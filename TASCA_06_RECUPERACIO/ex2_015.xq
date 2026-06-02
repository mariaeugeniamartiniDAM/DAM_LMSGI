let $db := collection("CLASSICMODELS_BD")
let $cognomsEmpleats := ("Fixter","King")
let $empleats := $db//employee[lastName = $cognomsEmpleats]/@employeeNumber
let $clients := $db//customer[salesRepEmployeeNumber = $empleats]/@customerNumber
for $x in $db//check
where $x/customer/@customerNumber = $clients
let $import := xs:double($x/amount)
order by $import descending
return concat("ID: ", $x/@number, ", Quantitat: ", format-number($import, "0.00"))