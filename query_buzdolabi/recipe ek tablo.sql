--stk's� ge�en �r�nler i�in yeni bir veitaban� olu�turuyoruz
-- 1) Tablo
CREATE TABLE dbo.ExpiringRecipes (
    Id           INT IDENTITY(1,1) PRIMARY KEY,
    Title        NVARCHAR(200) NOT NULL,
    Instructions NVARCHAR(MAX) NOT NULL,
    Ingredients  NVARCHAR(MAX) NOT NULL,  -- JSON dizi: ["domates","so�an",...]
    CONSTRAINT CK_ExpiringRecipes_Ingredients_IsJson CHECK (ISJSON(Ingredients) = 1)
);
--productta �r�n ekledim 
-- �r�nleri ekleme
INSERT INTO Products (user_id, pname, pbrand, pbarcode, pexpire_date, pquantity, punit)
VALUES 
(1, N'Domates', N'Yerli', N'1234567890123', DATEADD(DAY, 2, GETDATE()), 5, N'kg'),
(1, N'Yumurta', N'Tavuk �iftli�i', N'9876543210987', DATEADD(DAY, 1, GETDATE()), 12, N'adet'),
(1, N'S�t', N'P�nar', N'1112223334445', DATEADD(DAY, 5, GETDATE()), 2, N'litre'),
(1, N'Ekmek', N'�stanbul F�r�n�', NULL, DATEADD(DAY, 1, GETDATE()), 1, N'adet'),
(1, N'Zeytin', N'Ye�il Dal', NULL, DATEADD(DAY, 30, GETDATE()), 0.5, N'kg');


INSERT INTO Products (user_id, pname, pbrand, pbarcode, pexpire_date, pquantity, punit)
VALUES
(14, N'Yo�urt', N'P�nar', N'3344556677889', DATEADD(DAY, 7, GETDATE()), 2, N'kg'),
(14, N'Zeytinya��', N'Komili', N'4567891236540', DATEADD(DAY, 365, GETDATE()), 1, N'litre'),
(14, N'Meyve Suyu', N'Tamek', N'6677889900112', DATEADD(DAY, 90, GETDATE()), 2, N'litre'),
(14, N'�ikolata', N'Eti', N'9988776655443', DATEADD(DAY, 365, GETDATE()), 3, N'adet'),
(14, N'Bisk�vi', N'Eti', N'6677655544332', DATEADD(DAY, 180, GETDATE()), 20, N'adet'),
(14, N'Kakaolu Gofret', N'Eti', N'5566443322110', DATEADD(DAY, 180, GETDATE()), 10, N'adet'),
(14, N'Simit', N'Simit Saray�', NULL, DATEADD(DAY, 1, GETDATE()), 2, N'adet'),
(14, N'Su B�re�i', N'Asl� B�rek', NULL, DATEADD(DAY, 2, GETDATE()), 1, N'kg'),
(14, N'Puding', N'�zs�t', N'2233445566008', DATEADD(DAY, 7, GETDATE()), 6, N'adet'),
(14, N'Un', N'S�ke', N'7788990011223', DATEADD(DAY, 180, GETDATE()), 2, N'kg'),
(14, N'Bulgur', N'Duru', N'9988776655443', DATEADD(DAY, 365, GETDATE()), 1, N'kg'),
(14, N'Pirin�', N'Baldo', N'3216549870123', DATEADD(DAY, 365, GETDATE()), 1, N'kg'),
(14, N'Zeytin', N'Ye�il Dal', NULL, DATEADD(DAY, 30, GETDATE()), 0.5, N'kg'),
(14, N'Makarna', N'Filiz', N'9998887776665', DATEADD(DAY, 180, GETDATE()), 2, N'adet'),
(14, N'Ket�ap', N'Tamek', N'4455667788990', DATEADD(DAY, 180, GETDATE()), 1, N'adet'),
(14, N'Kahve', N'Kahve d�kk�n�', NULL, DATEADD(DAY, 365, GETDATE()), 1, N'adet'),
(14, N'�ay', N'Rize �ay', NULL, DATEADD(DAY, 720, GETDATE()), 1, N'kg');



