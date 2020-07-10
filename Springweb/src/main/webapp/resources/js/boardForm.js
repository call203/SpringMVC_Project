$( document ).ready(function() {
	
      ButtonClick();
     	
});

function ButtonClick(){
	 $("#btnSave").click(function(){

		 $("#form").submit();

	 });
	 $("#btnList").click(function(){

		 location.href = "/board";

	 });
			 
}

