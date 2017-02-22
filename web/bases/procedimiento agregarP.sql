drop procedure if exists addPerro;
delimiter //
 create procedure addPerro(IdPerr int(3), Nom varchar(30), Pes float(5), Color varchar(10), Tam varchar(10), Edad varchar(20),Descrip blob, idCen int(2), Sex varchar(20))
 begin 
	declare xIdPerr int;
    declare xMsj nvarchar(50);
    declare existe int;
    
    if (idPerr	 = 0) then
		set existe = (select count(*) from Perro where Nombre = Nom);
        if (existe = 0) then
			set xIdPerr = (select ifnull(max(IdPerro),0) + 1 from Perro);
            
            insert into Perro (IdPerro, Nombre, Peso, Color, Tamano ,Rango_edad ,Descripcion ,IdCentro, Sexo) values(xIdPerr, Nom,  Pes , Color , Tam , Edad ,Descrip , idCen, Sex );
            set xMsj ="Registro exitoso";
		else 
			set xMsj = "Usuario ya registrado";
			set xIdPerr = 0;
		end if;
    else 
		update Perro set contrasenia = Nom, Nombre = Nom where idPerro = idPerr;
        set xMsj = "Datos modificados";
        set xIdPerr = IdPerr;
    end if;
    select xIdPerr as IdPerro, xMsj;
 end;//