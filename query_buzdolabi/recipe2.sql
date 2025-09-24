-- 10 Yeni Tarif
INSERT INTO dbo.ExpiringRecipes (Title, Instructions, Ingredients)
VALUES
-- 11
(N'Lahana Sarmasý',
 N'Lahana yapraklarýný haþlayýn. Ýç harç için pirinç, kýyma, soðan, salça ve baharatlarý karýþtýrýn. Yapraklara harcý koyup sarýn. Tencereye dizip üzerine sos ekleyin ve piþirin.',
 '["lahana","pirinç","kýyma","soðan","salça","tuz","karabiber","zeytinyaðý"]'),

-- 12
(N'Ýmam Bayýldý',
 N'Patlýcanlarý alacalý soyup kýzartýn. Ýç harç için soðan, domates, biber ve sarýmsaðý kavurun. Harcý patlýcanlarýn içine doldurun. Fýrýnda piþirin ve soðuk servis edin.',
 '["patlýcan","soðan","domates","biber","sarýmsak","zeytinyaðý","tuz"]'),

-- 13
(N'Karnýyarýk',
 N'Patlýcanlarý kýzartýn ve ortalarýný açýn. Ýç harç için kýyma, soðan, domates ve biberleri kavurun. Harcý patlýcanlara doldurun. Salçalý sos ekleyip fýrýnda piþirin.',
 '["patlýcan","kýyma","soðan","domates","biber","salça","tuz","karabiber"]'),

-- 14
(N'Menemen',
 N'Tavada yaðda soðan ve biberi kavurun. Üzerine domates ekleyin. Domatesler piþince yumurtalarý kýrýn ve karýþtýrýn.',
 '["yumurta","domates","biber","soðan","tuz","zeytinyaðý"]'),

-- 15
(N'Köfte',
 N'Kýyma, soðan, galeta unu, yumurta ve baharatlarý yoðurun. Þekil verip tavada ya da fýrýnda piþirin.',
 '["kýyma","soðan","yumurta","galeta unu","tuz","karabiber","kimyon"]'),

-- 16
(N'Çoban Salata',
 N'Domates, salatalýk, biber ve soðaný doðrayýn. Üzerine zeytinyaðý, limon suyu ve tuz ekleyin.',
 '["domates","salatalýk","biber","soðan","zeytinyaðý","limon","tuz"]'),

-- 17
(N'Pilav',
 N'Tereyaðýnda þehriyeyi kavurun. Pirinci ekleyip kavurmaya devam edin. Üzerine sýcak su ve tuz ekleyip suyunu çekene kadar piþirin.',
 '["pirinç","þehriye","tereyaðý","su","tuz"]'),

-- 18
(N'Fýrýnda Sebze',
 N'Havuç, kabak, patates ve biberi doðrayýn. Zeytinyaðý, tuz ve baharatlarla harmanlayýp fýrýnda piþirin.',
 '["havuç","kabak","patates","biber","zeytinyaðý","tuz","karabiber"]'),

-- 19
(N'Pankek',
 N'Yumurta, süt, un, kabartma tozu ve þekeri karýþtýrýn. Tavada küçük parçalar halinde arkalý önlü piþirin.',
 '["yumurta","süt","un","kabartma tozu","þeker","tereyaðý"]'),

-- 20
(N'Baklava',
 N'Yufkalarý üst üste dizin. Aralara ceviz serpin. En üste yað dökün. Fýrýnda piþirdikten sonra þerbetini dökün.',
 '["yufka","ceviz","tereyaðý","þeker","su","limon"]');


INSERT INTO dbo.ExpiringRecipes (Title, Instructions, Ingredients)
VALUES
 -- 21
(N'Çýlbýr',
 N'Yoðurdu sarýmsakla karýþtýrýn. Kaynar suda yumurtalarý haþlayýn. Servis tabaðýna yoðurt koyun, üzerine yumurtalarý yerleþtirin. Tereyaðýnda pul biber yakýp üzerine dökün.',
 '["yumurta","yoðurt","sarýmsak","tereyaðý","pul biber","tuz"]'),

