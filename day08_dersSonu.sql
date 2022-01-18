use sys;
CREATE TABLE bolumler (
      bolum_id   int PRIMARY KEY,
      bolum_isim VARCHAR(14),
      konum      VARCHAR(13)
    );
    
    INSERT INTO bolumler VALUES (10,'MUHASEBE','IST');
    INSERT INTO bolumler VALUES (20,'MUDURLUK','ANKARA');
    INSERT INTO bolumler VALUES (30,'SATIS','IZMIR');
    INSERT INTO bolumler VALUES (40,'ISLETME','BURSA');
    INSERT INTO bolumler VALUES (50,'DEPO', 'YOZGAT');

    CREATE TABLE personel (
      personel_id   int PRIMARY KEY,
      personel_isim VARCHAR(10),
      meslek        VARCHAR(9),
      mudur_id      int,
      maas          int,
      bolum_id      int
    );
    
   SELECT * FROM personel;
  
    INSERT INTO personel VALUES (7369,'AHMET','KATIP',1111,800,20);
    INSERT INTO personel VALUES (7499,'BAHATTIN','SATISE',1222,1600,30);
    INSERT INTO personel VALUES (7521,'NESE','SATISE',1222,1250,30);
    INSERT INTO personel VALUES (1111,'MUZAFFER','MUDUR',7839,2975,20);
    INSERT INTO personel VALUES (7654,'MUHAMMET','SATISE',1222,1250,30);
    INSERT INTO personel VALUES (1222,'EMINE','MUDUR',7839,2850,30);
    INSERT INTO personel VALUES (1333,'HARUN','MUDUR',7839, 2450,10);
    INSERT INTO personel VALUES (7788,'MESUT','ANALIST',1111,3000,20);
    INSERT INTO personel VALUES (7839,'SEHER','BASKAN',NULL,5000,10);
    INSERT INTO personel VALUES (7844,'DUYGU','SATISE',1222,1500,30);
    INSERT INTO personel VALUES (7876,'ALI','KATIP',1111,1100,20);
    INSERT INTO personel VALUES (7900,'MERVE','KATIP',1222,950,30);
    INSERT INTO personel VALUES (7902,'NAZLI','ANALIST',1111,3000,20);
    INSERT INTO personel VALUES (7934,'EBRU','KATIP',1333,1300,10);
    INSERT INTO personel VALUES (7956,'SIBEL','MIMAR',1333,3300,60);
    INSERT INTO personel VALUES (7933,'ZEKI','MUHENDIS',1333,4300,60);
select * from bolumler;
select * from personel;
/* -----------------------------------------------------------------------------
  ORNEK1: SATIS ve MUHASEBE bolumlerinde calisan personelin isimlerini ve 
  bolumlerini, once bolum sonra isim sıralı olarak listeleyiniz
------------------------------------------------------------------------------*/ 
select p.personel_isim ,b.bolum_isim 
from bolumler b
join personel p 
on p.bolum_id=b.bolum_id
where bolum_isim in('SATIS','MUHASEBE')
order by b.bolum_isim, p.personel_isim;

-- bağlama işi join lerde on keyword ü ile yapilir

/* -----------------------------------------------------------------------------
  ORNEK2: SATIS,ISLETME ve DEPO bolumlerinde calisan personelin isimlerini,  
  bolumlerini  isim sıralı olarak listeleyiniz. 
  NOT: calisani olmasa bile bolum ismi gosterilmelidir.
------------------------------------------------------------------------------*/  
select p.personel_isim, b.bolum_isim
from bolumler b 
left join personel p 
on p.bolum_id=b.bolum_id
where b.bolum_id in (30,40,50)    -- ('SATIS','ISLETME', 'DEPO')bolum_ismi    -- (30,40,50) bolum_id
order by b.bolum_isim;

/* -----------------------------------------------------------------------------
  ORNEK3: Tüm bolumlerde calisan personelin isimlerini, bolum isimlerini ve 
  maaslarini bolum ters ve maas sirali listeleyiniz. 
  NOT: calisani olmasa bile bolum ismi gosterilmelidir.
------------------------------------------------------------------------------*/  
select p.personel_isim, b.bolum_isim, p.maas
from bolumler b left join personel p
on p.bolum_id=b.bolum_id
order by b.bolum_isim desc, p.maas;

/* -----------------------------------------------------------------------------
  ORNEK4: SATIS ve MUDURLUK bolumlerinde calisan personelin maaslari 2000'den 
  buyuk olanlarinin isim,bolum ve maas bilgilerini bolume ve isme gore
  siralayarak listeleyiniz.
------------------------------------------------------------------*/
select p.personel_isim, b.bolum_isim, p.maas
from bolumler b join personel p
on p.bolum_id=b.bolum_id
where b.bolum_isim in('satis','mudurluk') and p.maas>2000
order by b.bolum_isim,p.personel_isim;
             
/* -----------------------------------------------------------------------------
  ORNEK5: MUDUR'u Harun veya Emine olan personelin bolumlerini,isimlerini,  
  maaslarini ve ayrica MUDUR isimlerini  (emine kimin müdürüyse onun satirinda yazsin) 
-----------------------------------------------------*/
	select    b.bolum_isim, p.personel_isim, p.maas, 
                 ( select personel_isim from personel where p.mudur_id=personel_id) 
             from bolumler b right join personel p
             on p.bolum_id=b.bolum_id
             where p.mudur_id in (1222,1333);
             
