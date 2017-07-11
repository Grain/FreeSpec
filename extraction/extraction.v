Require Import FreeSpec.Interface.
Require Import FreeSpec.Interp.
Require Import FreeSpec.Program.

Require Import FreeSpec.Examples.Map.

Extraction Language Haskell.

Extraction "FreeSpec"
           Program.Program Program.runProgram'
           Map.IMap.