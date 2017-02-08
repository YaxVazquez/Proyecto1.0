drop trigger if exists agrega_foto_AU_Trigger;
DELIMITER // 
create TRIGGER agrega_foto_AU_Trigger
AFTER Insert ON Perro FOR EACH ROW 
BEGIN 

declare id int;
set id= (select ifnull(max(idFoto),0) + 1  FROM Fotos );

insert into Fotos values(id,id,'Yax2.jpg');

END// 

DELIMITER ; 