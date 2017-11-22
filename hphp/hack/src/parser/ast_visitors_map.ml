(* @generated by hphp/hack/tools/visitors/genvisitors *)
open Ast_visitors_ancestors
class virtual ['self] map =
  object (self : 'self)
    inherit [_] map_base
    method on_Cst_define env = Cst_define
    method on_Cst_const env = Cst_const
    method on_cst_kind env this =
      match this with
      | Cst_define -> self#on_Cst_define env
      | Cst_const -> self#on_Cst_const env
    method on_id env (c0, c1) =
      let r0 = self#on_Pos_t env c0 in
      let r1 = self#on_string env c1 in (r0, r1)
    method on_pstring env (c0, c1) =
      let r0 = self#on_Pos_t env c0 in
      let r1 = self#on_string env c1 in (r0, r1)
    method on_Covariant env = Covariant
    method on_Contravariant env = Contravariant
    method on_Invariant env = Invariant
    method on_variance env this =
      match this with
      | Covariant -> self#on_Covariant env
      | Contravariant -> self#on_Contravariant env
      | Invariant -> self#on_Invariant env
    method on_NSClass env = NSClass
    method on_NSNamespace env = NSNamespace
    method on_NSClassAndNamespace env = NSClassAndNamespace
    method on_NSFun env = NSFun
    method on_NSConst env = NSConst
    method on_ns_kind env this =
      match this with
      | NSClass -> self#on_NSClass env
      | NSNamespace -> self#on_NSNamespace env
      | NSClassAndNamespace -> self#on_NSClassAndNamespace env
      | NSFun -> self#on_NSFun env
      | NSConst -> self#on_NSConst env
    method on_program env = self#on_list self#on_def env
    method on_Fun env c0 =
      let r0 = self#on_fun_ env c0 in Fun r0
    method on_Class env c0 =
      let r0 = self#on_class_ env c0 in Class r0
    method on_Stmt env c0 =
      let r0 = self#on_stmt env c0 in Stmt r0
    method on_Typedef env c0 =
      let r0 = self#on_typedef env c0 in Typedef r0
    method on_Constant env c0 =
      let r0 = self#on_gconst env c0 in Constant r0
    method on_Namespace env c0 c1 =
      let r0 = self#on_id env c0 in
      let r1 = self#on_program env c1 in Namespace (r0, r1)
    method on_SetNamespaceEnv env c0 =
      let r0 = self#on_Namespace_env env c0 in SetNamespaceEnv r0
    method on_NamespaceUse env c0 =
      let r0 =
        self#on_list
          (fun env (c0, c1, c2) ->
               let r0 = self#on_ns_kind env c0 in
               let r1 = self#on_id env c1 in
               let r2 = self#on_id env c2 in (r0, r1, r2)) env c0
      in
      NamespaceUse r0
    method on_def env this =
      match this with
      | Fun c0 -> self#on_Fun env c0
      | Class c0 -> self#on_Class env c0
      | Stmt c0 -> self#on_Stmt env c0
      | Typedef c0 -> self#on_Typedef env c0
      | Constant c0 -> self#on_Constant env c0
      | Namespace (c0, c1) -> self#on_Namespace env c0 c1
      | NamespaceUse c0 -> self#on_NamespaceUse env c0
      | SetNamespaceEnv c0 -> self#on_SetNamespaceEnv env c0
    method on_typedef env this =
      let r0 = self#on_id env this.t_id in
      let r1 = self#on_list self#on_tparam env this.t_tparams in
      let r2 = self#on_tconstraint env this.t_constraint in
      let r3 = self#on_typedef_kind env this.t_kind in
      let r4 =
        self#on_list self#on_user_attribute env
          this.t_user_attributes
      in
      let r5 = self#on_Namespace_env env this.t_namespace in
      let r6 = self#on_FileInfo_mode env this.t_mode in
      {
        t_id = r0;
        t_tparams = r1;
        t_constraint = r2;
        t_kind = r3;
        t_user_attributes = r4;
        t_namespace = r5;
        t_mode = r6
      }
    method on_gconst env this =
      let r0 = self#on_FileInfo_mode env this.cst_mode in
      let r1 = self#on_cst_kind env this.cst_kind in
      let r2 = self#on_id env this.cst_name in
      let r3 = self#on_option self#on_hint env this.cst_type in
      let r4 = self#on_expr env this.cst_value in
      let r5 = self#on_Namespace_env env this.cst_namespace in
      {
        cst_mode = r0;
        cst_kind = r1;
        cst_name = r2;
        cst_type = r3;
        cst_value = r4;
        cst_namespace = r5
      }
    method on_Constraint_as env = Constraint_as
    method on_Constraint_eq env = Constraint_eq
    method on_Constraint_super env = Constraint_super
    method on_constraint_kind env this =
      match this with
      | Constraint_as -> self#on_Constraint_as env
      | Constraint_eq -> self#on_Constraint_eq env
      | Constraint_super -> self#on_Constraint_super env
    method on_tparam env (c0, c1, c2) =
      let r0 = self#on_variance env c0 in
      let r1 = self#on_id env c1 in
      let r2 =
        self#on_list
          (fun env (c0, c1) ->
               let r0 = self#on_constraint_kind env c0 in
               let r1 = self#on_hint env c1 in (r0, r1)) env c2
      in
      (r0, r1, r2)
    method on_tconstraint env = self#on_option self#on_hint env
    method on_Alias env c0 =
      let r0 = self#on_hint env c0 in Alias r0
    method on_NewType env c0 =
      let r0 = self#on_hint env c0 in NewType r0
    method on_typedef_kind env this =
      match this with
      | Alias c0 -> self#on_Alias env c0
      | NewType c0 -> self#on_NewType env c0
    method on_class_ env this =
      let r0 = self#on_FileInfo_mode env this.c_mode in
      let r1 =
        self#on_list self#on_user_attribute env
          this.c_user_attributes
      in
      let r2 = self#on_bool env this.c_final in
      let r3 = self#on_class_kind env this.c_kind in
      let r4 = self#on_bool env this.c_is_xhp in
      let r5 = self#on_id env this.c_name in
      let r6 = self#on_list self#on_tparam env this.c_tparams in
      let r7 = self#on_list self#on_hint env this.c_extends in
      let r8 = self#on_list self#on_hint env this.c_implements in
      let r9 = self#on_list self#on_class_elt env this.c_body in
      let r10 = self#on_Namespace_env env this.c_namespace in
      let r11 = self#on_option self#on_enum_ env this.c_enum in
      let r12 = self#on_Pos_t env this.c_span in
      {
        c_mode = r0;
        c_user_attributes = r1;
        c_final = r2;
        c_kind = r3;
        c_is_xhp = r4;
        c_name = r5;
        c_tparams = r6;
        c_extends = r7;
        c_implements = r8;
        c_body = r9;
        c_namespace = r10;
        c_enum = r11;
        c_span = r12;
        c_doc_comment = this.c_doc_comment
      }
    method on_enum_ env this =
      let r0 = self#on_hint env this.e_base in
      let r1 = self#on_option self#on_hint env this.e_constraint in

      { e_base = r0; e_constraint = r1 }
    method on_user_attribute env this =
      let r0 = self#on_id env this.ua_name in
      let r1 = self#on_list self#on_expr env this.ua_params in
      { ua_name = r0; ua_params = r1 }
    method on_Cabstract env = Cabstract
    method on_Cnormal env = Cnormal
    method on_Cinterface env = Cinterface
    method on_Ctrait env = Ctrait
    method on_Cenum env = Cenum
    method on_class_kind env this =
      match this with
      | Cabstract -> self#on_Cabstract env
      | Cnormal -> self#on_Cnormal env
      | Cinterface -> self#on_Cinterface env
      | Ctrait -> self#on_Ctrait env
      | Cenum -> self#on_Cenum env
    method on_MustExtend env = MustExtend
    method on_MustImplement env = MustImplement
    method on_trait_req_kind env this =
      match this with
      | MustExtend -> self#on_MustExtend env
      | MustImplement -> self#on_MustImplement env
    method on_Const env c0 c1 =
      let r0 = self#on_option self#on_hint env c0 in
      let r1 =
        self#on_list
          (fun env (c0, c1) ->
               let r0 = self#on_id env c0 in
               let r1 = self#on_expr env c1 in (r0, r1)) env c1
      in
      Const (r0, r1)
    method on_AbsConst env c0 c1 =
      let r0 = self#on_option self#on_hint env c0 in
      let r1 = self#on_id env c1 in AbsConst (r0, r1)
    method on_Attributes env c0 =
      let r0 = self#on_list self#on_class_attr env c0 in
      Attributes r0
    method on_TypeConst env c0 =
      let r0 = self#on_typeconst env c0 in TypeConst r0
    method on_ClassUse env c0 =
        let r0 = self#on_hint env c0 in ClassUse r0
    method on_ClassUseAlias env c0 c1 c2 c3 =
      let r0 = self#on_option self#on_id env c0 in
      let r1 = self#on_pstring env c1 in
      let r2 = self#on_option self#on_id env c2 in
      let r3 = self#on_list self#on_kind env c3 in
      ClassUseAlias (r0, r1, r2, r3)
    method on_ClassUsePrecedence env c0 c1 c2 =
      let r0 = self#on_id env c0 in
      let r1 = self#on_pstring env c1 in
      let r2 = self#on_list self#on_id env c2 in
      ClassUsePrecedence (r0, r1, r2)
    method on_XhpAttrUse env c0 =
      let r0 = self#on_hint env c0 in XhpAttrUse r0
    method on_ClassTraitRequire env c0 c1 =
      let r0 = self#on_trait_req_kind env c0 in
      let r1 = self#on_hint env c1 in ClassTraitRequire (r0, r1)
    method on_ClassVars env
      { cv_kinds = c0; cv_hint = c1; cv_names = c2; cv_doc_comment = c3 } =
      let r0 = self#on_list self#on_kind env c0 in
      let r1 = self#on_option self#on_hint env c1 in
      let r2 = self#on_list self#on_class_var env c2 in
      ClassVars { cv_kinds = r0; cv_hint = r1; cv_names = r2; cv_doc_comment = c3 }
    method on_XhpAttr env c0 c1 c2 c3 =
      let r0 = self#on_option self#on_hint env c0 in
      let r1 = self#on_class_var env c1 in
      let r2 = self#on_bool env c2 in
      let r3 =
        self#on_option
          (fun env (c0, c1) ->
               let r0 = self#on_Pos_t env c0 in
               let r1 = self#on_list self#on_expr env c1 in
               (r0, r1)) env c3
      in
      XhpAttr (r0, r1, r2, r3)
    method on_Method env c0 =
      let r0 = self#on_method_ env c0 in Method r0
    method on_XhpCategory env c0 =
      let r0 = self#on_list self#on_pstring env c0 in
      XhpCategory r0
    method on_XhpChild env c0 =
      let r0 = self#on_xhp_child env c0 in
      XhpChild r0

    method on_xhp_child env this =
      match this with
      | ChildName c0 -> self#on_ChildName env this c0
      | ChildList c0 -> self#on_ChildList env this c0
      | ChildUnary (c0, c1) -> self#on_ChildUnary env this c0 c1
      | ChildBinary (c0, c1) -> self#on_ChildBinary env this c0 c1

    method on_ChildName env this c0 =
      let r0 = self#on_id env c0 in
      ChildName r0

    method on_ChildList env this c0 =
      let r0 = self#on_list self#on_xhp_child env c0 in
      ChildList r0

    method on_ChildUnary env this c0 c1 =
      let r0 = self#on_xhp_child env c0 in
      let r1 = self#on_xhp_child_op env c1 in
      ChildUnary (r0, r1)

    method on_ChildBinary env this c0 c1 =
      let r0 = self#on_xhp_child env c0 in
      let r1 = self#on_xhp_child env c1 in
      ChildBinary (r0, r1)

    method on_xhp_child_op env this =
      match this with
      | ChildStar -> self#on_ChildStar env this
      | ChildPlus -> self#on_ChildPlus env this
      | ChildQuestion -> self#on_ChildQuestion env this

    method on_ChildStar env this = this
    method on_ChildPlus env this = this
    method on_ChildQuestion env this = this

    method on_class_elt env this =
      match this with
      | Const (c0, c1) -> self#on_Const env c0 c1
      | AbsConst (c0, c1) -> self#on_AbsConst env c0 c1
      | Attributes c0 -> self#on_Attributes env c0
      | TypeConst c0 -> self#on_TypeConst env c0
      | ClassUse c0 -> self#on_ClassUse env c0
      | ClassUseAlias (c0, c1, c2, c3) -> self#on_ClassUseAlias env c0 c1 c2 c3
      | ClassUsePrecedence (c0, c1, c2) ->
        self#on_ClassUsePrecedence env c0 c1 c2
      | XhpAttrUse c0 -> self#on_XhpAttrUse env c0
      | ClassTraitRequire (c0, c1) ->
          self#on_ClassTraitRequire env c0 c1
      | ClassVars cv -> self#on_ClassVars env cv
      | XhpAttr (c0, c1, c2, c3) -> self#on_XhpAttr env c0 c1 c2 c3
      | Method c0 -> self#on_Method env c0
      | XhpCategory c0 -> self#on_XhpCategory env c0
      | XhpChild c0 -> self#on_XhpChild env c0
    method on_CA_name env c0 =
      let r0 = self#on_id env c0 in CA_name r0
    method on_CA_field env c0 =
      let r0 = self#on_ca_field env c0 in CA_field r0
    method on_class_attr env this =
      match this with
      | CA_name c0 -> self#on_CA_name env c0
      | CA_field c0 -> self#on_CA_field env c0
    method on_ca_field env this =
      let r0 = self#on_ca_type env this.ca_type in
      let r1 = self#on_id env this.ca_id in
      let r2 = self#on_option self#on_expr env this.ca_value in
      let r3 = self#on_bool env this.ca_required in
      { ca_type = r0; ca_id = r1; ca_value = r2; ca_required = r3 }
    method on_CA_hint env c0 =
      let r0 = self#on_hint env c0 in CA_hint r0
    method on_CA_enum env c0 =
      let r0 = self#on_list self#on_string env c0 in CA_enum r0
    method on_ca_type env this =
      match this with
      | CA_hint c0 -> self#on_CA_hint env c0
      | CA_enum c0 -> self#on_CA_enum env c0
    method on_Final env = Final
    method on_Static env = Static
    method on_Abstract env = Abstract
    method on_Private env = Private
    method on_Public env = Public
    method on_Protected env = Protected
    method on_kind env this =
      match this with
      | Final -> self#on_Final env
      | Static -> self#on_Static env
      | Abstract -> self#on_Abstract env
      | Private -> self#on_Private env
      | Public -> self#on_Public env
      | Protected -> self#on_Protected env
    method on_Pinout env = Pinout
    method on_param_kind env this =
      match this with
      | Pinout -> self#on_Pinout env
    method on_OG_nullthrows env = OG_nullthrows
    method on_OG_nullsafe env = OG_nullsafe
    method on_og_null_flavor env this =
      match this with
      | OG_nullthrows -> self#on_OG_nullthrows env
      | OG_nullsafe -> self#on_OG_nullsafe env
    method on_class_var env (c0, c1, c2) =
      let r0 = self#on_Pos_t env c0 in
      let r1 = self#on_id env c1 in
      let r2 = self#on_option self#on_expr env c2 in (r0, r1, r2)
    method on_method_ env this =
      let r0 = self#on_list self#on_kind env this.m_kind in
      let r1 = self#on_list self#on_tparam env this.m_tparams in
      let r2 =
        self#on_list
          (fun env (c0, c1, c2) ->
               let r0 = self#on_hint env c0 in
               let r1 = self#on_constraint_kind env c1 in
               let r2 = self#on_hint env c2 in (r0, r1, r2)) env
          this.m_constrs
      in
      let r3 = self#on_id env this.m_name in
      let r4 = self#on_list self#on_fun_param env this.m_params in
      let r5 = self#on_block env this.m_body in
      let r6 =
        self#on_list self#on_user_attribute env
          this.m_user_attributes
      in
      let r7 = self#on_option self#on_hint env this.m_ret in
      let r8 = self#on_bool env this.m_ret_by_ref in
      let r9 = self#on_fun_kind env this.m_fun_kind in
      let r10 = self#on_Pos_t env this.m_span in
      {
        m_kind = r0;
        m_tparams = r1;
        m_constrs = r2;
        m_name = r3;
        m_params = r4;
        m_body = r5;
        m_user_attributes = r6;
        m_ret = r7;
        m_ret_by_ref = r8;
        m_fun_kind = r9;
        m_span = r10;
        m_doc_comment = this.m_doc_comment
      }
    method on_typeconst env this =
      let r0 = self#on_bool env this.tconst_abstract in
      let r1 = self#on_id env this.tconst_name in
      let r2 = self#on_list self#on_tparam env this.tconst_tparams in
      let r3 =
        self#on_option self#on_hint env this.tconst_constraint in
      let r4 = self#on_option self#on_hint env this.tconst_type in
      let r5 = self#on_Pos_t env this.tconst_span in
      {
        tconst_abstract = r0;
        tconst_name = r1;
        tconst_tparams = r2;
        tconst_constraint = r3;
        tconst_type = r4;
        tconst_span = r5
      }
    method on_is_reference env = self#on_bool env
    method on_is_variadic env = self#on_bool env
    method on_fun_param env this =
      let r0 = self#on_option self#on_hint env this.param_hint in
      let r1 = self#on_is_reference env this.param_is_reference in
      let r2 = self#on_is_variadic env this.param_is_variadic in
      let r3 = self#on_id env this.param_id in
      let r4 = self#on_option self#on_expr env this.param_expr in
      let r5 = self#on_option self#on_kind env this.param_modifier in

      let r6 = self#on_option self#on_param_kind env this.param_callconv in
      let r7 =
        self#on_list self#on_user_attribute env
          this.param_user_attributes
      in
      {
        param_hint = r0;
        param_is_reference = r1;
        param_is_variadic = r2;
        param_id = r3;
        param_expr = r4;
        param_modifier = r5;
        param_callconv = r6;
        param_user_attributes = r7
      }
    method on_fun_ env this =
      let r0 = self#on_FileInfo_mode env this.f_mode in
      let r1 = self#on_list self#on_tparam env this.f_tparams in
      let r2 =
        self#on_list
          (fun env (c0, c1, c2) ->
               let r0 = self#on_hint env c0 in
               let r1 = self#on_constraint_kind env c1 in
               let r2 = self#on_hint env c2 in (r0, r1, r2)) env
          this.f_constrs
      in
      let r3 = self#on_option self#on_hint env this.f_ret in
      let r4 = self#on_bool env this.f_ret_by_ref in
      let r5 = self#on_id env this.f_name in
      let r6 = self#on_list self#on_fun_param env this.f_params in
      let r7 = self#on_block env this.f_body in
      let r8 =
        self#on_list self#on_user_attribute env
          this.f_user_attributes
      in
      let r9 = self#on_fun_kind env this.f_fun_kind in
      let r10 = self#on_Namespace_env env this.f_namespace in
      let r11 = self#on_Pos_t env this.f_span in
      let r12 = self#on_bool env this.f_static in
      {
        f_mode = r0;
        f_tparams = r1;
        f_constrs = r2;
        f_ret = r3;
        f_ret_by_ref = r4;
        f_name = r5;
        f_params = r6;
        f_body = r7;
        f_user_attributes = r8;
        f_fun_kind = r9;
        f_namespace = r10;
        f_span = r11;
        f_doc_comment = this.f_doc_comment;
        f_static = r12;
      }
    method on_FSync env = FSync
    method on_FAsync env = FAsync
    method on_FGenerator env = FGenerator
    method on_FAsyncGenerator env = FAsyncGenerator
    method on_FCoroutine env = FCoroutine
    method on_fun_kind env this =
      match this with
      | FSync -> self#on_FSync env
      | FAsync -> self#on_FAsync env
      | FGenerator -> self#on_FGenerator env
      | FAsyncGenerator -> self#on_FAsyncGenerator env
      | FCoroutine -> self#on_FCoroutine env
    method on_hint env (c0, c1) =
      let r0 = self#on_Pos_t env c0 in
      let r1 = self#on_hint_ env c1 in (r0, r1)
    method on_variadic_hint env this =
      match this with
      | Hvariadic c0 ->
        let r0 = self#on_option self#on_hint env c0 in
        Hvariadic r0
      | Hnon_variadic -> Hnon_variadic
    method on_Hoption env c0 =
      let r0 = self#on_hint env c0 in Hoption r0
    method on_Hfun env c0 c1 c2 c3 c4 =
      let r0 = self#on_bool env c0 in
      let r1 = self#on_list self#on_hint env c1 in
      let r2 = self#on_list (self#on_option self#on_param_kind) env c2 in
      let r3 = self#on_variadic_hint env c3 in
      let r4 = self#on_hint env c4 in Hfun (r0, r1, r2, r3, r4)
    method on_Htuple env c0 =
      let r0 = self#on_list self#on_hint env c0 in Htuple r0
    method on_Happly env c0 c1 =
      let r0 = self#on_id env c0 in
      let r1 = self#on_list self#on_hint env c1 in Happly (r0, r1)
    method on_Hshape env c0 =
      let r0 = self#on_bool env c0.si_allows_unknown_fields in
      let r1 = self#on_list self#on_shape_field env c0.si_shape_field_list in
      Hshape {
        si_allows_unknown_fields = r0;
        si_shape_field_list = r1
      }
    method on_Haccess env c0 c1 c2 =
      let r0 = self#on_id env c0 in
      let r1 = self#on_id env c1 in
      let r2 = self#on_list self#on_id env c2 in
      Haccess (r0, r1, r2)
    method on_Hsoft env c0 =
      let r0 = self#on_hint env c0 in Hsoft r0
    method on_hint_ env this =
      match this with
      | Hoption c0 -> self#on_Hoption env c0
      | Hfun (c0, c1, c2, c3, c4) -> self#on_Hfun env c0 c1 c2 c3 c4
      | Htuple c0 -> self#on_Htuple env c0
      | Happly (c0, c1) -> self#on_Happly env c0 c1
      | Hshape c0 -> self#on_Hshape env c0
      | Haccess (c0, c1, c2) -> self#on_Haccess env c0 c1 c2
      | Hsoft c0 -> self#on_Hsoft env c0
    method on_SFlit env c0 =
      let r0 = self#on_pstring env c0 in SFlit r0
    method on_SFclass_const env c0 c1 =
      let r0 = self#on_id env c0 in
      let r1 = self#on_pstring env c1 in SFclass_const (r0, r1)
    method on_shape_field_name env this =
      match this with
      | SFlit c0 -> self#on_SFlit env c0
      | SFclass_const (c0, c1) -> self#on_SFclass_const env c0 c1
    method on_shape_field env this =
      let r0 = self#on_bool env this.sf_optional in
      let r1 = self#on_shape_field_name env this.sf_name in
      let r2 = self#on_hint env this.sf_hint in
      {
        sf_optional = r0;
        sf_name = r1;
        sf_hint = r2
      }
    method on_Unsafe env = Unsafe
    method on_Fallthrough env = Fallthrough
    method on_Omitted env = Omitted
    method on_Expr env c0 =
      let r0 = self#on_expr env c0 in Expr r0
    method on_Block env c0 =
      let r0 = self#on_block env c0 in Block r0
    method on_Break env c0 level_opt =
      let r0 = self#on_Pos_t env c0 in
      let r1 = self#on_option self#on_expr env level_opt in
      Break (r0, r1)
    method on_Continue env c0 level_opt =
      let r0 = self#on_Pos_t env c0 in
      let r1 = self#on_option self#on_expr env level_opt in
      Continue (r0, r1)
    method on_Throw env c0 =
      let r0 = self#on_expr env c0 in Throw r0
    method on_Return env c0 c1 =
      let r0 = self#on_Pos_t env c0 in
      let r1 = self#on_option self#on_expr env c1 in
      Return (r0, r1)
    method on_Static_var env c0 =
      let r0 = self#on_list self#on_expr env c0 in Static_var r0
    method on_Global_var env c0 =
      let r0 = self#on_list self#on_expr env c0 in Global_var r0
    method on_If env c0 c1 c2 =
      let r0 = self#on_expr env c0 in
      let r1 = self#on_block env c1 in
      let r2 = self#on_block env c2 in If (r0, r1, r2)
    method on_Do env c0 c1 =
      let r0 = self#on_block env c0 in
      let r1 = self#on_expr env c1 in Do (r0, r1)
    method on_While env c0 c1 =
      let r0 = self#on_expr env c0 in
      let r1 = self#on_block env c1 in While (r0, r1)
    method on_For env c0 c1 c2 c3 =
      let r0 = self#on_expr env c0 in
      let r1 = self#on_expr env c1 in
      let r2 = self#on_expr env c2 in
      let r3 = self#on_block env c3 in For (r0, r1, r2, r3)
    method on_Switch env c0 c1 =
      let r0 = self#on_expr env c0 in
      let r1 = self#on_list self#on_case env c1 in Switch (r0, r1)
    method on_Foreach env c0 c1 c2 c3 =
      let r0 = self#on_expr env c0 in
      let r1 = self#on_option self#on_Pos_t env c1 in
      let r2 = self#on_as_expr env c2 in
      let r3 = self#on_block env c3 in Foreach (r0, r1, r2, r3)
    method on_Try env c0 c1 c2 =
      let r0 = self#on_block env c0 in
      let r1 = self#on_list self#on_catch env c1 in
      let r2 = self#on_block env c2 in Try (r0, r1, r2)
    method on_Def_inline env c0 =
      let r0 = self#on_def env c0 in
      Def_inline r0
    method on_Noop env = Noop
    method on_stmt env this =
      match this with
      | Unsafe -> self#on_Unsafe env
      | Fallthrough -> self#on_Fallthrough env
      | Expr c0 -> self#on_Expr env c0
      | Block c0 -> self#on_Block env c0
      | Break (c0, level_opt) -> self#on_Break env c0 level_opt
      | Continue (c0, level_opt) -> self#on_Continue env c0 level_opt
      | Throw c0 -> self#on_Throw env c0
      | Return (c0, c1) -> self#on_Return env c0 c1
      | GotoLabel c0 -> self#on_GotoLabel env c0
      | Goto c0 -> self#on_Goto env c0
      | Markup (c0, c1) -> self#on_Markup env c0 c1
      | Static_var c0 -> self#on_Static_var env c0
      | Global_var c0 -> self#on_Global_var env c0
      | If (c0, c1, c2) -> self#on_If env c0 c1 c2
      | Do (c0, c1) -> self#on_Do env c0 c1
      | While (c0, c1) -> self#on_While env c0 c1
      | For (c0, c1, c2, c3) -> self#on_For env c0 c1 c2 c3
      | Switch (c0, c1) -> self#on_Switch env c0 c1
      | Foreach (c0, c1, c2, c3) -> self#on_Foreach env c0 c1 c2 c3
      | Try (c0, c1, c2) -> self#on_Try env c0 c1 c2
      | Def_inline c0 ->
        self#on_Def_inline env c0
      | Noop -> self#on_Noop env
      | Using s -> self#on_Using env s
    method on_As_v env c0 =
      let r0 = self#on_expr env c0 in As_v r0
    method on_As_kv env c0 c1 =
      let r0 = self#on_expr env c0 in
      let r1 = self#on_expr env c1 in As_kv (r0, r1)
    method on_as_expr env this =
      match this with
      | As_v c0 -> self#on_As_v env c0
      | As_kv (c0, c1) -> self#on_As_kv env c0 c1
    method on_block env = self#on_list self#on_stmt env
    method on_expr env (c0, c1) =
      let r0 = self#on_Pos_t env c0 in
      let r1 = self#on_expr_ env c1 in (r0, r1)
    method on_Array env c0 =
      let r0 = self#on_list self#on_afield env c0 in Array r0
    method on_Darray env c0 =
      let r0 =
        self#on_list
          (fun env (c0, c1) ->
               let r0 = self#on_expr env c0 in
               let r1 = self#on_expr env c1 in (r0, r1)) env c0
      in
      Darray r0
    method on_Varray env c0 =
      let r0 = self#on_list self#on_expr env c0 in Varray r0
    method on_Shape env c0 =
      let r0 =
        self#on_list
          (fun env (c0, c1) ->
               let r0 = self#on_shape_field_name env c0 in
               let r1 = self#on_expr env c1 in (r0, r1)) env c0
      in
      Shape r0
    method on_Collection env c0 c1 =
      let r0 = self#on_id env c0 in
      let r1 = self#on_list self#on_afield env c1 in
      Collection (r0, r1)
    method on_Null env = Null
    method on_True env = True
    method on_False env = False
    method on_Id env c0 =
      let r0 = self#on_id env c0 in Id r0
    method on_Id_type_arguments env c0 c1 =
      let r0 = self#on_id env c0 in
      let r1 = self#on_list self#on_hint env c1 in Id_type_arguments (r0, r1)
    method on_Lvar env c0 =
      let r0 = self#on_id env c0 in Lvar r0
    method on_Lvarvar env c0 c1 =
      let r0 = self#on_int env c0 in
      let r1 = self#on_id env c1 in Lvarvar (r0, r1)
    method on_Clone env c0 =
      let r0 = self#on_expr env c0 in Clone r0
    method on_Obj_get env c0 c1 c2 =
      let r0 = self#on_expr env c0 in
      let r1 = self#on_expr env c1 in
      let r2 = self#on_og_null_flavor env c2 in Obj_get (r0, r1, r2)
    method on_Array_get env c0 c1 =
      let r0 = self#on_expr env c0 in
      let r1 = self#on_option self#on_expr env c1 in
      Array_get (r0, r1)
    method on_Class_get env c0 c1 =
      let r0 = self#on_expr env c0 in
      let r1 = self#on_expr env c1 in Class_get (r0, r1)
    method on_Class_const env c0 c1 =
      let r0 = self#on_expr env c0 in
      let r1 = self#on_pstring env c1 in Class_const (r0, r1)
    method on_Call env c0 c1 c2 c3 =
      let r0 = self#on_expr env c0 in
      let r1 = self#on_list self#on_hint env c1 in
      let r2 = self#on_list self#on_expr env c2 in
      let r3 = self#on_list self#on_expr env c3 in
      Call (r0, r1, r2, r3)
    method on_Int env c0 =
      let r0 = self#on_pstring env c0 in Int r0
    method on_Float env c0 =
      let r0 = self#on_pstring env c0 in Float r0
    method on_String env c0 =
      let r0 = self#on_pstring env c0 in String r0
    method on_String2 env c0 =
      let r0 = self#on_list self#on_expr env c0 in String2 r0
    method on_Execution_operator env c0 =
      let r0 = self#on_list self#on_expr env c0 in Execution_operator r0
    method on_Yield env c0 =
      let r0 = self#on_afield env c0 in Yield r0
    method on_Yield_break env = Yield_break
    method on_Yield_from env c0 =
      let r0 = self#on_expr env c0 in Yield_from r0
    method on_Await env c0 =
      let r0 = self#on_expr env c0 in Await r0
    method on_Suspend env c0 =
      let r0 = self#on_expr env c0 in Suspend r0
    method on_List env c0 =
      let r0 = self#on_list self#on_expr env c0 in List r0
    method on_Expr_list env c0 =
      let r0 = self#on_list self#on_expr env c0 in Expr_list r0
    method on_Cast env c0 c1 =
      let r0 = self#on_hint env c0 in
      let r1 = self#on_expr env c1 in Cast (r0, r1)
    method on_Unop env c0 c1 =
      let r0 = self#on_uop env c0 in
      let r1 = self#on_expr env c1 in Unop (r0, r1)
    method on_Binop env c0 c1 c2 =
      let r0 = self#on_bop env c0 in
      let r1 = self#on_expr env c1 in
      let r2 = self#on_expr env c2 in Binop (r0, r1, r2)
    method on_Pipe env c0 c1 =
      let r0 = self#on_expr env c0 in
      let r1 = self#on_expr env c1 in Pipe (r0, r1)
    method on_Eif env c0 c1 c2 =
      let r0 = self#on_expr env c0 in
      let r1 = self#on_option self#on_expr env c1 in
      let r2 = self#on_expr env c2 in Eif (r0, r1, r2)
    method on_NullCoalesce env c0 c1 =
      let r0 = self#on_expr env c0 in
      let r1 = self#on_expr env c1 in NullCoalesce (r0, r1)
    method on_InstanceOf env c0 c1 =
      let r0 = self#on_expr env c0 in
      let r1 = self#on_expr env c1 in InstanceOf (r0, r1)
    method on_Is env c0 c1 =
      let r0 = self#on_expr env c0 in
      let r1 = self#on_hint env c1 in Is (r0, r1)
    method on_BracedExpr env c0 =
      let r0 = self#on_expr env c0 in BracedExpr r0
    method on_ParenthesizedExpr env c0 =
      let r0 = self#on_expr env c0 in ParenthesizedExpr r0
    method on_New env c0 c1 c2 =
      let r0 = self#on_expr env c0 in
      let r1 = self#on_list self#on_expr env c1 in
      let r2 = self#on_list self#on_expr env c2 in
      New (r0, r1, r2)
    method on_Efun env c0 c1 =
      let r0 = self#on_fun_ env c0 in
      let r1 =
        self#on_list
          (fun env (c0, c1) ->
               let r0 = self#on_id env c0 in
               let r1 = self#on_bool env c1 in (r0, r1)) env c1
      in
      Efun (r0, r1)
    method on_Lfun env c0 =
      let r0 = self#on_fun_ env c0 in Lfun r0
    method on_Xml env c0 c1 c2 =
      let r0 = self#on_id env c0 in
      let r1 = self#on_list self#on_Xhpattribute env c1 in
      let r2 = self#on_list self#on_expr env c2 in
      Xml (r0, r1, r2)
    method on_Xhpattribute env = function
      | Xhp_simple (c0, c1) -> self#on_Xhpsimpleattr env c0 c1
      | Xhp_spread c0 -> self#on_Xhpspreadattr env c0
    method on_Xhpsimpleattr env c0 c1 =
      let r0 = self#on_id env c0 in
      let r1 = self#on_expr env c1 in
      Xhp_simple (r0, r1)
    method on_Xhpspreadattr env c0 =
      let r0 = self#on_expr env c0 in Xhp_spread r0
    method on_Unsafeexpr env c0 =
      let r0 = self#on_expr env c0 in Unsafeexpr r0
    method on_Import env c0 c1 =
      let r0 = self#on_import_flavor env c0 in
      let r1 = self#on_expr env c1 in Import (r0, r1)
    method on_GotoLabel env c0 =
      let r0 = self#on_pstring env c0 in
      GotoLabel r0
    method on_Goto env c0 =
      let r0 = self#on_pstring env c0 in
      Goto r0
    method on_Markup env c0 c1 =
      let r0 = self#on_pstring env c0 in
      let r1 = self#on_option self#on_expr env c1 in
      Markup (r0, r1)
    method on_Callconv env c0 c1 =
      let r0 = self#on_param_kind env c0 in
      let r1 = self#on_expr env c1 in
      Callconv (r0, r1)
    method on_expr_ env this =
      match this with
      | Array c0 -> self#on_Array env c0
      | Darray c0 -> self#on_Darray env c0
      | Varray c0 -> self#on_Varray env c0
      | Shape c0 -> self#on_Shape env c0
      | Collection (c0, c1) -> self#on_Collection env c0 c1
      | Null -> self#on_Null env
      | True -> self#on_True env
      | False -> self#on_False env
      | Id c0 -> self#on_Id env c0
      | Id_type_arguments (c0, c1) -> self#on_Id_type_arguments env c0 c1
      | Lvar c0 -> self#on_Lvar env c0
      | Lvarvar (c0, c1) -> self#on_Lvarvar env c0 c1
      | Clone c0 -> self#on_Clone env c0
      | Obj_get (c0, c1, c2) -> self#on_Obj_get env c0 c1 c2
      | Array_get (c0, c1) -> self#on_Array_get env c0 c1
      | Class_get (c0, c1) -> self#on_Class_get env c0 c1
      | Class_const (c0, c1) -> self#on_Class_const env c0 c1
      | Call (c0, c1, c2, c3) -> self#on_Call env c0 c1 c2 c3
      | Int c0 -> self#on_Int env c0
      | Float c0 -> self#on_Float env c0
      | String c0 -> self#on_String env c0
      | String2 c0 -> self#on_String2 env c0
      | Execution_operator c0 -> self#on_Execution_operator env c0
      | Yield c0 -> self#on_Yield env c0
      | Yield_from c0 -> self#on_Yield_from env c0
      | Yield_break -> self#on_Yield_break env
      | Await c0 -> self#on_Await env c0
      | Suspend c0 -> self#on_Suspend env c0
      | List c0 -> self#on_List env c0
      | Expr_list c0 -> self#on_Expr_list env c0
      | Cast (c0, c1) -> self#on_Cast env c0 c1
      | Unop (c0, c1) -> self#on_Unop env c0 c1
      | Binop (c0, c1, c2) -> self#on_Binop env c0 c1 c2
      | Pipe (c0, c1) -> self#on_Pipe env c0 c1
      | Eif (c0, c1, c2) -> self#on_Eif env c0 c1 c2
      | NullCoalesce (c0, c1) -> self#on_NullCoalesce env c0 c1
      | BracedExpr c0 -> self#on_BracedExpr env c0
      | ParenthesizedExpr c0 -> self#on_ParenthesizedExpr env c0
      | InstanceOf (c0, c1) -> self#on_InstanceOf env c0 c1
      | Is (c0, c1) -> self#on_Is env c0 c1
      | New (c0, c1, c2) -> self#on_New env c0 c1 c2
      | Efun (c0, c1) -> self#on_Efun env c0 c1
      | Lfun c0 -> self#on_Lfun env c0
      | Xml (c0, c1, c2) -> self#on_Xml env c0 c1 c2
      | Unsafeexpr c0 -> self#on_Unsafeexpr env c0
      | Import (c0, c1) -> self#on_Import env c0 c1
      | Omitted         -> self#on_Omitted env
      | Callconv (c0, c1) -> self#on_Callconv env c0 c1
    method on_Include env = Include
    method on_Require env = Require
    method on_IncludeOnce env = IncludeOnce
    method on_RequireOnce env = RequireOnce
    method on_import_flavor env this =
      match this with
      | Include -> self#on_Include env
      | Require -> self#on_Require env
      | IncludeOnce -> self#on_IncludeOnce env
      | RequireOnce -> self#on_RequireOnce env
    method on_AFvalue env c0 =
      let r0 = self#on_expr env c0 in AFvalue r0
    method on_AFkvalue env c0 c1 =
      let r0 = self#on_expr env c0 in
      let r1 = self#on_expr env c1 in AFkvalue (r0, r1)
    method on_afield env this =
      match this with
      | AFvalue c0 -> self#on_AFvalue env c0
      | AFkvalue (c0, c1) -> self#on_AFkvalue env c0 c1
    method on_Plus env = Plus
    method on_Minus env = Minus
    method on_Star env = Star
    method on_Slash env = Slash
    method on_Eqeq env = Eqeq
    method on_EQeqeq env = EQeqeq
    method on_Starstar env = Starstar
    method on_Diff env = Diff
    method on_Diff2 env = Diff2
    method on_AMpamp env = AMpamp
    method on_BArbar env = BArbar
    method on_Lt env = Lt
    method on_Lte env = Lte
    method on_Cmp env = Cmp
    method on_Gt env = Gt
    method on_Gte env = Gte
    method on_Dot env = Dot
    method on_Amp env = Amp
    method on_Bar env = Bar
    method on_Ltlt env = Ltlt
    method on_Gtgt env = Gtgt
    method on_Percent env = Percent
    method on_LogXor env = LogXor
    method on_Xor env = Xor
    method on_Eq env c0 =
      let r0 = self#on_option self#on_bop env c0 in Eq r0
    method on_bop env this =
      match this with
      | Plus -> self#on_Plus env
      | Minus -> self#on_Minus env
      | Star -> self#on_Star env
      | Slash -> self#on_Slash env
      | Eqeq -> self#on_Eqeq env
      | EQeqeq -> self#on_EQeqeq env
      | Starstar -> self#on_Starstar env
      | Diff -> self#on_Diff env
      | Diff2 -> self#on_Diff2 env
      | AMpamp -> self#on_AMpamp env
      | BArbar -> self#on_BArbar env
      | Lt -> self#on_Lt env
      | Lte -> self#on_Lte env
      | Gt -> self#on_Gt env
      | Gte -> self#on_Gte env
      | Dot -> self#on_Dot env
      | Amp -> self#on_Amp env
      | Bar -> self#on_Bar env
      | Ltlt -> self#on_Ltlt env
      | Gtgt -> self#on_Gtgt env
      | Cmp -> self#on_Cmp env
      | Percent -> self#on_Percent env
      | LogXor -> self#on_LogXor env
      | Xor -> self#on_Xor env
      | Eq c0 -> self#on_Eq env c0
    method on_Utild env = Utild
    method on_Unot env = Unot
    method on_Uplus env = Uplus
    method on_Uminus env = Uminus
    method on_Uincr env = Uincr
    method on_Udecr env = Udecr
    method on_Upincr env = Upincr
    method on_Updecr env = Updecr
    method on_Uref env = Uref
    method on_Usilence env = Usilence
    method on_Using env s =
      let r0 = self#on_expr env s.us_expr in
      let r1 = self#on_block env s.us_block in
      Using { s with us_expr = r0; us_block = r1 }
    method on_uop env this =
      match this with
      | Utild -> self#on_Utild env
      | Unot -> self#on_Unot env
      | Uplus -> self#on_Uplus env
      | Uminus -> self#on_Uminus env
      | Uincr -> self#on_Uincr env
      | Udecr -> self#on_Udecr env
      | Upincr -> self#on_Upincr env
      | Updecr -> self#on_Updecr env
      | Uref -> self#on_Uref env
      | Usilence -> self#on_Usilence env
    method on_Default env c0 =
      let r0 = self#on_block env c0 in Default r0
    method on_Case env c0 c1 =
      let r0 = self#on_expr env c0 in
      let r1 = self#on_block env c1 in Case (r0, r1)
    method on_case env this =
      match this with
      | Default c0 -> self#on_Default env c0
      | Case (c0, c1) -> self#on_Case env c0 c1
    method on_catch env (c0, c1, c2) =
      let r0 = self#on_id env c0 in
      let r1 = self#on_id env c1 in
      let r2 = self#on_block env c2 in (r0, r1, r2)
    method on_field env (c0, c1) =
      let r0 = self#on_expr env c0 in
      let r1 = self#on_expr env c1 in (r0, r1)
    method on_attr env (c0, c1) =
      let r0 = self#on_id env c0 in
      let r1 = self#on_expr env c1 in (r0, r1)
    method on_AHint env c0 =
      let r0 = self#on_hint env c0 in AHint r0
    method on_AExpr env c0 =
      let r0 = self#on_expr env c0 in AExpr r0
    method on_AStmt env c0 =
      let r0 = self#on_stmt env c0 in AStmt r0
    method on_ADef env c0 =
      let r0 = self#on_def env c0 in ADef r0
    method on_AProgram env c0 =
      let r0 = self#on_program env c0 in AProgram r0
    method on_any env this =
      match this with
      | AHint c0 -> self#on_AHint env c0
      | AExpr c0 -> self#on_AExpr env c0
      | AStmt c0 -> self#on_AStmt env c0
      | ADef c0 -> self#on_ADef env c0
      | AProgram c0 -> self#on_AProgram env c0
  end
