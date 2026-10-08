# Public verification records

The three exact public terminal statements passed the local pinned Lean 4.34.1 compilation, clean kernel replay and standard-axiom audits. Their terminal dependencies were checked against `propext`, `Classical.choice` and `Quot.sound`.

The unchanged official `Comparator.verifyMatch` completed the native core check with exit code **0**, in **771.3663938045502 seconds**. The accepted scope comprises target and statement-dependency declaration equality, transitive permitted-axiom checking, builtin Lean kernel replay and quotient post-checks.

The [execution receipt](NATIVE-CORE-RECEIPT.json) is a public copy with local absolute paths removed. Result fields and hashes are unchanged. The underlying full log has SHA-256 `9b400828fd71459a334c53aa8fcf7fc7ecd6d8f8489e89b32eb7ac1b0e1b0025`; the original receipt has SHA-256 `51717eb9498d395f30ec338f92877fd1efdccaf45923b8c768939dd3b355e9ed`. The proof entry has SHA-256 `ffdd133750ac3bf57b5de12e474e5451791d625e2fc6e7269755e91760a642b5`.

This native run did not execute Linux Landrun or nanoda. The [separate Linux workflow run](https://github.com/Argonaut-Math/argonaut-math-quasi-riemann-boundary/actions/runs/37756200469) remains in progress at publication preparation; consult its live result for subsequent completion. The existing workflow verifies the same three roots and is retained unchanged.

These records document executed checks. Independent external reproduction and public mathematical review remain open. Private prompts, orchestration settings, credentials and private review transcripts are not included in this directory.
