(** Transpiles the abstract syntax tree of MiniJava to C. *)

val program2c : out_channel -> TMJ.program -> unit
(** [program2c out prog] transpiles the abstract syntax tree [prog] of the
    MiniJava program to C and prints it on the [out] channel. *)
