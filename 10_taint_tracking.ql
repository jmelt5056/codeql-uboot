import cpp
import semmle.code.cpp.dataflow.TaintTracking
import DataFlow::PathGraph

class NetworkByteSwap extends Expr {
    NetworkByteSwap() {
        
         exists(MacroInvocation mci |
           mci.getMacro().getName() in ["ntohs","ntohl","ntohll"] | this = mci.getExpr()
        )
    
    
    }

    
}

class Config extends TaintTracking::Configuration {
    Config() { this = "NetworkToMemFuncLength" }
  
    override predicate isSource(DataFlow::Node source) {
        
        source.asExpr() instanceof NetworkByteSwap
    }
    override predicate isSink(DataFlow::Node sink) {

      //  FunctionCall fnc

//where fnc.getTarget().getName() = "memcpy"

    //FunctionCall fnc
    
      exists( FunctionCall fnc|  
      sink.asExpr() = fnc.getArgument(2) | fnc.getTarget().getName() = "memcpy" )
    }
  }
  
  from Config cfg, DataFlow::PathNode source, DataFlow::PathNode sink
  where cfg.hasFlowPath(source, sink)
  select sink, source, sink, "Network byte swap flows to memcpy"