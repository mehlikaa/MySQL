-- ======= SELECT -WHERE =========
use sys;
CREATE TABLE ogrenciler(
id int,
isim varchar(45),
adres varchar(100),
sinav_notu int 
);


insert into ogrenciler values(123,'Ali Can','Ankara',72);
insert into ogrenciler values(124,'Merve Gul','Istanbul',95);
insert into ogrenciler values(125,'Yasar Kemal','Ankara',88);

/*============================================================================
   Verileri SELECT komutu ile veritabanından çekerken filtreleme yapmak için
   Syntax
   --------
    SELECT ile birlikte WHERE komutu kullanılabilir.
    SELECT sutün1, sutün2
        ...
    FROM  tablo_adı WHERE koşul;
================================*/
/*============================================================================
   Verileri SELECT komutu ile veritabanından çekerken filtreleme yapmak için
   Syntax
   --------
    SELECT ile birlikte WHERE komutu kullanılabilir.
    SELECT sutün1, sutün2
        ...
    FROM  tablo_adı WHERE koşul;
==============================================================================*/
select * from ogrenciler
where sinav_notu>80;

/* === ORNEK2: Adresi Ankara olan öğrencilerin isim ve adres bilgilerini listele 
=====*/

select isim, adres from ogrenciler where adres='Ankara';
select isim, adres from ogrenciler where adres='ankara';

/* === 
ORNEK3: id’si 124 olan öğrencilerin tüm bilgilerini ( (( * )) ) listele
=====*/
select * from ogrenciler where id=124;
/* === 
SELECT BETWEEN
=====*/
    
    -- NOT: Between 2 mantiksal ifade ile tanimlayabilecegimiz durumlari tek komutla yazabilme imkani verir.
    -- yazdiginiz iki sinir da, araliga dahildir.
    
        CREATE TABLE personel
    (   
        id CHAR(5),
        isim VARCHAR(50),
        maas int
    );
​
    INSERT INTO personel VALUES('10001', 'Ahmet Aslan', 7000);
    INSERT INTO personel VALUES( '10002', 'Mehmet Yılmaz' ,12000);
    INSERT INTO personel VALUES('10003', 'Meryem', 7215);
    INSERT INTO personel VALUES('10004', 'Veli Han', 5000);
    INSERT INTO personel VALUES('10005', 'Mustafa Ali', 5500);
    INSERT INTO personel VALUES('10005', 'Ayşe Can', 4000);
     INSERT INTO personel VALUES('10006', 'Cenyu Cenanya', 4500);
    
    /* 
    ORNEK4: id’si 10002 ile 10005 arasında olan personelin bilgilerini listele
    */
    -- yol 1
    select * from personel where id between '10002' and '10005';
    -- yol 2
    select * from personel where id>='10002' and id<='1005';
    
    /* -- 
    ORNEK5: ismi Mehmet Yılmaz ile Veli Han arasındaki olan personel bilgilerini 
  listeleyiniz. personelin bilgilerini listele
  */
  select * from personel where isim between 'Mehmet Yilmaz' and 'Veli';
  
  /* ======================= SELECT - IN ======================================
    IN birden fazla mantıksal ifade ile tanımlayabileceğimiz durumları 
    tek komutla yazabilme imkânı verir
    SYNTAX:
    -------
    SELECT sutun1,sutun2, ...
    FROM tablo_adı
    WHERE sutun_adı IN (deger1, deger2, ...);
/* ========================================================================== */
    