-- 22
(N'Simit Poðaça',
 N'Un, maya, süt, þeker ve tuzu yoðurun. Hamuru dinlendirin. Ýçine peynir koyup kapatýn. Üzerine pekmezli su sürüp susama batýrýn. Fýrýnda piþirin.',
 '["un","maya","süt","þeker","tuz","peynir","pekmez","susam"]'),

-- 23
(N'Patlýcan Musakka',
 N'Patlýcanlarý kýzartýn. Soðan ve kýymayý kavurun. Tepsiye patlýcan ve harcý sýrayla dizin. Salçalý sos ekleyip fýrýnda piþirin.',
 '["patlýcan","kýyma","soðan","salça","domates","tuz","karabiber"]'),

-- 24
(N'Fýrýnda Makarna',
 N'Makarnayý haþlayýn. Beþamel sos için süt, tereyaðý ve unu piþirin. Makarnayý sos ve peynirle karýþtýrýp fýrýn kabýna alýn. Üzerine kaþar rendesi ekleyip piþirin.',
 '["makarna","süt","tereyaðý","un","peynir","kaþar","tuz"]'),

-- 25
(N'Tavuk Sote',
 N'Tavuklarý küp doðrayýn. Soðan, biber ve domatesle birlikte kavurun. Baharat ekleyip sýcak servis edin.',
 '["tavuk göðsü","soðan","biber","domates","zeytinyaðý","tuz","karabiber"]'),

-- 26
(N'Bulgur Pilavý',
 N'Bulguru tereyaðýnda kavurun. Üzerine sýcak su ve tuz ekleyin. Suyunu çekene kadar piþirin.',
 '["bulgur","tereyaðý","su","tuz"]'),

-- 27
(N'Zeytinyaðlý Taze Fasulye',
 N'Taze fasulyeleri ayýklayýn. Soðan ve domatesle kavurun. Üzerine su ekleyin ve kýsýk ateþte piþirin.',
 '["taze fasulye","soðan","domates","zeytinyaðý","tuz"]'),

-- 28
(N'Fýrýnda Kabak Mücver',
 N'Kabaklarý rendeleyin. Yumurta, un, dereotu ve baharatlarla karýþtýrýn. Fýrýn kabýna dökün ve üzeri kýzarana kadar piþirin.',
 '["kabak","yumurta","un","dereotu","zeytinyaðý","tuz","karabiber"]'),

-- 29
(N'Mantý',
 N'Hamur açýn ve küçük kareler kesin. Ýçine kýymalý harç koyup kapatýn. Kaynar suda haþlayýn. Üzerine sarýmsaklý yoðurt ve tereyaðlý sos ekleyin.',
 '["un","su","tuz","kýyma","soðan","yoðurt","sarýmsak","tereyaðý","pul biber"]'),

-- 30
(N'Tavuklu Pilav',
 N'Pirinç pilavýný hazýrlayýn. Ayrý tencerede tavuk haþlayýn. Tavuk parçalarýný pilavla birlikte servis edin.',
 '["pirinç","tavuk","tereyaðý","su","tuz"]'),

-- 31
(N'Kuzu Tandýr',
 N'Kuzu etini tuz ve baharatlarla ovun. Düþük ýsýda uzun süre piþirin. Yanýnda pilavla servis edin.',
 '["kuzu eti","tuz","karabiber","kimyon","zeytinyaðý"]'),

-- 32
(N'Fýrýnda Karnabahar',
 N'Karnabaharý haþlayýn. Beþamel sos hazýrlayýn. Karnabaharý sosla karýþtýrýp fýrýn kabýna alýn. Üzerine kaþar rendesi ekleyip piþirin.',
 '["karnabahar","süt","un","tereyaðý","kaþar","tuz"]'),

-- 33
(N'Fýrýnda Balýk',
 N'Balýklarý temizleyin. Zeytinyaðý, limon ve baharatlarla marine edin. Fýrýnda piþirin.',
 '["balýk","zeytinyaðý","limon","tuz","karabiber"]'),

-- 34
(N'Mücver',
 N'Kabaklarý rendeleyin. Yumurta, un, dereotu ve baharat ekleyin. Kýzgýn yaðda kýzartýn.',
 '["kabak","yumurta","un","dereotu","tuz","karabiber","sývý yað"]'),

