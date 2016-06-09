/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function confirmar(controller, id, nombre,email,proveedor,codigo,estado) {
    if (confirm('¿Está seguro de desactivar el registro?')) {
        window.location.href = '../'+controller+'?btn=guardarcambios&id='+id+'&estado=' + estado + '&nombre=' + nombre + '&email=' + email + '&proveedor=' + proveedor + '&codigo=' + codigo + '&email=' + email +'';
    }
}
$(document).on("click", ".open-Modal", function () {
    var id = $(this).data('id');
    var nombre = $(this).data('nombre');
    var email = $(this).data('email');
    var proid = $(this).data('proid');
    var proveedor = $(this).data('proveedor');
    var codigo = $(this).data('codigo');
    var estado = $(this).data('estado');
    $(".modal-body #id").val(id);
    $(".modal-body #nombre").val(nombre);
    $(".modal-body #email").val(email);
    $(".modal-body #codigo").val(codigo);
    $(".modal-body #estado").val(estado);
    $(".modal-body #proid").val(proid);
    document.getElementById('proid').innerHTML=proveedor;
});

