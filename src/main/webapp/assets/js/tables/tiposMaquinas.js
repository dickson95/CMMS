/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function confirmacion(Controller, Id, Nombre, Estado) {
    if (confirm('¿Está seguro de activar nuevamente el registro?')) {
        window.location.href = '../' + Controller + '?btn=guardarcambios&tipoId='
                + Id + '&nombreTipo=' + Nombre + '&Estado=' + Estado + '';
    }
}
$(document).on("click", ".open-Modal", function () {
    var nombre = $(this).data('nombre');
    var id = $(this).data('id');
    var estado = $(this).data('estado');
    $(".modal-body #nombre").val(nombre);
    $(".modal-body #id").val(id);
    $(".modal-body #estado").val(estado);
});