let $db := collection("CLASSICMODELS_BD")
let $numClient := $db//customer[customerName="Atelier graphique"]/@customerNumber
for $c in $db//check[customer/@customerNumber=$numClient]
return attribute { "number" } { data($c/@number) }
