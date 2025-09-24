-- 10 Yeni Tarif
INSERT INTO dbo.ExpiringRecipes (Title, Instructions, Ingredients)
VALUES
-- 11
(N'Lahana Sarmas�',
 N'Lahana yapraklar�n� ha�lay�n. �� har� i�in pirin�, k�yma, so�an, sal�a ve baharatlar� kar��t�r�n. Yapraklara harc� koyup sar�n. Tencereye dizip �zerine sos ekleyin ve pi�irin.',
 '["lahana","pirin�","k�yma","so�an","sal�a","tuz","karabiber","zeytinya��"]'),

-- 12
(N'�mam Bay�ld�',
 N'Patl�canlar� alacal� soyup k�zart�n. �� har� i�in so�an, domates, biber ve sar�msa�� kavurun. Harc� patl�canlar�n i�ine doldurun. F�r�nda pi�irin ve so�uk servis edin.',
 '["patl�can","so�an","domates","biber","sar�msak","zeytinya��","tuz"]'),

-- 13
(N'Karn�yar�k',
 N'Patl�canlar� k�zart�n ve ortalar�n� a��n. �� har� i�in k�yma, so�an, domates ve biberleri kavurun. Harc� patl�canlara doldurun. Sal�al� sos ekleyip f�r�nda pi�irin.',
 '["patl�can","k�yma","so�an","domates","biber","sal�a","tuz","karabiber"]'),

-- 14
(N'Menemen',
 N'Tavada ya�da so�an ve biberi kavurun. �zerine domates ekleyin. Domatesler pi�ince yumurtalar� k�r�n ve kar��t�r�n.',
 '["yumurta","domates","biber","so�an","tuz","zeytinya��"]'),

-- 15
(N'K�fte',
 N'K�yma, so�an, galeta unu, yumurta ve baharatlar� yo�urun. �ekil verip tavada ya da f�r�nda pi�irin.',
 '["k�yma","so�an","yumurta","galeta unu","tuz","karabiber","kimyon"]'),

-- 16
(N'�oban Salata',
 N'Domates, salatal�k, biber ve so�an� do�ray�n. �zerine zeytinya��, limon suyu ve tuz ekleyin.',
 '["domates","salatal�k","biber","so�an","zeytinya��","limon","tuz"]'),

-- 17
(N'Pilav',
 N'Tereya��nda �ehriyeyi kavurun. Pirinci ekleyip kavurmaya devam edin. �zerine s�cak su ve tuz ekleyip suyunu �ekene kadar pi�irin.',
 '["pirin�","�ehriye","tereya��","su","tuz"]'),

-- 18
(N'F�r�nda Sebze',
 N'Havu�, kabak, patates ve biberi do�ray�n. Zeytinya��, tuz ve baharatlarla harmanlay�p f�r�nda pi�irin.',
 '["havu�","kabak","patates","biber","zeytinya��","tuz","karabiber"]'),

-- 19
(N'Pankek',
 N'Yumurta, s�t, un, kabartma tozu ve �ekeri kar��t�r�n. Tavada k���k par�alar halinde arkal� �nl� pi�irin.',
 '["yumurta","s�t","un","kabartma tozu","�eker","tereya��"]'),

-- 20
(N'Baklava',
 N'Yufkalar� �st �ste dizin. Aralara ceviz serpin. En �ste ya� d�k�n. F�r�nda pi�irdikten sonra �erbetini d�k�n.',
 '["yufka","ceviz","tereya��","�eker","su","limon"]');


INSERT INTO dbo.ExpiringRecipes (Title, Instructions, Ingredients)
VALUES
 -- 21
(N'��lb�r',
 N'Yo�urdu sar�msakla kar��t�r�n. Kaynar suda yumurtalar� ha�lay�n. Servis taba��na yo�urt koyun, �zerine yumurtalar� yerle�tirin. Tereya��nda pul biber yak�p �zerine d�k�n.',
 '["yumurta","yo�urt","sar�msak","tereya��","pul biber","tuz"]'),

-- 22
(N'Simit Po�a�a',
 N'Un, maya, s�t, �eker ve tuzu yo�urun. Hamuru dinlendirin. ��ine peynir koyup kapat�n. �zerine pekmezli su s�r�p susama bat�r�n. F�r�nda pi�irin.',
 '["un","maya","s�t","�eker","tuz","peynir","pekmez","susam"]'),

