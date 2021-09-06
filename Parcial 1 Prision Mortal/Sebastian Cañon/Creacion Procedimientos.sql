use mydb;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `idGanador`(OUT ganador int(11), IN id_Peleador1 int (11), IN id_Peleador2 int (11))
if (substring(id_Peleador1, 1,1) = 1 OR 2 OR 3 OR 9) THEN
    SET ganador = id_Peleador1;
else 
    SET ganador = id_Peleador2;
end if$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `idapostador`(OUT apuesta_valida varchar(2), IN id_Apostador1 int (11), IN id_Apostador2 int (11))
if(new.id_Apostador1 != new.id_apostador2) then
		insert into apuesta values(new.idApuesta,new.valorApuesta,new.id_Pelea,new.id_Apostador1,new.id_Apostador2);
    end if$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `validarGeneroPeleador1`(OUT `resultadoGP1` VARCHAR(30), IN `peleador1` INT(11), IN `pelea` INT(11))
SELECT sexo INTO resultadoGP1 FROM Persona WHERE idPersona = peleador1$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `validarGeneroPeleador2`(OUT `resultadoGP2` VARCHAR(30), IN `peleador2` INT(11), IN `pelea` INT(11))
SELECT sexo INTO resultadoGP2 FROM Persona WHERE idPersona = peleador2$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `validarPeleador`(OUT `resultado` INT(1), IN `peleador1` INT(11), IN `peleador2` INT(11), IN `pelea` INT(11))
SELECT idPelea INTO resultado FROM Pelea WHERE peleador1 = peleador2 AND idPelea = pelea$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `validarPeleador1`(OUT `resultadoP1` VARCHAR(30), IN `peleador1` INT(11), IN `pelea` INT(11))
SELECT tipoPersona INTO resultadoP1 FROM Persona WHERE idPersona = peleador1$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `validarPeleador2`(OUT `resultadoP2` VARCHAR(30), IN `peleador2` INT(11), IN `pelea` INT(11))
SELECT tipoPersona INTO resultadoP2 FROM Persona WHERE idPersona = peleador2$$
DELIMITER ;