Var Nodes;
Var Result;

Var ForkPoint;
Var ReturnCount;

Procedure Init(BSLParser) Export
	Nodes = BSLParser.Nodes();
	Result = New Array;
	ForkPoint = 0;
	ReturnCount = 0;
EndProcedure // Init()

Function Result() Export
	Return StrConcat(Result, Chars.LF);
EndFunction // Result()

Function Interface() Export
	Var Interface;
	Interface = New Array;
	Interface.Add("VisitFuncDecl");
	Interface.Add("VisitProcDecl");
	Interface.Add("AfterVisitFuncDecl");
	Interface.Add("AfterVisitProcDecl");
	Interface.Add("VisitPrepIfDecl");
	Interface.Add("VisitPrepElsIfDecl");
	Interface.Add("VisitIfStmt");
	Interface.Add("VisitElsIfStmt");
	Interface.Add("AfterVisitIfStmt");
	Interface.Add("VisitPrepIfStmt");
	Interface.Add("VisitPrepElsIfStmt");
	Interface.Add("VisitWhileStmt");
	Interface.Add("VisitForStmt");
	Interface.Add("VisitForEachStmt");
	Interface.Add("VisitTryStmt");
	Interface.Add("VisitReturnStmt");
	Return Interface;
EndFunction // Interface()

Procedure VisitFuncDecl(FuncDecl, Stack, Counters) Export
	ForkPoint = 0;
	ReturnCount = 0;
EndProcedure // VisitFuncDecl()

Procedure VisitProcDecl(ProcDecl, Stack, Counters) Export
	ForkPoint = 0;
	ReturnCount = 0;
EndProcedure // VisitFuncDecl()

Procedure AfterVisitFuncDecl(FuncDecl, Stack, Counters) Export
	CyclomaticComplexity = ForkPoint - Max(1,ReturnCount) + 2;
	Result.Add(StrTemplate("Функция `%1()` имеет цикломатическую сложность %2", FuncDecl.Object.Name, CyclomaticComplexity));
EndProcedure // AfterVisitFuncDecl()

Procedure AfterVisitProcDecl(ProcDecl, Stack, Counters) Export
	CyclomaticComplexity = ForkPoint - Max(1,ReturnCount) + 2;
	Result.Add(StrTemplate("Процедура `%1()` имеет цикломатическую сложность %2", ProcDecl.Object.Name, CyclomaticComplexity));
EndProcedure // AfterVisitFuncDecl()

Procedure VisitPrepIfDecl(PrepIfDecl, Stack, Counters) Export
	ForkPoint = ForkPoint + 1;
EndProcedure

Procedure VisitPrepElsIfDecl(PrepElsIfDecl, Stack, Counters) Export
	ForkPoint = ForkPoint + 1;
EndProcedure

Procedure VisitIfStmt(IfStmt, Stack, Counters) Export
	ForkPoint = ForkPoint + 1;
EndProcedure

Procedure AfterVisitIfStmt(IfStmt, Stack, Counters) Export
	If IfStmt.Else <> Undefined Then
		ForkPoint = ForkPoint + 1;
	EndIf
EndProcedure

Procedure VisitElsIfStmt(ElsIfStmt, Stack, Counters) Export
	ForkPoint = ForkPoint + 1;
EndProcedure

Procedure VisitPrepIfStmt(PrepIfStmt, Stack, Counters) Export
	ForkPoint = ForkPoint + 1;
EndProcedure

Procedure VisitPrepElsIfStmt(PrepElsIfStmt, Stack, Counters) Export
	ForkPoint = ForkPoint + 1;
EndProcedure

Procedure VisitWhileStmt(WhileStmt, Stack, Counters) Export
	ForkPoint = ForkPoint + 1;
EndProcedure

Procedure VisitForStmt(ForStmt, Stack, Counters) Export
	ForkPoint = ForkPoint + 1;
EndProcedure

Procedure VisitForEachStmt(ForEachStmt, Stack, Counters) Export
	ForkPoint = ForkPoint + 1;
EndProcedure

Procedure VisitTryStmt(TryStmt, Stack, Counters) Export
	ForkPoint = ForkPoint + 2;
EndProcedure

Procedure VisitReturnStmt(TryStmt, Stack, Counters) Export
	ReturnCount = ReturnCount + 1;
EndProcedure
