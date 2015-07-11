TABLA CATEGORIA
Título
Copete
Txt html
Logo marca producto
PDF
Imagen general de producto en home
Imagen general de producto en producto
Solución para tablas de cargas de trabajo (HTML?)
 
 
TABLA PRODUCTO
Selector de categoría
Imagen
PDF
Solución para tablas de cargas de trabajo (HTML?)


CREATE TABLE IF NOT EXISTS `Categorias` (
  `CatCodigo` smallint(5) unsigned NOT NULL auto_increment,
  `CatTitulo` varchar(30) NOT NULL default '',
  `CatResumen` varchar(255) NOT NULL,
  `CatTexto` text NOT NULL default '',
  `CatLogoMarca` varchar(160) NOT NULL,
  `CatPDF` varchar(160) NOT NULL,
  `CatImgHome` varchar(160) NOT NULL,
  `CatImgBig` varchar(160) NOT NULL,
  `CatExtraContent` text NOT NULL default '',
  `CatOrden` smallint(5) unsigned NOT NULL default '0',
  `CatVisible` varchar(2) NOT NULL default '',
  PRIMARY KEY  (`CatCodigo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=0 ;


CREATE TABLE IF NOT EXISTS `Productos` (
  `PrdCodigo` smallint(5) unsigned NOT NULL auto_increment,
  `CatCodigo` smallint(5) unsigned NOT NULL default '0',
  `PrdTitulo` varchar(30) NOT NULL default '',
  `PrdImagen` varchar(100) NOT NULL default '',
  `PrdPDF` varchar(100) NOT NULL default '',
  `PrdDescripcion` text NOT NULL default '',
  `PrdOrden` smallint(5) unsigned NOT NULL default '0',
  `PrdVisible` varchar(2) NOT NULL default '',
  `PrdVisitas` smallint(10) NOT NULL,
  PRIMARY KEY  (`PrdCodigo`)
) TYPE=MyISAM AUTO_INCREMENT=1 ;


INSERT INTO `sysCambios` (`CpoCodigo`, `ModNombre`, `CpoNombre`, `CpoEtiqueta`, `CpoTipo`, `CpoOpciones`, `CpoMaesEscl`, `CpoDependencias`, `CpoJScript`, `CpoJScriptDin`, `CpoAgregado`, `CpoOrdenPpal`, `CpoOrdenSec`, `CpoMinimo`, `CpoMaximo`, `CpoAnchoTot`, `CpoAnchoVis`, `CpoAlto`, `CpoToolTip`, `CpoRequerido`) VALUES 
(20, 'Categorias', 'CatCodigo', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, '', 'S'),
(21, 'Categorias', 'CatTitulo', 'Categoría', 'T', '', '', '', '', '', '', 5, 0, 0, 0, 100, 60, 0, '', 'S'),
(22, 'Categorias', 'CatResumen', 'Resumen', 'M', '', '', '', '', '', '', 10, 0, 0, 0, 250, 45, 6, 'hasta 255 caracteres', 'N'),
(23, 'Categorias', 'CatTexto', 'Descripcion', 'H', '', '', '', '', '', '', 50, 0, 0, 0, 0, 585, 350, '', 'S'),
(24, 'Categorias', 'CatLogoMarca', 'Logo Marca', 'U', 'Productos', '', '', '', '', '', 20, 0, 0, 0, 100, 60, 0, 'Alto máx: 40px', 'N'),
(25, 'Categorias', 'CatPDF', 'PDF', 'U', 'Productos', '', '', '', '', '', 20, 0, 0, 0, 100, 60, 0, '', 'N'),
(26, 'Categorias', 'CatImgHome', 'Imagen HOME', 'U', 'Productos', '', '', '', '', '', 20, 0, 0, 0, 100, 60, 0, 'Imagen que irá en la página de inicio. Ancho: 231px/Alto: 140px', 'N'),
(27, 'Categorias', 'CatImgBig', 'Imagen Grande', 'U', 'Productos', '', '', '', '', '', 20, 0, 0, 0, 100, 60, 0, 'Ancho: 615px'),


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
(34, 'Productos', 'PrdVisible', '', 'Visible', 'N', 'C', 30, 'S', '', 'S', ''),
(35, 'Productos', 'ProVisitas', '', 'Visitas', 'N', 'C', 45, 'S', '', 'S', '');


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