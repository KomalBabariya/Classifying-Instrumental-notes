% Babariya, Komal

function hzval = mel2hz(melval)
hzval = 700*(exp(melval/1127.01028) - 1);
end
