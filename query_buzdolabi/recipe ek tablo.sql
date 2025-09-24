--stk'sý geçen ürünler için yeni bir veitabaný oluþturuyoruz
-- 1) Tablo
CREATE TABLE dbo.ExpiringRecipes (
    Id           INT IDENTITY(1,1) PRIMARY KEY,
    Title        NVARCHAR(200) NOT NULL,
    Instructions NVARCHAR(MAX) NOT NULL,
    Ingredients  NVARCHAR(MAX) NOT NULL,  -- JSON dizi: ["domates","soðan",...]
    CONSTRAINT CK_ExpiringRecipes_Ingredients_IsJson CHECK (ISJSON(Ingredients) = 1)
);
--productta ürün ekledim 
-- Ürünleri ekleme
INSERT INTO Products (user_id, pname, pbrand, pbarcode, pexpire_date, pquantity, punit)
VALUES 
(1, N'Domates', N'Yerli', N'1234567890123', DATEADD(DAY, 2, GETDATE()), 5, N'kg'),
(1, N'Yumurta', N'Tavuk Çiftliði', N'9876543210987', DATEADD(DAY, 1, GETDATE()), 12, N'adet'),
(1, N'Süt', N'Pýnar', N'1112223334445', DATEADD(DAY, 5, GETDATE()), 2, N'litre'),
(1, N'Ekmek', N'Ýstanbul Fýrýný', NULL, DATEADD(DAY, 1, GETDATE()), 1, N'adet'),
(1, N'Zeytin', N'Yeþil Dal', NULL, DATEADD(DAY, 30, GETDATE()), 0.5, N'kg');


INSERT INTO Products (user_id, pname, pbrand, pbarcode, pexpire_date, pquantity, punit)
VALUES
(14, N'Yoðurt', N'Pýnar', N'3344556677889', DATEADD(DAY, 7, GETDATE()), 2, N'kg'),
(14, N'Zeytinyaðý', N'Komili', N'4567891236540', DATEADD(DAY, 365, GETDATE()), 1, N'litre'),
(14, N'Meyve Suyu', N'Tamek', N'6677889900112', DATEADD(DAY, 90, GETDATE()), 2, N'litre'),
(14, N'Çikolata', N'Eti', N'9988776655443', DATEADD(DAY, 365, GETDATE()), 3, N'adet'),
(14, N'Bisküvi', N'Eti', N'6677655544332', DATEADD(DAY, 180, GETDATE()), 20, N'adet'),
(14, N'Kakaolu Gofret', N'Eti', N'5566443322110', DATEADD(DAY, 180, GETDATE()), 10, N'adet'),
(14, N'Simit', N'Simit Sarayý', NULL, DATEADD(DAY, 1, GETDATE()), 2, N'adet'),
(14, N'Su Böreði', N'Aslý Börek', NULL, DATEADD(DAY, 2, GETDATE()), 1, N'kg'),
(14, N'Puding', N'Özsüt', N'2233445566008', DATEADD(DAY, 7, GETDATE()), 6, N'adet'),
(14, N'Un', N'Söke', N'7788990011223', DATEADD(DAY, 180, GETDATE()), 2, N'kg'),
(14, N'Bulgur', N'Duru', N'9988776655443', DATEADD(DAY, 365, GETDATE()), 1, N'kg'),
(14, N'Pirinç', N'Baldo', N'3216549870123', DATEADD(DAY, 365, GETDATE()), 1, N'kg'),
(14, N'Zeytin', N'Yeþil Dal', NULL, DATEADD(DAY, 30, GETDATE()), 0.5, N'kg'),
(14, N'Makarna', N'Filiz', N'9998887776665', DATEADD(DAY, 180, GETDATE()), 2, N'adet'),
(14, N'Ketçap', N'Tamek', N'4455667788990', DATEADD(DAY, 180, GETDATE()), 1, N'adet'),
(14, N'Kahve', N'Kahve dükkâný', NULL, DATEADD(DAY, 365, GETDATE()), 1, N'adet'),
(14, N'Çay', N'Rize Çay', NULL, DATEADD(DAY, 720, GETDATE()), 1, N'kg');



