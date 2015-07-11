--
-- Módulo de Novedades Multilenguaje
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
  `NovDateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `NovAutor` varchar(200) NOT NULL default '',
  `NovVisitas` smallint(10) NOT NULL,
  PRIMARY KEY  (`NovCodigo`)
) ENGINE=MyISAM AUTO_INCREMENT=0;


CREATE TABLE IF NOT EXISTS `Novedades_Lng` (
  `NovCodigo` int(10) unsigned NOT NULL default '0',
  `LanParticle` varchar(2) NOT NULL default '',
  `NovTitulo` varchar(100) NOT NULL default '',
  `NovApostilla` text NOT NULL,
  `NovTexto` text NOT NULL,
  `NovVisitas` smallint(10) NOT NULL,
  PRIMARY KEY  (`NovCodigo`,`LanParticle`)
) ENGINE=MyISAM;


INSERT INTO `sysCambios` (`CpoCodigo`, `ModNombre`, `CpoNombre`, `CpoEtiqueta`, `CpoTipo`, `CpoOpciones`, `CpoMaesEscl`, `CpoDependencias`, `CpoJScript`, `CpoJScriptDin`, `CpoAgregado`, `CpoOrdenPpal`, `CpoOrdenSec`, `CpoMinimo`, `CpoMaximo`, `CpoAnchoTot`, `CpoAnchoVis`, `CpoAlto`, `CpoToolTip`, `CpoRequerido`) VALUES 
(10, 'Novedades', 'NovCodigo', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, '', 'S'),
(11, 'Novedades', 'NovTitulo', 'Título', 'T', '', '', '', '', '', '', 5, 0, 0, 0, 100, 60, 0, '', 'S'),
(12, 'Novedades', 'NovApostilla', 'Resumen', 'M', '', '', '', '', '', '', 10, 0, 0, 0, 250, 45, 6, '', 'N'),
(13, 'Novedades', 'NovTexto', 'Contenido', 'H', '', '', '', '', '', '', 20, 0, 0, 0, 0, 585, 350, '', 'N'),
(14, 'Novedades', 'NovImagen', 'Imagen', 'U', 'Novedades', '', '', '', '', '', 30, 0, 0, 0, 100, 60, 0, '', 'N'),
(15, 'Novedades', 'NovFechaDesde', 'Fecha Desde', 'F', '', '', '', '', '', '', 40, 0, 0, 0, 0, 0, 0, '', 'N'),
(16, 'Novedades', 'NovFechaHasta', 'Fecha Hasta', 'F', '', '', '', '', '', '', 50, 0, 0, 0, 0, 0, 0, '', 'N'),
(17, 'Novedades', 'NovVisible', 'Visible', 'RH', 'Si:::Si\r\nNo:::No', '', '', '', '', '', 60, 0, 0, 0, 0, 0, 0, '', 'S'),
(18, 'Novedades', 'NovAutor', 'Autor', 'T', '', '', '', '', '', '', 70, 0, 0, 0, 100, 60, 0, '', 'S');


INSERT INTO `sysFrom` (`QryCodigo`, `ModNombre`, `QryFrom`, `QryFromAlias`) VALUES 
(10, 'Novedades', 'Novedades', '');


INSERT INTO `sysInfo` (`QryCodigo`, `ModNombre`, `QryCampo`, `QryCampoAlias`, `QryCampoNombre`, `QryCampoImagen`, `QryAlineacion`, `QryPosicion`, `QryOrden`, `QryOrdenExpr`, `QryFiltro`, `QryFiltroExpr`) VALUES 
(10, 'Novedades', 'NovCodigo', '', '', '', '', 0, '', '', '', ''),
(11, 'Novedades', 'NovTitulo', '', 'T&iacute;tulo Esp', 'N', 'I', 10, 'S', '', 'S', ''),
(12, 'Novedades', 'IF(NovFechaDesde,DATE_FORMAT(NovFechaDesde,''%d-%m-%Y''),'''')', 'ccFechaD', 'Fecha Desde', 'N', 'I', 20, 'D', 'NovFechaDesde', 'S', ''),
(13, 'Novedades', 'IF(NovFechaHasta,DATE_FORMAT(NovFechaHasta,''%d-%m-%Y''),'''')', 'ccFechaH', 'Fecha Hasta', 'N', 'I', 30, 'D', 'NovFechaHasta', 'S', ''),
(14, 'Novedades', 'NovVisible', '', 'Visible', 'N', 'C', 40, 'S', '', 'S', ''),
(15, 'Novedades', 'NovVisitas', '', 'Visitas', 'N', 'C', 45, 'S', '', 'S', '');


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



------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------Categorias y Productos con Lng-----------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `Categorias` (
  `CatCodigo` smallint(5) unsigned NOT NULL auto_increment,
  `CatNombre` varchar(30) NOT NULL default '',
  `CatImagen` varchar(160) NOT NULL,
  `CatOrden` smallint(5) unsigned NOT NULL default '0',
  `CatVisible` varchar(2) NOT NULL default '',
  PRIMARY KEY  (`CatCodigo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `Categorias_Lng` (
  `CatCodigo` int(10) unsigned NOT NULL default '0',
  `LanParticle` varchar(2) NOT NULL default '',
  `CatNombre` varchar(30) NOT NULL default '',
  PRIMARY KEY  (`CatCodigo`,`LanParticle`)
) TYPE=MyISAM;

