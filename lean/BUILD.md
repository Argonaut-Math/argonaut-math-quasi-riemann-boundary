# Build and verify

Requirements: Lean **4.34.1** (with `lean` and `lake` on PATH), Python **3.9+**, and Git. Run the preparation commands from the unpacked `Lean_Proof` directory.

## 1. Prepare the exact dependencies

Create a fresh `build-project/.lake/packages` directory. For every entry in `provenance/PINS.json` under `locked_dependencies`, use its `name`, `url`, and `revision` as NAME, URL, and REVISION below:

```text
git clone --no-checkout URL build-project/.lake/packages/NAME
git -C build-project/.lake/packages/NAME config core.autocrlf false
git -C build-project/.lake/packages/NAME fetch origin REVISION
git -C build-project/.lake/packages/NAME checkout --detach REVISION
```

Keep all 42 entries at their recorded revisions and origins.

## 2. Restore the proof sources

```text
python reproducibility/reconstruct.py --project build-project --apply-overlay
```

This checks the archive and dependency pins, applies the supplied compatibility patches, and restores the selected sources. Use a fresh project directory; review the supplied Lake configuration and patch hooks before running it.

## 3. Compile and audit

```text
cd build-project
lake -f lakefile.task18-reviewed-overlay-v1.lean build +PerturbedBoundaryMain
lake -f lakefile.task18-reviewed-overlay-v1.lean env lean audits/PerturbedBoundaryMainCurrentFullAuditV2.lean
lake -f lakefile.task18-reviewed-overlay-v1.lean env lean audits/HUBBLE-PrincipalV2-TerminalAudit.lean
```

All three commands must exit successfully. The designated theorem exports must depend only on `propext`, `Classical.choice`, and `Quot.sound`; reject `sorryAx` or additional assumptions.

The local pinned-environment build and audits passed. A fresh recipient rebuild has not yet been recorded. The source manifest and dependency pins identify the exact checked version.
