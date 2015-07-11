-
-- Modulo cambio contraseña
-    en el servidor debe estar subido CambioPass.php 


INSERT INTO `sysModulos` (`ModCodigo`, `ModOrden`, `ModNombre`, `ModTexto`, `ModTipo`, `ModLink`, `ModInfoAdic`, `ModInfoRela`, `ModPerDuplicar`) VALUES 
(999, 99, 'CambioPass', 'Contraseña', 'E', 'CambioPass.php', '', '', '');

INSERT INTO `sysModUsu` (`ModNombre`, `UsuAlias`, `PerVer`, `PerEditar`, `PerAgregar`, `PerBorrar`, `PerAcciones`, `PerExportar`, `VerCntLineas`) VALUES 
('CambioPass', 'federico', 'S', 'S', 'S', 'S', '', 'S', 1),
('CambioPass', 'cmirtuono', 'S', 'S', 'S', 'S', '', 'S', 1);