(** The abstract syntax tree for MiniJava with position informations to point
    the user to the location of the error in the source file when a syntax or
    typechecking error is encountered. *)

type identifier = string Location.t
(** An identifier with position informations. *)

type expression = raw_expression Location.t
(** An expression with position informations. *)

(** An expression without position informations. *)
and raw_expression =
  | EConst of constant  (** A integer, float, boolean or string constant. *)
  | EGetVar of identifier  (** Get the value of a variable. *)
  | ELUnOp of lunop * expression  (** An left unary operator. *)
  | ERUnOp of runop * expression  (** An right unary operator. *)
  | EBinOp of binop * expression * expression
      (** [EBinOp (op, e1, e2)] represents the expression [e1 op e2]. *)
  | EFunOp of funop * expression * expression
      (** [EFunOp (op, e1, e2)] represents the expression [e1 op e2] that has to
          be translated in C with a function. *)
  | EMethodCall of expression * identifier * expression list
      (** [EMethodCall (o, id, [p1, ..., pn])] represents the call
          [o.id(p1, ..., pn)]. *)
  | EArrayGet of expression * expression
      (** [EArrayGet (e1, e2)] represents the expression [e1[e2]]. *)
  | EIntArrayAlloc of expression
      (** [EIntArrayAlloc e] represents the expression [new int[e]]. *)
  | EFloatArrayAlloc of expression
      (** [EFloatArrayAlloc e] represents the expression [new float[e]]. *)
  | EArrayLength of expression
      (** [EArrayLength e] represents the expression [e.length]. *)
  | EThis  (** [EThis] represents the expression [this]. *)
  | EObjectAlloc of identifier
      (** [EObjectAlloc id] represents the expression [new id()]. *)

and constant =
  | ConstBool of bool  (** Boolean constant [true] or [false]. *)
  | ConstInt of int32  (** Integer constant [[-2^31, 2^31 - 1]]. *)
  | ConstFloat of float  (** Float constant. *)
  | ConstString of string  (** String constant. *)

and funop = OpMod  (** Function Operator [%%]. *)

and binop =
  | OpAdd  (** Binary operator [+]. *)
  | OpSub  (** Binary operator [-]. *)
  | OpMul  (** Binary operator [*]. *)
  | OpDiv  (** Binary operator [/]. *)
  | OpRem  (** Binary operator [%]. *)
  | OpLt  (** Binary operator [<]. *)
  | OpGt  (** Binary operator [>]. *)
  | OpBWAnd  (** Binary operator [&]. *)
  | OpBWOr  (** Binary operator [|]. *)
  | OpBWXOr  (** Binary operator [^]. *)
  | OpAnd  (** Binary operator [&&]. *)
  | OpOr  (** Binary operator [||]. *)
  | OpEq  (** Binary operator [==]. *)
  | OpNotEq  (** Binary operator [!=]. *)
  | OpLtEq  (** Binary operator [<=]. *)
  | OpGtEq  (** Binary operator [>=]. *)

and lunop =
  | LUOpNot  (** Unary operator [!]. *)
  | LUOpSub  (** Unary operator [-]. *)
  | LUOpIncr  (** Unary operator [++]. *)
  | LUOpDecr  (** Unary operator [--]. *)

and runop =
  | RUOpIncr  (** Unary operator [++]. *)
  | RUOpDecr  (** Unary operator [--]. *)

and instruction =
  | IBlock of instruction list
      (** [IBlock [i1; i2; ...; in]] represents the instruction
          [{ i1 i2 ... in }]. *)
  | IIf of expression * instruction * instruction
      (** [IIf (e, i1, i2)] represents the instruction [if (e) i1 else i2]. *)
  | IWhile of expression * instruction
      (** [IWile (e, ins)] represents the instruction [while (e) ins]. *)
  | IDoWhile of instruction * expression
      (** [IWile (ins, e)] represents the instruction [do ins while (e)]. *)
  | IFor of identifier * expression * expression * expression * instruction
      (** [IFor (i1, e1, e2, e3, ins)] represents the instruction
          [for (i1 = e1; e2; e3) ins]. *)
  | IExpr of expression  (** [IExpr e] represents the instruction [e;]. *)
  | IContinue  (** [IContinue] represents the instruction [continue;]. *)
  | ISyso of expression
      (** [ISyso e] represents the instruction [System.out.println(e);]. *)
  | ISetVar of identifier * expression
      (** [ISetVar (id, e)] represents the instruction [id = e;]. *)
  | IArraySet of identifier * expression * expression
      (** [IArraySet (id, e1, e2)] represents the instruction [id[e1] = e2;]. *)
  | IBreak  (** [IBreak] represents the instruction [break]. *)

and typ =
  | TypInt  (** Type [int]. *)
  | TypBool  (** Type [bool]. *)
  | TypString  (** Type [string]. *)
  | TypIntArray  (** Type [int[]]. *)
  | TypFloat  (** Type [float]. *)
  | TypFloatArray  (** Type [float[]]. *)
  | Typ of identifier  (** A class type. *)

and metho = {
  formals : (identifier * typ) list;
      (** The names of the parameters of the method with their types. *)
  result : typ;  (** Result type of the method. *)
  locals : (identifier * typ) list;
      (** The names of the local variables with their types (declared at the
          beginning of the method). *)
  body : instruction list;  (** The list of instructions of the method. *)
  return : expression;  (** The return expression. *)
}

and clas = {
  extends : identifier option;  (** The parent class if any. *)
  attributes : (identifier * typ) list;
      (** The names of the attributes of the class with their types. *)
  methods : (identifier * metho) list;
      (** The names of the methods of the class with their types. *)
}

and program = {
  name : identifier;  (** The name of the main class. *)
  defs : (identifier * clas) list;
      (** The names and definitions of the other classes. *)
  main_args : identifier;
      (** The name of the parameter of the main method in the main class. *)
  main : instruction list;
}
