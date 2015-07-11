Campos TR => Texto Relacional (varios campos de texto normal en tabla relacionada de varios registros apuntando al actual)



/* Tablas //////
Para el ejemplo de presentaciones en productos, las tablas se relacionan por el id del producto:
////// */
CREATE TABLE IF NOT EXISTS `Productos` (
  `PrdCod` smallint(5) unsigned NOT NULL auto_increment,
  `PrdCodInterno` smallint(10) NOT NULL,
  `PrdNombre` varchar(30) NOT NULL default '',
  `PrdCategoria` smallint(5) unsigned NOT NULL default '0',
  `PrdImgBaja` varchar(150) NOT NULL default '0',
  `PrdImgAlta` varchar(150) NOT NULL default '0',
  `PrdOrden` smallint(5) unsigned NOT NULL default '0',
  `PrdDescripcion` text NOT NULL,
  `PrdVisible` varchar(2) NOT NULL default 'No',
  `PrdVisitas` int(11) NOT NULL default '0',
  PRIMARY KEY  (`PrdCod`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=0 ;

CREATE TABLE IF NOT EXISTS `Presentaciones` (
  `PresCod` smallint(5) unsigned NOT NULL auto_increment,
  `PresDescr` varchar(150) NOT NULL default '',
  `PresPrecio` smallint(5) unsigned NOT NULL default '0',
  `PresProdId` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`PresCod`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=0 ;

// notese que Productos.PrdCod = Presentaciones.PresProdId


// -> esto no se si es necesario, creo que NO, ya que la consulta pasa por fuera del select normal que consulta la tabla sysJoin
INSERT INTO `sysJoin` (`QryCodigo`, `ModNombre`, `QryJoin`, `QryJoinAlias`, `QryJoinTipo`, `QryJoinExpr`, `QryJoinUso`, `RelModulo`) VALUES 
(30, 'Productos', 'Presentaciones', '', 'L', 'Productos.PrdCod=Presentaciones.PresProdId', 'I', '');



INSERT INTO `sysCambios` (`CpoCodigo`, `ModNombre`, `CpoNombre`, `CpoEtiqueta`, `CpoTipo`, `CpoOpciones`, `CpoMaesEscl`, `CpoDependencias`, `CpoJScript`, `CpoJScriptDin`, `CpoAgregado`, `CpoOrdenPpal`, `CpoOrdenSec`, `CpoMinimo`, `CpoMaximo`, `CpoAnchoTot`, `CpoAnchoVis`, `CpoAlto`, `CpoToolTip`, `CpoRequerido`) VALUES 
(90, 'Productos', 'PresProdId', 'Presentaciones', 'TR', 'SELECT Presentaciones.PresCod, PresDescr, PresPrecio FROM Presentaciones WHERE PresProdId=##Codigo## ORDER BY PresDescr', 'Presentaciones', 'SELECT Presentaciones.PresCod, PresDescr, PresPrecio FROM Presentaciones WHERE PresProdId=##Codigo## ORDER BY PresDescr', '', '', '', 99, 0, 0, 0, 60, 60, 10, '', 'N');


/* desglose //////
(
CpoCodigo 	= 90, 
ModNombre 	= 'Productos', (Modulo que manejara la tabla de relación [todos los registros que se creen apuntarán al registro de ESTE modulo])
CpoNombre 	= 'PresProdId', (el campo que HACE LA RELACION entre ambas tablas)
CpoEtiqueta 	= 'Presentaciones', 
CpoTipo		= 'TR', 
CpoOpciones	= 'SELECT Presentaciones.PresCod, PresDescr, PresPrecio FROM Presentaciones WHERE PresProdId=##Codigo## ORDER BY PresDescr', (se consulta a la tabla relacionada por todos los campos a editar que tenga grabados para mostrarlos en el InfMgr.php)
CpoMaesEscl	= 'Presentaciones', (la tabla relacionada)
CpoDependencias	= 'SELECT Presentaciones.PresCod, PresDescr, PresPrecio FROM Presentaciones WHERE PresProdId=##Codigo## ORDER BY PresDescr', (?)
CpoJScript	= '', 
CpoJScriptDin	= '', 
CpoAgregado	= '', 
CpoOrdenPpal	= 99, 
CpoOrdenSec	= 0, 
CpoMinimo	= 0, 
CpoMaximo	= 0, 
CpoAnchoTot	= 60, 
CpoAnchoVis	= 60, 
CpoAlto		= 10, 
CpoToolTip	= '', 
CpoRequerido	= 'N', 
);
////// */