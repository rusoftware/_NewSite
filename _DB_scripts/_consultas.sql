CREATE TABLE IF NOT EXISTS `Contacto` (
  `ConCodigo` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `ConArea` varchar(100) NOT NULL DEFAULT '',
  `ConNombre` varchar(100) NOT NULL DEFAULT '',
  `ConEmpresa` varchar(200) NOT NULL DEFAULT '',
  `ConEmail` varchar(100) NOT NULL DEFAULT '',
  `ConTelefono` varchar(100) NOT NULL DEFAULT '',
  `ConHorario` varchar(200) NOT NULL DEFAULT '',
  `ConDireccion` varchar(255) NOT NULL,
  `ConCiudad` varchar(255) NOT NULL,
  `ConCP` varchar(20) NOT NULL,
  `ConProvincia` varchar(255) NOT NULL,
  `ConPais` varchar(255) NOT NULL,
  `ConMensaje` text NOT NULL,
  `ConFecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ConEstado` varchar(120) NOT NULL,
  `ConAtendido` varchar(120) NOT NULL,
  `ConComentario` text NOT NULL,
  PRIMARY KEY (`ConCodigo`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=0 ;


INSERT INTO `sysCambios` (`CpoCodigo`, `ModNombre`, `CpoNombre`, `CpoEtiqueta`, `CpoTipo`, `CpoOpciones`, `CpoMaesEscl`, `CpoDependencias`, `CpoJScript`, `CpoJScriptDin`, `CpoAgregado`, `CpoOrdenPpal`, `CpoOrdenSec`, `CpoMinimo`, `CpoMaximo`, `CpoAnchoTot`, `CpoAnchoVis`, `CpoAlto`, `CpoToolTip`, `CpoRequerido`) VALUES 
(200, 'Contacto', 'ConCodigo', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, '', 'S'),
(201, 'Contacto', 'ConArea', 'Area', 'T', '', '', '', '', '', '', 10, 0, 0, 0, 100, 60, 0, '', 'S'),
(202, 'Contacto', 'ConNombre', 'Nombre y Apellido', 'T', '', '', '', '', '', '', 15, 0, 0, 0, 100, 60, 0, '', 'S'),
(203, 'Contacto', 'ConEmpresa', 'Empresa', 'T', '', '', '', '', '', '', 20, 0, 0, 0, 100, 60, 0, '', 'S'),
(204, 'Contacto', 'ConMensaje', 'Mensaje', 'M', '', '', '', '', '', '', 25, 0, 0, 0, 0, 45, 3, '', 'N'),
(205, 'Contacto', 'ConFecha', 'Fecha', 'F', '', '', '', '', '', '', 30, 0, 0, 0, 0, 0, 0, '', 'N'),
(206, 'Contacto', 'ConEmail', 'Email', 'T', '', '', '', '', '', '', 35, 0, 0, 0, 100, 60, 0, '', 'S'),
(207, 'Contacto', 'ConTelefono', 'Teléfono', 'T', '', '', '', '', '', '', 40, 0, 0, 0, 100, 60, 0, '', 'N'),
(208, 'Contacto', 'ConHorario', 'Horario preferido', 'T', '', '', '', '', '', '', 50, 0, 0, 0, 100, 60, 0, '', 'N'),
(209, 'Contacto', 'ConEstado', 'Estado', 'RH', 'Espera respuesta:::Espera respuesta\r\nSe respondió:::Se respondió', '', '', '', '', '', 70, 0, 0, 0, 100, 60, 0, '', 'N'),
(210, 'Contacto', 'ConAtendido', 'Respondido por:', 'T', '', '', '', '', '', '', 75, 0, 0, 0, 120, 60, 0, '', 'N'),
(211, 'Contacto', 'ConComentario', 'Comentario interno', 'M', '', '', '', '', '', '', 80, 0, 0, 0, 0, 45, 3, '', 'N'),
(212, 'Contacto', 'ConDireccion', 'Dirección', 'T', '', '', '', '', '', '', 85, 0, 0, 0, 255, 60, 0, '', 'N'),
(213, 'Contacto', 'ConCiudad', 'Ciudad', 'T', '', '', '', '', '', '', 86, 0, 0, 0, 100, 60, 0, '', 'N'),
(214, 'Contacto', 'ConCP', 'C.P.', 'T', '', '', '', '', '', '', 87, 0, 0, 0, 100, 60, 0, '', 'N'),
(215, 'Contacto', 'ConProvincia', 'Provincia', 'T', '', '', '', '', '', '', 88, 0, 0, 0, 100, 60, 0, '', 'N'),
(216, 'Contacto', 'ConPais', 'País', 'T', '', '', '', '', '', '', 89, 0, 0, 0, 100, 60, 0, '', 'N');

-- --------------------------------------------------------

INSERT INTO `sysFrom` (`QryCodigo`, `ModNombre`, `QryFrom`, `QryFromAlias`) VALUES 
(200, 'Contacto', 'Contacto', '');


INSERT INTO `sysInfo` (`QryCodigo`, `ModNombre`, `QryCampo`, `QryCampoAlias`, `QryCampoNombre`, `QryCampoImagen`, `QryAlineacion`, `QryPosicion`, `QryOrden`, `QryOrdenExpr`, `QryFiltro`, `QryFiltroExpr`) VALUES 
(200, 'Contacto', 'ConCodigo', '', '', '', '', 0, '', '', '', ''),
(201, 'Contacto', 'ConNombre', '', 'Nombre y Apellido', 'N', 'I', 10, 'S', '', 'S', ''),
(202, 'Contacto', 'IF(ConFecha,DATE_FORMAT(ConFecha,''%d-%m-%Y''),'''')', 'ccFechaD', 'Fecha', 'N', 'I', 20, 'D', 'ConFecha', 'S', ''),
(203, 'Contacto', 'ConEmail', '', 'Email', 'N', 'I', 30, 'S', '', 'S', ''),
(204, 'Contacto', 'ConTelefono', '', 'Teléfono', 'N', 'I', 40, 'S', '', 'S', ''),
(205, 'Contacto', 'ConHorario', '', 'Horario preferido', 'N', 'I', 50, 'S', '', 'S', ''),
(206, 'Contacto', 'ConEstado', '', 'Estado', 'N', 'I', 70, 'S', '', 'S', ''),
(207, 'Contacto', 'ConAtendido', '', 'Respondido por:', 'N', 'I', 75, 'S', '', 'S', ''),
(208, 'Contacto', 'CONCAT(ConDireccion,'' - '',ConCiudad,'' - '',ConProvincia)', '', 'Dirección', 'N', 'I', 51, 'S', '', 'S', '');



INSERT INTO `sysModulos` (`ModCodigo`, `ModOrden`, `ModNombre`, `ModTexto`, `ModTipo`, `ModLink`, `ModInfoAdic`, `ModInfoRela`, `ModPerDuplicar`) VALUES 
(200, 80, 'Contacto', 'Contacto', 'N', '', 'S', 'N', 'S');


INSERT INTO `sysModUsu` (`ModNombre`, `UsuAlias`, `PerVer`, `PerEditar`, `PerAgregar`, `PerBorrar`, `PerAcciones`, `PerExportar`, `VerCntLineas`) VALUES 
('Contacto', 'cmirtuono', 'S', 'S', 'S', 'S', 'S', 'S', 50),
('Contacto', 'federico', 'S', 'S', 'S', 'S', 'S', 'S', 50);