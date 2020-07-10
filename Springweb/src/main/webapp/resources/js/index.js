$( document ).ready(function() {
	ButtonClick();
});

function ButtonClick(){
	 $("#writeboard").click(function(){

		 location.href ="/board/boardForm";

	 });
	 
	
	 
}

function btnSearch(searchType){
	
		console.log("wlekr" + searchType);
//		location.href ="/board";
//		url = url + "?searchType=" + $('#searchType').val();
//		url = url + "&keyword=" + $('#keyword').val();
//		location.href = url;
//		console.log(url);

}
