-- phpMyAdmin SQL Dump
-- version 2.10.3
-- http://www.phpmyadmin.net
-- 
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-05-2010 a las 19:28:19
-- Versión del servidor: 5.0.24
-- Versión de PHP: 5.2.11

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- 
-- Base de datos: `uv1640_cmsv3`
-- 

-- --------------------------------------------------------

/*------------------------------------------------------------ sysAcciones ------
  Descripción:  tabla que define una acción desde un php personalizado a nivel
                registro o generales. Muestra el botón de acción en sysInfo
  AccCodigo     = clave única
  ModNombre     = Módulo en el cuál se habilita/realiza la acción (sysMódulos)
  AccTitulo     = Nombre de la acción, título que aparece en el botón
  AccNivel      = R/G (Registro/General) ¿como funciona acciones generales? -> ESTA DESACTIVADO, HACER FIND: $aFilas["G"]
  AccLink       = Archivo php que ejecutará la acción
  AccEjecutarSi = cláusula de condición dentro del where (por ej. 1=1)
  AccVentAncho  = ancho de la ventana popup
  AccVentAlto   = alto de la ventana popup
  AccOrden      = orden de ubicación

  Comments: 
    1. Definir si se continuará utilizando el modo de popup (como modal), de lo contrario quitar VentAlto y Ancho
    2. Revisar el funcionamiento pensado para acciones generales o eliminar AccNivel para evitar confusiones
--------------------------------------------------------------------------------*/
-- 
-- Estructura de tabla para la tabla `sysAcciones`
-- 
CREATE TABLE IF NOT EXISTS `sysAcciones` (
  `AccCodigo` int(10) unsigned NOT NULL auto_increment,
  `ModNombre` varchar(20) NOT NULL default '',
  `AccTitulo` varchar(20) NOT NULL default '',
  `AccNivel` char(1) NOT NULL default '',
  `AccLink` varchar(50) NOT NULL default '',
  `AccEjecutarSi` varchar(200) NOT NULL default '',
  `AccVentAncho` int(10) unsigned NOT NULL default '0',
  `AccVentAlto` int(10) unsigned NOT NULL default '0',
  `AccOrden` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`AccCodigo`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Acciones personalizadas' AUTO_INCREMENT=0 ;


-- --------------------------------------------------------

/*------------------------------------------------------------ sysCambios --------
  Descripción:  Gestiona los cambios de registros. Aquí se define la estructura de
                un registro y se prepara el formulario para que el mismo sea editado.
                Es decir, gestiona las "entradas" para los diferentes módulos.
  CpoCodigo       = clave única
  ModNombre       = Módulo sobre el cuál se trabajará
  CpoNombre       = Nombre del Campo que se editará (nombre literal del campo en la DB)
  CpoEtiqueta     = título del campo en el formulario de edición (label).
  CpoTipo         = como se tratará el campo en cuestión. 
    Permitidos:
    2L = Doble lista multiselección
    A  = Archivo
    B  = CheckBox
    C  = Color (este es mio (FD), revisar funcionamiento y reubicar el *.js)
    E  = Email
    F  = Fecha
    H  = HTML
    hr = Separador (FD - genera un separador, revisar en mirtuono)
    L  = Lista Desplegable
    LA =                    |
    LE = (lista esclavo)    | revisar manejo de estos tipos
    LM = (lista maestro)    |
    M  = Memo
    N  = Numérico
    RH = Radio Horizontal
    RV = Radio Vertical
    T  = Input Text
    TR = Textos Relacion (FD)  ------>  NO EN USO, TOMAR DE LA FAZENDA
    U  = Upload
  CpoOpciones     = opciones adicionales. Determina carpetas de imágenes, opciones 
                    de listas y check/radio. Opciones de listas dinámicas (2L x ej)
  CpoMaesEscl     = tabla que realiza la relación (para 2L, LA y LM)
  CpoDependencias = consulta a la tabla relacionada mediante CpoMaesEscl
  CpoJScript      = 
  CpoJScriptDin   = 
  CpoAgregado     = 
  CpoOrdenPcipal  = orden de ubicación
  CpoOrdenSec     = orden de ubicación dentro de la misma ROW (CpoOrdenPcipal)
  CpoMinimo       = valor MINIMO para campos tipo "N" (numéricos)
  CpoMáximo       = valor MAXIMO para campos tipo "N" (numéricos) -> Reprogramar que 0=infinito
  CpoAnchoTot     = cantidad de caracteres máximos para el campo
  CpoAnchoVis     = ancho visible en el popup (en px)
  CpoAlto         = alto del campo, útil para memos y html
  CpoToolTip      = información tooltip del label
  CpoRequerido    = SI/NO

  Comments: 
    1. Reformular funcionamiento. CpoTipo    = "hr" = separador
    2. Reestructurar funcionamiento. CpoTipo = "C" = colorpicker
    3. Diseñar nuevo rol. CpoTipo            = "TR" = tabla relacionada (presentaciones de x producto)
    4. Campos tipos LA, LE y LM ¿?
    5. CpoTipo "A" no puede ser más una lista desplegable, reestructurar para seleccionar
       el archivo deseado desde el directorio determinado en CpoOpciones (usar kcfinder?)
--------------------------------------------------------------------------------*/
-- 
-- Estructura de tabla para la tabla `sysCambios`
-- 
CREATE TABLE IF NOT EXISTS `sysCambios` (
  `CpoCodigo` smallint(5) unsigned NOT NULL auto_increment,
  `ModNombre` varchar(20) NOT NULL default '',
  `CpoNombre` varchar(20) NOT NULL default '',
  `CpoEtiqueta` varchar(50) NOT NULL default '',
  `CpoTipo` char(2) NOT NULL default '',
  `CpoOpciones` text NOT NULL,
  `CpoMaesEscl` varchar(60) NOT NULL default '',
  `CpoDependencias` text NOT NULL,
  `CpoJScript` text NOT NULL,
  `CpoJScriptDin` text NOT NULL,
  `CpoAgregado` varchar(100) NOT NULL default '',
  `CpoOrdenPpal` smallint(6) unsigned NOT NULL default '0',
  `CpoOrdenSec` smallint(6) unsigned NOT NULL default '0',
  `CpoMinimo` int(11) NOT NULL default '0',
  `CpoMaximo` int(11) NOT NULL default '0',
  `CpoAnchoTot` smallint(6) unsigned NOT NULL default '0',
  `CpoAnchoVis` smallint(6) unsigned NOT NULL default '0',
  `CpoAlto` smallint(6) unsigned NOT NULL default '0',
  `CpoToolTip` text NOT NULL,
  `CpoRequerido` char(1) NOT NULL default '',
  PRIMARY KEY  (`CpoCodigo`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=0 ;

-- 
-- Volcar la base de datos para la tabla `sysCambios`
-- 

-- --------------------------------------------------------

/*------------------------------------------------------------ sysConfig ---------
  Descripción:  tabla general para almacenar valores de configuración del sistema
                estos valores almacenados son pasados automáticamente a variables
                de session en conexion.inc.php. Algunos son obligatorios, ver en 
                descripción de "Registros para sysConfig"
  sysCnfId          = clave única
  sysCnfCodigo      = Nombre de la variable (será el nombre de la variable de session)
  sysCnfValor       = Valor de la variable
  sysCnfValidoEn    = Admin/Site/Both (NO EN USO)
  sysCnfComentarios = explicación del registro.
--------------------------------------------------------------------------------*/
-- 
-- Estructura de tabla para la tabla `sysConfig`
-- 
CREATE TABLE IF NOT EXISTS `sysConfig` (
  `sysCnfId` int(10) unsigned NOT NULL auto_increment,
  `sysCnfCodigo` varchar(30) NOT NULL default '',
  `sysCnfValor` varchar(100) NOT NULL default '',
  `sysCnfValidoEn` enum('Admin','Site','Both') NOT NULL default 'Admin',
  `sysCnfComentarios` text NOT NULL,
  PRIMARY KEY  (`sysCnfId`),
  UNIQUE KEY `sysCnfCodigo` (`sysCnfCodigo`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=0 ;

/*------------------------------------------------------------ sysConfig -> DATA -
  Descripción:  datos de configuración para generar variables de session que se
                utilizan en el sistema. A continuación los obligatorios y usos:
  
  -----------config Admin---------------------------------
  NombreCliente               = nombre del cliente
  LogoCliente                 = logo del cliente para ver en el cms
  LogoDesarrollador           = logo del desarrollador para verlo en el cms
  Lenguaje                    = lenguaje del admin, de momento espanol.inc.php/english.inc.php
  ModOrden                    = Orden de los módulos en sysInfo, ver comentarios en registro
  Fecha                       = formato de la fecha, admitidos DMY/MDY/YMD
  SeparadorOpcionesMenu       = caracter que separará los ítems del menú (volarlo)
  MostrarBotonABMDesactivado  = Muestra los botones ABM aunque no los pueda usar.
  MostrarInfoRelacVacia       = muestra boton info rel aunque no halla nada en sysMasInfo
  ColorCamposObligatorios     = color de label para campos obligatorios
  VariablesSESSION            = leer comentarios del registro
  ValorTitle                  = title del Admin
  -----------newsletters---------------------------------
  CantidadMailsPorEnvio       = ver comentarios
  DireccionMailPredeterminada = desde donde se envían los newsletter
  NombreMailPredeterminada    = nombre de esa casilla de email
  DireccionMailRetorno        = rebotes de newsletter
  DatosContacto               = datos al pié del newsletter
--------------------------------------------------------------------------------*/
-- 
-- Volcar la base de datos para la tabla `sysConfig`
-- 
INSERT INTO `sysConfig` (`sysCnfId`, `sysCnfCodigo`, `sysCnfValor`, `sysCnfValidoEn`, `sysCnfComentarios`) VALUES 
(1, 'NombreCliente', 'Docampo Lopez S.A.', 'Admin', ''),
(2, 'LogoCliente', 'logoDL.jpg', 'Admin', ''),
(3, 'LogoDesarrollador', 'logoMirtuono.gif', 'Admin', ''),
(4, 'Lenguaje', 'espanol.inc.php', 'Admin', 'espanol.inc.php\r\nenglish.inc.php '),
(5, 'ModOrden', '3', 'Admin', '1  => Por el título\r\n2i => Dos flechas visibles (izq)\r\n2d => Dos flechas visibles (der)\r\n3  => Las flechitas al lado'),
(6, 'Fecha', 'DMY', 'Admin', 'DMY\r\nMDY\r\nYMD'),
(7, 'SeparadorOpcionesMenu', '|', 'Admin', 'Colocar el símbolo deseado para separar las opciones del menú.\r\nDejar el campo en blanco para no utilizar ningún símbolo.'),
(8, 'MostrarBotonABMDesactivado', 'No', 'Admin', 'Si\r\nNo'),
(9, 'MostrarInfoRelacVacia', 'No', 'Admin', 'Si\r\nNo'),
(10, 'ColorCamposObligatorios', '#0000FF', 'Admin', 'Color de los campos obligatorios en el formulario de alta'),
(11, 'VariablesSESSION', 'DLS', 'Admin', 'Cadena (única para cada sitio) usada para diferenciar variables de SESSION'),
(12, 'ValorTitle', 'Docampo Lopez S.A.', 'Site', 'Título del sitio en el navegador'),
(13, 'CantidadMailsPorEnvio', '900', 'Admin', 'Cantidad predeterminada de mails que el sistema enviará.'),
(14, 'DireccionMailPredeterminada', 'newsletter@docampolopezsa.com.ar', 'Admin', 'Dirección de email predeterminada desde la cual el sistema enviará el newsletter.'),
(15, 'NombreMailPredeterminada', 'Docampo Lopez S.A. - Newsletter', 'Admin', 'Nombre a mostrar en email predeterminado desde la cual el sistema enviará el newsletter.'),
(16, 'DireccionMailRetorno', 'bounces@docampolopezsa.com.ar', 'Admin', 'Dirección de email predeterminada de retorno para el newsletter.'),
(17, 'DatosContacto', '© 2012 - Docampo López S.A.<br>ROSARIO: (0341) 425-1265 / 4361<br>CAPITAL FEDERAL: (011) 4314-2306', 'Admin', 'Datos de contacto a mostrar en el pie del newsletter');


-- --------------------------------------------------------


/*------------------------------------------------------------ sysErrores -------
  Descripción:  en esta tabla se salvan los errores mysql que se pasen a traves de
                la función en ./Funciones/funciones.inc.php 
                function fErrorSQL($cEstadoSitio, $cMensaje)
  ErrCodigo      = clave única
  ErrTexto       = texto del error (mysql_error)
  ErrExtra       = datos del sistema y variables relevadas
  ErrComentarios = campo para agregar comentarios sobre el error
  ErrStatus      = reparar/arreglado
  ErrFecha       = timestamp de cuándo se produjo el error
--------------------------------------------------------------------------------*/
-- 
-- Estructura de tabla para la tabla `sysErrores`
-- 
CREATE TABLE IF NOT EXISTS `sysErrores` (
  `ErrCodigo` int(10) unsigned NOT NULL auto_increment,
  `ErrTexto` text NOT NULL,
  `ErrExtra` text NOT NULL,
  `ErrComentarios` text NOT NULL,
  `ErrStatus` enum('Solucionar','Arreglado') NOT NULL default 'Solucionar',
  `ErrFecha` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`ErrCodigo`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=0 ;

-- 
-- Volcar la base de datos para la tabla `sysErrores`
-- 


-- --------------------------------------------------------


/*------------------------------------------------------------ sysFrom -----------
  Descripción: en esta tabla se asigna una TABLA a un MODULO
  QryCodigo    = clave única
  ModNombre    = modulo al que hace referencia
  QryFrom      = tabla de la db que es invocada al llamar al módulo ModNombre
  QryFromAlias = alias a la tabla
--------------------------------------------------------------------------------*/
CREATE TABLE IF NOT EXISTS `sysFrom` (
  `QryCodigo` smallint(5) unsigned NOT NULL auto_increment,
  `ModNombre` varchar(20) NOT NULL default '',
  `QryFrom` varchar(20) NOT NULL default '',
  `QryFromAlias` varchar(20) NOT NULL default '',
  PRIMARY KEY  (`QryCodigo`),
  KEY `ModNombre` (`ModNombre`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=0 ;


-- 
-- Volcar la base de datos para la tabla `sysFrom`
-- 


-- --------------------------------------------------------

/*------------------------------------------------------------ sysInfo -----------
  Descripción:  aquí se configuran los campos que se mostrarán como INFO de cada
                módulo.
  QryCodigo      = clave única
  ModNombre      = Modulo
  QryCampo       = Nombre del campo en la db
  QryCampoAlias  = alias para la consulta
  QryCampoNombre = Nombre a mostrar en la columna
  QryCampoImagen = es imagen. posibles: 
    - U (upload)
    - A (archivo)
    - S (si)
    - N (no)
  QryAlineacion  = alineación de los datos
    - centro(C)
    - izda(I)
    - dcha(D)
  QryPosición    = orden de ubicación
  QryOrden       = Dice si la columna puede ser ordenada 
    - A(asc)
    - D(desc)
    - S(si)
    - N(no)
  QryOrdenExpr   = ¿?
  QryFiltro      = Habilita el filtrado por esta columna
  QryFiltroExpr  = ¿?

  Comments: 
    1.- NUEVO: Edición "rápida" de algunos campos... configurar acá o en sysCambios
    2.- MEJORA: Mostrar info de tablas relacionadas mediante otra tabla. (por ejemplo, 
        todos los grupos a los que pertenece el usuario "xxxx").
--------------------------------------------------------------------------------*/
-- 
-- Estructura de tabla para la tabla `sysInfo`
-- 
CREATE TABLE IF NOT EXISTS `sysInfo` (
  `QryCodigo` smallint(5) unsigned NOT NULL auto_increment,
  `ModNombre` varchar(20) NOT NULL default '',
  `QryCampo` varchar(255) NOT NULL default '',
  `QryCampoAlias` varchar(20) NOT NULL default '',
  `QryCampoNombre` varchar(50) NOT NULL default '',
  `QryCampoImagen` char(1) NOT NULL default '',
  `QryAlineacion` char(1) NOT NULL default '',
  `QryPosicion` smallint(5) unsigned NOT NULL default '0',
  `QryOrden` char(1) NOT NULL default '',
  `QryOrdenExpr` varchar(100) NOT NULL default '',
  `QryFiltro` char(1) NOT NULL default '',
  `QryFiltroExpr` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`QryCodigo`),
  KEY `ModNombre` (`ModNombre`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=0 ;

-- 
-- Volcar la base de datos para la tabla `sysInfo`
-- 


-- --------------------------------------------------------

/*------------------------------------------------------------ sysJoin -----------
  Descripción:  Aquí se guardan los join para relacionar dos o más módulos. Ejemplo:
                INSERT INTO `sysJoin` (`QryCodigo`, `ModNombre`, `QryJoin`, `QryJoinAlias`, 
                `QryJoinTipo`, `QryJoinExpr`, `QryJoinUso`, `RelModulo`) VALUES 
                (70, 'Productos', 'Categorias', '', 'L', 'Productos.CatCodigo=Categorias.CatCodigo', 'I', '');
  QryCodigo    = Clave única
  ModNombre    = Módulo sobre el cuál se está trabajando
  QryJoin      = Módulo que se invoca para el join
  QryJoinAlias = alias
  QryJoinTipo  = INNER(I) - LEFT(L) - RIGHT(R)
  QryJoinExpr  = 
  QryJoinUso   = M, A y R (relación) ¿?
  RelModulo    = 
--------------------------------------------------------------------------------*/
-- 
-- Estructura de tabla para la tabla `sysJoin`
-- 
CREATE TABLE IF NOT EXISTS `sysJoin` (
  `QryCodigo` smallint(5) unsigned NOT NULL auto_increment,
  `ModNombre` varchar(20) NOT NULL default '',
  `QryJoin` varchar(20) NOT NULL default '',
  `QryJoinAlias` varchar(20) NOT NULL default '',
  `QryJoinTipo` char(1) NOT NULL default '',
  `QryJoinExpr` varchar(200) NOT NULL default '',
  `QryJoinUso` char(1) NOT NULL default '',
  `RelModulo` varchar(20) NOT NULL default '',
  PRIMARY KEY  (`QryCodigo`),
  KEY `ModNombre` (`ModNombre`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=0 ;

-- 
-- Volcar la base de datos para la tabla `sysJoin`
-- 

-- --------------------------------------------------------

/*------------------------------------------------------------ sysLenguajes -----
  Descripción: Se habilitan los idiomas en los cuáles se cargará la info

  LanId        = clave unico
  LanName      = Nombre del idioma
  LanDirectory = ? -> NO EN USO
  LanOrder     = para ordenarlos
  LanParticle  = partícula (es, en, pt, etc)
  LanFlag      = nombre de la bandera sin el '.gif'
--------------------------------------------------------------------------------*/
-- 
-- Estructura de tabla para la tabla `sysLenguajes`
-- 
CREATE TABLE IF NOT EXISTS `sysLenguajes` (
  `LanId` smallint(5) unsigned NOT NULL auto_increment,
  `LanName` varchar(30) NOT NULL default '',
  `LanDirectory` varchar(30) NOT NULL default '',
  `LanOrder` smallint(5) unsigned NOT NULL default '0',
  `LanParticle` char(2) NOT NULL default '',
  `LanFlag` char(2) NOT NULL,
  PRIMARY KEY  (`LanId`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=0 ;

-- 
-- Volcar la base de datos para la tabla `sysLenguajes`
-- 
INSERT INTO `sysLenguajes` (`LanName`, `LanDirectory`, `LanOrder`, `LanParticle`, `LanFlag`) VALUES 
('English', 'english', 2, 'en', 'gb'),
('Español', 'spanish', 0, 'es', 'es'),
('Português', 'portugues', 40, 'pt', 'br');


-- --------------------------------------------------------

/*------------------------------------------------------------ sysLogins ---------
  Descripción: Guarda el log de los últimos 6 meses
  LogId     = clave unica
  LogUser   = nick del usuario
  LogStatus = ok/error
//datos del intento de log
  LogIP
  LogBrowser
  LogTime
--------------------------------------------------------------------------------*/
-- 
-- Estructura de tabla para la tabla `sysLogins`
-- 
CREATE TABLE IF NOT EXISTS `sysLogins` (
  `LogId` int(10) unsigned NOT NULL auto_increment,
  `LogUser` varchar(30) NOT NULL default '',
  `LogStatus` varchar(10) NOT NULL default '',
  `LogIP` varchar(15) NOT NULL default '',
  `LogBrowser` varchar(255) NOT NULL default '',
  `LogTime` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`LogId`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=0 ;

-- 
-- Volcar la base de datos para la tabla `sysLogins`
-- 


-- --------------------------------------------------------

/*------------------------------------------------------------ sysMasInfo -------
  Descripción:  Info adicional que se muestra actualmente desde el link más info
  MInCodigo       = clave unica
  ModNombre       = módulo
  MInCampo        = campo de la tabla
  MInCampoAlias   = alias para el campo
  MInCampoNombre  = nombre a mostrar
  MInCampoImagen  = es imagen? U/A/S/N
  MInEtiqPosición = A(rriba) / I(zquierda)
  MInPosicion     = Orden de ubicación
--------------------------------------------------------------------------------*/
-- 
-- Estructura de tabla para la tabla `sysMasInfo`
-- 
CREATE TABLE IF NOT EXISTS `sysMasInfo` (
  `MInCodigo` smallint(5) unsigned NOT NULL auto_increment,
  `ModNombre` varchar(20) NOT NULL default '',
  `MInCampo` varchar(200) NOT NULL default '',
  `MInCampoAlias` varchar(20) NOT NULL default '',
  `MInCampoNombre` varchar(50) NOT NULL default '',
  `MInCampoImagen` char(1) NOT NULL default '',
  `MInEtiqPosicion` char(1) NOT NULL default '',
  `MInPosicion` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`MInCodigo`),
  KEY `ModNombre` (`ModNombre`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=0 ;

-- 
-- Volcar la base de datos para la tabla `sysMasInfo`
-- 

-- --------------------------------------------------------

/*------------------------------------------------------------ sysModulos -------
  Descripción:  Crea y configura los módulos que serán administrables en el sistema
  ModCodigo      = clave unica
  ModOrden       = orden de posición
  ModNombre      = Nombre del módulo. (que se usará en las otras tablas como sysCambios, sysInfo, etc)
  ModTexto       = título que se mostrará en el botón del menú
  ModTipo        = N(ormal) / E(nlace) / I(magenes) [para mód. Archivos]
  ModLink        = Si es enlace, aquí se le pasa el url
  ModInfoAdic    = S/N se permite info adicional (más info)
  ModInfoRela    = S/N se permite info relacionada
  ModPerDuplicar = S/N los registros se pueden duplicar
--------------------------------------------------------------------------------*/
-- 
-- Estructura de tabla para la tabla `sysModulos`
-- 
CREATE TABLE IF NOT EXISTS `sysModulos` (
  `ModCodigo` smallint(5) unsigned NOT NULL auto_increment,
  `ModOrden` smallint(5) unsigned NOT NULL default '0',
  `ModNombre` varchar(20) NOT NULL default '',
  `ModTexto` varchar(50) NOT NULL default '',
  `ModTipo` char(1) NOT NULL default '',
  `ModLink` varchar(100) NOT NULL default '',
  `ModInfoAdic` char(1) NOT NULL default '',
  `ModInfoRela` char(1) NOT NULL default '',
  `ModPerDuplicar` char(1) NOT NULL default '',
  PRIMARY KEY  (`ModCodigo`),
  KEY `ModOrden` (`ModOrden`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=0 ;

-- --------------------------------------------------------

/*------------------------------------------------------------ sysModUsu --------
  Descripción:  Tabla que asocia un módulo a un usuario y define los permisos para
                dicho usuario sobre ese módulo.
  ModNombre    = Módulo a administrar (sysModulos)
  UsuAlias     = Nick del usuario (tabla sysUsuarios)
  PerVer       = SI/NO (NO = módulo invisible para este usuario)
  PerEditar    = SI/NO
  PerAgregar   = SI/NO
  PerBorrar    = SI/NO
  PerAcciones  = SI/NO
  PerExportar  = SI/NO (habilita la exportación de datos a *.doc y *.xls)
  VerCntLineas = cantidad de registros por pantalla
--------------------------------------------------------------------------------*/
-- 
-- Estructura de tabla para la tabla `sysModUsu`
-- 
CREATE TABLE IF NOT EXISTS `sysModUsu` (
  `ModNombre` varchar(20) NOT NULL default '',
  `UsuAlias` varchar(20) NOT NULL,
  `PerVer` char(1) NOT NULL default '',
  `PerEditar` char(1) NOT NULL default '',
  `PerAgregar` char(1) NOT NULL default '',
  `PerBorrar` char(1) NOT NULL default '',
  `PerAcciones` char(1) NOT NULL default '',
  `PerExportar` char(1) NOT NULL default '',
  `VerCntLineas` smallint(6) NOT NULL default '0',
  UNIQUE KEY `ModuloAlias` (`ModNombre`,`UsuAlias`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Volcar la base de datos para la tabla `sysModUsu`
-- 

-- --------------------------------------------------------

/*------------------------------------------------------------ sysRelacion -------
  Descripción:  No tengo idea clara del funcionamiento de esta tabla
--------------------------------------------------------------------------------*/
-- 
-- Estructura de tabla para la tabla `sysRelacion`
-- 
CREATE TABLE IF NOT EXISTS `sysRelacion` (
  `RelCodigo` smallint(5) unsigned NOT NULL auto_increment,
  `ModNombre` varchar(20) NOT NULL default '',
  `RelModulo` varchar(20) NOT NULL default '',
  `RelCampo` varchar(200) NOT NULL default '',
  `RelExtraJoin` varchar(200) NOT NULL default '',
  PRIMARY KEY  (`RelCodigo`),
  KEY `ModNombre` (`ModNombre`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=0 ;

-- 
-- Volcar la base de datos para la tabla `sysRelacion`
-- 


-- --------------------------------------------------------

/*------------------------------------------------------------ sysUsuarios -------
  Descripción:  Usuarios que administraran el sistema. Estos son los usuarios con 
                acceso al admin.
  UsuCodigo     = clave única
  UsuAlias      = nick del usuario
  UsuClave      = contraseña que se codifica en MD5
  UsuNombre     = Nombre y apellido del usuario
  UsuCntFiltros = cantidad de filtros que puede utilizar???
  UsuUltLogin   = fecha de último login en el sistema

  Comments:
    1. Agregar datos de contacto. Teléfono, Dirección, Email.
--------------------------------------------------------------------------------*/
-- 
-- Estructura de tabla para la tabla `sysUsuarios`
-- 
CREATE TABLE `sysUsuarios` (
  `UsuCodigo` smallint(5) unsigned NOT NULL auto_increment,
  `UsuAlias` varchar(20) NOT NULL default '',
  `UsuClave` varchar(32) NOT NULL default '',
  `UsuNombre` varchar(40) NOT NULL default '',
  `UsuCntFiltros` tinyint(3) unsigned NOT NULL default '0',
  `UsuUltLogin` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`UsuCodigo`),
  UNIQUE KEY `UsuAlias` (`UsuAlias`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=0 ;

-- 
-- Volcar la base de datos para la tabla `sysUsuarios`
-- 

INSERT INTO `sysUsuarios` (`UsuAlias`, `UsuClave`, `UsuNombre`, `UsuCntFiltros`, `UsuUltLogin`) VALUES 
('fchesta', '85c08bb76a0dac35ba0cce76f1fe6f15', 'Fabián Chesta', 2, '2008-09-04 13:48:46'),
('cmirtuono', '4b8dc41d553ae3fc3b7ad639640864b1', 'Cristián Mirtuono', 1, '2009-10-26 09:29:54'),
('federico', '7a4b32161449c1d46b98b432f65a054c', 'Federico Teiserskis', 1, '2009-11-18 20:57:14'),
('ismael', '8eb0dd1db5afc5e88d996a32de05b962', 'Ismael Pena', 2, '2008-09-04 13:48:46');

-- --------------------------------------------------------


/*------------------------------------------------------------ sysWhere -------
  Descripción:  Genera una condición a la hora de visualizar los registros de
                un módulo en sysInfo. (por ejemplo mostrar todos los HOMBRES de la
                tabla Usuarios)
  QryCodigo    = clave única
  ModNombre    = módulo en cuestión
  QryWhereExpr = escribir la expresión (UsrSexo='M')
--------------------------------------------------------------------------------*/
-- 
-- Estructura de tabla para la tabla `sysWhere`
-- 
CREATE TABLE `sysWhere` (
  `QryCodigo` smallint(5) unsigned NOT NULL auto_increment,
  `ModNombre` varchar(20) NOT NULL default '',
  `QryWhereExpr` varchar(200) NOT NULL default '',
  PRIMARY KEY  (`QryCodigo`),
  KEY `ModNombre` (`ModNombre`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=0 ;
