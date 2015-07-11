/**********************************************************************
 * Software:	JS Embedded Content
 * Versi�n:	1.1 Final (Oct 13, 2006)
 * Autor:	Raspu (donraspu arroba gmail punto com)
 * Copyleft 2006, Raspu - Algunos derechos reservados. 
 *
 * "JS Embedded Content" es software libre. Se otorga permiso para copiar,
 * distribuir y/o modificar este programa bajo los t�rminos de la Licencia
 * P�blica General de GNU, versi�n 2.0 o cualquier otra versi�n posterior
 * (a su elecci�n) publicada por la Free Software Foundation.
 * 
 * Puedes consultar una copia de la licencia en http://www.gnu.org/copyleft/gpl.html
 *
 *
 * DESCRIPCI�N:
 * ------------
 * "JS Embedded Content" es una peque�a aplicaci�n desarrollada
 * mediante Javascript no intrusivo ni obstructivo, que permite la
 * activaci�n autom�tica de todos los elementos incrustados en un
 * documento HTML mediante las etiquetas OBJECT, EMBED y/o APPLET.
 *
 * NAVEGADORES COMPATIBLES:
 * ------------------------
 * - �pera 9 final o superior (para versiones anteriores no es requerido)
 * - Internet Explorer 5 o superior (Windows, en MAC no he probado)
 * El resto de navegadores no es compatible debido al uso outerHTML,
 * pero como por el momento no lo requieren no es mayor problema.
 *
 * INSTRUCCIONES DE USO:
 * ---------------------
 * S�lo debes incluir el archivo "embeddedcontent.js" colocando el siguiente 
 * c�digo entre las etiquetas <HEAD> y </HEAD> de tus documentos HTML:
 * 
 * <script type="text/javascript" src="embeddedcontent.js" defer="defer"></script>
 *
 * NOTA: el uso del atributo DEFER es imprescindible para poder emular en 
 * I. Explorer el evento DOMContentLoaded.
 **********************************************************************/
var embeddedContent = 
{

	isMSIE : (document.all && !window.opera) ? true : false,
	
	
	/**
	 * Reinserta en el documento HTML los elementos que han sido incrustados mediante
	 * las etiquetas OBJECT, EMBED y/o APPLET, redefiniendo su propiedad outerHTML
	 */
	reinsertContent : function()
	{	
	var totalNodes = new Array(3);
		totalNodes['OBJECT'] = document.getElementsByTagName('OBJECT').length;
		totalNodes['EMBED'] = document.getElementsByTagName('EMBED').length;
		totalNodes['APPLET'] = document.getElementsByTagName('APPLET').length;
		for(var tagName in totalNodes)
		{
			var counter = totalNodes[tagName] - 1;
			for(var node; node = document.getElementsByTagName(tagName)[counter]; counter--)
			{
				sourceCode = embeddedContent.getSourceCode(node);
				if(sourceCode)
				{
					node.outerHTML = sourceCode;
				}
			}
		}
		embeddedContent.isMSIE = null;
	},
	
	
	/**
	 * Obtiene el c�digo HTML completo de un determinado nodo.
	 * @param	node (object) - El nodo analizado
	 * @return	sourceCode (string) - El c�digo HTML obtenido
	 */
	getSourceCode : function(node)
	{
		var sourceCode = node.outerHTML;
		switch(node.nodeName)
		{
			case 'EMBED':
				return sourceCode;
			break;
			case 'OBJECT':
			case 'APPLET':
				var openTag = sourceCode.substr(0, sourceCode.indexOf('>') + 1).toLowerCase();
				var closeTag = sourceCode.substr(sourceCode.length - 9).toLowerCase();
				if(closeTag != '</object>' && closeTag != '</applet>')
				{
					/* Si el nodo est� mal formado (etiquetas de apertura y cierre) se debe 
					anular el script ya que podr�a devolver un resultado incorrecto */
					return null;
				}
				if(embeddedContent.isMSIE)
				{
					/* Para I. Explorer se debe obtener aparte el c�digo HTML de los nodos hijos,
					ya que la propiedad outerHTML en ocasiones devolver� un resultado incompleto */
					var innerCode = embeddedContent.getInnerCode(node);
					sourceCode = openTag + innerCode + closeTag;
				}
				return sourceCode;
			break;
		}
	},
	
	
	/**
	 * Obtiene el c�digo HTML de los nodos hijos de un determinado nodo. No se debe utilizar directamente
	 * la propiedad innerHTML ya que en ciertos casos I. Explorer devolver� un resultado incompleto.
	 * @param	node (object) - El nodo padre que ser� analizado
	 * @return	innerCode (string) - El c�digo HTML obtenido
	 */
	getInnerCode : function(node)
	{
		var innerCode = '';
		var totalChilds = node.childNodes.length - 1;
		for(var counter = totalChilds, child; child = node.childNodes[counter]; counter--)
		{
			innerCode += child.outerHTML;
		}
		return innerCode;
	}
	
}


/**
 * Activaci�n:
 * -----------
 * Detectamos el soporte de attachEvent() como filtro para I. Explorer y �pera.
 * Para ejecutar el script s�lo necesitamos que el DOM (Document Object Model); para
 * ello en �pera recurrimos al evento DOMContentLoaded, mientras que en I. Explorer
 * emulamos dicho evento apoy�ndonos en el atributo DEFER de la etiqueta SCRIPT
 * con la que estamos cargando este archivo.
 */
if(document.attachEvent)
{
	if(window.opera)
	{
		document.attachEvent("DOMContentLoaded", embeddedContent.reinsertContent);
	}
	else
	{
		embeddedContent.reinsertContent();
	}
}