CREATE TABLE IF NOT EXISTS `Productos` (
  `PrdCodigo` smallint(5) unsigned NOT NULL auto_increment,
  `CatCodigo` smallint(5) unsigned NOT NULL default '0',
  `PrdTitulo` varchar(30) NOT NULL default '',
  `PrdImagen1` varchar(100) NOT NULL default '',
  `PrdImagen2` varchar(100) NOT NULL default '',
  `PrdDescripcion` text NOT NULL default '',
  `PrdTablaNut` text NOT NULL default '',
  `PrdOrden` smallint(5) unsigned NOT NULL default '0',
  `PrdVisible` varchar(2) NOT NULL default '',
  PRIMARY KEY  (`PrdCodigo`)
) TYPE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `Productos_Lng` (
  `PrdCodigo` int(10) unsigned NOT NULL default '0',
  `LanParticle` varchar(2) NOT NULL default '',
  `PrdTitulo` varchar(30) NOT NULL default '',
  `PrdDescripcion` text NOT NULL default '',
  `PrdTablaNut` text NOT NULL default '',
  PRIMARY KEY  (`PrdCodigo`,`LanParticle`)
) TYPE=MyISAM;


INSERT INTO `sysCambios` (`CpoCodigo`, `ModNombre`, `CpoNombre`, `CpoEtiqueta`, `CpoTipo`, `CpoOpciones`, `CpoMaesEscl`, `CpoDependencias`, `CpoJScript`, `CpoJScriptDin`, `CpoAgregado`, `CpoOrdenPpal`, `CpoOrdenSec`, `CpoMinimo`, `CpoMaximo`, `CpoAnchoTot`, `CpoAnchoVis`, `CpoAlto`, `CpoToolTip`, `CpoRequerido`) VALUES 
(20, 'Categorias', 'CatCodigo', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, '', 'S'),
(21, 'Categorias', 'CatNombre', 'Categoría', 'T', '', '', '', '', '', '', 5, 0, 0, 0, 100, 60, 0, '', 'S'),
(22, 'Categorias', 'CatImagen', 'Imagen', 'U', 'Categorias', '', '', '', '', '', 20, 0, 0, 0, 100, 60, 0, '', 'N'),
(23, 'Categorias', 'CatOrden', 'Orden', 'N', '', '', '', '', '', '', 40, 0, 0, 999, 3, 3, 0, '', 'N'),
(24, 'Categorias', 'CatVisible', 'Visible', 'RH', 'Si:::Si\r\nNo:::No', '', '', '', '', '', 50, 0, 0, 0, 0, 0, 0, '', 'S'),
(30, 'Productos', 'PrdCodigo', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, '', 'S'),
(31, 'Productos', 'CatCodigo', 'Categoria', 'L', '+SELECT CatCodigo, CatNombre FROM Categorias ORDER BY CatNombre', '', '', '', '', '', 10, 0, 0, 0, 0, 0, 1, '', 'N'),
(33, 'Productos', 'PrdTitulo', 'Título', 'T', '', '', '', '', '', '', 20, 0, 0, 0, 100, 60, 0, '', 'S'),
(34, 'Productos', 'PrdImagen1', 'Imagen Chica', 'U', 'Productos', '', '', '', '', '', 30, 0, 0, 0, 100, 60, 0, '', 'N'),
(35, 'Productos', 'PrdImagen2', 'Imagen Grande', 'U', 'Productos', '', '', '', '', '', 40, 0, 0, 0, 100, 60, 0, '', 'N'),
(36, 'Productos', 'PrdDescripcion', 'Descripcion', 'H', '', '', '', '', '', '', 50, 0, 0, 0, 0, 585, 350, '', 'S'),
(37, 'Productos', 'PrdTablaNut', 'Tabla Nutricional', 'H', '', '', '', '', '', '', 60, 0, 0, 0, 0, 585, 350, '', 'S'),
(38, 'Productos', 'PrdOrden', 'Orden', 'N', '', '', '', '', '', '', 70, 0, 0, 999, 3, 3, 0, '', 'N'),
(39, 'Productos', 'PrdVisible', 'Visible', 'RH', 'Si:::Si\r\nNo:::No', '', '', '', '', '', 80, 0, 0, 0, 0, 0, 0, '', 'S');

