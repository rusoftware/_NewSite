--
-- Módulo de GALERIAS Multilenguaje (los idiomas se cargan en sysLenguajes)
--

Galerías de imágenes: En cada galería se podrá cargar:
o	Título de la galería
o	Descripción
o	Hasta 20 imágenes
o	Visible Si/No



CREATE TABLE IF NOT EXISTS `Galerias` (
  `GalCodigo` smallint(5) unsigned NOT NULL auto_increment,
  `GalTitulo` varchar(100) NOT NULL default '',
  `GalTexto` text NOT NULL,
  `GalImg01` varchar(255) NOT NULL default '',
  `GalImg02` varchar(255) NOT NULL default '',
  `GalImg03` varchar(255) NOT NULL default '',
  `GalImg04` varchar(255) NOT NULL default '',
  `GalImg05` varchar(255) NOT NULL default '',
  `GalImg06` varchar(255) NOT NULL default '',
  `GalImg07` varchar(255) NOT NULL default '',
  `GalImg08` varchar(255) NOT NULL default '',
  `GalImg09` varchar(255) NOT NULL default '',
  `GalImg10` varchar(255) NOT NULL default '',
  `GalImg11` varchar(255) NOT NULL default '',
  `GalImg12` varchar(255) NOT NULL default '',
  `GalImg13` varchar(255) NOT NULL default '',
  `GalImg14` varchar(255) NOT NULL default '',
  `GalImg15` varchar(255) NOT NULL default '',
  `GalImg16` varchar(255) NOT NULL default '',
  `GalImg17` varchar(255) NOT NULL default '',
  `GalImg18` varchar(255) NOT NULL default '',
  `GalImg19` varchar(255) NOT NULL default '',
  `GalImg20` varchar(255) NOT NULL default '',
  `GalVisible` varchar(2) NOT NULL default '',
  PRIMARY KEY  (`GalCodigo`)
) TYPE=MyISAM AUTO_INCREMENT=0;


CREATE TABLE IF NOT EXISTS `Galerias_Lng` (
  `GalCodigo` int(10) unsigned NOT NULL default '0',
  `LanParticle` varchar(2) NOT NULL default '',
  `GalTitulo` varchar(100) NOT NULL default '',
  `GalTexto` text NOT NULL,
  PRIMARY KEY  (`GalCodigo`,`LanParticle`)
) TYPE=MyISAM;


