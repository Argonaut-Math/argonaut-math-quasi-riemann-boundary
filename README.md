# Argonaut Math — Research Breakthrough Announcement

**October 8, 2026**

Within just **40 hours** of OpenAI's announcement, according to the Argonaut Math team's development timeline, Argonaut Math developed a proposed improvement to OpenAI's Quasi-Riemann Hypothesis result.

On October 6, 2026, OpenAI unveiled hundreds of mathematical manuscripts spanning 372 result families, marking a remarkable milestone in AI-assisted mathematical research.[^1]

The proposed refinement lowers the zero-free threshold from 7/8 to

$$
\frac78-\frac1{4000000}=0.87499975,
$$

and concerns the strict half-plane to the right of that new threshold. The exact families and pole exceptions are stated in the accompanying [README](README.md).

**The formalization has passed Lean 4.34.1 compilation and native Comparator verification.**

The timing of this announcement is deliberate. We believe that the ability to develop a potential strengthening of such a sophisticated mathematical result within an exceptionally short timeframe demonstrates the remarkable research potential of Argonaut Math.

## Beyond the Quasi-Riemann Hypothesis

Argonaut Math has also produced what we believe to be solutions to several other highly advanced, frontier-level mathematical problems.

However, we have deliberately decided not to disclose these additional results at this stage.

Our developers firmly believe that releasing AI-generated mathematical results without complete, corresponding Lean formalizations would depart from the very principle that inspired this project: the pursuit of mathematical correctness.

For Argonaut Math, mathematical discovery is not merely about producing convincing arguments or making ambitious claims. It is about establishing results whose logical foundations can be rigorously examined, independently reproduced, and ultimately verified.

We therefore adhere to a strict and non-negotiable publication standard: **Every mathematical result formally published by Argonaut Math must be accompanied by both a complete research paper and its corresponding Lean 4 formalization, released together.**

Neither a research paper without its corresponding Lean formalization nor Lean code without an accompanying mathematical paper qualifies as a complete Argonaut Math publication.

This is not merely a publication preference. It is a fundamental principle of Argonaut Math: mathematical correctness must take precedence over publication speed, recognition, or the number of claimed discoveries.

Our remaining results will be released once their corresponding Lean formalizations are complete.

We believe the future of AI for Mathematics must be measured not only by the speed and depth of mathematical discovery, but above all by the reliability of its results.

Discovery demonstrates capability. Formal verification establishes confidence. Mathematical correctness remains our ultimate commitment.

**Argonaut Math — Advancing the Frontiers of Mathematics Without Compromising Rigor.**

[^1]: OpenAI, [Sharing AI progress in mathematics](https://openai.com/index/sharing-ai-progress-in-mathematics/), October 6, 2026; [official repository catalogue](https://github.com/openai/math/blob/main/README.md). At the preparation of this announcement, that catalogue lists 719 manuscripts and 372 families. The phrase “hundreds” avoids treating a changing manuscript count as a fixed release statistic.

---

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

