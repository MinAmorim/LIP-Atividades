declare
local Acumulador in
   Acumulador = {NewCell 0} 

   fun {Acumular N}
      Acumulador := @Acumulador + N 
      @Acumulador                     
   end
end

{Browse {Acumular 5}}   
{Browse {Acumular 10}} 
{Browse {Acumular 34}}  
