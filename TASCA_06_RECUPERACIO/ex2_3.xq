let $suma := sum(
  for $p in collection("CLASSICMODELS_BD")//check  
  where $p/customer/salesRepEmployeeNumber = 1370  
  return xs:double($p/amount)
)
(: Muevo la coma 6 posiciones a la izquierda y concatenamos el texto 'E6' para que el resultado sea el mismo que el planteado :)
return concat(xs:string($suma div 1000000), "E6")