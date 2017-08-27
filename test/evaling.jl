using ASTInterpreter2

# Simple evaling of function argument
function evalfoo1(x,y)
    x+y
end
frame = ASTInterpreter2.enter_call_expr(:($(evalfoo1)(1,2)))
ok, res = DebuggerFramework.eval_code(nothing, frame, "x")
@assert res == 1

ok, res = DebuggerFramework.eval_code(state, "y")
@assert res == 2

# Evaling with sparams
function evalsparams{T}(x::T)
    x
end
frame = ASTInterpreter2.enter_call_expr(:($(evalsparams)(1)))
ok, res = DebuggerFramework.eval_code(nothing, frame, "x")
@assert res == 1

ok, res = DebuggerFramework.eval_code(nothing, frame, "T")
@assert res == Int