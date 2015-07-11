CREATE TABLE IF NOT EXISTS `Banners` (
  `BnrCodigo` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `BnrNombre` varchar(60) NOT NULL DEFAULT '',
  `BnrTipo` varchar(20) NOT NULL DEFAULT '',
  `BnrArea` varchar(20) NOT NULL DEFAULT 'Todas',
  `BnrOrden` smallint(5) NOT NULL,
  `BnrImg` varchar(200) NOT NULL DEFAULT '',
  `BnrLink` varchar(255) NOT NULL,
  `BnrPaginaNueva` varchar(2) NOT NULL DEFAULT '',
  `BnrCobertura` smallint(5) unsigned NOT NULL DEFAULT '100',
  `BnrLmtHasta` date NOT NULL DEFAULT '0000-00-00',
  `BnrLmtVeces` int(11) NOT NULL DEFAULT '0',
  `BnrLmtClicks` int(11) NOT NULL DEFAULT '0',
  `BnrCntMostrado` int(11) NOT NULL DEFAULT '0',
  `BnrCntClicks` int(11) NOT NULL DEFAULT '0',
  `BnrVisible` varchar(2) NOT NULL DEFAULT '',
  PRIMARY KEY (`BnrCodigo`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=0 ;

INSERT INTO `sysCambios` (`CpoCodigo`, `ModNombre`, `CpoNombre`, `CpoEtiqueta`, `CpoTipo`, `CpoOpciones`, `CpoMaesEscl`, `CpoDependencias`, `CpoJScript`, `CpoJScriptDin`, `CpoAgregado`, `CpoOrdenPpal`, `CpoOrdenSec`, `CpoMinimo`, `CpoMaximo`, `CpoAnchoTot`, `CpoAnchoVis`, `CpoAlto`, `CpoToolTip`, `CpoRequerido`) VALUES 
(200, 'Banners', 'BnrCodigo', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, '', 'S'),
(201, 'Banners', 'BnrNombre', 'Nombre', 'T', '', '', '', '', '', '', 5, 0, 0, 0, 60, 60, 0, '', 'S'),
(202, 'xBanners', 'BnrTipo', 'Tipo', 'L', ':::\r\nRotador Home:::Rotador Home', '', '', '', '', '', 10, 0, 0, 0, 0, 0, 1, 'Tipo de banner (ubicación)', 'N'),
(203, 'Banners', 'BnrArea', 'Area', 'L', ':::\r\nHome:::Home\r\nAuspiciantes:::Auspiciantes\r\nAmbas:::Ambas', '', '', '', '', '', 15, 0, 0, 0, 0, 0, 1, 'Area del sitio en la que se visualizará', 'S'),
(204, 'Banners', 'BnrImg', 'Banner', 'U', 'Banners', '', '', '', '', '', 20, 0, 0, 0, 100, 60, 1, 'Formatos aceptados: jpg, jpeg, gif, swf, png.\r\nAncho máximo 155px\r\nAlto variable', 'N'),
(205, 'Banners', 'BnrLink', 'Link&nbsp;&nbsp;(http://)', 'T', '', '', '', '', '', '', 25, 0, 0, 0, 255, 60, 0, '', 'N'),
(206, 'Banners', 'BnrPaginaNueva', 'Página Nueva', 'RH', 'Si:::Si\r\nNo:::No', '', '', '', '', '', 26, 0, 0, 0, 0, 0, 0, '', 'N'),
(207, 'xBanners', 'BnrCobertura', 'Cobertura', 'N', '', '', '', '', '', '', 30, 0, 1, 999, 3, 3, 0, 'Cobertura en %', 'S'),
(208, 'Banners', 'BnrLmtHasta', 'Hasta', 'F', '', '', '', '', '', '', 35, 0, 0, 0, 0, 0, 0, 'Visible hasta (dejar en blanco para no establecer límite)', 'N'),
(209, 'Banners', 'BnrLmtVeces', 'Programar impresiones', 'N', '', '', '', '', '', '', 40, 0, 0, 99999999, 8, 8, 0, 'Mostrar -x- cantidad de veces (dejar en blanco para no establecer límite)', 'N'),
(210, 'Banners', 'BnrLmtClicks', 'Programar clicks', 'N', '', '', '', '', '', '', 45, 0, 0, 99999999, 8, 8, 0, 'Mostrar hasta que tenga -x- cantidad de clicks (dejar en blanco para no establecer límite)', 'N'),
(211, 'Banners', 'BnrVisible', 'Visible', 'RH', 'Si:::Si\r\nNo:::No', '', '', '', '', '', 50, 0, 0, 0, 0, 0, 0, '', 'S'),
(212, 'Banners', 'BnrCntMostrado', 'Mostrado', 'N', '', '', '', '', '', '', 55, 0, 0, 99999999, 8, 8, 0, 'Ha sido visto', 'N'),
(213, 'Banners', 'BnrCntClicks', 'Clicks', 'N', '', '', '', '', '', '', 60, 0, 0, 99999999, 8, 8, 0, 'Ha sido clickeado', 'N'),
(214, 'Banners', 'BnrOrden', 'Orden', 'N', '', '', '', '', '', '', 16, 0, 0, 99999, 5, 6, 1, 'Orden de ubicación', 'S');



INSERT INTO `sysFrom` (`QryCodigo`, `ModNombre`, `QryFrom`, `QryFromAlias`) VALUES 
(200, 'Banners', 'Banners', '');


INSERT INTO `sysInfo` (`QryCodigo`, `ModNombre`, `QryCampo`, `QryCampoAlias`, `QryCampoNombre`, `QryCampoImagen`, `QryAlineacion`, `QryPosicion`, `QryOrden`, `QryOrdenExpr`, `QryFiltro`, `QryFiltroExpr`) VALUES 
(200, 'Banners', 'BnrCodigo', '', '', 'N', 'I', 0, 'N', '', 'N', ''),
(201, 'Banners', 'BnrNombre', '', 'Nombre', 'N', 'I', 5, 'A', '', 'S', ''),
(202, 'Banners', 'BnrTipo', '', 'Tipo', 'N', 'I', 10, 'S', '', 'S', ''),
(203, 'Banners', 'BnrArea', '', 'Area', 'N', 'I', 15, 'S', '', 'S', ''),
(204, 'Banners', 'BnrImg', '', 'Imagen[Banners]', 'U', 'C', 20, 'S', '', 'S', ''),
(205, 'xBanners', 'BnrCobertura', '', 'Cobertura', 'N', 'D', 25, 'S', '', 'S', ''),
(206, 'Banners', 'IF(BnrLmtHasta,DATE_FORMAT(BnrLmtHasta,''%d-%m-%Y''),'''')', 'ccFecha', 'Visible Hasta (fecha)', 'N', 'I', 30, 'S', 'BnrLmtHasta', 'S', ''),
(207, 'Banners', 'BnrLmtVeces', '', 'Impresiones programadas', 'N', 'D', 35, 'S', '', 'S', ''),
(208, 'Banners', 'BnrCntMostrado', '', 'Impresiones totales', 'N', 'D', 40, 'S', '', 'S', ''),
(209, 'Banners', 'BnrLmtClicks', '', 'Clicks programados', 'N', 'D', 45, 'S', '', 'S', ''),
(210, 'Banners', 'BnrCntClicks', '', 'Clicks totales', 'N', 'D', 50, 'S', '', 'S', ''),
(211, 'Banners', 'BnrVisible', '', 'Visible', 'N', 'C', 55, 'S', '', 'S', '');

INSERT INTO `sysMasInfo` (`MInCodigo`, `ModNombre`, `MInCampo`, `MInCampoAlias`, `MInCampoNombre`, `MInCampoImagen`, `MInEtiqPosicion`, `MInPosicion`) VALUES 
(200, 'Banners', 'BnrCodigo', '', '', '', '', 0),
(201, 'Banners', 'BnrNombre', '', 'Título', 'N', 'A', 10),
(202, 'Banners', 'BnrNombre', '', 'Título', 'N', 'A', 20),
(203, 'Banners', 'BnrLink', '', 'Enlace: ', 'N', 'I', 30),
(204, 'Banners', 'BnrPaginaNueva', '', 'Página nueva: ', 'N', 'I', 40);


INSERT INTO `sysModulos` (`ModCodigo`, `ModOrden`, `ModNombre`, `ModTexto`, `ModTipo`, `ModLink`, `ModInfoAdic`, `ModInfoRela`, `ModPerDuplicar`) VALUES 
(200, 90, 'Banners', 'Banners', 'N', '', 'S', 'N', 'S');


INSERT INTO `sysModUsu` (`ModNombre`, `UsuAlias`, `PerVer`, `PerEditar`, `PerAgregar`, `PerBorrar`, `PerAcciones`, `PerExportar`, `VerCntLineas`) VALUES 
('Banners', 'cmirtuono', 'S', 'S', 'S', 'S', 'S', 'S', 50),
('Banners', 'federico', 'S', 'S', 'S', 'S', 'S', 'S', 50),
('Banners', 'romina', 'S', 'S', 'S', 'S', 'S', 'S', 50),
('Banners', 'jose', 'S', 'S', 'S', 'S', 'S', 'S', 50);
