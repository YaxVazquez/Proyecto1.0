drop procedure if exists addSolicitud;
delimiter //
 create procedure addSolicitud(IdSol int(3), IdUs int(3), IdPerr int(3), Cas varchar(10), MayorE varchar(2),
 Exper varchar(2),OtrasMas varchar(2), Fin varchar(30),FamiliaIn varchar(2),
 Respo varchar(30),Tiem varchar(2), Luga varchar(30), PorQ varchar(30), Visit varchar(2), Donat varchar(2))
 begin 
	declare xIdSol int;
    declare xMsj nvarchar(50);
    declare existe int;
    
    if (idSol	 = 0) then
		set existe = (select count(*) from SolicitudAdopcion where idSolicitud = idSol);
        if (existe = 0) then
			set xIdSol = (select ifnull(max(IdSolicitud),0) + 1 from SolicitudAdopcion);
            
            insert into SolicitudAdopcion (IdSolicitud, idUsuario,idPerro,Casa,MayorEdad,Experiencia,   
						OtrasMascotas,Finalidad,FamiliaInformada,Responsable,Tiempo,Lugar,PorQue,Visitas,Donativo) 
				   values(xIdSol,IdUs, IdPerr, Cas, MayorE, Exper,OtrasMas, Fin,FamiliaIn, Respo,
                         Tiem, Luga, PorQ, Visit, Donat );
            set xMsj ="Registro exitoso";
		else 
			set xMsj = "Usuario ya registrado";
			set xIdSol = 0;
		end if;
    		
    end if;
    select xIdSol as IdSolicitud, xMsj;
 end;//