-- 23
(N'Patl�can Musakka',
 N'Patl�canlar� k�zart�n. So�an ve k�ymay� kavurun. Tepsiye patl�can ve harc� s�rayla dizin. Sal�al� sos ekleyip f�r�nda pi�irin.',
 '["patl�can","k�yma","so�an","sal�a","domates","tuz","karabiber"]'),

-- 24
(N'F�r�nda Makarna',
 N'Makarnay� ha�lay�n. Be�amel sos i�in s�t, tereya�� ve unu pi�irin. Makarnay� sos ve peynirle kar��t�r�p f�r�n kab�na al�n. �zerine ka�ar rendesi ekleyip pi�irin.',
 '["makarna","s�t","tereya��","un","peynir","ka�ar","tuz"]'),

-- 25
(N'Tavuk Sote',
 N'Tavuklar� k�p do�ray�n. So�an, biber ve domatesle birlikte kavurun. Baharat ekleyip s�cak servis edin.',
 '["tavuk g��s�","so�an","biber","domates","zeytinya��","tuz","karabiber"]'),

-- 26
(N'Bulgur Pilav�',
 N'Bulguru tereya��nda kavurun. �zerine s�cak su ve tuz ekleyin. Suyunu �ekene kadar pi�irin.',
 '["bulgur","tereya��","su","tuz"]'),

-- 27
(N'Zeytinya�l� Taze Fasulye',
 N'Taze fasulyeleri ay�klay�n. So�an ve domatesle kavurun. �zerine su ekleyin ve k�s�k ate�te pi�irin.',
 '["taze fasulye","so�an","domates","zeytinya��","tuz"]'),

-- 28
(N'F�r�nda Kabak M�cver',
 N'Kabaklar� rendeleyin. Yumurta, un, dereotu ve baharatlarla kar��t�r�n. F�r�n kab�na d�k�n ve �zeri k�zarana kadar pi�irin.',
 '["kabak","yumurta","un","dereotu","zeytinya��","tuz","karabiber"]'),

-- 29
(N'Mant�',
 N'Hamur a��n ve k���k kareler kesin. ��ine k�ymal� har� koyup kapat�n. Kaynar suda ha�lay�n. �zerine sar�msakl� yo�urt ve tereya�l� sos ekleyin.',
 '["un","su","tuz","k�yma","so�an","yo�urt","sar�msak","tereya��","pul biber"]'),

-- 30
(N'Tavuklu Pilav',
 N'Pirin� pilav�n� haz�rlay�n. Ayr� tencerede tavuk ha�lay�n. Tavuk par�alar�n� pilavla birlikte servis edin.',
 '["pirin�","tavuk","tereya��","su","tuz"]'),

-- 31
(N'Kuzu Tand�r',
 N'Kuzu etini tuz ve baharatlarla ovun. D���k �s�da uzun s�re pi�irin. Yan�nda pilavla servis edin.',
 '["kuzu eti","tuz","karabiber","kimyon","zeytinya��"]'),

-- 32
(N'F�r�nda Karnabahar',
 N'Karnabahar� ha�lay�n. Be�amel sos haz�rlay�n. Karnabahar� sosla kar��t�r�p f�r�n kab�na al�n. �zerine ka�ar rendesi ekleyip pi�irin.',
 '["karnabahar","s�t","un","tereya��","ka�ar","tuz"]'),

-- 33
(N'F�r�nda Bal�k',
 N'Bal�klar� temizleyin. Zeytinya��, limon ve baharatlarla marine edin. F�r�nda pi�irin.',
 '["bal�k","zeytinya��","limon","tuz","karabiber"]'),

-- 34
(N'M�cver',
 N'Kabaklar� rendeleyin. Yumurta, un, dereotu ve baharat ekleyin. K�zg�n ya�da k�zart�n.',
 '["kabak","yumurta","un","dereotu","tuz","karabiber","s�v� ya�"]'),

-- 35
(N'B�rek',
 N'Yufkalar� tezgaha a��n. ��ine peynir veya k�ymal� har� koyun. Rulo yap�p tepsiye dizin. �zerine yumurta sar�s� s�r�p f�r�nda pi�irin.',
 '["yufka","peynir","k�yma","so�an","yumurta","s�v� ya�"]'),