/* -----------------------------------------------------------------------------
  ORNEK7: id’si 10001,10002 ve 10004 olan personelin bilgilerini listele
 -----------------------------------------------------------------------------*/   
    -- yol 1
    select * from personel where id ='10001' or id='10002' or id='10004';
    -- yol 2
    select * from personel where id in (10001,10002,10004);
    
    /* --------------------------
  ORNEK8: Maaşı sadece 7000  veya 12000 olan personelin bilgilerini listele
	   ----------------------------------*/  
       select * from personel where maas in (7000,12000);
       
       select * from personel where maas=7000 and isim='Meryem';
       
       -- yanlis yazim
       -- select * from personel where maas in(7000, 'Meryem');
       
       /* ======================= SELECT - LIKE ======================================
    NOT:LIKE anahtar kelimesi, sorgulama yaparken belirli patternleri 
    kullanabilmemize olanak sağlar.
    SYNTAX:
    -------
    SELECT sutün1, sutün2,…
    FROM  tablo_adı WHERE sütunN LIKE pattern
    
    PATTERN İÇİN
    -------------
    %    ---> 0 veya daha fazla karakteri belirtir. 
    _    ---> Tek bir karakteri temsil eder.
        
/* ========================================================================== */
-- Ornek 9:Ismi A harfi ile baslayanlari listeleyiniz.
select * from personel where isim like 'a%';

/* -----------------------------------------------------------------------------
  ORNEK10:  ismi n harfi ile bitenleri listeleyiniz
 -----------------------------------------------------------------------------*/
select * from personel where isim like '%n'; 


/*--------------------------
  ORNEK11:  isminin 2. harfi e olanları listeleyiniz
 -----------------------------------------------------------------------------*/
 select * from personel where isim like '_e%';
 
 /* -----------------------------------------------------------------------------
  ORNEK12:  isminin 2. harfi e olup diğer harflerinde y olanları listeleyiniz
 -----------------------------------------------------------------------------*/
 select * from personel where isim like '_e%y%';
 
 /* -----------------------------------------------------------------------------
  ORNEK15:  isminde a harfi olmayanları listeleyiniz
 -----------------------------------------------------------------------------*/
 select * from personel where isim not like '%a%';
 /*-----------------------------------------------------------------------------
  ORNEK16:  maaşının son 2 hanesi 00 olmayanları listeleyiniz
 -----------------------------------------------------------------------------*/  
    SELECT * FROM personel
    WHERE maas NOT LIKE '%00';
    
/* -----------------------------------------------------------------------------
  ORNEK17:  maaşının 4000 olmayanları listeleyiniz
 -----------------------------------------------------------------------------*/  
    SELECT * FROM personel
    WHERE maas NOT LIKE 4000;
 /* -----------------------------------------------------------------------------
  ORNEK18: maaşı 5 haneli olanları listeleyiniz
 -----------------------------------------------------------------------------*/ 
 select * from personel where maas like '_____';
 
 /*--------------------------
  ORNEK20: 1. harfi A ve 7.harfi A olan perspneli listeleyiniz.
 -----------------------------------------------------------------------------*/
 
 select * from personel where isim like 'a_____a%';
 
 -- friday
 /*====================== SELECT - REGEXP_LIKE ================================
    Daha karmaşık pattern ile sorgulama işlemi için REGEXP_LIKE kullanılabilir.  
     -- 'c' => case-sentisitive demektir 
     -- 'i' => incase-sentisitive demektir ve default incase-sensitive aktiftir..
    Syntax:
    --------
    REGEXP_LIKE(sutun_adı, ‘pattern[] ‘, ‘c’ ] ) 
            
/* ========================================================================== */
    
    CREATE TABLE kelimeler
    (
        id int UNIQUE,
        kelime VARCHAR(50) NOT NULL,
        harf_sayisi int
    );
    
    INSERT INTO kelimeler VALUES (1001, 'hot', 3);
    INSERT INTO kelimeler VALUES (1002, 'hat', 3);
    INSERT INTO kelimeler VALUES (1003, 'hit', 3);
    INSERT INTO kelimeler VALUES (1004, 'hbt', 3);
    INSERT INTO kelimeler VALUES (1005, 'hait', 3);
    INSERT INTO kelimeler VALUES (1006, 'adem', 4);
    INSERT INTO kelimeler VALUES (1007, 'selim', 5);
    INSERT INTO kelimeler VALUES (1008, 'yusuf', 5);
    INSERT INTO kelimeler VALUES (1009, 'hip', 3);
    INSERT INTO kelimeler VALUES (1010, 'H2T', 3);
    INSERT INTO kelimeler VALUES (1011, 'h4t', 3);
    INSERT INTO kelimeler VALUES (1012, 'ho9ot', 6);
    INSERT INTO kelimeler VALUES (1013, 'hoot', 4);
    INSERT INTO kelimeler VALUES (1014, 'haaat', 5);
    INSERT INTO kelimeler VALUES (1015, 'hooott', 6);
    INSERT INTO kelimeler VALUES (1016, 'hooooot', 7);
      INSERT INTO kelimeler VALUES (1017, 'hofootoyot', 7);
    DROP TABLE kelimeler;
    
    ​select * from kelimeler ;
    
    
