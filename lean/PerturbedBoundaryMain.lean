import PerturbedDfirstSource
import PrincipalCutoffRequestV2
import OAI.NumberTheory.DirichletL.Detector.SameDataCanonicalPhysical
import OAI.NumberTheory.DirichletL.Detector.PerturbedCommonProbeAssembly
import OAI.NumberTheory.DirichletL.Hecke.DirichletBoundaryGeneric

namespace OAI
noncomputable section
open scoped Classical BigOperators

namespace SevenEighths.PerturbedBoundaryMain
open HeckeFamily ProbeHighRowFamily Parameters
open HighFrontierTargets PerturbedMomentConstruction
open PerturbedCommonProbeAssembly PerturbedCanonicalLocalPrep
open LocalPrincipalCutoffRequestV2
open LocalPrincipalSameDataGeometryV2

/-!
Terminal integration candidate, NOT_RUN.

`D` is selected first.  `sameDataCutoff D` is then fixed, after which one
source `F` supplies the modulus, window, count parameters, principal probe and
canonical probe.  The Euler producer is invoked on that exact `D/hfine/F/S`.
-/

/-- Combine the complete V2 principal request with the separate correction
cutoff used by the common-probe contract. -/
def sameDataCutoff
    (D : HighDataPerturbed positiveGap) : ℕ :=
  max (principalCutoffRequest D)
    PerturbedCommonProbeAssembly.principalCutoff

lemma sigmaBoundary_value :
    sigmaBoundary = (3499999 / 4000000 : ℝ) := by
  norm_num [sigmaBoundary, HighFrontierTargets.rho]

lemma principal_request_le_sameDataCutoff
    (D : HighDataPerturbed positiveGap) :
    principalCutoffRequest D ≤ sameDataCutoff D :=
  le_max_left _ _

lemma assembly_cutoff_le_sameDataCutoff
    (D : HighDataPerturbed positiveGap) :
    PerturbedCommonProbeAssembly.principalCutoff ≤
      sameDataCutoff D :=
  le_max_right _ _

/-- Build the actual common-probe contract without an Euler-estimate premise.
The canonical and Euler proof bodies are run on the same constructed data. -/
theorem commonProbeConstruction_current :
    CommonProbeConstructionGoalAt sigmaBoundary := by
  apply commonProbeConstructionGoalAt_of_same_data_owner_supply
  intro hbeta
  obtain ⟨D, hfine, F, hcover, wide, heuler, _heulerSaved⟩ :=
    exists_D_first_same_data_principal_outputs
      hbeta sameDataCutoff principal_request_le_sameDataCutoff
  have hcut : ∀ P : ProbePhysical.PrimeIdeal,
      P.val.absNorm ≤
        PerturbedCommonProbeAssembly.principalCutoff →
      P.val ∈ F.S := by
    intro P hP
    exact hcover P
      (hP.trans (assembly_cutoff_le_sameDataCutoff D))
  have hbetaCentral :
      PerturbedCentral.boundary <
        HeckeZeroSupremum.beta := by
    rw [central_boundary_eq_sigmaBoundary]
    exact hbeta
  have htheta :
      0 < chosenTheta D hfine F wide hbeta :=
    (chosenTheta_spec D hfine F wide hbeta).1
  have hcanonical :=
    same_data_canonical_physical_at D hfine F
      hbetaCentral
      (chosenTheta D hfine F wide hbeta) htheta
  exact ⟨D, hfine, F, wide, hcut, hcanonical, heuler⟩

/-- The uniform common-probe boundary is obtained from the constructed goal. -/
theorem uniformCommonProbeBoundary_current :
    HeckeCommonProbe.UniformCommonProbeBoundary sigmaBoundary :=
  uniformCommonProbeBoundary_of_construction_goal
    commonProbeConstruction_current

/-- Internal Hecke nonvanishing consumer with the exact principal-pole
exception. -/
theorem hecke_current
    (chi : Character) (s : ℂ)
    (hs : (3499999 / 4000000 : ℝ) < s.re)
    (hpole : s ≠ 1 ∨ chi.residue ≠ 1) :
    LFunction chi s ≠ 0 := by
  apply HeckeCommonProbe.hecke_ne_zero_of_common_probe_boundary
    uniformCommonProbeBoundary_current chi s
  · simpa only [sigmaBoundary_value] using hs
  · exact hpole

end SevenEighths.PerturbedBoundaryMain

namespace DirichletCharacter

/-- Candidate Dirichlet root at the frozen improved boundary, excluding the
principal pole. -/
theorem LFunction_ne_zero_of_perturbed_boundary_lt_re
    {q : ℕ} [NeZero q]
    (chi : _root_.DirichletCharacter ℂ q) {s : ℂ}
    (hs : (3499999 / 4000000 : ℝ) < s.re)
    (hpole : ¬ (chi = 1 ∧ s = 1)) :
    _root_.DirichletCharacter.LFunction chi s ≠ 0 := by
  exact SevenEighths.HeckeDirichlet.dirichlet_boundary_of_hecke
    (3499999 / 4000000) (by norm_num)
    SevenEighths.PerturbedBoundaryMain.hecke_current
      chi s hs hpole

end DirichletCharacter

/-- Candidate zeta root, retaining the pinned convention at `s = 1`. -/
theorem riemannZeta_ne_zero_of_perturbed_boundary_lt_re
    {s : ℂ}
    (hs : (3499999 / 4000000 : ℝ) < s.re) :
    riemannZeta s ≠ 0 := by
  exact SevenEighths.HeckeDirichlet.zeta_boundary_of_hecke
    (3499999 / 4000000) (by norm_num)
    SevenEighths.PerturbedBoundaryMain.hecke_current s hs

namespace SevenEighths.HeckeFamily

/-- Candidate Hecke root; no principal estimate, integrability statement or
common-probe conclusion is an argument. -/
theorem LFunction_ne_zero_of_perturbed_boundary_lt_re
    (chi : Character) {s : ℂ}
    (hs : (3499999 / 4000000 : ℝ) < s.re)
    (hpole : ¬ (chi.residue = 1 ∧ s = 1)) :
    LFunction chi s ≠ 0 := by
  apply SevenEighths.PerturbedBoundaryMain.hecke_current
    chi s hs
  tauto

end SevenEighths.HeckeFamily
end
end OAI
