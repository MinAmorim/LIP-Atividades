declare
fun {QuickSort Ls}
   fun {QuickSortIter Ls E}
      case Ls
      of nil then E
      [] L|Lr then Ys Zs in
	 {Devide Lr L Ys Zs}
	 {QuickSortIter Ys L|{QuickSortIter Zs E}}
      end
   end
   proc {Devide Ls P ?Ys ?Zs}
      case Ls
      of nil then Ys=nil Zs=nil
      [] L|Lr then
	 if L < P then Ys = L|{Devide Lr P $ Zs}
	 else Zs = L|{Devide Lr P Ys $} end
      end
   end
in
   {QuickSortIter Ls nil}
end
