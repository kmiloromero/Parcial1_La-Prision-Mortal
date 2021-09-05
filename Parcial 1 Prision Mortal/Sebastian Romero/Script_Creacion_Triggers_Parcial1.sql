USE `parcial1` ;

DELIMITER $$
create trigger trigger_genero AFTER INSERT ON condena for each row
BEGIN
	    
    DECLARE genero varchar(200);
    DECLARE genero2 varchar(200);
    
    SET genero= (SELECT  generoCelda   FROM Celda WHERE idCelda = NEW.id_Celda);
    SET genero2= (SELECT  sexo   FROM Persona WHERE idPersona = NEW.id_Persona);    
   
		IF genero != genero2 THEN 
		 DELETE FROM Condena where idCondena = new.idCondena;
        END IF ;      
END $$
DELIMITER ;

DELIMITER $$
create trigger trigger_pelea AFTER INSERT ON Pelea for each row
BEGIN  
   
		CALL validarPeleador(@resultado,NEW.id_Peleador1, NEW.id_Peleador2 ,NEW.idPelea);   
        IF @resultado > 0 THEN 
			DELETE FROM Pelea WHERE idPelea = NEW.idPelea;
        ELSE 
			CALL validarPeleador1(@resultadoP1,NEW.id_Peleador1, NEW.idPelea );
			CALL validarPeleador2(@resultadoP2,NEW.id_Peleador2, NEW.idPelea );
			IF @resultadoP1 != 'preso'  OR @resultadoP2 !='preso' THEN 
				DELETE FROM Pelea WHERE idPelea = NEW.idPelea;
                ELSE
					CALL validarGeneroPeleador1(@resultadoGP1,NEW.id_Peleador1, NEW.idPelea );
					CALL validarGeneroPeleador2(@resultadoGP2,NEW.id_Peleador2, NEW.idPelea );
                    IF @resultadoGP1 !=  @resultadoGP2  THEN
						DELETE FROM Pelea WHERE idPelea = NEW.idPelea;
                    END IF;
            END IF;
        END IF;
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER trigger_Ganador before insert on pelea for each row
BEGIN
    if new.id_Peleador1 = 1 or 2 or 3 or 9 then
    set new.ganador = new.id_Peleador1;
    else
    set new.ganador = new.id_Peleador2;
    end if;
END $$
Delimiter ;

DELIMITER $$
create procedure idGanador (OUT ganador int(11), IN id_Peleador1 int (11), IN id_Peleador2 int (11))
if (substring(id_Peleador1, 1,1) = 1 OR 2 OR 3 OR 9) THEN
    SET ganador = id_Peleador1;
else 
    SET ganador = id_Peleador2;
end if $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER trigger_Ganador before insert on pelea for each row
BEGIN
CALL idGanador (@ganador, new.id_Peleador1, new.id_Peleador2);
SET new.ganador = @ganador ;
END $$
Delimiter ;

DELIMITER $$
create procedure idapostador (OUT apuesta_valida varchar(2), IN id_Apostador1 int (11), IN id_Apostador2 int (11))
if(new.id_Apostador1 != new.id_apostador2) then
		insert into apuesta values(new.idApuesta,new.valorApuesta,new.id_Pelea,new.id_Apostador1,new.id_Apostador2);
    end if;$$
DELIMITER ; 

DELIMITER $$
create trigger trigger_apuesta before insert on apuesta for each row
begin
	call idapostador(@apuesta_valida , new.id_Apostador1, new.id_Apostador2);
end$$
delimiter $$