-- 35
(N'Börek',
 N'Yufkalarý tezgaha açýn. Ýçine peynir veya kýymalý harç koyun. Rulo yapýp tepsiye dizin. Üzerine yumurta sarýsý sürüp fýrýnda piþirin.',
 '["yufka","peynir","kýyma","soðan","yumurta","sývý yað"]'),

-- 36
(N'Sütlaç',
 N'Süt ve pirinci piþirin. Þeker ekleyin ve karýþtýrýn. Kaselere paylaþtýrýp soðumaya býrakýn.',
 '["pirinç","süt","þeker","su","vanilin"]'),

-- 37
(N'Aþure',
 N'Buðdayý haþlayýn. Ýçine nohut, fasulye, kuru kayýsý, kuru incir ve üzüm ekleyin. Þekerle tatlandýrýn. Soðuyunca ceviz ve tarçýnla süsleyin.',
 '["buðday","nohut","fasulye","kuru kayýsý","kuru incir","üzüm","þeker","ceviz","tarçýn"]'),

-- 38
(N'Tavuklu Salata',
 N'Haþlanmýþ tavuk göðsünü didikleyin. Yeþillikler, domates ve salatalýkla karýþtýrýn. Üzerine zeytinyaðý ve limon ekleyin.',
 '["tavuk göðsü","marul","domates","salatalýk","zeytinyaðý","limon","tuz"]'),

-- 39
(N'Kurabiye',
 N'Tereyaðý, þeker ve yumurtayý çýrpýn. Un ve kabartma tozunu ekleyin. Hamura þekil verip fýrýnda piþirin.',
 '["un","tereyaðý","þeker","yumurta","kabartma tozu","vanilin"]'),

-- 40
(N'Tiramisu',
 N'Kedi dili bisküvilerini kahveyle ýslatýn. Üzerine mascarpone kremasý sürün. Kat kat dizin. Üzerine kakao serpin ve buzdolabýnda bekletin.',
 '["kedi dili","kahve","mascarpone","krema","þeker","kakao"]');


INSERT INTO dbo.ExpiringRecipes (Title, Instructions, Ingredients)
VALUES

 (N'Zeytinyaðlý Yaprak Sarma',
 N'Asma yapraklarýný haþlayýn. Ýç harcý için pirinci, soðaný, dereotunu ve baharatlarý kavurun. Yapraklara harcý koyup sarýn. Tencereye dizip üzerine limon dilimleri koyarak piþirin.',
 '["asma yapraðý","pirinç","soðan","zeytinyaðý","dereotu","limon","tuz"]'),

-- 5
(N'Çoban Salata',
 N'Domates, salatalýk, soðan ve biberleri doðrayýn. Zeytinyaðý, limon suyu ve tuz ile harmanlayarak servis edin.',
 '["domates","salatalýk","soðan","biber","zeytinyaðý","limon","tuz"]'),

 (N'Fýrýnda Levrek',
 N'Levrekleri temizleyip yaðlý kaðýda koyun. Üzerine zeytinyaðý, limon dilimleri ve baharat ekleyin. 180°C fýrýnda piþirin.',
 '["levrek","zeytinyaðý","limon","tuz","karabiber"]');


INSERT INTO dbo.ExpiringRecipes (Title, Instructions, Ingredients)
VALUES
-- 1
(N'Sucuklu Yumurta',
 N'Tavayý hafifçe yaðlayýn. Dilimlenmiþ sucuklarý tavada kýzartýn. Üzerine yumurtalarý kýrýn. Tuz serpip beyazlarý piþene kadar ocakta tutun.',
 '["sucuk","yumurta","tuz","tereyaðý"]'),

-- 2
(N'Revani',
 N'Yumurta ve þekeri çýrpýn. Un, irmik, yoðurt ve kabartma tozunu ekleyin. Yaðlanmýþ tepsiye dökün ve piþirin. Soðuyunca üzerine þerbet dökün.',
 '["yumurta","þeker","un","irmik","yoðurt","kabartma tozu","þerbet"]'),

-- 3
(N'Kazandibi',
 N'Süt, þeker ve niþastayý kaynatýn. Tepsiyi tereyaðýyla yaðlayýp hafif yakarak karamelleþtirin. Muhallebiyi içine dökün. Soðutup ters çevirerek servis edin.',
 '["süt","þeker","niþasta","tereyaðý"]'),

