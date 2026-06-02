distinct-values(
  for $c in collection("CLASSICMODELS_BD")//customer
  where $c/creditLimit castable as xs:double   
    and xs:double($c/creditLimit) >= 1160   
    and xs:double($c/creditLimit) <= 1165
    and $c/customerName != ""
  return $c/customerName/text()
)