-- 36
(N'S�tla�',
 N'S�t ve pirinci pi�irin. �eker ekleyin ve kar��t�r�n. Kaselere payla�t�r�p so�umaya b�rak�n.',
 '["pirin�","s�t","�eker","su","vanilin"]'),

-- 37
(N'A�ure',
 N'Bu�day� ha�lay�n. ��ine nohut, fasulye, kuru kay�s�, kuru incir ve �z�m ekleyin. �ekerle tatland�r�n. So�uyunca ceviz ve tar��nla s�sleyin.',
 '["bu�day","nohut","fasulye","kuru kay�s�","kuru incir","�z�m","�eker","ceviz","tar��n"]'),

-- 38
(N'Tavuklu Salata',
 N'Ha�lanm�� tavuk g��s�n� didikleyin. Ye�illikler, domates ve salatal�kla kar��t�r�n. �zerine zeytinya�� ve limon ekleyin.',
 '["tavuk g��s�","marul","domates","salatal�k","zeytinya��","limon","tuz"]'),

-- 39
(N'Kurabiye',
 N'Tereya��, �eker ve yumurtay� ��rp�n. Un ve kabartma tozunu ekleyin. Hamura �ekil verip f�r�nda pi�irin.',
 '["un","tereya��","�eker","yumurta","kabartma tozu","vanilin"]'),

-- 40
(N'Tiramisu',
 N'Kedi dili bisk�vilerini kahveyle �slat�n. �zerine mascarpone kremas� s�r�n. Kat kat dizin. �zerine kakao serpin ve buzdolab�nda bekletin.',
 '["kedi dili","kahve","mascarpone","krema","�eker","kakao"]');


INSERT INTO dbo.ExpiringRecipes (Title, Instructions, Ingredients)
VALUES

 (N'Zeytinya�l� Yaprak Sarma',
 N'Asma yapraklar�n� ha�lay�n. �� harc� i�in pirinci, so�an�, dereotunu ve baharatlar� kavurun. Yapraklara harc� koyup sar�n. Tencereye dizip �zerine limon dilimleri koyarak pi�irin.',
 '["asma yapra��","pirin�","so�an","zeytinya��","dereotu","limon","tuz"]'),

-- 5
(N'�oban Salata',
 N'Domates, salatal�k, so�an ve biberleri do�ray�n. Zeytinya��, limon suyu ve tuz ile harmanlayarak servis edin.',
 '["domates","salatal�k","so�an","biber","zeytinya��","limon","tuz"]'),

 (N'F�r�nda Levrek',
 N'Levrekleri temizleyip ya�l� ka��da koyun. �zerine zeytinya��, limon dilimleri ve baharat ekleyin. 180�C f�r�nda pi�irin.',
 '["levrek","zeytinya��","limon","tuz","karabiber"]');


INSERT INTO dbo.ExpiringRecipes (Title, Instructions, Ingredients)
VALUES
-- 1
(N'Sucuklu Yumurta',
 N'Tavay� hafif�e ya�lay�n. Dilimlenmi� sucuklar� tavada k�zart�n. �zerine yumurtalar� k�r�n. Tuz serpip beyazlar� pi�ene kadar ocakta tutun.',
 '["sucuk","yumurta","tuz","tereya��"]'),

-- 2
(N'Revani',
 N'Yumurta ve �ekeri ��rp�n. Un, irmik, yo�urt ve kabartma tozunu ekleyin. Ya�lanm�� tepsiye d�k�n ve pi�irin. So�uyunca �zerine �erbet d�k�n.',
 '["yumurta","�eker","un","irmik","yo�urt","kabartma tozu","�erbet"]'),

-- 3
(N'Kazandibi',
 N'S�t, �eker ve ni�astay� kaynat�n. Tepsiyi tereya��yla ya�lay�p hafif yakarak karamelle�tirin. Muhallebiyi i�ine d�k�n. So�utup ters �evirerek servis edin.',
 '["s�t","�eker","ni�asta","tereya��"]'),

