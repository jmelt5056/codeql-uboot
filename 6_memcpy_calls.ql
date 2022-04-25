import cpp

//from  FunctionCall fc, Function f
//where f.getName() = "memcpy" and fc.getTarget() = f
//select fc

from FunctionCall fnc
where fnc.getTarget().getName() = "memcpy"
select fnc