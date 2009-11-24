function insertAtCaret(filename) { 
	
	// find the active div  
    var myDivArray = new Array();
    myDivArray = $('pages').getElementsByClassName('page');
    var i=0;
    while (i < myDivArray.length){ 
	    if($(myDivArray[i].id).getStyle('display') == 'none'){
		 // do nothing, non-active tab
		} else {
		   var divId = '';
		   divId =  myDivArray[i].id;
		   var myTextAreaArray = new Array();
		   myTextAreaArray = $(divId).getElementsByClassName('textarea');
		   var areaId = '';
		   areaId = myTextAreaArray[0].id;

		}
		i++;
    }
   
	var txtarea = document.getElementById(areaId);
	
	var text = '<div class="mediamaid"><img src="' + filename + '" /></div>';
	var scrollPos = txtarea.scrollTop; 
	var strPos = 0; 
	var br = ((txtarea.selectionStart || txtarea.selectionStart == '0') ? "ff" : (document.selection ? "ie" : false ) ); 
	if (br == "ie") { 
		txtarea.focus(); 
		var range = document.selection.createRange(); 
		range.moveStart ('character', -txtarea.value.length); 
		strPos = range.text.length; 
	} 
	else if (br == "ff") strPos = txtarea.selectionStart; 
	
	var front = (txtarea.value).substring(0,strPos); 
	var back = (txtarea.value).substring(strPos,txtarea.value.length); 
	txtarea.value=front+text+back; 
	strPos = strPos + text.length; 
	if (br == "ie") { 
		txtarea.focus(); 
		var range = document.selection.createRange(); 
		range.moveStart ('character', -txtarea.value.length); 
		range.moveStart ('character', strPos); 
		range.moveEnd ('character', 0); 
		range.select(); 
	} 
	else if (br == "ff") { 
		txtarea.selectionStart = strPos; 
		txtarea.selectionEnd = strPos; txtarea.focus(); 
	} 
	txtarea.scrollTop = scrollPos; 
} 