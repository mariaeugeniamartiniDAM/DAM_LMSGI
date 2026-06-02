let $db := collection("CLASSICMODELS_BD")
let $valors := ("103","112")
for $c in $db//check
where $c/customer/@customerNumber = $valors
return attribute { "number" } { data($c/@number) }