-- 4
(N'A�ure',
 N'Bu�day� bir gece �nceden �slat�n. Kaynat�n, i�ine kuru fasulye, nohut, kuru kay�s�, �z�m ve incir ekleyin. �ekerle tatland�r�n, �zerine nar ve ceviz serpin.',
 '["bu�day","nohut","kuru fasulye","kay�s�","�z�m","incir","�eker","nar","ceviz"]'),

-- 5
(N'K�nefe',
 N'Kaday�f� tereya��yla kar��t�r�n. Tepsiye yayarak ortas�na peynir koyun. �st�ne tekrar kaday�f kapat�n. Pi�irip s�cak �erbet d�k�n.',
 '["kaday�f","peynir","tereya��","�eker","su","limon"]'),

-- 6
(N'Profiterol',
 N'Un, su, tereya�� ve yumurta ile hamur yap�n. F�r�nda pi�irin. ��ini krema ile doldurun. �zerine �ikolata sos d�k�n.',
 '["un","su","tereya��","yumurta","krema","�ikolata"]'),

-- 7
(N'S�t Helvas�',
 N'Unu tereya��nda kavurun. �zerine s�t ve �eker ekleyip pi�irin. F�r�n kab�na d�k�n ve �st� k�zarana kadar pi�irin.',
 '["un","tereya��","s�t","�eker"]'),

-- 8
(N'�rmik Helvas�',
 N'�rmi�i tereya��nda kavurun. Ayr� yerde �eker ve s�t� kaynat�n. Kaynayan �erbeti irmi�e d�k�n, kapa�� kapal� demlenmeye b�rak�n.',
 '["irmik","tereya��","s�t","�eker"]'),

-- 9
(N'Tulumba Tatl�s�',
 N'Hamuru yo�urun ve ��r�nga ile k�zg�n ya�a s�k�n. K�zard�ktan sonra so�uk �erbete at�n.',
 '["un","yumurta","yo�urt","�eker","su","limon"]');




INSERT INTO dbo.ExpiringRecipes (Title, Instructions, Ingredients)
VALUES
-- 1
(N'Dalyan K�fte',
 N'K�ymay� so�an, baharat ve galeta unu ile yo�urun. ��ine ha�lanm�� yumurta koyarak rulo yap�n. F�r�nda pi�irin.',
 '["k�yma","so�an","baharat","galeta unu","yumurta"]'),

-- 2
(N'Damat Dolmas�',
 N'Kuzu etini, pirin� ve baharatlarla doldurup pi�irin. �zel g�nlerde sunulur.',
 '["kuzu eti","pirin�","so�an","baharat"]'),

-- 3
(N'Dijon Hardal�',
 N'Hardal tohumlar� sirke ve baharatlarla ���t�l�p kremsi hale getirilir.',
 '["hardal tohumu","sirke","tuz","baharat"]'),

-- 4
(N'Dilber Duda��',
 N'Yufkalar� yuvarlak kesip i�lerine ceviz koyun. �erbetle tatland�rarak servis edin.',
 '["yufka","ceviz","�eker","su","limon"]'),

-- 5
(N'Diyar K�fte',
 N'K�yma, so�an ve baharatla yo�rulup k�fte �ekli verilir. Izgarada pi�irilir.',
 '["k�yma","so�an","baharat","ekmek i�i"]'),

-- 6
(N'Dolma',
 N'Biber veya yapraklar�n i�ine pirin�li har� doldurulur. D���k ate�te pi�irilir.',
 '["pirin�","so�an","baharat","dolmal�k biber veya yaprak"]'),

-- 7
(N'Domates Dolmas�',
 N'Domatesler oyularak i�i pirin�li har�la doldurulur. Tencerede pi�irilir.',
 '["domates","pirin�","so�an","zeytinya��","baharat"]'),

-- 8
(N'Domatesli G�zleme',
 N'G�zleme hamurunun i�ine domates, peynir ve maydanoz koyup sacda pi�irin.',
 '["un","su","tuz","domates","peynir","maydanoz"]'),

-- 9
(N'Domatesli Pirin� Pilav�',
 N'Pirin�leri tereya��nda kavurun. Domates rendesi ve su ekleyerek pi�irin.',
 '["pirin�","domates","tereya��","su","tuz"]'),

