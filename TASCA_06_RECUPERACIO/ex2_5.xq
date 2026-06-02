let $db := collection("CLASSICMODELS_BD")
let $mitjana := avg(
  for $c in $db//check  
  where $c/amount castable as xs:double  
  return xs:double($c/amount)
)
for $c in $db//check
let $id := data($c/@number)
where xs:double($c/amount) > $mitjana
order by $id
return $id
