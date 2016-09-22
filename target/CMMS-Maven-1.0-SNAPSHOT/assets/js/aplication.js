/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
    $('.tablas').DataTable({
        "lengthMenu": [7, 15, 25, 50, "Todos"],
        language: {
            processing: "Espere un momento...",
            search: "Buscar&nbsp;:",
            lengthMenu: "Mostrar&nbsp; _MENU_ &nbsp;registros",
            info: "Resultados _START_ - _END_ de _TOTAL_",
            infoEmpty: "Viendo el elemento 0 0 de 0 productos",
            infoFiltered: "(filtrado de _MAX_ registros)",
            infoPostFix: "",
            loadingRecords: "Cargando datos...",
            zeroRecords: "No hay datos para mostrar",
            emptyTable: "No hay datos disponibles en la tabla",
            paginate: {
                first: "Primero",
                previous: "Anterior",
                next: "Siguiente",
                last: "Último"
            },
            aria: {
                sortAscending: ": habilitado para ordenar columna en orden ascendente",
                sortDescending: ": habilitado para ordenar columna en orden descendente"
            }
        }
    });
});