-- 4
(N'Aþure',
 N'Buðdayý bir gece önceden ýslatýn. Kaynatýn, içine kuru fasulye, nohut, kuru kayýsý, üzüm ve incir ekleyin. Þekerle tatlandýrýn, üzerine nar ve ceviz serpin.',
 '["buðday","nohut","kuru fasulye","kayýsý","üzüm","incir","þeker","nar","ceviz"]'),

-- 5
(N'Künefe',
 N'Kadayýfý tereyaðýyla karýþtýrýn. Tepsiye yayarak ortasýna peynir koyun. Üstüne tekrar kadayýf kapatýn. Piþirip sýcak þerbet dökün.',
 '["kadayýf","peynir","tereyaðý","þeker","su","limon"]'),

-- 6
(N'Profiterol',
 N'Un, su, tereyaðý ve yumurta ile hamur yapýn. Fýrýnda piþirin. Ýçini krema ile doldurun. Üzerine çikolata sos dökün.',
 '["un","su","tereyaðý","yumurta","krema","çikolata"]'),

-- 7
(N'Süt Helvasý',
 N'Unu tereyaðýnda kavurun. Üzerine süt ve þeker ekleyip piþirin. Fýrýn kabýna dökün ve üstü kýzarana kadar piþirin.',
 '["un","tereyaðý","süt","þeker"]'),

-- 8
(N'Ýrmik Helvasý',
 N'Ýrmiði tereyaðýnda kavurun. Ayrý yerde þeker ve sütü kaynatýn. Kaynayan þerbeti irmiðe dökün, kapaðý kapalý demlenmeye býrakýn.',
 '["irmik","tereyaðý","süt","þeker"]'),

-- 9
(N'Tulumba Tatlýsý',
 N'Hamuru yoðurun ve þýrýnga ile kýzgýn yaða sýkýn. Kýzardýktan sonra soðuk þerbete atýn.',
 '["un","yumurta","yoðurt","þeker","su","limon"]');




INSERT INTO dbo.ExpiringRecipes (Title, Instructions, Ingredients)
VALUES
-- 1
(N'Dalyan Köfte',
 N'Kýymayý soðan, baharat ve galeta unu ile yoðurun. Ýçine haþlanmýþ yumurta koyarak rulo yapýn. Fýrýnda piþirin.',
 '["kýyma","soðan","baharat","galeta unu","yumurta"]'),

-- 2
(N'Damat Dolmasý',
 N'Kuzu etini, pirinç ve baharatlarla doldurup piþirin. Özel günlerde sunulur.',
 '["kuzu eti","pirinç","soðan","baharat"]'),

-- 3
(N'Dijon Hardalý',
 N'Hardal tohumlarý sirke ve baharatlarla öðütülüp kremsi hale getirilir.',
 '["hardal tohumu","sirke","tuz","baharat"]'),

-- 4
(N'Dilber Dudaðý',
 N'Yufkalarý yuvarlak kesip içlerine ceviz koyun. Þerbetle tatlandýrarak servis edin.',
 '["yufka","ceviz","þeker","su","limon"]'),

-- 5
(N'Diyar Köfte',
 N'Kýyma, soðan ve baharatla yoðrulup köfte þekli verilir. Izgarada piþirilir.',
 '["kýyma","soðan","baharat","ekmek içi"]'),

-- 6
(N'Dolma',
 N'Biber veya yapraklarýn içine pirinçli harç doldurulur. Düþük ateþte piþirilir.',
 '["pirinç","soðan","baharat","dolmalýk biber veya yaprak"]'),

-- 7
(N'Domates Dolmasý',
 N'Domatesler oyularak içi pirinçli harçla doldurulur. Tencerede piþirilir.',
 '["domates","pirinç","soðan","zeytinyaðý","baharat"]'),

-- 8
(N'Domatesli Gözleme',
 N'Gözleme hamurunun içine domates, peynir ve maydanoz koyup sacda piþirin.',
 '["un","su","tuz","domates","peynir","maydanoz"]'),

-- 9
(N'Domatesli Pirinç Pilavý',
 N'Pirinçleri tereyaðýnda kavurun. Domates rendesi ve su ekleyerek piþirin.',
 '["pirinç","domates","tereyaðý","su","tuz"]'),

