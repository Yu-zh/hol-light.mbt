// Rqe/make.ml: the load steps are generated (rqe_make.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Rqe/make.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @analysis.load()
  @poly.load()
  @rqe_lib.load()
  @rqe_tactics_ext.load()
  @util.load()
  @rewrites.load()
  @basic.load()
  @rqe_num.load()
  @rqe_real.load()
  @list_rewrites.load()
  @rqe_list.load()
  @timers.load()
  @num_calc_simp.load()
  @asym.load()
  @rol.load()
  @poly_ext.load()
  @simplify.load()
  @lift_qelim.load()
  @defs.load()
  @testform_thms.load()
  @condense_thms.load()
  @inferisign_thms.load()
  @matinsert_thms.load()
  @signs_thms.load()
  @inferpsign_thms.load()
  @dedmatrix_thms.load()
  @pdivides_thms.load()
  @main_thms.load()
  @work_thms.load()
  @testform.load()
  @condense.load()
  @inferisign.load()
  @matinsert.load()
  @signs.load()
  @inferpsign.load()
  @dedmatrix.load()
  @pdivides.load()
  @rqe_main.load()
  @theory.begin_theory("Rqe/make")
  load_steps() catch {
    e => abort("HOL Light: loading Rqe/make.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
