"""Verify the public source overlay or apply it to fresh, exactly pinned checkouts.

Standard-library Python only. No fetching, installation, deletion or compiler invocation.
"""
import argparse, hashlib, json, os, subprocess, zipfile
from pathlib import Path, PurePosixPath

def digest(data): return hashlib.sha256(data).hexdigest()
def safe_parts(name):
    p=PurePosixPath(name)
    if p.is_absolute() or '\\' in name or ':' in name or not p.parts or any(x in ('','..','.') for x in p.parts):
        raise ValueError('Unsafe relative archive path')
    return p.parts
def destination(name):
    parts=safe_parts(name)
    if parts[0]=='project': return '/'.join(parts[1:])
    if parts[0]=='dependencies': return '/'.join(('.lake','packages')+parts[1:])
    if parts[0]=='toolchain-source': return None
    raise ValueError('Unknown overlay source category')
def long_path(p):
    s=str(p.resolve())
    if os.name=='nt' and not s.startswith('\\\\?\\'): return Path('\\\\?\\'+s)
    return Path(s)
def verify(root):
    manifest=json.loads((root/'provenance/SOURCE-MANIFEST.json').read_bytes())
    archive=root/manifest['archive_path']
    if digest(archive.read_bytes())!=manifest['archive_sha256']: raise ValueError('Archive digest mismatch')
    with zipfile.ZipFile(archive) as z:
        names=z.namelist()
        if len(names)!=len(set(names)) or set(names)!={r['path'] for r in manifest['files']}: raise ValueError('Archive inventory mismatch')
        targets=set()
        for r in manifest['files']:
            b=z.read(r['path']); dest=destination(r['path'])
            if len(b)!=r['bytes'] or digest(b)!=r['sha256']: raise ValueError('Source digest mismatch: '+r['path'])
            if dest is not None:
                if dest in targets: raise ValueError('Duplicate destination')
                targets.add(dest)
    return manifest
def check_pins(root,project,git):
    pins=json.loads((root/'provenance/PINS.json').read_bytes())
    for pin in pins['locked_dependencies']:
        folder=project/'.lake/packages'/pin['name']
        for args, expected in [(['rev-parse','HEAD'],pin['revision']),(['remote','get-url','origin'],pin['url'])]:
            p=subprocess.run([git,'-C',str(folder)]+args,check=True,capture_output=True)
            if p.stdout.decode().strip()!=expected: raise ValueError('Dependency pin mismatch: '+pin['name'])
def apply(root,project,manifest,git):
    project=project.resolve()
    if not (project/'.lake/packages').is_dir() or (project/'lakefile.task18-reviewed-overlay-v1.lean').exists():
        raise ValueError('Use a fresh recipient-owned directory containing only the prepared dependency checkouts')
    check_pins(root,project,git)
    pending=[]
    for r in manifest['files']:
        rel=destination(r['path'])
        if rel is None: continue
        out=project/rel
        if not out.resolve().is_relative_to(project): raise ValueError('Destination escape')
        for ancestor in [out,*out.parents]:
            if ancestor==project.parent: break
            if ancestor.is_symlink(): raise ValueError('Symlink destination rejected')
        pending.append((r,long_path(out)))
    # Write and preflight the exact upstream patch files before restoring patched metadata.
    with zipfile.ZipFile(root/manifest['archive_path']) as z:
        patches=[(r,out) for r,out in pending if r['path'].startswith('project/patches/')]
        plans=[]
        for r,out in patches:
            out.parent.mkdir(parents=True,exist_ok=True);out.write_bytes(z.read(r['path']))
            package=out.name.removesuffix('-lean4341.patch')
            folder=project/'.lake/packages'/package
            reverse=subprocess.run([git,'-C',str(folder),'apply','--reverse','--check',str(out)],capture_output=True)
            if reverse.returncode==0: continue
            forward=subprocess.run([git,'-C',str(folder),'apply','--check',str(out)],capture_output=True)
            if forward.returncode!=0:raise ValueError('Compatibility patch preflight failed: '+package)
            plans.append((folder,out))
        for folder,patch in plans:
            subprocess.run([git,'-C',str(folder),'apply',str(patch)],check=True)
            subprocess.run([git,'-C',str(folder),'apply','--reverse','--check',str(patch)],check=True)
        for r,out in pending:
            out.parent.mkdir(parents=True,exist_ok=True);out.write_bytes(z.read(r['path']))
            b=out.read_bytes()
            if digest(b)!=r['sha256'] or len(b)!=r['bytes']: raise ValueError('Written source mismatch')
    return len(pending)
def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--project',type=Path);p.add_argument('--apply-overlay',action='store_true');p.add_argument('--git',default='git')
    a=p.parse_args();root=Path(__file__).resolve().parents[1];manifest=verify(root)
    written=0
    if a.apply_overlay:
        if a.project is None: p.error('--apply-overlay requires --project')
        written=apply(root,a.project,manifest,a.git)
    print(json.dumps({'source_archive_verification':'PASS','files':len(manifest['files']),
                      'written_files':written,'compiler_started':False,'recipient_kernel_replay':'NOT_RUN'}))
if __name__=='__main__': main()
