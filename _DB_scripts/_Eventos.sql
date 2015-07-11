CREATE TABLE IF NOT EXISTS `Eventos` (
  `EveCodigo` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `EveTipo` varchar(100) NOT NULL DEFAULT '',
  `EveTitulo` varchar(100) NOT NULL DEFAULT '',
  `EveDescripcion` text NOT NULL,
  `EveFecha` date NOT NULL default '0000-00-00',
  `EveHora` varchar(30) NOT NULL DEFAULT '',
  `EveLugar` text NOT NULL,
  `EveVisible` varchar(2) NOT NULL,
  PRIMARY KEY (`EveCodigo`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=0 ;

INSERT INTO `sysCambios` (`CpoCodigo`, `ModNombre`, `CpoNombre`, `CpoEtiqueta`, `CpoTipo`, `CpoOpciones`, `CpoMaesEscl`, `CpoDependencias`, `CpoJScript`, `CpoJScriptDin`, `CpoAgregado`, `CpoOrdenPpal`, `CpoOrdenSec`, `CpoMinimo`, `CpoMaximo`, `CpoAnchoTot`, `CpoAnchoVis`, `CpoAlto`, `CpoToolTip`, `CpoRequerido`) VALUES 
(300, 'Eventos', 'EveCodigo', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, '', 'S'),
(301, 'Eventos', 'EveTipo', 'Tipo', 'T', '', '', '', '', '', '', 10, 0, 0, 0, 100, 60, 0, '', 'S'),
(302, 'Eventos', 'EveTitulo', 'Titulo', 'T', '', '', '', '', '', '', 15, 0, 0, 0, 100, 60, 0, '', 'S'),
(303, 'Eventos', 'EveDescripcion', 'Descripción', 'M', '', '', '', '', '', '', 20, 0, 0, 0, 0, 45, 3, '', 'N'),
(304, 'Eventos', 'EveFecha', 'Fecha', 'F', '', '', '', '', '', '', 25, 0, 0, 0, 0, 0, 0, '', 'N'),
(305, 'Eventos', 'EveHora', 'Hora', 'T', '', '', '', '', '', '', 30, 0, 0, 0, 100, 60, 0, '', 'S'),
(306, 'Eventos', 'EveLugar', 'Lugar', 'M', '', '', '', '', '', '', 35, 0, 0, 0, 0, 45, 3, '', 'N'),
(307, 'Eventos', 'EveVisible', 'Visible', 'RV', 'Si:::Si\r\nNo:::No', '', '', '', '', '', 60, 0, 0, 99999, 5, 5, 0, '', 'S');

-- --------------------------------------------------------

INSERT INTO `sysFrom` (`QryCodigo`, `ModNombre`, `QryFrom`, `QryFromAlias`) VALUES 
(300, 'Eventos', 'Eventos', '');


INSERT INTO `sysInfo` (`QryCodigo`, `ModNombre`, `QryCampo`, `QryCampoAlias`, `QryCampoNombre`, `QryCampoImagen`, `QryAlineacion`, `QryPosicion`, `QryOrden`, `QryOrdenExpr`, `QryFiltro`, `QryFiltroExpr`) VALUES 
(300, 'Eventos', 'EveCodigo', '', '', '', '', 0, '', '', '', ''),
(301, 'Eventos', 'EveTipo', '', 'Tipo', 'N', 'I', 10, 'S', '', 'S', ''),
(302, 'Eventos', 'EveTitulo', '', 'Titulo', 'N', 'I', 20, 'S', '', 'S', ''),
(303, 'Eventos', 'IF(EveFecha,DATE_FORMAT(EveFecha,''%d-%m-%Y''),'''')', 'ccFechaD', 'Fecha', 'N', 'I', 30, 'D', 'EveFecha', 'S', ''),
(304, 'Eventos', 'EveHora', '', 'Hora', 'N', 'I', 40, 'S', '', 'S', ''),
(305, 'Eventos', 'EveVisible', '', 'Visible', 'N', 'C', 90, 'S', '', 'S', '');



INSERT INTO `sysModulos` (`ModCodigo`, `ModOrden`, `ModNombre`, `ModTexto`, `ModTipo`, `ModLink`, `ModInfoAdic`, `ModInfoRela`, `ModPerDuplicar`) VALUES 
(300, 70, 'Eventos', 'Eventos', 'N', '', 'S', 'N', 'S');


INSERT INTO `sysModUsu` (`ModNombre`, `UsuAlias`, `PerVer`, `PerEditar`, `PerAgregar`, `PerBorrar`, `PerAcciones`, `PerExportar`, `VerCntLineas`) VALUES 
('Eventos', 'cmirtuono', 'S', 'S', 'S', 'S', 'S', 'S', 50),
('Eventos', 'federico', 'S', 'S', 'S', 'S', 'S', 'S', 50);