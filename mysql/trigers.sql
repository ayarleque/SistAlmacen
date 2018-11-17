drop trigger trActualizaCant

DELIMITER |

create TRIGGER trActualizaCant after INSERT ON movprod
  FOR EACH ROW BEGIN
  
	if NEW.cantIngr=0 then
        
			update producto_almacen set Cant=Cant-NEW.cantSalida
				where idProducto=NEW.idProducto and idAlmacen=NEW.idAlmacen;
			
            update producto set stock=stock-NEW.cantSalida
				where idProducto=NEW.idProducto;
	else
		update producto_almacen set Cant=Cant+NEW.cantIngr
			where idProducto=NEW.idProducto and idAlmacen=NEW.idAlmacen;
		
        update producto set stock=stock+NEW.cantIngr
				where idProducto=NEW.idProducto;
	end if;
      
  END
|

DELIMITER ;






DELIMITER |

create TRIGGER trIngresaProdAlmac after INSERT ON producto
  FOR EACH ROW BEGIN
  
	declare vueltas int;
    declare cont int;
    
    set vueltas:=(select count(*) from almacen);
    set cont=1;
		
    while  cont<=vueltas do
		insert into producto_almacen(idProducto, idAlmacen, Cant)
			values(NEW.idProducto, cont, 0);
		
        set cont=cont+1;
    end while;
    
  END
|

DELIMITER ;

DELIMITER |

create TRIGGER trIngresaProdAlmacNvo after INSERT ON almacen
  FOR EACH ROW BEGIN
  
	declare vueltas int;
    declare cont int;
    
    set vueltas:=(select count(*) from producto);
    set cont=1;
		
    while  cont<=vueltas do
		insert into producto_almacen(idProducto, idAlmacen, Cant)
			values(cont,NEW.idAlmacen, 0);
		
        set cont=cont+1;
    end while;
    
  END
|

DELIMITER ;

drop trigger trIngresaModificaProd
DELIMITER |

create TRIGGER trIngresaModificaProd after update ON producto
  FOR EACH ROW BEGIN
  
	update producto_almacen set idProducto=NEW.idProducto
		where idProducto=NEW.idProducto+10;
    
  END
|

DELIMITER ;

drop trigger trActualizaCant