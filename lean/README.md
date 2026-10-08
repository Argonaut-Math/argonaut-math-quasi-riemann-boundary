# Lean proof sources

The exact terminal proof entry is [PerturbedBoundaryMain.lean](PerturbedBoundaryMain.lean). Its SHA-256 is `ffdd133750ac3bf57b5de12e474e5451791d625e2fc6e7269755e91760a642b5`.

The three exported statements cover the perturbed-boundary nonvanishing results for Dirichlet characters, the Riemann zeta function and the stated Hecke family. The full scope and pole conventions are stated in the repository README.

For a full rebuild, download [Lean_Proof_Source.zip](https://github.com/Argonaut-Math/argonaut-math-quasi-riemann-boundary/releases/download/v0.1.3/Lean_Proof_Source.zip), unpack it, and follow [BUILD.md](BUILD.md) from its `Lean_Proof` directory. The archive preserves the `lean/`, `provenance/` and `reproducibility/` paths required by `reconstruct.py`, together with the 38 MB source overlay. The files displayed here are unchanged browsable copies; they are not a replacement for that complete build package.

Archive SHA-256: `37602f9379f833c1b9ad3a6c7c628f961670f4219a9ac0f4190f8eb9b7655a93`.

Lean version: **4.34.1**. Dependency revisions and source digests are recorded in [PINS.json](PINS.json) and [SOURCE-MANIFEST.json](SOURCE-MANIFEST.json). Upstream attribution, licenses and patch provenance are retained in the accompanying notice files. The local compilation, clean replay and standard-axiom audits passed. See [public verification records](../reasoning_traces/README.md) for the native Comparator core PASS and the separate Linux workflow.