INSERT INTO `sysFrom` (`QryCodigo`, `ModNombre`, `QryFrom`, `QryFromAlias`) VALUES 
(20, 'Categorias', 'Categorias', ''),
(30, 'Productos', 'Productos', '');


INSERT INTO `sysInfo` (`QryCodigo`, `ModNombre`, `QryCampo`, `QryCampoAlias`, `QryCampoNombre`, `QryCampoImagen`, `QryAlineacion`, `QryPosicion`, `QryOrden`, `QryOrdenExpr`, `QryFiltro`, `QryFiltroExpr`) VALUES 
(20, 'Categorias', 'CatCodigo', '', '', '', '', 0, '', '', '', ''),
(21, 'Categorias', 'CatNombre', '', 'Categoria', 'N', 'I', 10, 'S', '', 'S', ''),
(22, 'Categorias', 'CatOrden', '', 'Orden', 'N', 'D', 20, 'S', '', 'S', ''),
(23, 'Categorias', 'CatVisible', '', 'Visible', 'N', 'C', 30, 'S', '', 'S', ''),
(30, 'Productos', 'PrdCodigo', '', '', '', '', 0, '', '', '', ''),
(31, 'Productos', 'PrdTitulo', '', 'Modelo', 'N', 'I', 10, 'S', '', 'S', ''),
(32, 'Productos', 'CatNombre', '', 'Linea', 'N', 'I', 8, 'S', '', 'S', ''),
(33, 'Productos', 'PrdOrden', '', 'Orden', 'N', 'D', 20, 'S', '', 'S', ''),
(34, 'Productos', 'PrdVisible', '', 'Visible', 'N', 'C', 30, 'S', '', 'S', '');


INSERT INTO `sysJoin` (`QryCodigo`, `ModNombre`, `QryJoin`, `QryJoinAlias`, `QryJoinTipo`, `QryJoinExpr`, `QryJoinUso`, `RelModulo`) VALUES 
(20, 'Productos', 'Categorias', '', 'L', 'Productos.CatCodigo=Categorias.CatCodigo', 'I', '');


INSERT INTO `sysModulos` (`ModCodigo`, `ModOrden`, `ModNombre`, `ModTexto`, `ModTipo`, `ModLink`, `ModInfoAdic`, `ModInfoRela`, `ModPerDuplicar`) VALUES 
(20, 20, 'Categorias', 'Categorias', 'N', '', 'S', 'N', 'S'),
(30, 21, 'Productos', 'Productos', 'N', '', 'S', 'N', 'S');


