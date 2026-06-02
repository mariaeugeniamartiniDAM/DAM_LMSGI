for $e in collection("CLASSICMODELS_BD")//employee[lastName="Patterson"]
return attribute { "employeeNumber" } { data($e/@employeeNumber) }
