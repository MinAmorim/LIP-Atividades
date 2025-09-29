declare SomaLista
fun {SomaLista Lista}
   case Lista of X|Resto then X + {SomaLista Resto}
   else 0 end
end

declare Inteiros
fun lazy {Inteiros N}
   N | {Inteiros N + 1}
end