INSERT INTO `sysModUsu` (`ModNombre`, `UsuAlias`, `PerVer`, `PerEditar`, `PerAgregar`, `PerBorrar`, `PerAcciones`, `PerExportar`, `VerCntLineas`) VALUES 
('Categorias', 'cmirtuono', 'S', 'S', 'S', 'S', 'S', 'S', 50),
('Categorias', 'federico', 'S', 'S', 'S', 'S', 'S', 'S', 50),
('Productos', 'cmirtuono', 'S', 'S', 'S', 'S', 'S', 'S', 50),
('Productos', 'federico', 'S', 'S', 'S', 'S', 'S', 'S', 50);


INSERT INTO `sysRelacion` (`RelCodigo`, `ModNombre`, `RelModulo`, `RelCampo`, `RelExtraJoin`) VALUES 
(20, 'Categorias', 'Productos', 'XXCodigoXX=Categorias.CatCodigo', 'LEFT JOIN Productos ON Categorias.CatCodigo=Productos.CatCodigo');




------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `Lineas` (
  `LinCodigo` smallint(5) unsigned NOT NULL auto_increment,
  `LinDescripcion` varchar(30) NOT NULL default '',
  PRIMARY KEY  (`LinCodigo`)
) TYPE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `Lineas_Lng` (
  `LinCodigo` int(10) unsigned NOT NULL default '0',
  `LanParticle` varchar(2) NOT NULL default '',
  `LinDescripcion` varchar(30) NOT NULL default '',
  PRIMARY KEY  (`LinCodigo`,`LanParticle`)
) TYPE=MyISAM;

CREATE TABLE IF NOT EXISTS `Formas` (
  `ForCodigo` smallint(5) unsigned NOT NULL auto_increment,
  `LinCodigo` smallint(5) unsigned NOT NULL default '0',
  `ForDescripcion` varchar(30) NOT NULL default '',
  `ForTitulo` varchar(30) NOT NULL default '',
  `ForPosicion` smallint(5) unsigned NOT NULL default '0',
  `ForImagen` varchar(100) NOT NULL default '',
  `ForPDF` varchar(40) NOT NULL default '',
  PRIMARY KEY  (`ForCodigo`)
) TYPE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `Formas_Lng` (
  `ForCodigo` int(10) unsigned NOT NULL default '0',
  `LanParticle` varchar(2) NOT NULL default '',
  `ForDescripcion` varchar(30) NOT NULL default '',
  `ForTitulo` varchar(30) NOT NULL default '',
  `ForPDF` varchar(40) NOT NULL default '',
  PRIMARY KEY  (`ForCodigo`,`LanParticle`)
) TYPE=MyISAM;


INSERT INTO `sysCambios` (`CpoCodigo`, `ModNombre`, `CpoNombre`, `CpoEtiqueta`, `CpoTipo`, `CpoOpciones`, `CpoMaesEscl`, `CpoDependencias`, `CpoJScript`, `CpoJScriptDin`, `CpoAgregado`, `CpoOrdenPpal`, `CpoOrdenSec`, `CpoMinimo`, `CpoMaximo`, `CpoAnchoTot`, `CpoAnchoVis`, `CpoAlto`, `CpoToolTip`, `CpoRequerido`) VALUES 
(20, 'Lineas', 'LinCodigo', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, '', 'S'),
(21, 'Lineas', 'LinDescripcion', 'Linea', 'T', '', '', '', '', '', '', 5, 0, 0, 0, 100, 60, 0, '', 'S'),
(22, 'Formas', 'ForCodigo', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, '', 'S'),
(23, 'Formas', 'LinCodigo', 'Linea', 'L', '+SELECT LinCodigo, LinDescripcion FROM Lineas ORDER BY LinDescripcion', '', '', '', '', '', 10, 0, 0, 0, 0, 0, 1, '', 'N'),
(24, 'Formas', 'ForTitulo', 'Título', 'T', '', '', '', '', '', '', 20, 0, 0, 0, 100, 60, 0, '', 'S'),
(25, 'Formas', 'ForDescripcion', 'Descripcion', 'T', '', '', '', '', '', '', 30, 0, 0, 0, 100, 60, 0, '', 'S'),
(26, 'Formas', 'ForPosicion', 'Orden', 'N', '', '', '', '', '', '', 40, 0, 0, 999, 3, 3, 0, '', 'N'),
(27, 'Formas', 'ForImagen', 'Imagen', 'U', 'Formas', '', '', '', '', '', 20, 0, 0, 0, 100, 60, 0, '', 'N'),
(28, 'Formas', 'ForPDF', 'PDF', 'U', 'PDFs', '', '', '', '', '', 20, 0, 0, 0, 100, 60, 0, '', 'N');

