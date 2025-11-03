declare
fun {SumList Xs}
   fun {SumListIter Ys A}
      case Ys
      of nil then A
      [] Y|Yr then {SumListIter Yr A+Y} end
   end
in
   {SumListIter Xs 0}
end