-- 10
(N'Dizme Patlýcan Kebabý',
 N'Patlýcan ve köfteleri sýrayla dizerek fýrýnda piþirin.',
 '["patlýcan","kýyma","soðan","baharat","domates"]'),

-- 11
(N'Dondurma',
 N'Süt, þeker ve salep karýþýmý dondurularak hazýrlanýr.',
 '["süt","þeker","salep"]'),

-- 12
(N'Döner',
 N'Baharatlý et þiþe geçirilerek dikey döner ocaðýnda piþirilir.',
 '["et","baharat","yoðurt","soðan"]'),

-- 13
(N'Döner Kebabý',
 N'Döner etleri ince dilimlenip pilav veya lavaþla servis edilir.',
 '["döner eti","lavaþ","soðan","domates"]'),

-- 14
(N'Dövme Pilavý',
 N'Buðday dövmesi et suyu ve tereyaðý ile piþirilir.',
 '["buðday dövmesi","et suyu","tereyaðý","tuz"]'),

-- 15
(N'Duxelles',
 N'Mantar ve soðan ince kýyýlarak kavrulur. Garnitür olarak kullanýlýr.',
 '["mantar","soðan","tereyaðý","tuz"]'),

-- 16
(N'Düðün Çorbasý',
 N'Kuzu eti haþlanýp terbiyeli unlu sosla karýþtýrýlýr. Naneli yað gezdirilir.',
 '["kuzu eti","un","tereyaðý","nane","tuz"]'),

-- 17
(N'Düðür Çorbasý',
 N'Bulgur ve mercimek birlikte kaynatýlýr. Soðanlý yað ile tatlandýrýlýr.',
 '["bulgur","mercimek","soðan","tereyaðý"]'),

-- 18
(N'Düðürcük Çorbasý',
 N'Köftecikler hazýrlanýp kaynayan çorbanýn içine atýlýr.',
 '["kýyma","bulgur","soðan","baharat"]'),

-- 19
(N'Ebegümeci',
 N'Ebegümeci yapraklarý soðan ve domatesle kavrularak hazýrlanýr.',
 '["ebegümeci","soðan","domates","zeytinyaðý"]'),

-- 20
(N'Ekler',
 N'Piþmiþ hamurun içine krema doldurulur, üzerine çikolata sos dökülür.',
 '["un","yumurta","tereyaðý","krema","çikolata"]'),

-- 21
(N'Ekmek Dolmasý',
 N'Ekmek içi oyulur, içine etli harç doldurulup fýrýnda piþirilir.',
 '["ekmek","kýyma","soðan","baharat"]'),

-- 22
(N'Ekmek Kadayýfý',
 N'Ekmek kadayýfý piþirilip þerbetle tatlandýrýlýr. Kaymakla servis edilir.',
 '["ekmek kadayýfý","þeker","su","kaymak"]'),

-- 23
(N'Ekþili Çorba',
 N'Bulgur köfteleri yoðurtlu ve limonlu çorba içinde piþirilir.',
 '["bulgur","yoðurt","limon","yumurta","nane"]'),

-- 24
(N'Ekþili Dolma',
 N'Asma yapraklarýna ekþi soslu pirinç harcý doldurularak hazýrlanýr.',
 '["pirinç","soðan","nane","limon","yaprak"]'),

-- 25
(N'Ekþili Kýþ Dolmasý',
 N'Kýþ sebzeleri ve pirinç ekþi sos ile doldurulur.',
 '["lahana","pirinç","soðan","limon"]'),

-- 26
(N'Ekþili Köfte',
 N'Kýyma ve bulgur köfteleri limonlu suda piþirilir.',
 '["kýyma","bulgur","limon","nane"]'),

-- 27
(N'Ekþili Ufak Köfte',
 N'Minik köfteler yoðurtlu limonlu çorba içinde piþirilir.',
 '["kýyma","bulgur","yoðurt","limon"]'),

-- 28
(N'Elbasan Tava',
 N'Etler yoðurtlu sosla fýrýnlanarak hazýrlanýr.',
 '["kuzu eti","yoðurt","yumurta","un","baharat"]'),

