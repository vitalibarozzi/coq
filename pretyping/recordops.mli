
(*i $Id$ i*)

(*i*)
open Names
open Term
open Classops
open Libobject
open Library
(*i*)

val nbimpl : int ref
val nbpathc : int ref
val nbcoer : int ref
val nbstruc : int ref
val nbimplstruc : int ref
val compter : bool ref

type struc_typ = {
  s_CONST : identifier; 
  s_PARAM : int;
  s_PROJ : section_path option list }

val add_new_struc : 
  inductive_path * identifier * int * section_path option list -> unit

(* [find_structure isp] returns the infos associated to inductive path
   [isp] if it corresponds to a structure, otherwise fails with [Not_found] *)
val find_structure : inductive_path -> struc_typ

type obj_typ = {
  o_DEF : constr;
  o_TABS : constr list; (* dans l'ordre *)
  o_TPARAMS : constr list; (* dans l'ordre *)
  o_TCOMPS : constr list } (* dans l'ordre *)
               
val objdef_info : (global_reference * global_reference) -> obj_typ
val add_new_objdef : 
  (global_reference * global_reference) * Term.constr * Term.constr list *
  Term.constr list * Term.constr list -> unit


val inStruc : inductive_path * struc_typ -> obj
val outStruc : obj -> inductive_path * struc_typ
val inObjDef1 : section_path -> obj
val outObjDef1 : obj -> section_path

val add_new_objdef1 : ((global_reference * global_reference) * obj_typ) -> unit