INSERT INTO Products (user_id, pname, pbrand, pbarcode, pexpire_date, pquantity, punit)
VALUES
(14, N'Mercimek', N'Anadolu Bakliyat', N'1002003004001', DATEADD(DAY, 13, GETDATE()), 1, N'kg'),
(14, N'Havuç', N'Yerli', NULL, DATEADD(DAY, 2, GETDATE()), 0.5, N'kg'),
(14, N'Patates', N'Yerli', NULL, DATEADD(DAY, 14, GETDATE()), 1, N'kg'),
(14, N'Korniþon Turþu', N'Tamek', N'1002003004002', DATEADD(DAY, 2, GETDATE()), 1, N'adet'),
(14, N'Mýsýr (konserve)', N'Tamek', N'1002003004003', DATEADD(DAY, 140, GETDATE()), 1, N'adet'),
(14, N'Mayonez', N'Calve', N'1002003004004', DATEADD(DAY, 4, GETDATE()), 0.5, N'litre'),
(14, N'Tarhana', N'Ev Yapýmý', NULL, DATEADD(DAY, 1, GETDATE()), 0.3, N'kg'),
(14, N'Kakao', N'Torku', N'1002003004005', DATEADD(DAY, 241, GETDATE()), 0.25, N'kg'),
(14, N'Mýsýr Unu', N'Doðalsan', N'1002003004006', DATEADD(DAY, 14, GETDATE()), 0.5, N'kg'),
(14, N'Bezelye (konserve)', N'Tamek', N'1002003004007', DATEADD(DAY, 13, GETDATE()), 1, N'adet');


-- 2) Örnek veri
INSERT INTO dbo.ExpiringRecipes (Title, Instructions, Ingredients)
VALUES
(N'Domates Çorbasý', N'Domatesleri yýkayýp kabuklarýný soyun ve küp küp doðrayýn. Bir tencereye zeytinyaðýný alýn, ýsýtýn. Ýnce doðranmýþ soðaný ekleyip pembeleþene kadar kavurun. Ardýndan ezilmiþ sarýmsaðý ekleyip 1 dakika daha kavurun. Doðranmýþ domatesleri ekleyin ve orta ateþte 10-15 dakika kadar piþirin. Tuzunu ekleyin. Ardýndan karýþýmý blenderdan geçirerek pürüzsüz hale getirin. Gerekirse biraz su ekleyin. 5 dakika daha kaynatýn ve sýcak olarak servis edin.', '["domates","soðan","sarýmsak","zeytinyaðý","tuz"]'),
(N'Menemen',         N'Öncelikle domatesleri rendeleyin veya küçük küpler halinde doðrayýn. Biberleri ince ince doðrayýn. Bir tavaya zeytinyaðýný alýn ve ýsýtýn. Biberleri ekleyip birkaç dakika soteleyin. Ardýndan rendelenmiþ domatesleri tavaya ekleyin, domatesler suyunu salýp çekene kadar orta ateþte piþirin. Üzerine yumurtalarý kýrýn, isterseniz karýþtýrmadan piþirin ya da hafifçe karýþtýrarak yumurtalarýn tüm malzemeyle karýþmasýný saðlayýn. Tuzunu ekleyin. Yumurtalar istediðiniz kývama geldiðinde ocaktan alýn ve sýcak servis yapýn.', '["domates","biber","yumurta","tuz"]');


SELECT ISJSON('["domates", "soðan", "sarýmsak", "zeytinyaðý", "tuz"]');  -- 1 dönerse OK  malzeme listesine uygun yapýda mý kontrol