INSERT INTO `sysFrom` (`QryCodigo`, `ModNombre`, `QryFrom`, `QryFromAlias`) VALUES 
(20, 'Lineas', 'Lineas', ''),
(21, 'Formas', 'Formas', '');


INSERT INTO `sysInfo` (`QryCodigo`, `ModNombre`, `QryCampo`, `QryCampoAlias`, `QryCampoNombre`, `QryCampoImagen`, `QryAlineacion`, `QryPosicion`, `QryOrden`, `QryOrdenExpr`, `QryFiltro`, `QryFiltroExpr`) VALUES 
(20, 'Lineas', 'LinCodigo', '', '', '', '', 0, '', '', '', ''),
(21, 'Lineas', 'LinDescripcion', '', 'Linea', 'N', 'I', 10, 'S', '', 'S', ''),
(22, 'Formas', 'ForCodigo', '', '', '', '', 0, '', '', '', ''),
(23, 'Formas', 'ForTitulo', '', 'Modelo', 'N', 'I', 10, 'S', '', 'S', ''),
(24, 'Formas', 'LinDescripcion', '', 'Linea', 'N', 'I', 8, 'S', '', 'S', ''),
(25, 'Formas', 'ForPosicion', '', 'Orden', 'N', 'D', 28, 'S', '', 'S', '');


INSERT INTO `sysJoin` (`QryCodigo`, `ModNombre`, `QryJoin`, `QryJoinAlias`, `QryJoinTipo`, `QryJoinExpr`, `QryJoinUso`, `RelModulo`) VALUES 
(20, 'Formas', 'Lineas', '', 'L', 'Formas.LinCodigo=Lineas.LinCodigo', 'I', '');


INSERT INTO `sysModulos` (`ModCodigo`, `ModOrden`, `ModNombre`, `ModTexto`, `ModTipo`, `ModLink`, `ModInfoAdic`, `ModInfoRela`, `ModPerDuplicar`) VALUES 
(20, 20, 'Lineas', 'Lineas', 'N', '', 'S', 'N', 'S'),
(21, 21, 'Formas', 'Formas', 'N', '', 'S', 'N', 'S');


INSERT INTO `sysModUsu` (`ModNombre`, `UsuAlias`, `PerVer`, `PerEditar`, `PerAgregar`, `PerBorrar`, `PerAcciones`, `PerExportar`, `VerCntLineas`) VALUES 
('Lineas', 'cmirtuono', 'S', 'S', 'S', 'S', 'S', 'S', 50),
('Lineas', 'federico', 'S', 'S', 'S', 'S', 'S', 'S', 50),
('Lineas', 'mmirtuono', 'S', 'S', 'S', 'S', 'S', 'S', 50),
('Formas', 'cmirtuono', 'S', 'S', 'S', 'S', 'S', 'S', 50),
('Formas', 'federico', 'S', 'S', 'S', 'S', 'S', 'S', 50),
('Formas', 'mmirtuono', 'S', 'S', 'S', 'S', 'S', 'S', 50);


INSERT INTO `sysRelacion` (`RelCodigo`, `ModNombre`, `RelModulo`, `RelCampo`, `RelExtraJoin`) VALUES 
(20, 'Lineas', 'Formas', 'XXCodigoXX=Lineas.LinCodigo', 'LEFT JOIN Formas ON Lineas.LinCodigo=Formas.LinCodigo');
