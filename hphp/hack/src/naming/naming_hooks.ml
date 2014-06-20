(**
 * Copyright (c) 2014, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the "hack" directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 *
 *)

let (hint_hooks: (Pos.t * string -> unit) list ref) = ref []

let (new_id_hooks: (Pos.t * string -> unit) list ref) = ref []

let attach_hint_hook hook =
  hint_hooks := hook :: !hint_hooks

let attach_new_id_hook hook =
  new_id_hooks := hook :: !new_id_hooks

let dispatch_hint_hook id =
  List.iter begin fun hook -> hook id end !hint_hooks

let dispatch_new_id_hook id =
  List.iter begin fun hook -> hook id end !new_id_hooks

let remove_all_hooks () =
  hint_hooks := [];
  new_id_hooks := [];
