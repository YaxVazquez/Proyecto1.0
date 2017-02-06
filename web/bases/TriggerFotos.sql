drop trigger if exists agrega_foto_AU_Trigger;
DELIMITER // 
create TRIGGER agrega_foto_AU_Trigger
AFTER Insert ON Perro FOR EACH ROW 
BEGIN 

declare id int;
set id= (SELECT COUNT(idFoto )  FROM Fotos );

insert into Fotos values(id+1,id+1,'Yax2.jpg');

END// 

DELIMITER ; 