INSERT INTO `sysCambios` (`CpoCodigo`, `ModNombre`, `CpoNombre`, `CpoEtiqueta`, `CpoTipo`, `CpoOpciones`, `CpoMaesEscl`, `CpoDependencias`, `CpoJScript`, `CpoJScriptDin`, `CpoAgregado`, `CpoOrdenPpal`, `CpoOrdenSec`, `CpoMinimo`, `CpoMaximo`, `CpoAnchoTot`, `CpoAnchoVis`, `CpoAlto`, `CpoToolTip`, `CpoRequerido`) VALUES 
(100, 'Galerias', 'GalCodigo', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, '', 'S'),
(101, 'Galerias', 'GalTitulo', 'Título', 'T', '', '', '', '', '', '', 5, 0, 0, 0, 100, 60, 0, '', 'S'),
(102, 'Galerias', 'GalTexto', 'Descripción', 'H', '', '', '', '', '', '', 10, 0, 0, 0, 0, 585, 350, '', 'N'),
(103, 'Galerias', 'GalImg01', 'Imagen', 'U', 'Galerias', '', '', '', '', '', 20, 0, 0, 0, 100, 60, 0, '', 'N'),
(104, 'Galerias', 'GalImg02', 'Imagen', 'U', 'Galerias', '', '', '', '', '', 22, 0, 0, 0, 100, 60, 0, '', 'N'),
(105, 'Galerias', 'GalImg03', 'Imagen', 'U', 'Galerias', '', '', '', '', '', 24, 0, 0, 0, 100, 60, 0, '', 'N'),
(106, 'Galerias', 'GalImg04', 'Imagen', 'U', 'Galerias', '', '', '', '', '', 26, 0, 0, 0, 100, 60, 0, '', 'N'),
(107, 'Galerias', 'GalImg05', 'Imagen', 'U', 'Galerias', '', '', '', '', '', 28, 0, 0, 0, 100, 60, 0, '', 'N'),
(108, 'Galerias', 'GalImg06', 'Imagen', 'U', 'Galerias', '', '', '', '', '', 30, 0, 0, 0, 100, 60, 0, '', 'N'),
(109, 'Galerias', 'GalImg07', 'Imagen', 'U', 'Galerias', '', '', '', '', '', 32, 0, 0, 0, 100, 60, 0, '', 'N'),
(110, 'Galerias', 'GalImg08', 'Imagen', 'U', 'Galerias', '', '', '', '', '', 34, 0, 0, 0, 100, 60, 0, '', 'N'),
(111, 'Galerias', 'GalImg09', 'Imagen', 'U', 'Galerias', '', '', '', '', '', 36, 0, 0, 0, 100, 60, 0, '', 'N'),
(112, 'Galerias', 'GalImg10', 'Imagen', 'U', 'Galerias', '', '', '', '', '', 38, 0, 0, 0, 100, 60, 0, '', 'N'),
(113, 'Galerias', 'GalImg11', 'Imagen', 'U', 'Galerias', '', '', '', '', '', 40, 0, 0, 0, 100, 60, 0, '', 'N'),
(114, 'Galerias', 'GalImg12', 'Imagen', 'U', 'Galerias', '', '', '', '', '', 42, 0, 0, 0, 100, 60, 0, '', 'N'),
(115, 'Galerias', 'GalImg13', 'Imagen', 'U', 'Galerias', '', '', '', '', '', 44, 0, 0, 0, 100, 60, 0, '', 'N'),
(116, 'Galerias', 'GalImg14', 'Imagen', 'U', 'Galerias', '', '', '', '', '', 46, 0, 0, 0, 100, 60, 0, '', 'N'),
(117, 'Galerias', 'GalImg15', 'Imagen', 'U', 'Galerias', '', '', '', '', '', 48, 0, 0, 0, 100, 60, 0, '', 'N'),
(118, 'Galerias', 'GalImg16', 'Imagen', 'U', 'Galerias', '', '', '', '', '', 50, 0, 0, 0, 100, 60, 0, '', 'N'),
(119, 'Galerias', 'GalImg17', 'Imagen', 'U', 'Galerias', '', '', '', '', '', 52, 0, 0, 0, 100, 60, 0, '', 'N'),
(120, 'Galerias', 'GalImg18', 'Imagen', 'U', 'Galerias', '', '', '', '', '', 54, 0, 0, 0, 100, 60, 0, '', 'N'),
(121, 'Galerias', 'GalImg19', 'Imagen', 'U', 'Galerias', '', '', '', '', '', 56, 0, 0, 0, 100, 60, 0, '', 'N'),
(122, 'Galerias', 'GalImg20', 'Imagen', 'U', 'Galerias', '', '', '', '', '', 58, 0, 0, 0, 100, 60, 0, '', 'N'),
(123, 'Galerias', 'GalVisible', 'Visible', 'RH', 'Si:::Si\r\nNo:::No', '', '', '', '', '', 60, 0, 0, 0, 0, 0, 0, '', 'S');


INSERT INTO `sysFrom` (`QryCodigo`, `ModNombre`, `QryFrom`, `QryFromAlias`) VALUES 
(100, 'Galerias', 'Galerias', '');


INSERT INTO `sysInfo` (`QryCodigo`, `ModNombre`, `QryCampo`, `QryCampoAlias`, `QryCampoNombre`, `QryCampoImagen`, `QryAlineacion`, `QryPosicion`, `QryOrden`, `QryOrdenExpr`, `QryFiltro`, `QryFiltroExpr`) VALUES 
(100, 'Galerias', 'GalCodigo', '', '', '', '', 0, '', '', '', ''),
(101, 'Galerias', 'GalTitulo', '', 'T&iacute;tulo', 'N', 'I', 10, 'S', '', 'S', ''),
(102, 'Galerias', 'GalVisible', '', 'Visible', 'N', 'C', 40, 'S', '', 'S', '');


INSERT INTO `sysMasInfo` (`MInCodigo`, `ModNombre`, `MInCampo`, `MInCampoAlias`, `MInCampoNombre`, `MInCampoImagen`, `MInEtiqPosicion`, `MInPosicion`) VALUES 
(100, 'Galerias', 'GalCodigo', '', '', '', '', 0),
(101, 'Galerias', 'GalTitulo', '', 'Título', 'N', 'A', 10),
(102, 'Galerias', 'GalTexto', '', 'Descripción', 'N', 'A', 20);


INSERT INTO `sysModulos` (`ModCodigo`, `ModOrden`, `ModNombre`, `ModTexto`, `ModTipo`, `ModLink`, `ModInfoAdic`, `ModInfoRela`, `ModPerDuplicar`) VALUES 
(100, 100, 'Galerias', 'Galerias', 'N', '', 'S', 'N', 'S');


INSERT INTO `sysModUsu` (`ModNombre`, `UsuAlias`, `PerVer`, `PerEditar`, `PerAgregar`, `PerBorrar`, `PerAcciones`, `PerExportar`, `VerCntLineas`) VALUES 
('Galerias', 'cmirtuono', 'S', 'S', 'S', 'S', 'S', 'S', 50),
('Galerias', 'federico', 'S', 'S', 'S', 'S', 'S', 'S', 50);