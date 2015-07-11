CREATE TABLE IF NOT EXISTS `SliderHome` (
  `SliCodigo` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `SliTitulo` varchar(100) NOT NULL DEFAULT '',
  `SliImagen` varchar(200) NOT NULL DEFAULT '',
  `SliAlt` text NOT NULL,
  `SliLink` varchar(220) NOT NULL DEFAULT '',
  `SliOrden` int(10) unsigned NOT NULL DEFAULT '0',
  `SliVisible` varchar(2) NOT NULL DEFAULT '',
  PRIMARY KEY (`SliCodigo`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;


INSERT INTO `sysCambios` (`CpoCodigo`, `ModNombre`, `CpoNombre`, `CpoEtiqueta`, `CpoTipo`, `CpoOpciones`, `CpoMaesEscl`, `CpoDependencias`, `CpoJScript`, `CpoJScriptDin`, `CpoAgregado`, `CpoOrdenPpal`, `CpoOrdenSec`, `CpoMinimo`, `CpoMaximo`, `CpoAnchoTot`, `CpoAnchoVis`, `CpoAlto`, `CpoToolTip`, `CpoRequerido`) VALUES 
(130, 'SliderHome', 'SliCodigo', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, '', 'S'),
(131, 'SliderHome', 'SliTitulo', 'Título', 'T', '', '', '', '', '', '', 15, 0, 0, 0, 100, 60, 0, '', 'S'),
(132, 'SliderHome', 'SliImagen', 'Imagen', 'U', 'SliderHome', '', '', '', '', '', 20, 0, 0, 0, 100, 60, 0, '', 'N'),
(133, 'SliderHome', 'SliAlt', 'Descripción', 'M', '', '', '', '', '', '', 22, 0, 0, 0, 255, 585, 350, '', 'N'),
(134, 'SliderHome', 'SliLink', 'Enlace (Link)', 'T', '', '', '', '', '', '', 25, 0, 0, 0, 100, 60, 0, '', 'N'),
(135, 'SliderHome', 'SliVisible', 'Visible', 'RH', 'Si:::Si\r\nNo:::No', '', '', '', '', '', 50, 0, 0, 0, 0, 0, 0, '', 'S'),
(136, 'SliderHome', 'SliOrden', 'Orden', 'N', '', '', '', '', '', '', 30, 0, 0, 99999, 4, 2, 0, '', 'N');



INSERT INTO `sysFrom` (`QryCodigo`, `ModNombre`, `QryFrom`, `QryFromAlias`) VALUES 
(130, 'SliderHome', 'SliderHome', '');


INSERT INTO `sysInfo` (`QryCodigo`, `ModNombre`, `QryCampo`, `QryCampoAlias`, `QryCampoNombre`, `QryCampoImagen`, `QryAlineacion`, `QryPosicion`, `QryOrden`, `QryOrdenExpr`, `QryFiltro`, `QryFiltroExpr`) VALUES 
(130, 'SliderHome', 'SliCodigo', '', '', '', '', 0, '', '', '', ''),
(131, 'SliderHome', 'SliTitulo', '', 'Título', 'N', 'I', 10, 'S', '', 'S', ''),
(132, 'SliderHome', 'SliVisible', '', 'Visible', 'N', 'C', 40, 'S', '', 'S', ''),
(133, 'SliderHome', 'SliImagen', '', 'Imagen[SliderHome]', 'U', 'I', 45, 'S', '', 'S', ''),
(134, 'SliderHome', 'SliAlt', '', 'Descripción', 'N', 'C', 50, 'S', '', 'S', ''),
(135, 'SliderHome', 'SliOrden', '', 'Orden', 'N', 'I', 55, 'S', '', 'S', '');


INSERT INTO `sysMasInfo` (`MInCodigo`, `ModNombre`, `MInCampo`, `MInCampoAlias`, `MInCampoNombre`, `MInCampoImagen`, `MInEtiqPosicion`, `MInPosicion`) VALUES 
(130, 'SliderHome', 'SliCodigo', '', '', '', '', 0),
(131, 'SliderHome', 'SliTitulo', '', 'Título', 'N', 'A', 10),
(132, 'SliderHome', 'SliLink', '', 'Enlace', 'N', 'A', 20),
(133, 'SliderHome', 'SliImagen', '', 'Contenido', 'S', 'A', 30),
(134, 'SliderHome', 'SliAlt', '', 'Descripción', 'S', 'A', 40);


INSERT INTO `sysModulos` (`ModCodigo`, `ModOrden`, `ModNombre`, `ModTexto`, `ModTipo`, `ModLink`, `ModInfoAdic`, `ModInfoRela`, `ModPerDuplicar`) VALUES 
(130, 5, 'SliderHome', 'Rotador Home', 'N', '', 'S', 'N', 'S');


INSERT INTO `sysModUsu` (`ModNombre`, `UsuAlias`, `PerVer`, `PerEditar`, `PerAgregar`, `PerBorrar`, `PerAcciones`, `PerExportar`, `VerCntLineas`) VALUES 
('SliderHome', 'cmirtuono', 'S', 'S', 'S', 'S', 'S', 'S', 50),
('SliderHome', 'federico', 'S', 'S', 'S', 'S', 'S', 'S', 50);