-- 29
(N'Elma Kompostosu',
 N'Elmalar þekerli suda kaynatýlarak komposto yapýlýr.',
 '["elma","þeker","su","tarçýn"]'),

-- 30
(N'Emet Kebabý',
 N'Kuzu eti ve sebzeler güveçte aðýr ateþte piþirilir.',
 '["kuzu eti","soðan","domates","biber","baharat"]'),

-- 31
(N'Ezo Gelin Çorbasý',
 N'Mercimek, bulgur ve pirinç kaynatýlýp salçalý sos eklenir.',
 '["mercimek","bulgur","pirinç","salça","soðan","baharat"]'),

-- 32
(N'Enginarlý Yuva Kebabý',
 N'Enginarlarýn içine etli harç doldurulup fýrýnda piþirilir.',
 '["enginar","kuzu eti","soðan","baharat"]'),

-- 33
(N'Erik Hoþafý',
 N'Erikler þekerli suda kaynatýlarak hoþaf yapýlýr.',
 '["erik","þeker","su"]'),

-- 34
(N'Eriþte',
 N'Un, yumurta ve tuzla hamur hazýrlanýp ince þeritler kesilir.',
 '["un","yumurta","tuz"]'),

-- 35
(N'Etli Ekmek',
 N'Hamurun üzerine kýymalý harç serilip taþ fýrýnda piþirilir.',
 '["un","su","tuz","kýyma","soðan","domates"]'),

-- 36
(N'Etli Kuru Bamya',
 N'Kuru bamya et ve domatesle piþirilir.',
 '["kuru bamya","kuzu eti","domates","soðan"]'),

-- 37
(N'Etli Kuru Fasulye',
 N'Kuru fasulye etle birlikte piþirilir.',
 '["kuru fasulye","kuzu eti","soðan","salça"]'),

-- 38
(N'Etli Nohut',
 N'Nohut etle birlikte piþirilir.',
 '["nohut","kuzu eti","soðan","salça"]'),

-- 39
(N'Etli Patlýcan',
 N'Patlýcan ve et tencerede birlikte piþirilir.',
 '["patlýcan","kuzu eti","soðan","domates"]'),

-- 40
(N'Etli Pide',
 N'Hamurun üzerine etli harç konulup fýrýnda piþirilir.',
 '["un","su","tuz","kýyma","soðan","baharat"]'),

-- 41
(N'Etli Taze Fasulye',
 N'Taze fasulyeler etle birlikte piþirilir.',
 '["taze fasulye","kuzu eti","soðan","domates"]');



INSERT INTO dbo.ExpiringRecipes (Title, Instructions, Ingredients)
VALUES
-- 43
(N'Tava Ekmeði',
 N'Un, su, tuz ve maya ile hamur hazýrlanýr. Tavada piþirilir.',
 '["un","su","tuz","maya"]'),

-- 44
(N'Tavuk Çorbasý',
 N'Tavuk parçalarý suyla kaynatýlýr. Sebzeler ve baharatlar eklenir. Terbiyesi yapýlýr ve servis edilir.',
 '["tavuk","su","soðan","havuç","tuz","baharat"]'),

-- 45
(N'Tavuk Göðsü',
 N'Tavuk göðsü haþlanýr, süt, þeker ve niþasta ile muhallebi yapýlýr. Soðuk servis edilir.',
 '["tavuk göðsü","süt","þeker","niþasta"]'),

-- 46
(N'Tavuk Þiþ Kebabý',
 N'Tavuk parçalarý marine edilir, þiþe geçirilip ýzgarada piþirilir.',
 '["tavuk","yoðurt","zeytinyaðý","baharat","limon"]'),

-- 47
(N'Tavuklu Kebap',
 N'Tavuk parçalarý sebzelerle birlikte þiþe dizilip fýrýn veya mangalda piþirilir.',
 '["tavuk","biber","soðan","domates","baharat"]'),

-- 48
(N'Tavuklu Þehriye Çorbasý',
 N'Tavuk suyu hazýrlanýr, içine þehriye ve sebzeler eklenir. Tuz ve baharat ile tatlandýrýlýr.',
 '["tavuk","þehriye","havuç","soðan","tuz","baharat"]');



 INSERT INTO dbo.ExpiringRecipes (Title, Instructions, Ingredients)
