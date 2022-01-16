use sys;
/*============================== JOIN İSLEMLERİ ===============================
    
    Set Operatorleri (Union,Union All, {oracle->Intersect,Minus}) farklı tablolardaki sutunlari 
    birlestirmek kullanilir.
    
    Join islemleri ise farklı Tablolari birlestirmek icin kullanilir. Diger 
    bir ifade ile farkli tablolardaki secilen sutunlar ile yeni bir tablo 
    olusturmak icin kullanilabilir.
    
    JOIN islemleri Iliskisel Veritabanlari icin cok onemli bir ozelliktir. Çunku
    Foreign Key'ler ile iliskili olan tablolardan istenilen sutunlari cekmek 
    icin JOIN islemleri kullanilabilir.
    
    mySQL'de 3 Cesit Join islemi kullanilabilmektedir.
    
    1) INNER JOIN:  Tablolardaki ortak olan sonuc kumesini gosterir
    2) LEFT JOIN:  Ilk tabloda (Sol) olan sonuclari gosterir
    3) RIGHT JOIN: Ikinci tabloda sag olan tum sonuclari
       Full JOIN=(left join + union + right join) Tablodaki tum sonuclari gosterir
==============================================================================*/   
    CREATE TABLE sirketler
    (
        sirket_id int, 
        sirket_isim VARCHAR(20)
    );
    
    INSERT INTO sirketler VALUES(100, 'Toyota');
    INSERT INTO sirketler VALUES(101, 'Honda');
    INSERT INTO sirketler VALUES(102, 'Ford');
    INSERT INTO sirketler VALUES(103, 'Hyundai');
    
    CREATE TABLE siparisler
    (
        siparis_id int,
        sirket_id int, 
        siparis_tarihi DATE
    );
    
    INSERT INTO siparisler VALUES(11, 101, '2020-04-17');
    INSERT INTO siparisler VALUES(22, 102, '2020-04-18');
    INSERT INTO siparisler VALUES(33, 103, '2020-04-19');
    INSERT INTO siparisler VALUES(44, 104, '2020-04-20');
    INSERT INTO siparisler VALUES(55, 105, '2020-04-21');
    
    select * from sirketler;
    select * from siparisler;
    
    /*=============================== INNER JOIN  ==================================
    Iki tablonun kesisim kumesi ile yeni bir tablo olusturmak icin kullanilir.
    Syntax
    -----------
    SELECT sutun1,sutun2....sutunN
    FROM tablo1 
    INNER JOIN tablo2
    ON tablo1.sutun = tablo2.sutun;
================================================================================  
  
/* -----------------------------------------------------------------------------
  ORNEK1: Iki Tabloda sirket_id'si ayni olanlarin sirket_ismi, siparis_id ve 
  siparis_tarihleri listeleyen bir sorgu yaziniz.
------------------------------------------------------------------------------*/  
/*select sirket_ismi, siparis_id, siparis_tarihi,sirket_id
from sirketler 
inner join siparisler
on sirketler.sirket.id=siparisler.sirket_id; */

select sir.sirket_isim, sip.siparis_id, sip.siparis_tarihi,sip.sirket_id
from sirketler sir
inner join siparisler sip
on sir.sirket_id=sip.sirket_id; 

/* -----------------------------------------------------------------------------
  ORNEK1: Iki Tabloda sirket_id'si ayni olanlarin sirket_ismi, siparis_id ve 
  siparis_tarihleri listeleyen bir sorgu yaziniz.
------------------------------------------------------------------------------*/  
    
    SELECT s.sirket_isim, sp.siparis_id, sp.siparis_tarihi, sp.sirket_id
    FROM siparisler sp  -- tablo önceliği farketmez
    INNER JOIN sirketler s 
    on s.sirket_id = sp.sirket_id; -- where yerine on yazilacak
    
    -- INNER JOIN ile sadece iki tabloki ortak olan satirlar secilir.
    -- Diger bir ifadeyle iki tablodaki ortak olan sirket_id degerleri icin 
    -- ilgili sutunlar listenir.
    
    -- INNER anahtar kelimesi opsiyoneldir.
    
        
