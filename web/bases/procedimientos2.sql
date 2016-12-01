drop procedure if exists addDireccion;
delimiter //
 create procedure addDireccion(idUs int(3), idDir int(2), Calle varchar(30), NumI varchar(4),NumE varchar(4), CoP varchar(5), Colo varchar(30), Del varchar(30),Est varchar(30), Tel varchar(15), Des blob)
 begin 
	declare xIdDir int;
    declare xMsj nvarchar(50);
    declare existe int;
    
    if (idDir = 0) then
			set xIdDir = (select ifnull(max(IdDireccion),0) + 1 from DireccionUsuario);
            insert into DireccionUsuario (IdDireccion, Calle, NumInt, NumExt, Cp, Colonia, Delegacion,Estado) values(xIdDir, Calle, NumI, NumE, CoP, Colo, Del, Est);
            update Usuario set IdDireccion=xIdDir, Telefono = Tel, Descripcion = Des where IdUsuario = idUs;
            
            set xMsj ="Registro exitoso";
		end if;
    select xIdDir as IdDireccion, xMsj;
 end;//