VALUES
-- 49
(N'Yað Çorbasý',
 N'Un ve yað kavrulur, üzerine su eklenir ve kaynatýlýr. Tuz ve baharat ile tatlandýrýlýr.',
 '["un","yað","su","tuz","baharat"]'),

-- 50
(N'Yaðlama',
 N'Yufka hazýrlanýr ve yaðlý harçla kat kat dizilir. Fýrýnda piþirilir.',
 '["yufka","yað","soðan","domates","biber"]'),

-- 51
(N'Yahni',
 N'Et ve sebzeler kavrulur, üzerine su eklenir ve kýsýk ateþte piþirilir.',
 '["et","soðan","domates","biber","su","tuz","baharat"]'),

-- 52
(N'Yalancý Dolma',
 N'Bulgur ve sebzeler karýþtýrýlýr, dolma þekli verilip piþirilir.',
 '["bulgur","soðan","biber","domates","zeytinyaðý","baharat"]'),

-- 53
(N'Yalancý Ýskender',
 N'Pide dilimlenir, üzerine sos ve yoðurt eklenir, kýzarmýþ etle servis edilir.',
 '["pide","yoðurt","et","tereyaðý","domates salçasý"]'),

-- 54
(N'Yanardað Kebabý',
 N'Et ve sebzeler karýþtýrýlýr, fýrýnda üzeri kýzarana kadar piþirilir.',
 '["et","biber","domates","soðan","baharat"]'),

-- 55
(N'Yaprak Sarmasý',
 N'Asma yapraklarý hazýrlanan harç ile doldurulur ve tencereye dizilip piþirilir.',
 '["asma yapraðý","pirinç","soðan","maydanoz","zeytinyaðý","tuz","baharat"]'),

-- 56
(N'Yarma Çorbasý',
 N'Yarma haþlanýr, et suyu ve baharatlar eklenir, kaynatýlýr.',
 '["yarma","et suyu","soðan","tuz","baharat"]'),

-- 57
(N'Yayla Çorbasý',
 N'Yoðurt, un ve su karýþtýrýlýr, içine þehriye eklenir ve kaynatýlýr.',
 '["yoðurt","un","su","þehriye","nane","tuz"]'),

-- 58
(N'Yayla Kebabý',
 N'Et ve sebzeler fýrýnda piþirilir, yoðurt ve sos ile servis edilir.',
 '["et","yoðurt","biber","domates","soðan","baharat"]'),

-- 59
(N'Yayla Köfte',
 N'Kýyma, bulgur ve baharatlar karýþtýrýlýr, köfte þekli verilip piþirilir.',
 '["kýyma","bulgur","soðan","tuz","baharat"]'),


-- 61
(N'Yenidünya Kebabý',
 N'Et ve sebzeler piþirilip sos ile servis edilir.',
 '["et","sebze","zeytinyaðý","tuz","baharat"]'),

-- 62
(N'Yeþil Domates Yemeði',
 N'Domatesler doðranýr, tencerede kavrulur, baharat ve su eklenir, piþirilir.',
 '["yeþil domates","soðan","biber","zeytinyaðý","tuz","baharat"]'),

-- 63
(N'Yeþil Mercimek Çorbasý',
 N'Yeþil mercimek yýkanýr ve su ile haþlanýr, sebzeler eklenir ve blenderdan geçirilir.',
 '["yeþil mercimek","soðan","havuç","su","tuz","zeytinyaðý"]'),

-- 64
(N'Yeþil Mercimek Plaki',
 N'Mercimek haþlanýr, üzerine soðan, sarýmsak ve baharatlar ile fýrýnlanýr.',
 '["yeþil mercimek","soðan","sarýmsak","zeytinyaðý","tuz","baharat"]'),

-- 65
(N'Yeþil Salata',
 N'Marul, domates, salatalýk doðranýr, zeytinyaðý ve limon ile karýþtýrýlýr.',
 '["marul","domates","salatalýk","zeytinyaðý","limon"]'),

-- 66
(N'Yeþil Soðanlý Et',
 N'Et parçalarý sebzelerle kavrulur, yeþil soðan eklenir ve piþirilir.',
 '["et","yeþil soðan","biber","domates","tuz","baharat"]'),

