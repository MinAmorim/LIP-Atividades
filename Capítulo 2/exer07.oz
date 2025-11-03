fun {CorrectAppend Ls Ms}
   case Ls
   of nil then Ms
   [] L|Lr then L|{CorrectAppend Lr Ms}
   end
end
