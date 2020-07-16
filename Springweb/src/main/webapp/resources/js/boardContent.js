$( document ).ready(function() {
    ButtonClick();
});

function ButtonClick(){
	
	 $("#btnList").click(function(){

		 location.href = "/board";

	 });
	 	 
	 
}
function btnUpdate(bid){
	var url="/board/editForm";
	url= url +"?bid="+bid;
	url = url + "&mode=edit";
	
	location.href= url;

}

function btnDelete(bid){
	var url="/board/deleteBoard";
	url= url +"?bid="+bid;
	
	location.href= url;

}
