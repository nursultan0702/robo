function like(id){
var like = document.getElementById(id);
like =  parseInt(like.textContent);
like++;
document.getElementById(id).innerHTML ='<span class="lnr lnr-heart"></span> ' + like + " likes";
$.ajax({
    url: '/news/like/'+id,
    type: 'get',
     })
            .done(function( msg ) {
                alert( "Data: " + msg );
            });
}