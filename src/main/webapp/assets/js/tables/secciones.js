/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function confirmacion(Controller, Id, Nombre, Codigo, Localizacion_Id, Estado) {
    if (confirm('¿Está seguro de activar nuevamente el registro?')) {
        window.location.href = '../' + Controller + '?btn=guardarcambios&seccionId='
                + Id + '&nombreSeccion=' + Nombre + '&codigo=' + Codigo +
                '&Estado=' + Estado + '&localizacion='+Localizacion_Id+'';
    }
}
$(document).on("click", ".open-Modal", function () {
    var nombre = $(this).data('nombre');
    var id = $(this).data('id');
    var estado = $(this).data('estado');
    var cod = $(this).data('codigo');
    var locid = $(this).data('locid');
    var locnom = $(this).data('locnom');
    $(".modal-body #nombre").val(nombre);
    $(".modal-body #id").val(id);
    $(".modal-body #estado").val(estado);
    $(".modal-body #codigo").val(cod);
    $(".modal-body #locid").val(locid);
    document.getElementById('locid').innerHTML=locnom;
});

