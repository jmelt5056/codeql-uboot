import cpp

class NetworkByteSwap extends Expr {
    NetworkByteSwap() {
        
         exists(MacroInvocation mci |
           mci.getMacro().getName() in ["ntohs","ntohl","ntohll"] | this = mci.getExpr()
        )
    
    
    }

    
}

from NetworkByteSwap n

select n, "Network byte swap"