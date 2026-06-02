count(
  distinct-values(
    for $c in collection("CLASSICMODELS_BD")//customer
    where $c/creditLimit castable as xs:double 
      and xs:double($c/creditLimit) > 1600
    return data($c/@customerNumber)
  )
)