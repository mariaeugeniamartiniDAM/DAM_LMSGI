for $c in collection("CLASSICMODELS_BD")//check[customer/@customerNumber="103"]
return attribute { "number" } { data($c/@number) }