INSERT INTO Products (user_id, pname, pbrand, pbarcode, pexpire_date, pquantity, punit)
VALUES
(14, N'Mercimek', N'Anadolu Bakliyat', N'1002003004001', DATEADD(DAY, 13, GETDATE()), 1, N'kg'),
(14, N'Havu�', N'Yerli', NULL, DATEADD(DAY, 2, GETDATE()), 0.5, N'kg'),
(14, N'Patates', N'Yerli', NULL, DATEADD(DAY, 14, GETDATE()), 1, N'kg'),
(14, N'Korni�on Tur�u', N'Tamek', N'1002003004002', DATEADD(DAY, 2, GETDATE()), 1, N'adet'),
(14, N'M�s�r (konserve)', N'Tamek', N'1002003004003', DATEADD(DAY, 140, GETDATE()), 1, N'adet'),
(14, N'Mayonez', N'Calve', N'1002003004004', DATEADD(DAY, 4, GETDATE()), 0.5, N'litre'),
(14, N'Tarhana', N'Ev Yap�m�', NULL, DATEADD(DAY, 1, GETDATE()), 0.3, N'kg'),
(14, N'Kakao', N'Torku', N'1002003004005', DATEADD(DAY, 241, GETDATE()), 0.25, N'kg'),
(14, N'M�s�r Unu', N'Do�alsan', N'1002003004006', DATEADD(DAY, 14, GETDATE()), 0.5, N'kg'),
(14, N'Bezelye (konserve)', N'Tamek', N'1002003004007', DATEADD(DAY, 13, GETDATE()), 1, N'adet');


-- 2) �rnek veri
INSERT INTO dbo.ExpiringRecipes (Title, Instructions, Ingredients)
VALUES
(N'Domates �orbas�', N'Domatesleri y�kay�p kabuklar�n� soyun ve k�p k�p do�ray�n. Bir tencereye zeytinya��n� al�n, �s�t�n. �nce do�ranm�� so�an� ekleyip pembele�ene kadar kavurun. Ard�ndan ezilmi� sar�msa�� ekleyip 1 dakika daha kavurun. Do�ranm�� domatesleri ekleyin ve orta ate�te 10-15 dakika kadar pi�irin. Tuzunu ekleyin. Ard�ndan kar���m� blenderdan ge�irerek p�r�zs�z hale getirin. Gerekirse biraz su ekleyin. 5 dakika daha kaynat�n ve s�cak olarak servis edin.', '["domates","so�an","sar�msak","zeytinya��","tuz"]'),
(N'Menemen',         N'�ncelikle domatesleri rendeleyin veya k���k k�pler halinde do�ray�n. Biberleri ince ince do�ray�n. Bir tavaya zeytinya��n� al�n ve �s�t�n. Biberleri ekleyip birka� dakika soteleyin. Ard�ndan rendelenmi� domatesleri tavaya ekleyin, domatesler suyunu sal�p �ekene kadar orta ate�te pi�irin. �zerine yumurtalar� k�r�n, isterseniz kar��t�rmadan pi�irin ya da hafif�e kar��t�rarak yumurtalar�n t�m malzemeyle kar��mas�n� sa�lay�n. Tuzunu ekleyin. Yumurtalar istedi�iniz k�vama geldi�inde ocaktan al�n ve s�cak servis yap�n.', '["domates","biber","yumurta","tuz"]');


SELECT ISJSON('["domates", "so�an", "sar�msak", "zeytinya��", "tuz"]');  -- 1 d�nerse OK  malzeme listesine uygun yap�da m� kontrol


