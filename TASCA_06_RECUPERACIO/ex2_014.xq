let $db := collection("CLASSICMODELS_BD")
let $cognoms := ("King","Schmitt")
let $clients := $db//customer[contact/contactLastName = $cognoms]/@customerNumber
for $x in $db//check
where $x/customer/@customerNumber = $clients
order by xs:double($x/amount) descending
return <amount>{ xs:double($x/amount) }</amount>