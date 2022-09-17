/**
 * 
 */
 function click_get_btn(){
	 const element = document.getElementById('get_btn');
	 var text = element.innerHTML;
	 exp = /gray/;
	 
	 if(exp.test(text))
	{
	// 버튼 안눌렀을 때
	// alert(element.innerHTML);
	 $("#get_btn").attr("href", "GetCertiCon");
	}
	 else{
		//버튼 눌렸을 때
		 $("#get_btn").attr("href", "CancleGetCertiCon");
	 }
}

 function click_bookmark(){
	 const element = document.getElementById('bookmark_btn');
	 var text = element.innerHTML;
	 exp = /gray/;
	 
	 if(exp.test(text))
	{
	// 버튼 안눌렀을 때
	// alert(element.innerHTML);
	 $("#bookmark_btn").attr("href", "BookmarkCon");
	 

	}
	 else{
		//버튼 눌렸을 때
		 $("#bookmark_btn").attr("href", "CancleBookmarkCon");
		
	 }
}