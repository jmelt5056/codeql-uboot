import cpp

from MacroInvocation mci
where mci.getMacro().getName() in ["ntohs","ntohl","ntohll"]
select mci
