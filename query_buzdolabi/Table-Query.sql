CREATE TABLE Products (
    productsid INT IDENTITY(1,1) PRIMARY KEY,   -- �r�n ID
    user_id INT NOT NULL,                       -- Bu �r�n kime ait (Users FK)
    pname NVARCHAR(150) NOT NULL,               -- �r�n ad�
    pbrand NVARCHAR(100) NULL,                  -- Marka (opsiyonel)
    pbarcode NVARCHAR(100) NULL,                -- QR / Barkod (opsiyonel)
    pexpire_date DATE NOT NULL,                 -- Son kullanma tarihi (STK)
    pquantity DECIMAL(10,2) NOT NULL DEFAULT 0, -- Miktar
    punit NVARCHAR(20) NULL,                    -- Birim (adet, kg vs.)
    pcreated_at DATE DEFAULT GETDATE(),         -- Eklenme tarihi
    status NVARCHAR(20) DEFAULT 'mevcut' CHECK (status IN ('mevcut','t�ketildi','silindi')),   -- Durum: mevcut / t�ketildi / silindi
    CONSTRAINT FK_Products_Users FOREIGN KEY (user_id) REFERENCES Users(id)    --constraint, bu foreign key yap�s�n� isimlendirme i�in var ilerde kolayl�k
);




CREATE TABLE Users (
  id INT IDENTITY(1,1) PRIMARY KEY,
  ad NVARCHAR(150) NOT NULL,
  email NVARCHAR(150) NOT NULL UNIQUE,
  password_hash NVARCHAR(255) NOT NULL,
  salt NVARCHAR(255) NOT NULL,
  created_at DATETIME DEFAULT GETDATE()
);




-- .Bildirimler tablosu
CREATE TABLE notifications (
    id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT NOT NULL,
    message NVARCHAR(255) NOT NULL,
    is_read BIT DEFAULT 0,
    created_at DATETIME DEFAULT GETDATE(),
    type NVARCHAR(50) NULL
);
-- Foreign Key: notifications.user_id -> users.id
ALTER TABLE notifications
ADD CONSTRAINT FK_notifications_users
FOREIGN KEY (user_id) REFERENCES users(id);

-- Performans i�in index (user_id + is_read �zerinde)
CREATE INDEX idx_notifications_user_read
ON notifications(user_id, is_read);
--bildirim eklemede ki�iye �zel ve global olabilmesi i�in foreigm keyi sildik sonra null olabilir yapt�k
-- �nce mevcut foreign key�i sil (��nk� user_id �u an NOT NULL oldu�u i�in de�i�tiremiyoruz):
ALTER TABLE notifications
DROP CONSTRAINT FK_notifications_users;
--user_id kolonunu NULL yap�labilir hale getir (yani bo� b�rak�labilir, herkese bildirim i�in gerekli):
ALTER TABLE notifications
ALTER COLUMN user_id INT NULL;
--Tekrar foreign key ekle (art�k NULL de�erleri kabul eder):
ALTER TABLE notifications
ADD CONSTRAINT FK_notifications_users
FOREIGN KEY (user_id) REFERENCES users(id);
--(Opsiyonel ama tavsiye edilir) Bildirimin herkese mi �zel mi oldu�unu kolayca anlamak i�in yeni bir kolon ekle:
ALTER TABLE notifications
ADD is_global BIT DEFAULT 0;





CREATE TABLE Recipes (
    id INT IDENTITY(1,1) PRIMARY KEY,        -- Tarif ID
    user_id INT NOT NULL,                    -- Tarifi ekleyen kullan�c� (Users FK)
    title NVARCHAR(200) NOT NULL,            -- Tarif ba�l���
    instructions NVARCHAR(MAX) NOT NULL,     -- Tarif a��klamas� / metni
    created_at DATE DEFAULT GETDATE(),       -- Eklenme tarihi
    CONSTRAINT FK_Recipes_Users FOREIGN KEY (user_id) REFERENCES Users(id)   -- Foreign Key
);




CREATE TABLE News (
    newsid INT IDENTITY(1,1) PRIMARY KEY,        -- Haber ID
    user_id INT NOT NULL,                        -- Haberi ekleyen kullan�c� (Users FK)
    ntitle NVARCHAR(200) NOT NULL,               -- Haber ba�l���
    ncontent NVARCHAR(MAX) NOT NULL,             -- Haber metni veya URL
    ncreated_at DATE DEFAULT GETDATE(),          -- Yay�n tarihi
    CONSTRAINT FK_News_Users FOREIGN KEY (user_id) REFERENCES Users(id)   -- Foreign Key
);
ALTER TABLE News
DROP CONSTRAINT FK_News_Users;
ALTER TABLE News
DROP COLUMN user_id;



CREATE TABLE ShoppingLists (
    list_id INT IDENTITY(1,1) PRIMARY KEY,       -- Al��veri� listesi ID
    user_id INT NOT NULL,                        -- Listeyi olu�turan kullan�c� (Users FK)
    list_name NVARCHAR(200) NULL,                -- Listenin ad� (opsiyonel)
    created_at DATE DEFAULT GETDATE(),           -- Listenin olu�turulma tarihi
    CONSTRAINT FK_ShoppingLists_Users FOREIGN KEY (user_id) REFERENCES Users(id)   -- Foreign Key
);
CREATE TABLE ShoppingListItems (
    item_id INT IDENTITY(1,1) PRIMARY KEY,       -- Liste ��esi ID
    list_id INT NOT NULL,                        -- Ba�l� oldu�u liste (ShoppingLists FK)
    product_name NVARCHAR(200) NOT NULL,         -- �r�n ad� (�rn: Domates, Salatal�k)
    is_checked BIT DEFAULT 0,                    -- ��aretli mi? (0 = Hay�r, 1 = Evet)
    created_at DATE DEFAULT GETDATE(),           -- Eklenme tarihi
    CONSTRAINT FK_ShoppingListItems_Lists FOREIGN KEY (list_id) REFERENCES ShoppingLists(list_id)   -- Foreign Key
);

