fun {Fact N}
   fun {FactIter N A}
      if N==1 then A
      else {Fact N-1 N*A} end
   end
in
   {FactIter N 1}
end