-- 10 Yeni Tarif
INSERT INTO dbo.ExpiringRecipes (Title, Instructions, Ingredients)
VALUES
-- 1
(N'Mercimek Çorbasý',
 N'Kýrmýzý mercimeði bol suyla yýkayýn. Tencereye sývý yað alýn, doðranmýþ soðaný ve havucu ekleyip kavurun. Ardýndan mercimeði ekleyin. Üzerine su ve tuz ekleyerek mercimekler yumuþayana kadar piþirin. Blenderdan geçirerek servis edin.',
 '["kýrmýzý mercimek","soðan","havuç","tuz","su","sývý yað"]'),

-- 2
(N'Makarna Salatasý',
 N'Haþlanmýþ makarnayý soðutun. Bir kaba alýn. Üzerine doðranmýþ korniþon turþu, mýsýr, yoðurt ve mayonez ekleyin. Karýþtýrýn ve buzdolabýnda bir süre dinlendirip servis edin.',
 '["makarna","korniþon turþu","mýsýr","yoðurt","mayonez"]'),

-- 3
(N'Patates Kavurmasý',
 N'Patatesleri haþlayýp küp doðrayýn. Tavaya tereyaðý ve sývý yað alýn. Doðranmýþ soðanlarý kavurun. Haþlanmýþ patatesleri ekleyin, baharatlarla birlikte birkaç dakika kavurun.',
 '["patates","soðan","tereyaðý","sývý yað","karabiber","tuz"]'),

-- 4
(N'Kýsýr',
 N'Bulguru sýcak suyla ýslatýp þiþmesini bekleyin. Ýçine ince doðranmýþ yeþillikler, biber salçasý, limon suyu, nar ekþisi ve zeytinyaðý ekleyip karýþtýrýn.',
 '["ince bulgur","salça","maydanoz","nane","limon","zeytinyaðý","nar ekþisi"]'),

-- 5
(N'Mozaik Pasta',
 N'Petibör bisküvileri küçük parçalara ayýrýn. Eritilmiþ tereyaðý, kakao, süt ve þeker ile karýþtýrýn. Streç filme sarýp dolaba koyun. Dilimleyerek servis edin.',
 '["bisküvi","kakao","tereyaðý","süt","þeker"]'),

-- 6
(N'Tarhana Çorbasý',
 N'Tarhanayý biraz suyla ýslatýp bekletin. Tencerede tereyaðý ve salçayý kavurun. Üzerine tarhana ve suyu ekleyin, kaynayana kadar karýþtýrýn. Tuzunu ekleyip sýcak servis yapýn.',
 '["tarhana","salça","tereyaðý","su","tuz"]'),

-- 7
(N'Sebzeli Omlet',
 N'Yumurtalarý çýrpýn. Ýçine doðranmýþ biber, domates ve biraz tuz ekleyin. Tavada tereyaðý veya sývý yað ile piþirin.',
 '["yumurta","biber","domates","tuz","tereyaðý"]'),

-- 8
(N'Muhlama (Kuymak)',
 N'Tereyaðýný tavada eritin. Mýsýr ununu ekleyin ve kokusu çýkana kadar kavurun. Suyu ekleyin ve karýþtýrýn. Son olarak peyniri ekleyin ve eriyene kadar karýþtýrmadan piþirin.',
 '["mýsýr unu","tereyaðý","su","peynir"]'),

-- 9
(N'Fýrýnda Tavuk Baget',
 N'Tavuk bagetleri yað, yoðurt, salça, tuz ve baharatlarla marine edin. Fýrýn tepsisine dizip 200°C fýrýnda kýzarana kadar piþirin.',
 '["tavuk baget","yoðurt","salça","zeytinyaðý","tuz","karabiber","kýrmýzý toz biber"]'),

-- 10
(N'Zeytinyaðlý Enginar',
 N'Enginarlarý limonlu suda bekletin. Tencerede soðan, havuç ve bezelyeyi zeytinyaðýnda soteleyin. Üzerine enginarlarý yerleþtirip az su ekleyin. Kýsýk ateþte piþirin.',
 '["enginar","soðan","havuç","bezelye","zeytinyaðý","limon","tuz"]');
 