-- 10
(N'Dizme Patl�can Kebab�',
 N'Patl�can ve k�fteleri s�rayla dizerek f�r�nda pi�irin.',
 '["patl�can","k�yma","so�an","baharat","domates"]'),

-- 11
(N'Dondurma',
 N'S�t, �eker ve salep kar���m� dondurularak haz�rlan�r.',
 '["s�t","�eker","salep"]'),

-- 12
(N'D�ner',
 N'Baharatl� et �i�e ge�irilerek dikey d�ner oca��nda pi�irilir.',
 '["et","baharat","yo�urt","so�an"]'),

-- 13
(N'D�ner Kebab�',
 N'D�ner etleri ince dilimlenip pilav veya lava�la servis edilir.',
 '["d�ner eti","lava�","so�an","domates"]'),

-- 14
(N'D�vme Pilav�',
 N'Bu�day d�vmesi et suyu ve tereya�� ile pi�irilir.',
 '["bu�day d�vmesi","et suyu","tereya��","tuz"]'),

-- 15
(N'Duxelles',
 N'Mantar ve so�an ince k�y�larak kavrulur. Garnit�r olarak kullan�l�r.',
 '["mantar","so�an","tereya��","tuz"]'),

-- 16
(N'D���n �orbas�',
 N'Kuzu eti ha�lan�p terbiyeli unlu sosla kar��t�r�l�r. Naneli ya� gezdirilir.',
 '["kuzu eti","un","tereya��","nane","tuz"]'),

-- 17
(N'D���r �orbas�',
 N'Bulgur ve mercimek birlikte kaynat�l�r. So�anl� ya� ile tatland�r�l�r.',
 '["bulgur","mercimek","so�an","tereya��"]'),

-- 18
(N'D���rc�k �orbas�',
 N'K�ftecikler haz�rlan�p kaynayan �orban�n i�ine at�l�r.',
 '["k�yma","bulgur","so�an","baharat"]'),

-- 19
(N'Ebeg�meci',
 N'Ebeg�meci yapraklar� so�an ve domatesle kavrularak haz�rlan�r.',
 '["ebeg�meci","so�an","domates","zeytinya��"]'),

-- 20
(N'Ekler',
 N'Pi�mi� hamurun i�ine krema doldurulur, �zerine �ikolata sos d�k�l�r.',
 '["un","yumurta","tereya��","krema","�ikolata"]'),

-- 21
(N'Ekmek Dolmas�',
 N'Ekmek i�i oyulur, i�ine etli har� doldurulup f�r�nda pi�irilir.',
 '["ekmek","k�yma","so�an","baharat"]'),

-- 22
(N'Ekmek Kaday�f�',
 N'Ekmek kaday�f� pi�irilip �erbetle tatland�r�l�r. Kaymakla servis edilir.',
 '["ekmek kaday�f�","�eker","su","kaymak"]'),

-- 23
(N'Ek�ili �orba',
 N'Bulgur k�fteleri yo�urtlu ve limonlu �orba i�inde pi�irilir.',
 '["bulgur","yo�urt","limon","yumurta","nane"]'),

-- 24
(N'Ek�ili Dolma',
 N'Asma yapraklar�na ek�i soslu pirin� harc� doldurularak haz�rlan�r.',
 '["pirin�","so�an","nane","limon","yaprak"]'),

-- 25
(N'Ek�ili K�� Dolmas�',
 N'K�� sebzeleri ve pirin� ek�i sos ile doldurulur.',
 '["lahana","pirin�","so�an","limon"]'),

-- 26
(N'Ek�ili K�fte',
 N'K�yma ve bulgur k�fteleri limonlu suda pi�irilir.',
 '["k�yma","bulgur","limon","nane"]'),

-- 27
(N'Ek�ili Ufak K�fte',
 N'Minik k�fteler yo�urtlu limonlu �orba i�inde pi�irilir.',
 '["k�yma","bulgur","yo�urt","limon"]'),

-- 28
(N'Elbasan Tava',
 N'Etler yo�urtlu sosla f�r�nlanarak haz�rlan�r.',
 '["kuzu eti","yo�urt","yumurta","un","baharat"]'),

-- 29
(N'Elma Kompostosu',
 N'Elmalar �ekerli suda kaynat�larak komposto yap�l�r.',
 '["elma","�eker","su","tar��n"]'),

