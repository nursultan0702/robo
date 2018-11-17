function like(id){
$.ajax({
    url: '/news/like/'+id,
    type: 'get',
     })
            .done(function( msg ) {
                alert( "Data: " + msg );
            });
}