let $db := collection("CLASSICMODELS_BD")
let $mitjana := avg($db//check[amount castable as xs:double]/xs:double(amount))
for $x in $db//check
let $import := xs:double($x/amount)
where $import > $mitjana
order by $import descending
return concat("Compte: ", $x/@number,               
              ", Import: ", format-number($import, "0.00"),               
              ", Client: ", $x/customer/customerName)