-- 30
(N'Emet Kebab�',
 N'Kuzu eti ve sebzeler g�ve�te a��r ate�te pi�irilir.',
 '["kuzu eti","so�an","domates","biber","baharat"]'),

-- 31
(N'Ezo Gelin �orbas�',
 N'Mercimek, bulgur ve pirin� kaynat�l�p sal�al� sos eklenir.',
 '["mercimek","bulgur","pirin�","sal�a","so�an","baharat"]'),

-- 32
(N'Enginarl� Yuva Kebab�',
 N'Enginarlar�n i�ine etli har� doldurulup f�r�nda pi�irilir.',
 '["enginar","kuzu eti","so�an","baharat"]'),

-- 33
(N'Erik Ho�af�',
 N'Erikler �ekerli suda kaynat�larak ho�af yap�l�r.',
 '["erik","�eker","su"]'),

-- 34
(N'Eri�te',
 N'Un, yumurta ve tuzla hamur haz�rlan�p ince �eritler kesilir.',
 '["un","yumurta","tuz"]'),

-- 35
(N'Etli Ekmek',
 N'Hamurun �zerine k�ymal� har� serilip ta� f�r�nda pi�irilir.',
 '["un","su","tuz","k�yma","so�an","domates"]'),

-- 36
(N'Etli Kuru Bamya',
 N'Kuru bamya et ve domatesle pi�irilir.',
 '["kuru bamya","kuzu eti","domates","so�an"]'),

-- 37
(N'Etli Kuru Fasulye',
 N'Kuru fasulye etle birlikte pi�irilir.',
 '["kuru fasulye","kuzu eti","so�an","sal�a"]'),

-- 38
(N'Etli Nohut',
 N'Nohut etle birlikte pi�irilir.',
 '["nohut","kuzu eti","so�an","sal�a"]'),

-- 39
(N'Etli Patl�can',
 N'Patl�can ve et tencerede birlikte pi�irilir.',
 '["patl�can","kuzu eti","so�an","domates"]'),

-- 40
(N'Etli Pide',
 N'Hamurun �zerine etli har� konulup f�r�nda pi�irilir.',
 '["un","su","tuz","k�yma","so�an","baharat"]'),

-- 41
(N'Etli Taze Fasulye',
 N'Taze fasulyeler etle birlikte pi�irilir.',
 '["taze fasulye","kuzu eti","so�an","domates"]');



INSERT INTO dbo.ExpiringRecipes (Title, Instructions, Ingredients)
VALUES
-- 43
(N'Tava Ekme�i',
 N'Un, su, tuz ve maya ile hamur haz�rlan�r. Tavada pi�irilir.',
 '["un","su","tuz","maya"]'),

-- 44
(N'Tavuk �orbas�',
 N'Tavuk par�alar� suyla kaynat�l�r. Sebzeler ve baharatlar eklenir. Terbiyesi yap�l�r ve servis edilir.',
 '["tavuk","su","so�an","havu�","tuz","baharat"]'),

-- 45
(N'Tavuk G��s�',
 N'Tavuk g��s� ha�lan�r, s�t, �eker ve ni�asta ile muhallebi yap�l�r. So�uk servis edilir.',
 '["tavuk g��s�","s�t","�eker","ni�asta"]'),

-- 46
(N'Tavuk �i� Kebab�',
 N'Tavuk par�alar� marine edilir, �i�e ge�irilip �zgarada pi�irilir.',
 '["tavuk","yo�urt","zeytinya��","baharat","limon"]'),

-- 47
(N'Tavuklu Kebap',
 N'Tavuk par�alar� sebzelerle birlikte �i�e dizilip f�r�n veya mangalda pi�irilir.',
 '["tavuk","biber","so�an","domates","baharat"]'),

-- 48
(N'Tavuklu �ehriye �orbas�',
 N'Tavuk suyu haz�rlan�r, i�ine �ehriye ve sebzeler eklenir. Tuz ve baharat ile tatland�r�l�r.',
 '["tavuk","�ehriye","havu�","so�an","tuz","baharat"]');



 INSERT INTO dbo.ExpiringRecipes (Title, Instructions, Ingredients)
