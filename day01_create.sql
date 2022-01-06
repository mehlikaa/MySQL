drop table student;
use sys;

CREATE TABLE mystudent 
(   
    id VARCHAR(4)  ,
    name VARCHAR(20),
    age int
);

/* ========================================================= 
                     VERİ GİRİSİ 
===========================================================*/
INSERT INTO mystudent VALUES( null,'MEHMET ALİ', 25);
INSERT INTO mystudent VALUES('1002', 'AYSE YILMAZ', 34);
INSERT INTO mystudent VALUES('1003', 'JOHN STAR', 56);
INSERT INTO mystudent VALUES('1004', 'MARY BROWN', 17);

select * from mystudent;

/* ========================================================= 
                     PARCALI VERİ GİRİSİ 
===========================================================*/
insert into mystudent(name,age) values ('Samet Ay', 24 );
/* ========================================================= 
                     Tablodan VERİ sorgulama
===========================================================*/
select * from mystudent;

/* ========================================================= 
                   TABLO SiLME  (CRUD - Drop )
===========================================================*/
drop table mystudent;

