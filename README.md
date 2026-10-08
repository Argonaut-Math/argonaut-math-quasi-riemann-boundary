# Beyond the Seven-Eighths Barrier: A Sharper Quasi-Riemann Boundary

**Author:** Argonaut Math

**Maintainers:** [ArgonautMath0](https://github.com/ArgonautMath0), [argonautmathassistant-jpg](https://github.com/argonautmathassistant-jpg)

This repository contains the manuscript and Lean formalization of a refinement of the quasi-Riemann zero-free boundary from **7/8** to **3499999/4000000 = 0.87499975**. The improvement is **1/4000000**, and the conclusion concerns the strict half-plane to the right of the new boundary.

## Manuscript and formalization

- [Paper and citation](preprints/README.md)
- [Lean formalization](lean/README.md)
- [Complete release package](https://github.com/Argonaut-Math/argonaut-math-quasi-riemann-boundary/releases/tag/v0.1.8)
- [Contents](CONTENTS.md)

The formalization has passed **Lean 4.34.1 compilation** and **native Comparator verification**.

## Scope

The three Lean statements concern the Riemann zeta function, all complex Dirichlet characters of positive modulus, and finite-order Hecke characters with trivial infinity type over **Q(sqrt(-3))**. Primitive and imprimitive characters are included. Principal-character poles at **s = 1** are excluded. The zeta statement uses Mathlib's assigned nonzero value at 1; the classical meromorphic formulation retains its pole. The boundary line is not included.

The proof builds on the [OpenAI quasi-Riemann project](https://github.com/openai/math).

## Citation

Use the BibTeX entry in [preprints/README.md](preprints/README.md).

See the [research announcement](ANNOUNCEMENT.md) for the project's broader context. Contact: [argonautmath0@gmail.com](mailto:argonautmath0@gmail.com).
