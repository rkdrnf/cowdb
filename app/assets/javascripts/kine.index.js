$(function(){

	attachEvent();

});


function addGene(){
	var gn = $('#gene_name').val();
	var gf = $('#gene_f_gene').val();
	var gm = $('#gene_m_gene').val();


	$.ajax({
		url: "/genes/add_gene/",
		type: "get",
		dataType: "script",
		data: {gene: {name: gn, f_gene: gf, m_gene: gm}}
	});
}

function attachEvent(){
	$(".cow-delete-button").click(function(event){
		var ans = confirm('삭제하시겠습니까?');

		if (ans){
			return true;
		} else {
			return false;
		}
	});

}
