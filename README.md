# Beyond the Seven-Eighths Barrier: A Sharper Quasi-Riemann Boundary

**Research release candidate — October 8, 2026**

Argonaut Math refines the zero-free boundary in OpenAI's quasi-Riemann result from **7/8 = 0.875** to **3499999/4000000 = 0.87499975**, an improvement of **1/4000000**. The conclusion concerns the strict half-plane **Re(s) > 3499999/4000000**.

- [English paper](https://github.com/ArgonautMath0/argonaut-math-quasi-riemann-boundary/releases/download/v0.1.2/Beyond_the_Seven_Eighths_Barrier.pdf)
- [Corresponding Lean 4 sources](https://github.com/ArgonautMath0/argonaut-math-quasi-riemann-boundary/releases/download/v0.1.2/Lean_Proof_Source.zip)
- [Research announcement](ANNOUNCEMENT.md)

## The result

The three public Lean statements establish nonvanishing in that half-plane for the Riemann zeta function, all complex Dirichlet characters of positive modulus, and finite-order Hecke characters with trivial infinity type over the fixed field Q(sqrt(-3)). Primitive and imprimitive characters are included. Principal-character poles at s = 1 are excluded. The zeta statement uses Mathlib's assigned nonzero value at 1; the classical meromorphic formulation retains its pole. The boundary line is not included.

The proof builds on the pinned [OpenAI source project](https://github.com/openai/math/tree/adc7f1241b42e322a6451854ab7e4b4c146bf78a). The public roots require no externally supplied analytic estimate. Local kernel, standard-axiom and source-based semantic checks are complete for these three exact statements. External reproduction and public review remain open. The paper predates completion of the final formal checks; its historical AI Closure note is supplemented by this current status.

## Check the proof

Unpack `Lean_Proof_Source.zip` and follow the included `Lean_Proof/BUILD.md`. It specifies Lean 4.34.1, exact dependency revisions, source restoration and the build/audit commands. Checking the proof does not require our plugin or a model call.

The package contains generated mathematical proof sources and generic verification tools. Plugin implementation, private prompts, orchestration settings, private review records and credentials are not published. Upstream licenses and notices are retained.

Prepared by **Argonaut Math** through human-guided AI research and the AI for Math workflow. This release pairs the paper with its corresponding Lean sources.

Contact: [argonautmath0@gmail.com](mailto:argonautmath0@gmail.com).

---

## Argonaut Math — Research Breakthrough Announcement

**October 8, 2026**

On October 6, 2026, OpenAI unveiled hundreds of mathematical manuscripts spanning 372 result families, marking a remarkable milestone in AI-assisted mathematical research.[1]

Within just 40 hours of this landmark announcement, according to the Argonaut Math team's development timeline, Argonaut Math developed a proposed improvement to OpenAI's Quasi-Riemann Hypothesis result. The proposed refinement lowers the zero-free threshold from 7/8 to

$$
\frac78-\frac1{4000000}=0.87499975,
$$

and concerns the strict half-plane to the right of that new threshold. The exact families and pole exceptions are stated in the accompanying [README](README.md).

The timing of this announcement is deliberate. We believe that the ability to develop a potential strengthening of such a sophisticated mathematical result within an exceptionally short timeframe demonstrates the remarkable research potential of Argonaut Math.

### Beyond the Quasi-Riemann Hypothesis

Argonaut Math has also produced what we believe to be solutions to several other highly advanced, frontier-level mathematical problems.

However, we have deliberately decided not to disclose these additional results at this stage.

Our developers firmly believe that releasing AI-generated mathematical results without complete, corresponding Lean formalizations would depart from the very principle that inspired this project: the pursuit of mathematical correctness.

For Argonaut Math, mathematical discovery is not merely about producing convincing arguments or making ambitious claims. It is about establishing results whose logical foundations can be rigorously examined, independently reproduced, and ultimately verified.

We therefore adhere to a strict and non-negotiable publication standard: **Every mathematical result formally published by Argonaut Math must be accompanied by both a complete research paper and its corresponding Lean 4 formalization, released together.**

Neither a research paper without its corresponding Lean formalization nor Lean code without an accompanying mathematical paper qualifies as a complete Argonaut Math publication.

This is not merely a publication preference. It is a fundamental principle of Argonaut Math: mathematical correctness must take precedence over publication speed, recognition, or the number of claimed discoveries.

The three exact quasi-Riemann statements in this release have completed local Lean checks, source-based semantic review, and final internal admission. Independent external reproduction and public review remain open. Our other candidate results remain subject to final verification and should not yet be regarded as established theorems.

We ask the mathematical community to await our forthcoming coordinated release, in which we intend to publish these additional results together with their complete mathematical manuscripts and corresponding Lean 4 proofs.

We believe the future of AI for Mathematics must be measured not only by the speed and depth of mathematical discovery, but above all by the reliability of its results.

Discovery demonstrates capability. Formal verification establishes confidence. Mathematical correctness remains our ultimate commitment.

**Argonaut Math — Advancing the Frontiers of Mathematics Without Compromising Rigor.**

### Notes on this announcement

The 40-hour interval is the team's reported time to develop the proposed refinement. It is not presented as the duration of a completed external review or an independently timestamp-certified performance benchmark. The statement about other undisclosed candidates records the team's assessment; this release provides no proof or formal certificate for those candidates.

The quasi-Riemann roots now have completed local kernel, axiom, source-based semantic, and separate-agent final checks. The cautious announcement language is retained for the coordinated publication and independent public scrutiny. The README states the exact theorem scope and current verification status.

[1] OpenAI, [Sharing AI progress in mathematics](https://openai.com/index/sharing-ai-progress-in-mathematics/), October 6, 2026; [official repository catalogue](https://github.com/openai/math/blob/main/README.md). At the preparation of this announcement, that catalogue lists 719 manuscripts and 372 families. The phrase “hundreds” avoids treating a changing manuscript count as a fixed release statistic.
