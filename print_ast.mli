(** Prints the abstract syntax tree on an output channel. *)

val print : out_channel -> LMJ.program -> bool -> unit
(** [print out prog show_loc] prints the abstract syntax tree [prog] on the
    [out] channel. If [show_loc] is true, prints position informations too. *)
