let $db := collection("CLASSICMODELS_BD")
let $mitjana := avg($db//check[amount castable as xs:double]/xs:double(amount))
return round($mitjana)