/* -----------------------------------------------------------------------------
  ORNEK22: İçerisinde 'ot' veya 'at' bulunan kelimeleri küçük harfe dikkat
  ederek listeleyiniz 
 -----------------------------------------------------------------------------*/ 
    -- VEYA işlemi için | karakteri kullanılır.
    select * from kelimeler  where regexp_like(kelime, 'at|ot','c');
   
/* -----------------------------------------------------------------------------
  ORNEK23: İçerisinde 'ot' veya 'at' bulunan kelimeleri büyük-küçük harfe dikkat
  etmeksizin listeleyeniz
 -----------------------------------------------------------------------------*/ 
    select * from kelimeler  where regexp_like(kelime, 'at|ot');
   
   
 /* -----------------------------------------------------------------------------
  ORNEK24: 'ho' veya 'hi' ile başlayan kelimeleri büyük-küçük harfe dikkat
  etmeksizin listeleyeniz
 -----------------------------------------------------------------------------*/   
     -- Başlangıcı göstermek için ^ karakteri kullanılır.
    
    select * from kelimeler  where regexp_like(kelime, '^ho|^hi');
    
/* -----------------------------------------------------------------------------
  ORNEK25: Sonu 't' veya 'm' ile bitenleri büyük-küçük harfe dikkat
  etmeksizin listeleyeniz. (i yazmaya gerek yok)
 -----------------------------------------------------------------------------*/   
     --  Bitişi göstermek için $ karakteri kullanılır.
     
/* -----------------------------------------------------------------------------
  ORNEK26: h ile başlayıp t ile biten 3 harfli kelimeleri (h ile t küçük harfli 
  olanlari) listeleyeniz
 -----------------------------------------------------------------------------*/ 
     select  * from kelimeler  where regexp_like(kelime,'h[a-zA-Z0-9]t','c');
      select  * from kelimeler  where regexp_like(kelime,'h[a-zA-Z]t','c');
/* -----------------------------------------------------------------------------
  ORNEK27: İlk harfi h, son harfi t olup 2.harfi a veya i olan 3 harfli 
  kelimelerin tüm bilgilerini sorgulayalım.
 -----------------------------------------------------------------------------*/ 
   
   select * from kelimeler where regexp_like(kelime, 'h[ai]t');
   
/* -----------------------------------------------------------------------------
  ORNEK28: İçinde m veya i veya e olan kelimelerin tüm bilgilerini listeleyiniz.
 -----------------------------------------------------------------------------*/     
   select * from kelimeler where regexp_like(kelime, '[mei]');
   select * from kelimeler where regexp_like(kelime, 'm|e|i');
 
/* -----------------------------------------------------------------------------
  ORNEK29: a veya s ile başlayan kelimelerin tüm bilgilerini listeleyiniz.
-----------------------------------------------------------------------------*/ 
 select * from kelimeler where regexp_like(kelime, '^[as]');
  select * from kelimeler where regexp_like(kelime, '[^a^s]'); -- calismadi
  select * from kelimeler where regexp_like(kelime, '^a|^s');
/* -----------------------------------------------------------------------------
  ORNEK30: içerisinde en az 2 adet oo barıdıran kelimelerin tüm bilgilerini 
  listeleyiniz. [o][o] iki o icin gecerli 
-----------------------------------------------------------------------------*/ 
select * from kelimeler where regexp_like(kelime, '[o]');
select * from kelimeler where regexp_like(kelime, 'o');
select * from kelimeler where regexp_like(kelime, 'oo');