-- 10 Yeni Tarif
INSERT INTO dbo.ExpiringRecipes (Title, Instructions, Ingredients)
VALUES
-- 1
(N'Mercimek �orbas�',
 N'K�rm�z� mercime�i bol suyla y�kay�n. Tencereye s�v� ya� al�n, do�ranm�� so�an� ve havucu ekleyip kavurun. Ard�ndan mercime�i ekleyin. �zerine su ve tuz ekleyerek mercimekler yumu�ayana kadar pi�irin. Blenderdan ge�irerek servis edin.',
 '["k�rm�z� mercimek","so�an","havu�","tuz","su","s�v� ya�"]'),

-- 2
(N'Makarna Salatas�',
 N'Ha�lanm�� makarnay� so�utun. Bir kaba al�n. �zerine do�ranm�� korni�on tur�u, m�s�r, yo�urt ve mayonez ekleyin. Kar��t�r�n ve buzdolab�nda bir s�re dinlendirip servis edin.',
 '["makarna","korni�on tur�u","m�s�r","yo�urt","mayonez"]'),

-- 3
(N'Patates Kavurmas�',
 N'Patatesleri ha�lay�p k�p do�ray�n. Tavaya tereya�� ve s�v� ya� al�n. Do�ranm�� so�anlar� kavurun. Ha�lanm�� patatesleri ekleyin, baharatlarla birlikte birka� dakika kavurun.',
 '["patates","so�an","tereya��","s�v� ya�","karabiber","tuz"]'),

-- 4
(N'K�s�r',
 N'Bulguru s�cak suyla �slat�p �i�mesini bekleyin. ��ine ince do�ranm�� ye�illikler, biber sal�as�, limon suyu, nar ek�isi ve zeytinya�� ekleyip kar��t�r�n.',
 '["ince bulgur","sal�a","maydanoz","nane","limon","zeytinya��","nar ek�isi"]'),

-- 5
(N'Mozaik Pasta',
 N'Petib�r bisk�vileri k���k par�alara ay�r�n. Eritilmi� tereya��, kakao, s�t ve �eker ile kar��t�r�n. Stre� filme sar�p dolaba koyun. Dilimleyerek servis edin.',
 '["bisk�vi","kakao","tereya��","s�t","�eker"]'),

-- 6
(N'Tarhana �orbas�',
 N'Tarhanay� biraz suyla �slat�p bekletin. Tencerede tereya�� ve sal�ay� kavurun. �zerine tarhana ve suyu ekleyin, kaynayana kadar kar��t�r�n. Tuzunu ekleyip s�cak servis yap�n.',
 '["tarhana","sal�a","tereya��","su","tuz"]'),

-- 7
(N'Sebzeli Omlet',
 N'Yumurtalar� ��rp�n. ��ine do�ranm�� biber, domates ve biraz tuz ekleyin. Tavada tereya�� veya s�v� ya� ile pi�irin.',
 '["yumurta","biber","domates","tuz","tereya��"]'),

-- 8
(N'Muhlama (Kuymak)',
 N'Tereya��n� tavada eritin. M�s�r ununu ekleyin ve kokusu ��kana kadar kavurun. Suyu ekleyin ve kar��t�r�n. Son olarak peyniri ekleyin ve eriyene kadar kar��t�rmadan pi�irin.',
 '["m�s�r unu","tereya��","su","peynir"]'),

-- 9
(N'F�r�nda Tavuk Baget',
 N'Tavuk bagetleri ya�, yo�urt, sal�a, tuz ve baharatlarla marine edin. F�r�n tepsisine dizip 200�C f�r�nda k�zarana kadar pi�irin.',
 '["tavuk baget","yo�urt","sal�a","zeytinya��","tuz","karabiber","k�rm�z� toz biber"]'),

-- 10
(N'Zeytinya�l� Enginar',
 N'Enginarlar� limonlu suda bekletin. Tencerede so�an, havu� ve bezelyeyi zeytinya��nda soteleyin. �zerine enginarlar� yerle�tirip az su ekleyin. K�s�k ate�te pi�irin.',
 '["enginar","so�an","havu�","bezelye","zeytinya��","limon","tuz"]');
 


