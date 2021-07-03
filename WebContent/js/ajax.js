/*
 *	ajax.js 	
 */


var ajax = null;

// AJAX 객체(XMLHttpRequest 객체) 생성 함수

function createAjax()
{
	// ※ 객체를 생성하는 방식(방법)의 차이일 뿐...
	//    모두 XMLHttpRequest 객체를 생성하는 구문이다.
	
	/*
	if (window.ActiveXobject)		//-- 클라이언트야~ 너 IE 7 이전 버전 지원하고 있닝?
	{
		//return new ActiveXObject("Microsoft.XMLHTTP");
		return new ActiveXObject("Msxml12.XMLHTTP");
		//-- 이와 같은 방식으로 XMLHttpRequest 객체를 생성해라.
		//   (ActiveXObject 객체 → XMLHttpRequest 객체의 대리 객체)
	}
	else							//-- IE 7 이전 버전이 아닌 그 외 브라우저
	{	
		if(window.XMLHttpRequest)	//-- XMLHttpRequest 객체 지원 브라우저
		{
			return new XMLHttpRequest();
			//-- 이와 같은 방식으로 XMLHttpRequest 객체를 생성해라.
		}
		else						//-- AJAX 를 지원하지 않는 브라우저
		{
			return null;
		}
	}
	*/
	
	if (window.ActiveXobject)
		return new ActiveXObject("Msxml12.XMLHTTP");
	else if(window.XMLHttpRequest)
		return new XMLHttpRequest();
	else						
		return null;

}