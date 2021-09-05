
use parcial1;
insert into Escenario values (1, "miel de oveja");
insert into Escenario values (2, "aceite de ballena");
insert into Escenario values (3, "pisicina");

-- /persona/

insert into Persona values (3,"Sebastian Romero","M", "1994/12/31", null, null, "preso");
insert into Persona values (4,"Maria Mata","F", "1995/11/31", null, null, "preso");
insert into Persona values (5,"Johan Cañon","M", "1996/10/31", null, null, "preso");
insert into Persona values (6,"Pepito Perez","M", "1997/09/31", null, null, "preso");
insert into Persona values (7,"Camila Romero","F", "1998/08/31", null, null, "preso");
insert into Persona values (8,"Maria Perez","F", "1999/07/31", null, null, "preso");
insert into Persona values (9,"Pedro Lopez","M", "1991/06/31", null, null, "preso");
insert into Persona values (10,"Hellen Bautista","F", "1992/05/31", null, null, "preso");
insert into Persona values (11,"Benito Suavidad","M", "1993/04/31", null, null, "preso");
insert into Persona values (12,"Eilen Serna","F", "1990/03/31", null, null, "preso");

-- /Delito/

insert into Delito values (11,"Asesinato");
insert into Delito values (12,"Masacre");
insert into Delito values (13,"Violacion");
insert into Delito values (14,"Secuestro");
insert into Delito values (15,"Robo");

-- /Alias/

insert into Alias values (21,"El papas");
insert into Alias values (22,"Maria Dolores");
insert into Alias values (23,"El papi");
insert into Alias values (24,"El cacas");
insert into Alias values (25,"Tokio");

-- /Comodidad/

insert into Comodidad values (31, "Sauna");
insert into Comodidad values (32, "Jacuzzi");
insert into Comodidad values (33, "Cama doble");
insert into Comodidad values (34, "Cama de agua");

-- /Celda/

insert into Celda values (41,"10x9x8","M",4);
insert into Celda values (42,"9x8x7","F",6);
insert into Celda values (43,"8x7x6","M",8);
insert into Celda values (44,"7x6x5","F",10);
insert into Celda values (45,"6x5x4","M",12);


-- /Condena/



insert into Condena values (71,"2020/10/12", 20,"2020/12/12","2040/12/12", 41,4);
insert into Condena values (99,"2020/10/12", 20,"2020/12/12","2040/12/12",42,4 );
insert into pelea values (1,"M","banano" , "jabon rey",null,11,5,1);
insert into pelea values (2,"M","chancla", "colada maizena",null,9,5,2);
-- /Pelea/

insert into apuesta values (1,253500,2,11,12);
