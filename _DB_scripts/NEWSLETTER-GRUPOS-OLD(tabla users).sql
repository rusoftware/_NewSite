-- SISTEMA DE NEWSLETTER - CMS v3.0
-- envíos por grupos
-- administración de grupos vía CMS
/* funcionando en barcelonanews.com.ar */

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `NwsContenido`
-- 

CREATE TABLE IF NOT EXISTS `NwsContenido` (
  `NwsContCodigo` int(10) unsigned NOT NULL auto_increment COMMENT 'TABLA DE REL ENTRE NL y NEWS',
  `NwsEdicCodigo` int(10) unsigned NOT NULL default '0' COMMENT 'ID del newsletter',
  `NovCodigo` int(10) unsigned NOT NULL default '0' COMMENT 'ID de la noticia asociada',
  PRIMARY KEY  (`NwsContCodigo`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `NwsEdicion`
-- 
CREATE TABLE IF NOT EXISTS `NwsEdicion` (
  `NwsEdicCodigo` int(10) unsigned NOT NULL auto_increment,
  `NwsEdicTitulo` varchar(60) NOT NULL default '',
  `NwsEdicFecha` date NOT NULL default '0000-00-00',
  `NwsEdicContHTML` text NOT NULL,
  `NwsEdicContTexto` text NOT NULL,
  `NwsEdicPlantilla` varchar(50) NOT NULL default 'Standar',
  `NwsEdicEnvio` varchar(40) NOT NULL default 'No',
  PRIMARY KEY  (`NwsEdicCodigo`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Volcar la base de datos para la tabla `NwsEdicion`
-- 

INSERT INTO `NwsEdicion` (`NwsEdicCodigo`, `NwsEdicTitulo`, `NwsEdicFecha`, `NwsEdicSaludoHTML`, `NwsEdicSaludoText`, `NwsEdicEnvio`) VALUES 
(1, 'Pantilla de campo nombre (NO BORRAR)', '0000-00-00', 'Buen d&iacute;a ##Nombre##,<br />\r\nestas son las novedades de Kami para Usted.', 'Buen día ##Nombre##,\r\nestas son las novedades de Kami para Usted.', 'No');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `NwsEnvio`
-- 

CREATE TABLE IF NOT EXISTS `NwsEnvio` (
  `NwsEnviCodigo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NwsEdicCodigo` int(10) unsigned NOT NULL DEFAULT '0',
  `UsrCode` int(10) unsigned NOT NULL DEFAULT '0',
  `NwsEnviFecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`NwsEnviCodigo`),
  KEY `NwsEdicCodigo` (`NwsEdicCodigo`),
  KEY `NwsSuscCodigo` (`UsrCode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `NwsGrupos`
-- 

CREATE TABLE IF NOT EXISTS `NwsGrupos` (
  `NwsGruCodigo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NwsGruTitulo` varchar(60) NOT NULL DEFAULT '',
  PRIMARY KEY (`NwsGruCodigo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


-- --------------------------------------------------------

-- 
-- Volcar la base de datos para la tabla `NwsGrupos`
-- 

INSERT INTO `NwsGrupos` (`NwsGruCodigo` ,`NwsGruTitulo`)VALUES 
('1',  'Clientes'),
('2',  'Proveedores'),
('3',  'Suscriptores Web');


-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `NwsRelNlGru`
-- 

CREATE TABLE IF NOT EXISTS `NwsRelNlGru` (
  `NwsGruCodigo` int(10) unsigned NOT NULL default '0' COMMENT 'ID del Grupo de usuarios',
  `NwsEdicCodigo` int(10) unsigned NOT NULL default '0' COMMENT 'ID de newsletter',
  UNIQUE KEY `RelNGCode` (`NwsGruCodigo`,`NwsEdicCodigo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `NwsRelUsrGru`
-- 

CREATE TABLE IF NOT EXISTS `NwsRelUsrGru` (
  `NwsGruCodigo` int(10) unsigned NOT NULL default '0' COMMENT 'ID del Grupo de usuarios',
  `UsrCode` int(10) unsigned NOT NULL default '0' COMMENT 'ID DE USUARIO',
  UNIQUE KEY `RelGUCode` (`NwsGruCodigo`,`UsrCode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `Users`
-- 

CREATE TABLE IF NOT EXISTS `Users` (
  `UsrCode` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `UsrFirstName1` varchar(30) NOT NULL DEFAULT '',
  `UsrLastName1` varchar(30) NOT NULL DEFAULT '',
  `UsrBirth` date NOT NULL default '0000-00-00',
  `UsrDNI` int(8) NOT NULL,
  `UsrCompany` varchar(30) NOT NULL DEFAULT '',
  `UsrStreet1a` varchar(60) NOT NULL DEFAULT '',
  `UsrStreet1b` varchar(100) NOT NULL DEFAULT '',
  `UsrCity1` varchar(60) NOT NULL DEFAULT '',
  `UsrState1` varchar(100) NOT NULL DEFAULT '',
  `UsrCountry1` varchar(60) NOT NULL DEFAULT '',
  `UsrZipCode1` varchar(30) NOT NULL DEFAULT '',
  `UsrPhone1` varchar(30) NOT NULL DEFAULT '',
  `UsrCelPhone1` varchar(30) NOT NULL DEFAULT '',
  `UsrEMail1` varchar(60) NOT NULL DEFAULT '',
  `UsrActivo` varchar(2) NOT NULL,
  `UsrPrueba` varchar(2) NOT NULL DEFAULT '',
  `UsrNotes` text NOT NULL,
  `UsrPassword` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`UsrCode`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


-- --------------------------------------------------------

-- 
-- Volcar la base de datos para la tabla `sysAcciones`
-- 

INSERT INTO `sysAcciones` (`AccCodigo`, `ModNombre`, `AccTitulo`, `AccNivel`, `AccLink`, `AccEjecutarSi`, `AccVentAncho`, `AccVentAlto`, `AccOrden`) VALUES 
(500, 'Newsletter', 'ENVIAR', 'R', 'NewsletterSend.php', '', 300, 300, 5);


-- --------------------------------------------------------

-- 
-- Volcar la base de datos para la tabla `sysCambios`
-- 

INSERT INTO `sysCambios` (`CpoCodigo`, `ModNombre`, `CpoNombre`, `CpoEtiqueta`, `CpoTipo`, `CpoOpciones`, `CpoMaesEscl`, `CpoDependencias`, `CpoJScript`, `CpoJScriptDin`, `CpoAgregado`, `CpoOrdenPpal`, `CpoOrdenSec`, `CpoMinimo`, `CpoMaximo`, `CpoAnchoTot`, `CpoAnchoVis`, `CpoAlto`, `CpoToolTip`, `CpoRequerido`) VALUES 
(500, 'Newsletter', 'NwsEdicCodigo', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, '', 'S'),
(501, 'Newsletter', 'NwsEdicTitulo', 'Asunto', 'T', '', '', '', '', '', '', 10, 0, 0, 0, 60, 60, 0, '', 'S'),
(502, 'Newsletter', 'NwsEdicFecha', 'Fecha', 'F', '', '', '', '', '', '', 20, 0, 0, 0, 0, 0, 0, '', 'N'),
(503, 'Newsletter', 'NwsEdicContHTML', 'Contenido (HTML)', 'H', '', '', '', '', '', '', 30, 0, 0, 0, 0, 585, 350, '', 'N'),
(504, 'Newsletter', 'NwsEdicContTexto', 'Contenido (Texto)', 'M', '', '', '', '', '', '', 35, 0, 0, 0, 0, 45, 5, '', 'N'),
(505, 'Newsletter', 'NovCodigo', 'Novedades', '2L', 'SELECT Novedades.NovCodigo, NovTitulo FROM Novedades LEFT JOIN NwsContenido ON (Novedades.NovCodigo=NwsContenido.NovCodigo AND ##Codigo##=NwsEdicCodigo) WHERE NwsContenido.NovCodigo IS NULL ORDER BY NovTitulo', 'NwsContenido', 'SELECT Novedades.NovCodigo, NovTitulo FROM Novedades INNER JOIN NwsContenido ON Novedades.NovCodigo=NwsContenido.NovCodigo WHERE NovVisible=''Si'' AND NwsEdicCodigo=##Codigo## ORDER BY NovTitulo', '', '', '', 40, 0, 0, 0, 0, 200, 10, '', 'N'),
(506, 'Newsletter', 'NwsGruCodigo', 'Grupos de Destinatarios', '2L', 'SELECT NwsGrupos.NwsGruCodigo, NwsGruTitulo FROM NwsGrupos LEFT JOIN NwsRelNlGru ON (NwsGrupos.NwsGruCodigo=NwsRelNlGru.NwsGruCodigo AND ##Codigo##=NwsEdicCodigo) WHERE NwsRelNlGru.NwsGruCodigo IS NULL ORDER BY NwsGruTitulo', 'NwsRelNlGru', 'SELECT NwsGrupos.NwsGruCodigo, NwsGruTitulo FROM NwsGrupos INNER JOIN NwsRelNlGru ON NwsGrupos.NwsGruCodigo=NwsRelNlGru.NwsGruCodigo WHERE NwsEdicCodigo=##Codigo## ORDER BY NwsGruTitulo', '', '', '', 50, 0, 0, 0, 0, 200, 10, '', 'N'),
(507, 'Newsletter', 'NwsEdicPlantilla', 'Usar Plantilla', 'RV', 'Standar:::Standar\r\nFlyer:::Flyer\r\nComunicado:::Comunicado', '', '', '', '', '', 25, 0, 0, 0, 0, 0, 0, '', 'S'),
(550, 'NwsGrupos', 'NwsGruCodigo', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, '', 'S'),
(551, 'NwsGrupos', 'NwsGruTitulo', 'Grupo', 'T', '', '', '', '', '', '', 10, 0, 0, 0, 60, 60, 0, '', 'S'),
(600, 'Usuarios', 'UsrCode', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, '', 'S'),
(601, 'Usuarios', 'UsrFirstName1', 'Nombre', 'T', '', '', '', '', '', '', 10, 0, 0, 0, 60, 60, 0, '', 'S'),
(602, 'Usuarios', 'UsrLastName1', 'Apellido', 'T', '', '', '', '', '', '', 15, 0, 0, 0, 60, 60, 0, '', 'S'),
(603, 'Usuarios', 'UsrCompany', 'Empresa', 'T', '', '', '', '', '', '', 20, 0, 0, 0, 60, 60, 0, '', 'N'),
(604, 'Usuarios', 'UsrStreet1a', 'Dirección', 'T', '', '', '', '', '', '', 21, 0, 0, 0, 60, 60, 0, '', 'N'),
(605, 'Usuarios', 'UsrCity1', 'Ciudad', 'T', '', '', '', '', '', '', 22, 0, 0, 0, 60, 60, 0, '', 'N'),
(606, 'Usuarios', 'UsrZipCode1', 'CP', 'T', '', '', '', '', '', '', 23, 0, 0, 0, 60, 60, 0, '', 'N'),
(607, 'Usuarios', 'UsrState1', 'Provincia', 'T', '', '', '', '', '', '', 24, 0, 0, 0, 60, 60, 0, '', 'N'),
(608, 'Usuarios', 'UsrCountry1', 'País', 'T', '', '', '', '', '', '', 25, 0, 0, 0, 60, 60, 0, '', 'N'),
(609, 'Usuarios', 'UsrEMail1', 'EMail', 'E', '', '', '', '', '', '', 30, 0, 0, 0, 60, 60, 0, '', 'S'),
(610, 'Usuarios', 'UsrPhone1', 'Teléfono', 'T', '', '', '', '', '', '', 35, 0, 0, 0, 60, 60, 0, '', 'N'),
(611, 'Usuarios', 'UsrCelPhone1', 'Celular', 'T', '', '', '', '', '', '', 40, 0, 0, 0, 60, 60, 0, '', 'N'),
(612, 'Usuarios', 'NwsGruCodigo', 'Pertenece a los grupos', '2L', 'SELECT NwsGrupos.NwsGruCodigo, NwsGruTitulo FROM NwsGrupos LEFT JOIN NwsRelUsrGru ON (NwsGrupos.NwsGruCodigo=NwsRelUsrGru.NwsGruCodigo AND ##Codigo##=UsrCode) WHERE NwsRelUsrGru.NwsGruCodigo IS NULL ORDER BY NwsGruTitulo', 'NwsRelUsrGru', 'SELECT NwsGrupos.NwsGruCodigo, NwsGruTitulo FROM NwsGrupos INNER JOIN NwsRelUsrGru ON NwsGrupos.NwsGruCodigo=NwsRelUsrGru.NwsGruCodigo WHERE UsrCode=##Codigo## ORDER BY NwsGruTitulo', '', '', '', 50, 0, 0, 0, 0, 200, 10, '', 'N'),
(613, 'Usuarios', 'UsrPrueba', 'Prueba de envío', 'RH', 'Si:::Si\r\nNo:::No', '', '', '', '', '', 90, 0, 0, 0, 0, 0, 0, '', 'N'),
(614, 'Usuarios', 'UsrNotes', 'Comentario', 'M', '', '', '', '', '', '', 200, 0, 0, 0, 0, 45, 5, '', 'N'),
(615, 'Usuarios', 'UsrActivo', 'Activo', 'RH', 'Si:::Si\r\nNo:::No', '', '', '', '', '', 80, 0, 0, 0, 0, 0, 0, 'Un usuario INACTIVO no recibirá newsletter.\r\n(Campo que se inactiva cuándo el usuario de desuscribe)', 'N');

-- --------------------------------------------------------

-- 
-- Volcar la base de datos para la tabla `sysFrom`
-- 

INSERT INTO `sysFrom` (`QryCodigo`, `ModNombre`, `QryFrom`, `QryFromAlias`) VALUES 
(500, 'Newsletter', 'NwsEdicion', ''),
(550, 'NwsGrupos', 'NwsGrupos', ''),
(600, 'Usuarios', 'Users', '');

-- --------------------------------------------------------

-- 
-- Volcar la base de datos para la tabla `sysInfo`
-- 

INSERT INTO `sysInfo` (`QryCodigo`, `ModNombre`, `QryCampo`, `QryCampoAlias`, `QryCampoNombre`, `QryCampoImagen`, `QryAlineacion`, `QryPosicion`, `QryOrden`, `QryOrdenExpr`, `QryFiltro`, `QryFiltroExpr`) VALUES 
(500, 'Newsletter', 'NwsEdicCodigo', '', '', '', '', 0, '', '', '', ''),
(501, 'Newsletter', 'NwsEdicTitulo', '', 'Asunto', 'N', 'I', 10, 'A', '', 'S', ''),
(502, 'Newsletter', 'IF(NwsEdicFecha,DATE_FORMAT(NwsEdicFecha,"%d-%m-%Y"),"")', 'ccFecha', 'Fecha', 'N', 'I', 20, 'S', 'NwsEdicFecha', 'S', ''),
(503, 'Newsletter', 'NwsEdicEnvio', '', 'Enviado', 'N', 'I', 30, 'S', '', 'S', ''),
(550, 'NwsGrupos', 'NwsGruCodigo', '', '', '', '', 0, '', '', '', ''),
(551, 'NwsGrupos', 'NwsGruTitulo', '', 'Asunto', 'N', 'I', 10, 'A', '', 'S', ''),
(600, 'Usuarios', 'UsrCode', '', '', '', '', 0, '', '', '', ''),
(601, 'Usuarios', 'CONCAT(UsrLastName1,'', '',UsrFirstName1)', 'ccApeNom', 'Apellido, Nombre', 'N', 'I', 10, 'A', '', 'S', ''),
(602, 'Usuarios', 'UsrCompany', '', 'Empresa', 'N', 'I', 15, 'S', '', 'S', ''),
(603, 'Usuarios', 'UsrEMail1', '', 'EMail', 'N', 'I', 20, 'S', '', 'S', ''),
(604, 'Usuarios', 'UsrPhone1', '', 'Teléfono', 'N', 'I', 25, 'S', '', 'S', ''),
(605, 'Usuarios', 'UsrPrueba', '', 'Prueba', 'N', 'C', 90, 'S', '', 'S', ''),
(606, 'Usuarios', 'UsrActivo', '', 'Activo', 'N', 'C', 85, 'S', '', 'S', '');


-- --------------------------------------------------------

-- 
-- Volcar la base de datos para la tabla `sysMasInfo`
-- 

INSERT INTO `sysMasInfo` (`MInCodigo`, `ModNombre`, `MInCampo`, `MInCampoAlias`, `MInCampoNombre`, `MInCampoImagen`, `MInEtiqPosicion`, `MInPosicion`) VALUES 
(500, 'Newsletter', 'NwsEdicCodigo', '', '', '', '', 0),
(501, 'Newsletter', 'CONCAT(NwsEdicEmpresa," - ",NwsEdicTitulo)', '', '', '', '', 1),
(502, 'Newsletter', 'NwsEdicContHTML', '', 'Contenido HTML', 'N', 'A', 10),
(503, 'Newsletter', 'NwsEdicContTexto', '', 'Contenido Texto', 'N', 'A', 20),
(600, 'Usuarios', 'UsrCode', '', '', '', '', 0),
(601, 'Usuarios', 'CONCAT(UsrFirstName1," ",UsrLastName1)', '', '', '', '', 1),
(602, 'Usuarios', 'UsrCelPhone1', '', 'Celular', 'N', 'A', 10),
(603, 'Usuarios', 'UsrStreet1a', '', 'Dirección', 'N', 'A', 15),
(604, 'Usuarios', 'UsrCity1', '', 'Ciudad', 'N', 'A', 16),
(605, 'Usuarios', 'UsrState1', '', 'Provincia', 'N', 'A', 17),
(606, 'Usuarios', 'UsrCountry1', '', 'País', 'N', 'A', 18),
(607, 'Usuarios', 'UsrPassword', '', 'Contraseña', 'N', 'A', 40),
(608, 'Usuarios', 'UsrNotes', '', 'Comentarios', 'N', 'A', 100);

-- --------------------------------------------------------

-- 
-- Volcar la base de datos para la tabla `sysModulos`
-- 

INSERT INTO `sysModulos` (`ModCodigo`, `ModOrden`, `ModNombre`, `ModTexto`, `ModTipo`, `ModLink`, `ModInfoAdic`, `ModInfoRela`, `ModPerDuplicar`) VALUES 
(500, 40, 'Newsletter', 'Newsletter', 'N', '', 'S', 'S', 'S'),
(550, 60, 'NwsGrupos', 'Grupos de Usuarios', 'N', '', 'S', 'S', 'S'),
(600, 50, 'Usuarios', 'Suscriptores', 'N', '', 'S', 'N', 'S');

-- --------------------------------------------------------

-- 
-- Volcar la base de datos para la tabla `sysModUsu`
-- 

INSERT INTO `sysModUsu` (`ModNombre`, `UsuAlias`, `PerVer`, `PerEditar`, `PerAgregar`, `PerBorrar`, `PerAcciones`, `PerExportar`, `VerCntLineas`) VALUES 
('Newsletter', 'cmirtuono', 'S', 'S', 'S', 'S', 'S', 'S', 10),
('Usuarios', 'cmirtuono', 'S', 'S', 'S', 'S', '', 'S', 50),
('NwsGrupos', 'cmirtuono', 'S', 'S', 'S', 'S', '', 'S', 50),
('Newsletter', 'federico', 'S', 'S', 'S', 'S', 'S', 'S', 10),
('NwsGrupos', 'federico', 'S', 'S', 'S', 'S', '', 'S', 50),
('Usuarios', 'federico', 'S', 'S', 'S', 'S', '', 'S', 10);


-- ----------------------------------------------------------

--
-- INCLUYENDO LAS NOVEDADES, LOS BÁSICO SERIA
-- 

CREATE TABLE IF NOT EXISTS `Novedades` (
  `NovCodigo` smallint(5) unsigned NOT NULL auto_increment,
  `NovTitulo` varchar(200) NOT NULL default '',
  `NovApostilla` text NOT NULL,
  `NovTexto` text NOT NULL,
  `NovFechaDesde` date NOT NULL default '0000-00-00',
  `NovFechaHasta` date NOT NULL default '0000-00-00',
  `NovImagen` varchar(100) NOT NULL default '',
  `NovVisible` varchar(2) NOT NULL default '',
  PRIMARY KEY  (`NovCodigo`)
) TYPE=MyISAM AUTO_INCREMENT=0;


CREATE TABLE IF NOT EXISTS `Novedades_Lng` (
  `NovCodigo` int(10) unsigned NOT NULL default '0',
  `LanParticle` varchar(2) NOT NULL default '',
  `NovTitulo` varchar(100) NOT NULL default '',
  `NovApostilla` text NOT NULL,
  `NovTexto` text NOT NULL,
  PRIMARY KEY  (`NovCodigo`,`LanParticle`)
) TYPE=MyISAM;


INSERT INTO `sysCambios` (`CpoCodigo`, `ModNombre`, `CpoNombre`, `CpoEtiqueta`, `CpoTipo`, `CpoOpciones`, `CpoMaesEscl`, `CpoDependencias`, `CpoJScript`, `CpoJScriptDin`, `CpoAgregado`, `CpoOrdenPpal`, `CpoOrdenSec`, `CpoMinimo`, `CpoMaximo`, `CpoAnchoTot`, `CpoAnchoVis`, `CpoAlto`, `CpoToolTip`, `CpoRequerido`) VALUES 
(10, 'Novedades', 'NovCodigo', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, '', 'S'),
(11, 'Novedades', 'NovTitulo', 'Título', 'T', '', '', '', '', '', '', 5, 0, 0, 0, 100, 60, 0, '', 'S'),
(12, 'Novedades', 'NovApostilla', 'Resumen', 'M', '', '', '', '', '', '', 10, 0, 0, 0, 250, 45, 6, '', 'N'),
(13, 'Novedades', 'NovTexto', 'Contenido', 'H', '', '', '', '', '', '', 20, 0, 0, 0, 0, 585, 350, '', 'N'),
(14, 'Novedades', 'NovImagen', 'Imagen', 'U', 'Novedades', '', '', '', '', '', 30, 0, 0, 0, 100, 60, 0, '', 'N'),
(15, 'Novedades', 'NovFechaDesde', 'Fecha Desde', 'F', '', '', '', '', '', '', 40, 0, 0, 0, 0, 0, 0, '', 'N'),
(16, 'Novedades', 'NovFechaHasta', 'Fecha Hasta', 'F', '', '', '', '', '', '', 50, 0, 0, 0, 0, 0, 0, '', 'N'),
(17, 'Novedades', 'NovVisible', 'Visible', 'RH', 'Si:::Si\r\nNo:::No', '', '', '', '', '', 60, 0, 0, 0, 0, 0, 0, '', 'S');


INSERT INTO `sysFrom` (`QryCodigo`, `ModNombre`, `QryFrom`, `QryFromAlias`) VALUES 
(10, 'Novedades', 'Novedades', '');


INSERT INTO `sysInfo` (`QryCodigo`, `ModNombre`, `QryCampo`, `QryCampoAlias`, `QryCampoNombre`, `QryCampoImagen`, `QryAlineacion`, `QryPosicion`, `QryOrden`, `QryOrdenExpr`, `QryFiltro`, `QryFiltroExpr`) VALUES 
(10, 'Novedades', 'NovCodigo', '', '', '', '', 0, '', '', '', ''),
(11, 'Novedades', 'NovTitulo', '', 'T&iacute;tulo Esp', 'N', 'I', 10, 'S', '', 'S', ''),
(12, 'Novedades', 'IF(NovFechaDesde,DATE_FORMAT(NovFechaDesde,''%d-%m-%Y''),'''')', 'ccFechaD', 'Fecha Desde', 'N', 'I', 20, 'D', 'NovFechaDesde', 'S', ''),
(13, 'Novedades', 'IF(NovFechaHasta,DATE_FORMAT(NovFechaHasta,''%d-%m-%Y''),'''')', 'ccFechaH', 'Fecha Hasta', 'N', 'I', 30, 'D', 'NovFechaHasta', 'S', ''),
(14, 'Novedades', 'NovVisible', '', 'Visible', 'N', 'C', 40, 'S', '', 'S', '');


INSERT INTO `sysMasInfo` (`MInCodigo`, `ModNombre`, `MInCampo`, `MInCampoAlias`, `MInCampoNombre`, `MInCampoImagen`, `MInEtiqPosicion`, `MInPosicion`) VALUES 
(10, 'Novedades', 'NovCodigo', '', '', '', '', 0),
(11, 'Novedades', 'NovTitulo', '', 'Título', 'N', 'A', 10),
(12, 'Novedades', 'NovApostilla', '', 'Resumen', 'N', 'A', 20),
(13, 'Novedades', 'NovTexto', '', 'Contenido', 'N', 'A', 30);


INSERT INTO `sysModulos` (`ModCodigo`, `ModOrden`, `ModNombre`, `ModTexto`, `ModTipo`, `ModLink`, `ModInfoAdic`, `ModInfoRela`, `ModPerDuplicar`) VALUES 
(10, 10, 'Novedades', 'Novedades', 'N', '', 'S', 'N', 'S');


INSERT INTO `sysModUsu` (`ModNombre`, `UsuAlias`, `PerVer`, `PerEditar`, `PerAgregar`, `PerBorrar`, `PerAcciones`, `PerExportar`, `VerCntLineas`) VALUES 
('Novedades', 'cmirtuono', 'S', 'S', 'S', 'S', 'S', 'S', 50),
('Novedades', 'federico', 'S', 'S', 'S', 'S', 'S', 'S', 50);