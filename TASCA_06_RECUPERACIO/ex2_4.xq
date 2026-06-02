for $e in collection("CLASSICMODELS_BD")//employee
order by xs:integer($e/@employeeNumber)
return concat("Nom:", $e/firstName, " ", $e/lastName,                
              ", Numero d'empleat:", $e/@employeeNumber,                
              ", Oficina assignada:", $e/office/City)
