(* FreeSpec
 * Copyright (C) 2018 ANSSI
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 *)

Require Import Coq.Program.Program.

Require Import FreeSpec.Specs.Memory.
Require Import FreeSpec.Specs.Bitfield.

Record SMRAMC :=
  { d_lock: bool
  ; d_open: bool
  ; d_cls:  bool
  }.

Definition SMRAMC_bf
  : Bitfield 8 SMRAMC :=
  skip 4                  :;
  d_lck  :<- bit           ;
  d_cls  :<- bit           ;
  d_open :<- bit           ;
  skip 1                  :;

  bf_pure {| d_lock  := d_lck
           ; d_open := d_open
           ; d_cls  := d_cls
           |}.

Definition parse_smramc
           (b: byte)
  : SMRAMC :=
  parse SMRAMC_bf b.