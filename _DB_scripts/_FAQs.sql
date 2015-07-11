CREATE TABLE IF NOT EXISTS `Faq` (
  `FaqCodigo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `FaqPreg` varchar(200) DEFAULT NULL,
  `FaqResp` text,
  `FaqOrden` int(10) unsigned NOT NULL DEFAULT '0',
  `FaqVisible` varchar(2) NOT NULL,
  PRIMARY KEY (`FaqCodigo`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=0 ;


INSERT INTO `sysCambios` (`CpoCodigo`, `ModNombre`, `CpoNombre`, `CpoEtiqueta`, `CpoTipo`, `CpoOpciones`, `CpoMaesEscl`, `CpoDependencias`, `CpoJScript`, `CpoJScriptDin`, `CpoAgregado`, `CpoOrdenPpal`, `CpoOrdenSec`, `CpoMinimo`, `CpoMaximo`, `CpoAnchoTot`, `CpoAnchoVis`, `CpoAlto`, `CpoToolTip`, `CpoRequerido`) VALUES
(330, 'Faq', 'FaqCodigo', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, '', 'S'),
(331, 'Faq', 'FaqPreg', 'Pregunta', 'T', '', '', '', '', '', '', 20, 0, 0, 0, 200, 60, 0, '', 'S'),
(332, 'Faq', 'FaqResp', 'Respuesta', 'H', '', '', '', '', '', '', 42, 0, 0, 0, 0, 585, 350, '', 'S'),
(333, 'Faq', 'FaqOrden', 'Orden', 'N', '', '', '', '', '', '', 65, 0, 0, 99999, 5, 5, 0, '', 'S'),
(334, 'Faq', 'FaqVisible', 'Visible', 'RV', 'Si:::Si\r\nNo:::No', '', '', '', '', '', 60, 0, 0, 99999, 5, 5, 0, '', 'S');


INSERT INTO `sysFrom` (`QryCodigo`, `ModNombre`, `QryFrom`, `QryFromAlias`) VALUES 
(330, 'Faq', 'Faq', '');

INSERT INTO `sysInfo` (`QryCodigo`, `ModNombre`, `QryCampo`, `QryCampoAlias`, `QryCampoNombre`, `QryCampoImagen`, `QryAlineacion`, `QryPosicion`, `QryOrden`, `QryOrdenExpr`, `QryFiltro`, `QryFiltroExpr`) VALUES
(330, 'Faq', 'FaqCodigo', '', '', '', '', 0, '', '', '', ''),
(331, 'Faq', 'FaqPreg', '', 'Pregunta', 'N', 'I', 10, 'S', '', 'S', ''),
(332, 'Faq', 'FaqOrden', '', 'Orden', 'N', 'C', 80, 'A', '', 'S', ''),
(333, 'Faq', 'FaqVisible', '', 'Visible', 'N', 'C', 90, 'S', '', 'S', '');

INSERT INTO `sysModulos` (`ModCodigo`, `ModOrden`, `ModNombre`, `ModTexto`, `ModTipo`, `ModLink`, `ModInfoAdic`, `ModInfoRela`, `ModPerDuplicar`) VALUES 
(330, 80, 'Faq', 'Faq', 'N', '', 'S', 'N', 'S');


INSERT INTO `sysModUsu` (`ModNombre`, `UsuAlias`, `PerVer`, `PerEditar`, `PerAgregar`, `PerBorrar`, `PerAcciones`, `PerExportar`, `VerCntLineas`) VALUES 
('Faq', 'cmirtuono', 'S', 'S', 'S', 'S', 'S', 'S', 50),
('Faq', 'federico', 'S', 'S', 'S', 'S', 'S', 'S', 50);