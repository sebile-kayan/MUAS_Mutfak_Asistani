CREATE TABLE Products (
    productsid INT IDENTITY(1,1) PRIMARY KEY,   -- Ürün ID
    user_id INT NOT NULL,                       -- Bu ürün kime ait (Users FK)
    pname NVARCHAR(150) NOT NULL,               -- Ürün adý
    pbrand NVARCHAR(100) NULL,                  -- Marka (opsiyonel)
    pbarcode NVARCHAR(100) NULL,                -- QR / Barkod (opsiyonel)
    pexpire_date DATE NOT NULL,                 -- Son kullanma tarihi (STK)
    pquantity DECIMAL(10,2) NOT NULL DEFAULT 0, -- Miktar
    punit NVARCHAR(20) NULL,                    -- Birim (adet, kg vs.)
    pcreated_at DATE DEFAULT GETDATE(),         -- Eklenme tarihi
    status NVARCHAR(20) DEFAULT 'mevcut' CHECK (status IN ('mevcut','tüketildi','silindi')),   -- Durum: mevcut / tüketildi / silindi
    CONSTRAINT FK_Products_Users FOREIGN KEY (user_id) REFERENCES Users(id)    --constraint, bu foreign key yapýsýný isimlendirme için var ilerde kolaylýk
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

-- Performans için index (user_id + is_read üzerinde)
CREATE INDEX idx_notifications_user_read
ON notifications(user_id, is_read);
--bildirim eklemede kiþiye özel ve global olabilmesi için foreigm keyi sildik sonra null olabilir yaptýk
-- Önce mevcut foreign key’i sil (çünkü user_id þu an NOT NULL olduðu için deðiþtiremiyoruz):
ALTER TABLE notifications
DROP CONSTRAINT FK_notifications_users;
--user_id kolonunu NULL yapýlabilir hale getir (yani boþ býrakýlabilir, herkese bildirim için gerekli):
ALTER TABLE notifications
ALTER COLUMN user_id INT NULL;
--Tekrar foreign key ekle (artýk NULL deðerleri kabul eder):
ALTER TABLE notifications
ADD CONSTRAINT FK_notifications_users
FOREIGN KEY (user_id) REFERENCES users(id);
--(Opsiyonel ama tavsiye edilir) Bildirimin herkese mi özel mi olduðunu kolayca anlamak için yeni bir kolon ekle:
ALTER TABLE notifications
ADD is_global BIT DEFAULT 0;





CREATE TABLE Recipes (
    id INT IDENTITY(1,1) PRIMARY KEY,        -- Tarif ID
    user_id INT NOT NULL,                    -- Tarifi ekleyen kullanýcý (Users FK)
    title NVARCHAR(200) NOT NULL,            -- Tarif baþlýðý
    instructions NVARCHAR(MAX) NOT NULL,     -- Tarif açýklamasý / metni
    created_at DATE DEFAULT GETDATE(),       -- Eklenme tarihi
    CONSTRAINT FK_Recipes_Users FOREIGN KEY (user_id) REFERENCES Users(id)   -- Foreign Key
);




CREATE TABLE News (
    newsid INT IDENTITY(1,1) PRIMARY KEY,        -- Haber ID
    user_id INT NOT NULL,                        -- Haberi ekleyen kullanýcý (Users FK)
    ntitle NVARCHAR(200) NOT NULL,               -- Haber baþlýðý
    ncontent NVARCHAR(MAX) NOT NULL,             -- Haber metni veya URL
    ncreated_at DATE DEFAULT GETDATE(),          -- Yayýn tarihi
    CONSTRAINT FK_News_Users FOREIGN KEY (user_id) REFERENCES Users(id)   -- Foreign Key
);
ALTER TABLE News
DROP CONSTRAINT FK_News_Users;
ALTER TABLE News
DROP COLUMN user_id;



CREATE TABLE ShoppingLists (
    list_id INT IDENTITY(1,1) PRIMARY KEY,       -- Alýþveriþ listesi ID
    user_id INT NOT NULL,                        -- Listeyi oluþturan kullanýcý (Users FK)
    list_name NVARCHAR(200) NULL,                -- Listenin adý (opsiyonel)
    created_at DATE DEFAULT GETDATE(),           -- Listenin oluþturulma tarihi
    CONSTRAINT FK_ShoppingLists_Users FOREIGN KEY (user_id) REFERENCES Users(id)   -- Foreign Key
);
CREATE TABLE ShoppingListItems (
    item_id INT IDENTITY(1,1) PRIMARY KEY,       -- Liste öðesi ID
    list_id INT NOT NULL,                        -- Baðlý olduðu liste (ShoppingLists FK)
    product_name NVARCHAR(200) NOT NULL,         -- Ürün adý (örn: Domates, Salatalýk)
    is_checked BIT DEFAULT 0,                    -- Ýþaretli mi? (0 = Hayýr, 1 = Evet)
    created_at DATE DEFAULT GETDATE(),           -- Eklenme tarihi
    CONSTRAINT FK_ShoppingListItems_Lists FOREIGN KEY (list_id) REFERENCES ShoppingLists(list_id)   -- Foreign Key
);