/*=============================== LEFT JOIN  ==================================
    LEFT JOIN, 1. tablodan (sol tablo) SELECT ile ifade edilen sutunlara ait tum
    satirlari getirir. 
    Ancak, diger tablodan sadece ON ile belirtilen kosula uyan satirlari getirir. 
    Syntax
    -----------
    SELECT sutun1,sutun2....sutunN
    FROM tablo1 
    LEFT JOIN tablo2  (fromdan sonra gelen)
    ON tablo1.sutun = tablo2.sutun;
==============================================================================*/  
/* -----------------------------------------------------------------------------
  ORNEK2: sirketler tablosundaki tum sirketleri ve bu sirketlere ait olan 
  siparis_id ve siparis_tarihleri listeleyen bir sorgu yaziniz.
------------------------------------------------------------------------------*/   
select sir.sirket_isim,sip.siparis_ID, sip.siparis_tarihi, sir.sirket_id
from sirketler sir  left join siparisler sip
on sir.sirket_id = sip.sirket_id; 

-- Left Join'de ilk tablodaki tum satirlar gosterilir.
    -- Ilk tablodaki satirlara 2.tablodan kosula uyan ortak satirlar 
	-- gosterilir, ancak ortak olmayan kisimlar bos kalir
          
/*=============================== RIGHT JOIN  ==================================
    
    RIGHT JOIN, 2. tablodan (sag tablo) SELECT ile ifade edilen sutunlara ait tum
    satirlari getirir. 
    Ancak, diger tablodan sadece ON ile belirtilen kosula uyan satirlari getirir. 
    Syntax
    -----------
    SELECT sutun1,sutun2....sutunN
    FROM tablo1 
    RIGHT JOIN tablo2
    ON tablo1.sutun = tablo2.sutun;
==============================================================================*/   
      select sir.sirket_isim,sip.siparis_ID, sip.siparis_tarihi, sir.sirket_id
from siparisler sip    
right join  sirketler sir
on sir.sirket_id = sip.sirket_id; 

/* -----------------------------------------------------------------------------
  ORNEK3: siparisler tablosundaki tum siparis_id ve siparis_tarihleri ile 
  bunlara karşılık gelen sirket_isimlerini listeleyen bir sorgu yaziniz.
------------------------------------------------------------------------------*/   
select sir.sirket_isim, sip.sirket_id, sip.siparis_tarihi
from sirketler as sir right join siparisler as sip
on sir.sirket_id = sip.sirket_id; 

-- Right Join'de 2. tablodaki tum satirlar gosterilir.
    -- 2 tablodaki satirlara 1.tablodan kosula uyan ortak satirlar gosterilir
    -- ancak ortak olmayan kisimlar bos kalirir.
    
    
    /*=============================== full JOIN  ==================================
    full JOIN: (left join + union all + right join)
   full  JOIN, Her iki tablo icin secilen sutunlara ait olan tum satirlari 
    getirmek icin kullanilir. 
    
    Syntax
    -----------
    SELECT sutun1,sutun2....sutunN
    FROM tablo1 
    left JOIN tablo2
    ON tablo1.sutun = tablo2.sutun
    union all
    SELECT sutun1,sutun2....sutunN
    FROM tablo1 
    right JOIN tablo2
    ON tablo1.sutun = tablo2.sutun
==============================================================================*/   
/* -----------------------------------------------------------------------------
  ORNEK4: sirketler ve siparisler adındaki tablolarda yer alan sirket_isim, 
  siparis_id ve siparis_tarihleri listeleyen bir sorgu yaziniz.
------------------------------------------------------------------------------*/ 
select sir.sirket_isim, sip.siparis_id, sip.siparis_tarihi,sir.sirket_id
from sirketler as sir
left join siparisler as sip
on sir.sirket_id = sip.sirket_id
union
select sir.sirket_isim, sip.siparis_id, sip.siparis_tarihi,sir.sirket_id
from sirketler as sir
right join siparisler as sip
on sir.sirket_id = sip.sirket_id; 