-- 67
(N'Yeþil Zeytin Piyazý',
 N'Yeþil zeytin, soðan ve maydanoz doðranýr, limon ve zeytinyaðý ile karýþtýrýlýr.',
 '["yeþil zeytin","soðan","maydanoz","limon","zeytinyaðý"]'),

-- 68
(N'Yeþil Zeytinli Çörek',
 N'Hamur hazýrlanýr, içine yeþil zeytin eklenir, fýrýnda piþirilir.',
 '["un","yeþil zeytin","yað","tuz"]'),


-- 70
(N'Yoðurtlu Bulgur Köftesi',
 N'Bulgur ve yoðurt ile köfte harcý hazýrlanýr, haþlanýr ve servis edilir.',
 '["bulgur","yoðurt","soðan","tuz","baharat"]'),

-- 71
(N'Yoðurtlu Kebap',
 N'Et parçalarý piþirilir, üzerine yoðurt ve sos eklenir.',
 '["et","yoðurt","biber","domates","tuz","baharat"]'),

-- 72
(N'Yoðurtlu Patates',
 N'Haþlanmýþ patates yoðurt ve sarýmsak ile karýþtýrýlýr, servis edilir.',
 '["patates","yoðurt","sarýmsak","tuz"]'),

-- 73
(N'Yoðurtlu Semizotu Salatasý',
 N'Semizotu, yoðurt, sarýmsak ve limon ile karýþtýrýlýr.',
 '["semizotu","yoðurt","sarýmsak","limon"]'),

-- 74
(N'Yoðurtlu Ufak Köfte',
 N'Kýyma ve yoðurt karýþtýrýlýr, ufak köfte þekli verilerek piþirilir.',
 '["kýyma","yoðurt","soðan","tuz","baharat"]'),

-- 75
(N'Yörük Kebabý',
 N'Et ve sebzeler fýrýnda piþirilir, üzerine sos eklenir.',
 '["et","sebze","zeytinyaðý","tuz","baharat"]'),

-- 76
(N'Yufka',
 N'Un ve su ile hamur hazýrlanýr, ince açýlýr ve piþirilir.',
 '["un","su","tuz"]'),

-- 77
(N'Yufkalý Saç Kebabý',
 N'Yufka açýlýr, içine et ve sebzeler konur, saç üzerinde piþirilir.',
 '["yufka","et","sebze","tuz","baharat"]'),

-- 78
(N'Yumru Köfte',
 N'Kýyma ve baharatlar karýþtýrýlýr, yuvarlanýr ve piþirilir.',
 '["kýyma","soðan","tuz","baharat"]'),

-- 79
(N'Yumurta',
 N'Yumurta haþlanýr veya omlet þeklinde piþirilir.',
 '["yumurta","tuz","yað"]'),

-- 80
(N'Yumurta Salatasý',
 N'Haþlanmýþ yumurta, mayonez ve baharatlar karýþtýrýlýr.',
 '["yumurta","mayonez","tuz","baharat"]'),

-- 82
(N'Yuvarlama',
 N'Et ve sebzeler tencereye alýnýr, kaynatýlýr ve piþirilir.',
 '["et","sebze","tuz","baharat"]'),

-- 83
(N'Yüksük Çorbasý',
 N'Tuz, un, yað ve su ile hazýrlanan çorba kaynatýlýr.',
 '["un","yað","su","tuz","baharat"]'),

-- 84
(N'Zerde',
 N'Safran ve pirinç ile hazýrlanýr, þekerle tatlandýrýlýr.',
 '["pirinç","þeker","safran"]'),

-- 85
(N'Zeytinyaðlý Bakla',
 N'Baklalar doðranýr, zeytinyaðý ve soðanla piþirilir.',
 '["bakla","soðan","zeytinyaðý","tuz"]'),

-- 86
(N'Zeytinyaðlý Barbunya Plaki',
 N'Barbunya haþlanýr, üzerine soðan ve zeytinyaðý eklenir ve fýrýnlanýr.',
 '["barbunya","soðan","zeytinyaðý","tuz"]'),

-- 87
(N'Zeytinyaðlý Enginar',
 N'Enginarlar temizlenir, zeytinyaðý ve sebzelerle piþirilir.',
 '["enginar","soðan","havuç","zeytinyaðý","tuz"]');
