let $nl := "&#10;"
let $db := collection("CLASSICMODELS_BD")
let $numEmpleats := count($db//employee)
let $numClients := count(distinct-values($db//customer/@customerNumber))
let $numXecs := count($db//check)
return concat("Número d'empleats: ", $numEmpleats, $nl,              
              "Número de clients: ", $numClients, $nl,              
              "Número de xecs: ", $numXecs)
