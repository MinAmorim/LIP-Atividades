declare
fun {BscMeth F A B}
   fun {BscMethIter A B}
      X = (A+B)/2.0
      V = {F X}
   in
      if {GoodEnough V} then X
      else A1 B1 in
	 A1#B1={Improve A B V X}
	 {BscMethIter A1 B1}
      end
   end
   fun {GoodEnough V}
      {Abs V} < 0.00001
   end
   fun {Improve A B V X}
      if V > 0.0 then A#X
      else X#B end
   end
in
   {BscMethIter A B}
end

{Browse {BscMeth fun{$ X} X*X - 2.0 end 0.0 2.0}}
