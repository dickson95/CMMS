/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function confirmacion(Controller,  Id, estado, boton) {
    if (confirm('¿De verdad desea '+boton.value +' esta Imagen?')) {
        window.location.href = '../' + Controller + '?btn=estado&id=' + Id + '&estado='+estado+'';
    }else{
        return false;
    }
}
$(document).on('click', '.open-Modal', function(){
   var id = $(this).data('id');
   var estado = $(this).data('estado');
   var imagen = $(this).data('imagen');
   var maquina = $(this).data('maquina');
   var maqid = $(this).data('maqid');
   $('.modal-body #id').val(id);
   $('.modal-body #estado').val(estado);
   $('.modal-body #imagen').val(imagen);
   $('.modal-body #maqid').val(maqid);
   document.getElementById('maqid').innerHTML=maquina;
   
});

