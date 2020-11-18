(*
 * Copyright (c) 2018, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the "hack" directory of this source tree.
 *
 *)

open Hh_prelude
open Aast
module SN = Naming_special_names

let attribute_exists x1 attrs =
  List.exists attrs (fun { ua_name; _ } -> String.equal x1 (snd ua_name))

let static_memoized_check m =
  if attribute_exists SN.UserAttributes.uaMemoize m.m_user_attributes then
    Errors.static_memoized_function (fst m.m_name)

let unnecessary_memoize_lsb c m =
  let attr = SN.UserAttributes.uaMemoizeLSB in
  match Naming_attributes.mem_pos attr m.m_user_attributes with
  | None -> ()
  | Some pos ->
    let (pos_class, name_class) = c.c_name in
    let name_class = Utils.strip_ns name_class in
    let reason = (pos_class, sprintf "the class `%s` is final" name_class) in
    let suggestion =
      Some
        (sprintf
           "Try using the attribute `%s` instead"
           SN.UserAttributes.uaMemoize)
    in
    Errors.unnecessary_attribute pos ~attr ~reason ~suggestion

let handler =
  object
    inherit Tast_visitor.handler_base

    method! at_class_ env c =
      let disallow_static_memoized =
        TypecheckerOptions.experimental_feature_enabled
          (Tast_env.get_tcopt env)
          TypecheckerOptions.experimental_disallow_static_memoized
      in
      let (constructor, static_methods, _) = split_methods c in
      if disallow_static_memoized && not c.c_final then (
        List.iter static_methods static_memoized_check;
        Option.iter constructor static_memoized_check
      );
      if c.c_final then List.iter static_methods (unnecessary_memoize_lsb c)
  end
