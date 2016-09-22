/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function confirmacion(Controller,  Id, estado, boton) {
    if (confirm('¿De verdad desea '+boton.value +' esta máquina?')) {
        window.location.href = '../' + Controller + '?btn=archivar&id=' + Id + '&estado='+estado+'';
    }else{
        return false;
    }
}


