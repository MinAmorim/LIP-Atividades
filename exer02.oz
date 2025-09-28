% (a) 

declare Permutacao CombRapida
fun {Permutacao N K}
   if K==0 then 1
   else N*{Permutacao N-1 K-1} end
end

fun {CombRapida N K}
   if K==0 then 1
   else {Permutacao N K} div {Permutacao K K} end
end

{Browse {CombRapida 5 3}}  


% (b) 

declare Fatorial Combinacao CombMuitoRapida
fun {Fatorial N}
   if N==0 then 1
   else N*{Fatorial N-1} end
end

fun {Combinacao N K}
   if K==0 then 1
   else {Fatorial N} div ({Fatorial N-K}*{Fatorial K}) end
end

fun {CombMuitoRapida N K}
   if 2*K =< N then {Combinacao N K}
   else {Combinacao N N-K} end
end

{Browse {CombMuitoRapida 4 2}} 