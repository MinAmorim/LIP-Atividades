declare
fun {Fact N}
   if N == 0 then 1
   else N * {Fact N-1}
   end
end

Result = {Fact 100}

{Browse Result}

