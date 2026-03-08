// Funció esperada del arxiuc offices.jsonp
function callback(datosOficinas) {
    const contenedor = document.getElementById('contenedor-oficinas');
    let contenidoHTML = '';

    datosOficinas.forEach(oficina => {
       // -- PROCESSAMENT DE DATES --

       //Fila 2. Direcció (addressLine1 + addressLine2 si n'hi ha)
        const direccioCompleta = oficina.addressLine2 
            ? `${oficina.addressLine1}, ${oficina.addressLine2}` 
            : oficina.addressLine1;
        
        //Fila 3. Estat ( si és null, posarem un guió)
        const estat = (oficina.state && oficina.state !== "null") ? oficina.state : "--"

        //Fila 4. Pais (country + territory)

        const paisTerritori = `${oficina.country} - ${oficina.territory}`;

        // Construcció del HTML
        contenidoHTML += `
            <div class="oficina-card">
                <div class="banner">${oficina.city}</div>
                <table class="tabla-datos">
                    <tr>
                        <td class="col-foto">
                            <img src="${oficina.picture}" alt="Foto de ${oficina.city}">
                        </td>
                        <td class="col-info">
                            <div class="fila-dato"><span class="negreta">Telèfon:</span> ${oficina.phone}</div>
                            <div class="fila-dato"><span class="negreta">Direcció:</span> ${direccioCompleta}</div>
                            <div class="fila-dato"><span class="negreta">Estat:</span> ${estat}</div>
                            <div class="fila-dato"><span class="negreta">País:</span> ${paisTerritori}</div>
                        </td>
                    </tr>
                </table>
            </div>
        `;
    });

    contenedor.innerHTML = contenidoHTML;
}