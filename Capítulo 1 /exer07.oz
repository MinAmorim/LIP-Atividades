local X in
   X=23
   local X in
      X=44
   end
   {Browse X}
end

local X in
   X={NewCell 23}
   X:=44
   {Browse @X}
end