VALUES
-- 49
(N'Ya� �orbas�',
 N'Un ve ya� kavrulur, �zerine su eklenir ve kaynat�l�r. Tuz ve baharat ile tatland�r�l�r.',
 '["un","ya�","su","tuz","baharat"]'),

-- 50
(N'Ya�lama',
 N'Yufka haz�rlan�r ve ya�l� har�la kat kat dizilir. F�r�nda pi�irilir.',
 '["yufka","ya�","so�an","domates","biber"]'),

-- 51
(N'Yahni',
 N'Et ve sebzeler kavrulur, �zerine su eklenir ve k�s�k ate�te pi�irilir.',
 '["et","so�an","domates","biber","su","tuz","baharat"]'),

-- 52
(N'Yalanc� Dolma',
 N'Bulgur ve sebzeler kar��t�r�l�r, dolma �ekli verilip pi�irilir.',
 '["bulgur","so�an","biber","domates","zeytinya��","baharat"]'),

-- 53
(N'Yalanc� �skender',
 N'Pide dilimlenir, �zerine sos ve yo�urt eklenir, k�zarm�� etle servis edilir.',
 '["pide","yo�urt","et","tereya��","domates sal�as�"]'),

-- 54
(N'Yanarda� Kebab�',
 N'Et ve sebzeler kar��t�r�l�r, f�r�nda �zeri k�zarana kadar pi�irilir.',
 '["et","biber","domates","so�an","baharat"]'),

-- 55
(N'Yaprak Sarmas�',
 N'Asma yapraklar� haz�rlanan har� ile doldurulur ve tencereye dizilip pi�irilir.',
 '["asma yapra��","pirin�","so�an","maydanoz","zeytinya��","tuz","baharat"]'),

-- 56
(N'Yarma �orbas�',
 N'Yarma ha�lan�r, et suyu ve baharatlar eklenir, kaynat�l�r.',
 '["yarma","et suyu","so�an","tuz","baharat"]'),

-- 57
(N'Yayla �orbas�',
 N'Yo�urt, un ve su kar��t�r�l�r, i�ine �ehriye eklenir ve kaynat�l�r.',
 '["yo�urt","un","su","�ehriye","nane","tuz"]'),

-- 58
(N'Yayla Kebab�',
 N'Et ve sebzeler f�r�nda pi�irilir, yo�urt ve sos ile servis edilir.',
 '["et","yo�urt","biber","domates","so�an","baharat"]'),

-- 59
(N'Yayla K�fte',
 N'K�yma, bulgur ve baharatlar kar��t�r�l�r, k�fte �ekli verilip pi�irilir.',
 '["k�yma","bulgur","so�an","tuz","baharat"]'),


-- 61
(N'Yenid�nya Kebab�',
 N'Et ve sebzeler pi�irilip sos ile servis edilir.',
 '["et","sebze","zeytinya��","tuz","baharat"]'),

-- 62
(N'Ye�il Domates Yeme�i',
 N'Domatesler do�ran�r, tencerede kavrulur, baharat ve su eklenir, pi�irilir.',
 '["ye�il domates","so�an","biber","zeytinya��","tuz","baharat"]'),

-- 63
(N'Ye�il Mercimek �orbas�',
 N'Ye�il mercimek y�kan�r ve su ile ha�lan�r, sebzeler eklenir ve blenderdan ge�irilir.',
 '["ye�il mercimek","so�an","havu�","su","tuz","zeytinya��"]'),

-- 64
(N'Ye�il Mercimek Plaki',
 N'Mercimek ha�lan�r, �zerine so�an, sar�msak ve baharatlar ile f�r�nlan�r.',
 '["ye�il mercimek","so�an","sar�msak","zeytinya��","tuz","baharat"]'),

-- 65
(N'Ye�il Salata',
 N'Marul, domates, salatal�k do�ran�r, zeytinya�� ve limon ile kar��t�r�l�r.',
 '["marul","domates","salatal�k","zeytinya��","limon"]'),

-- 66
(N'Ye�il So�anl� Et',
 N'Et par�alar� sebzelerle kavrulur, ye�il so�an eklenir ve pi�irilir.',
 '["et","ye�il so�an","biber","domates","tuz","baharat"]'),

