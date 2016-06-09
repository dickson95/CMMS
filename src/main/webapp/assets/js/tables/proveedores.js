/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function confirmar(controller, id, estado,compania,telefono,direccion,c_postal,
                    email,p_web,ciudad,deuda,descripcion) {
    if (confirm('¿Está seguro de desactivar el registro?')) {
        window.location.href = '../'+controller+'?btn=guardarcambios&id='+id+'&estado=' + estado + '&compania=' + compania + '&telefono=' + telefono + '&direccion=' + direccion + '&c_postal=' + c_postal + '&email=' + email + '&p_web=' + p_web + '&ciudad=' + ciudad + '&deuda=' + deuda + '&descripcion=' + descripcion + '';
    }
}
$(document).on("click", ".open-Modal", function () {
    var id = $(this).data('id');
    var estado = $(this).data('estado');
    var compania = $(this).data('compania');
    var telefono = $(this).data('telefono');
    var direccion = $(this).data('direccion');
    var c_postal = $(this).data('c_postal');
    var email = $(this).data('email');
    var p_web = $(this).data('p_web');
    var ciuid = $(this).data('ciuid');
    var ciudad = $(this).data('ciudad');
    var deuda = $(this).data('deuda');
    var descripcion = $(this).data('descripcion');
    $(".modal-body #id").val(id);
    $(".modal-body #estado").val(estado);
    $(".modal-body #compania").val(compania);
    $(".modal-body #telefono").val(telefono);
    $(".modal-body #direccion").val(direccion);
    $(".modal-body #c_postal").val(c_postal);
    $(".modal-body #email").val(email);
    $(".modal-body #p_web").val(p_web);
    $(".modal-body #ciuid").val(ciuid);
    document.getElementById('ciuid').innerHTML=ciudad;
    $(".modal-body #deuda").val(deuda);
    $(".modal-body #descripcion").val(descripcion);
});


/**
 * Plugin  : Autocompletar con jQuery
 *   Autor : Lucas Forchino
 * WebSite : http://www.tutorialjquery.com
 * version : 1.0
 * Licencia: Pueden usar libremenete este código siempre y cuando no sea para 
 *           publicarlo como ejemplo de autocompletar en otro sitio.
 */
(function($){
    // Creo la funcion en el prototype de jQuery de manera de integrarla
    $.fn.autocomplete= function ()
    {
        //puede haber mas de un autocomplete que cargar por eso esto los levanta a todos
        $(this).each(function(){
             
             
            // aplico los estilos a los elementos elegidos
            $(this).addClass('autocomplete-jquery-aBox');
             
             
            // guardo en una variable una nueva funcion que asigna el texto del 
            // link que paso en that al input donde escribimos.
            // esto seleccionaria el link del cuadro autocompletar
            var selectItem = function(that)
            {
                // partiendo del link busco el input y le asigno el valor del link
                $(that).parent().parent().find('input').val($(that).html());
                // remuevo el cuadro de autocompletar, se supone si ya seleccionaste
                // un valor no se necesita mas
                $(that).parent().remove();
                                     
            }
            // busco el input y le asigno un evento al presionar una tecla
            $(this).find('input').bind('keyup',function(event){
                var input=$(this);
                 
                // codigo de la tecla persionada
                var code=event.keyCode;
                // si es Enter => seleccionar el link marcado 
                if (code==13 && $('.autocomplete-jquery-mark').size()>0)
                {
                    var element=$('.autocomplete-jquery-mark').get(0);
                    selectItem(element);
                }
                // si son las flechas => moverse por los links
                else if(code==40 || code ==38)
                {
                    elements =$('.autocomplete-jquery-results').find('a');
                    var mark =0;
                    if ($('.autocomplete-jquery-mark').size()>0){
                        mark=$('.autocomplete-jquery-mark').attr('data-id');
                        $('.autocomplete-jquery-mark').removeClass('autocomplete-jquery-mark');
                              
                        if (code==38){
                            mark --;
                        }else{
                            mark ++;
                        }
                              
                        if (mark > elements.size()){
                            mark=0;
                        }else if (mark < 0){
                            mark=elements.size();
                        }
                              
                              
                    }
                    elements.each(function(){
                        if ($(this).attr('data-id')==mark)
                        {
                            $(this).addClass('autocomplete-jquery-mark');
                        }
                    });                             
                              
                }
                 
                // si es una letra o caracter, ejecutar el autocompletar
                // con este filtro solo toma caracteres para la busqueda
                else if((code>47 && code<91)||(code>96 && code<123) || code ==8 )
                {
                    // si presiono me fijo si hay resultados para lo que tengo 
                    // tomo la url
                    var url = input.attr('data-source');
                    // tomo el valor del combo actualmente
                    var value = input.val();
                    url+=value;
                    //busco en el server la info 
                    $.getJSON(url,{}, function(data){
                        // si encontro algo 
                        // creo un cuadro debajo del input con los resultados
                        input.parent().find('.autocomplete-jquery-results').remove();
                        var left = input.position().left;
                        var width= input.width();
                        var result=$('<ul>');
                        // le damos algunos estilos al combo 
                        result.css({'width':width});
                        result.css({'left':left});
                         
                         
                        result.addClass('autocomplete-jquery-results');
                        for(index in data)
                        {
                            //agrego un link por resultado
                            if(data.hasOwnProperty(index))
                                {
                                    var div = $('<li>');
                                    div.html(data[index]);
                                    div.addClass('autocomplete-jquery-item');
                                    var panel='dropdown-menu';
                                    div.css({'class':panel});
 
                                    div.click(function(){
                                        // funcion que pone el texto en input
                                        selectItem(this);
                                    })
                                    div.attr('data-id',index);
                                    $(result).append(div);
                                }
                        }
                        if (data.length>0)
                        {
                            input.parent().append(result);
                            result.fadeIn('slow');
                        }
                    });
                }
            });
        });
    }
})(jQuery);