-- 67
(N'Ye�il Zeytin Piyaz�',
 N'Ye�il zeytin, so�an ve maydanoz do�ran�r, limon ve zeytinya�� ile kar��t�r�l�r.',
 '["ye�il zeytin","so�an","maydanoz","limon","zeytinya��"]'),

-- 68
(N'Ye�il Zeytinli ��rek',
 N'Hamur haz�rlan�r, i�ine ye�il zeytin eklenir, f�r�nda pi�irilir.',
 '["un","ye�il zeytin","ya�","tuz"]'),


-- 70
(N'Yo�urtlu Bulgur K�ftesi',
 N'Bulgur ve yo�urt ile k�fte harc� haz�rlan�r, ha�lan�r ve servis edilir.',
 '["bulgur","yo�urt","so�an","tuz","baharat"]'),

-- 71
(N'Yo�urtlu Kebap',
 N'Et par�alar� pi�irilir, �zerine yo�urt ve sos eklenir.',
 '["et","yo�urt","biber","domates","tuz","baharat"]'),

-- 72
(N'Yo�urtlu Patates',
 N'Ha�lanm�� patates yo�urt ve sar�msak ile kar��t�r�l�r, servis edilir.',
 '["patates","yo�urt","sar�msak","tuz"]'),

-- 73
(N'Yo�urtlu Semizotu Salatas�',
 N'Semizotu, yo�urt, sar�msak ve limon ile kar��t�r�l�r.',
 '["semizotu","yo�urt","sar�msak","limon"]'),

-- 74
(N'Yo�urtlu Ufak K�fte',
 N'K�yma ve yo�urt kar��t�r�l�r, ufak k�fte �ekli verilerek pi�irilir.',
 '["k�yma","yo�urt","so�an","tuz","baharat"]'),

-- 75
(N'Y�r�k Kebab�',
 N'Et ve sebzeler f�r�nda pi�irilir, �zerine sos eklenir.',
 '["et","sebze","zeytinya��","tuz","baharat"]'),

-- 76
(N'Yufka',
 N'Un ve su ile hamur haz�rlan�r, ince a��l�r ve pi�irilir.',
 '["un","su","tuz"]'),

-- 77
(N'Yufkal� Sa� Kebab�',
 N'Yufka a��l�r, i�ine et ve sebzeler konur, sa� �zerinde pi�irilir.',
 '["yufka","et","sebze","tuz","baharat"]'),

-- 78
(N'Yumru K�fte',
 N'K�yma ve baharatlar kar��t�r�l�r, yuvarlan�r ve pi�irilir.',
 '["k�yma","so�an","tuz","baharat"]'),

-- 79
(N'Yumurta',
 N'Yumurta ha�lan�r veya omlet �eklinde pi�irilir.',
 '["yumurta","tuz","ya�"]'),

-- 80
(N'Yumurta Salatas�',
 N'Ha�lanm�� yumurta, mayonez ve baharatlar kar��t�r�l�r.',
 '["yumurta","mayonez","tuz","baharat"]'),

-- 82
(N'Yuvarlama',
 N'Et ve sebzeler tencereye al�n�r, kaynat�l�r ve pi�irilir.',
 '["et","sebze","tuz","baharat"]'),

-- 83
(N'Y�ks�k �orbas�',
 N'Tuz, un, ya� ve su ile haz�rlanan �orba kaynat�l�r.',
 '["un","ya�","su","tuz","baharat"]'),

-- 84
(N'Zerde',
 N'Safran ve pirin� ile haz�rlan�r, �ekerle tatland�r�l�r.',
 '["pirin�","�eker","safran"]'),

-- 85
(N'Zeytinya�l� Bakla',
 N'Baklalar do�ran�r, zeytinya�� ve so�anla pi�irilir.',
 '["bakla","so�an","zeytinya��","tuz"]'),

-- 86
(N'Zeytinya�l� Barbunya Plaki',
 N'Barbunya ha�lan�r, �zerine so�an ve zeytinya�� eklenir ve f�r�nlan�r.',
 '["barbunya","so�an","zeytinya��","tuz"]'),

-- 87
(N'Zeytinya�l� Enginar',
 N'Enginarlar temizlenir, zeytinya�� ve sebzelerle pi�irilir.',
 '["enginar","so�an","havu�","zeytinya��","tuz"]');
