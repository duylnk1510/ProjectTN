use master
go

if exists (select *
from sys.databases
where name=N'Project')
	drop database Project
go

create database Project
go
use Project
go

CREATE TABLE Categories
(
    Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Name NVARCHAR(50) NOT NULL,
    IsDeleted BIT DEFAULT 0 NOT NULL
)

CREATE TABLE Brands
(
    Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    IsDeleted BIT DEFAULT 0 NOT NULL,
    Name NVARCHAR(250) NOT NULL
)

CREATE TABLE Products
(
    Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Name NVARCHAR(50) NOT NULL,
    Image NVARCHAR(50) NOT NULL,
    Price FLOAT NOT NULL,
    CreateDate DATE NOT NULL,
    Available BIT DEFAULT 0 NOT NULL,
    CategoryId INT NOT NULL,
    BrandId INT NOT NULL,
    Discription NVARCHAR(500) NULL,
    FOREIGN KEY(CategoryId) REFERENCES Categories(Id),
    FOREIGN KEY(BrandId) REFERENCES Brands(Id)
)

CREATE TABLE Accounts
(
    Username NVARCHAR(50) PRIMARY KEY NOT NULL,
    Password NVARCHAR(50) NOT NULL,
    Fullname NVARCHAR(50) NOT NULL,
    PhoneNumber VARCHAR(15) NOT NULL,
    Email NVARCHAR(50) NOT NULL,
    Photo NVARCHAR(50) NULL,
    IsDeleted BIT DEFAULT 0 NOT NULL
)

CREATE TABLE Discounts
(
    Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Name NVARCHAR(50) NOT NULL,
    Percentage INT NOT NULL,
    CreateDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    ProductId INT NOT NULL,
    CreateBy NVARCHAR(50) NOT NULL,
    FOREIGN KEY(ProductId) REFERENCES Products(Id),
    FOREIGN KEY(CreateBy) REFERENCES Accounts(Username)
)

CREATE TABLE ProductPhotos 
(
    Id VARCHAR(100) PRIMARY KEY NOT NULL,
    ProductId INT NOT NULL,
    FOREIGN KEY(ProductId) REFERENCES Products(Id)
)


CREATE TABLE Orders
(
    Id BIGINT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Username NVARCHAR(50) NOT NULL,
    CreateDate DATETIME NOT NULL,
    Address NVARCHAR(100) NOT NULL,
    OrderStatus NVARCHAR(25)  NOT NULL,
    Note NVARCHAR(300) NULL,
    FOREIGN KEY(Username) REFERENCES Accounts(Username)
)



CREATE TABLE OrderDetails
(
    Id BIGINT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    OrderId BIGINT NOT NULL,
    ProductId INT NOT NULL,
    Price FLOAT NOT NULL,
    Quantity INT NOT NULL,
    FOREIGN KEY(OrderId) REFERENCES Orders(Id),
    FOREIGN KEY(ProductId) REFERENCES Products(Id)
)

CREATE TABLE Roles
(
    Id NVARCHAR(10) PRIMARY KEY NOT NULL,
    Name NVARCHAR(50) NOT NULL
)

CREATE TABLE Authorities
(
    Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Username NVARCHAR(50) NOT NULL,
    RoleId NVARCHAR(10) NOT NULL,
    FOREIGN KEY(Username) REFERENCES Accounts(Username),
    FOREIGN KEY(RoleId) REFERENCES Roles(Id)
)

CREATE TABLE ProductLikes
(
    Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    IsLiked BIT DEFAULT 0 NULL,
    ProductId INT NOT NULL,
    Username NVARCHAR(50) NOT NULL,
    FOREIGN KEY(ProductId) REFERENCES Products(Id),
    FOREIGN KEY(Username) REFERENCES Accounts(Username)
)

CREATE TABLE ProductEvalutions (
    Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Evalution INT DEFAULT 0 NULL,
    Comment NVARCHAR(250) NULL,
    ProductId INT NOT NULL,
    Username NVARCHAR(50) NOT NULL,
    FOREIGN KEY(ProductId) REFERENCES Products(Id),
    FOREIGN KEY(Username) REFERENCES Accounts(Username)
)


SELECT * FROM Accounts
-- Account
INSERT INTO Accounts (Username, Password, Fullname, PhoneNumber, Email, Photo, IsDeleted)
VALUES ('haonqn', '123', N'Nguyễn Quang Nhật Hào', '0988828888', 'hao@gmail.com', 'hao.jpg', 0);
INSERT INTO Accounts (Username, Password, Fullname, PhoneNumber, Email, Photo, IsDeleted)
VALUES ('duylnk', '123', N'Lê Nguyễn Khánh Duy', '0988828888', 'duy@gmail.com', 'duy.jpg', 0);
INSERT INTO Accounts (Username, Password, Fullname, PhoneNumber, Email, Photo, IsDeleted)
VALUES ('thangtq', '123', N'Trần Quốc Thắng', '0328162039', 'thang@gmail.com', 'thang.jpg', 0);
INSERT INTO Accounts (Username, Password, Fullname, PhoneNumber, Email, Photo, IsDeleted)
VALUES ('datnq', '123', N'Nguyễn Quốc Đạt', '0988828888', 'datGoVap@gmail.com', 'dat.jpg', 0);
INSERT INTO Accounts (Username, Password, Fullname, PhoneNumber, Email, Photo, IsDeleted)
VALUES ('hieulq', '123', N'Lữ Quang Hiếu', '0988828888', 'hieu@gmail.com', 'hieu.jpg', 0);
INSERT INTO Accounts (Username, Password, Fullname, PhoneNumber, Email, Photo, IsDeleted)
VALUES ('phuocnhh', '123', N'NNguyễn Hữu Hải Phước', '0988828888', 'phuoc@gmail.com', 'phuoc.jpg', 0);

INSERT INTO Accounts (Username, Password, Fullname, PhoneNumber, Email, Photo, IsDeleted)
VALUES ('user1', '123', N'Na', '0988828888', 'na@gmail.com', 'na.jpg', 0);

select * from Categories

INSERT INTO Categories ( Name, IsDeleted)
VALUES (N'Laptop', 0);
INSERT INTO Categories ( Name, IsDeleted)
VALUES (N'Phụ kiện Laptop', 0);
INSERT INTO Categories ( Name, IsDeleted)
VALUES (N'Thiết bị lưu trữ, dự phòng', 0);
INSERT INTO Categories ( Name, IsDeleted)
VALUES (N'Thiết bị nghe nhìn', 0);
INSERT INTO Categories ( Name, IsDeleted)
VALUES (N'Linh kiện máy tính', 0);
INSERT INTO Categories ( Name, IsDeleted)
VALUES (N'Apple chính hãng', 0);
INSERT INTO Categories ( Name, IsDeleted)
VALUES (N'Thiết bị ngoại vi', 0);

INSERT INTO Brands (IsDeleted, Name)
VALUES (0,'Laptop Dell');
INSERT INTO Brands (IsDeleted, Name)
VALUES (0,'Laptop Asus');
INSERT INTO Brands (IsDeleted, Name)
VALUES (0,'Laptop HP');
INSERT INTO Brands (IsDeleted, Name)
VALUES (0,'Laptop MSI');
INSERT INTO Brands (IsDeleted, Name)
VALUES (0,'Laptop LG');
INSERT INTO Brands (IsDeleted, Name)
VALUES (0,'Laptop Lenovo');
INSERT INTO Brands (IsDeleted, Name)
VALUES (0,'Laptop Acer');
INSERT INTO Brands (IsDeleted, Name)
VALUES (0,'Laptop Intel');
INSERT INTO Brands (IsDeleted, Name)
VALUES (0,'Laptop Avita');


INSERT INTO Products(Name, Image, Price, CreateDate, Available, CategoryId, BrandId, Discription)
VALUES('Laptop Asus Vivobook A415EA-EB1750W', 'laptop_asus1.jpg', 11490000, '2022-10-4',0,1,2,'CPU Intel Core i3-1125G4 (8MB, up to 3.70GHz,)
Ram 8GB DDR4 onboard,
SSD 256GB M.2 NVMe PCIe 3.0,
VGA Intel UHD Graphics,
Display 14.0Inch FHD IPS Anti-Glare,
Pin 3Cell 42WHrs,
Finger Print,
Color Transparent Silver (Bạc),
Weight 1.40 kg,
OS Windows 11 Home 64 bits')
INSERT INTO Products(Name, Image, Price, CreateDate, Available, CategoryId, BrandId, Discription)
VALUES('Laptop Asus Vivobook 15X OLED A1503ZA-L1421W', 'laptop_asus_2.jpg', 18590000, '2022-10-4',0,1,2,'CPU Intel® Core™ i5-12500H Processor (18MB cache, up to 4.5GHz), 
Ram 8GB DDR4 Onboard, 
SSD 512GB M.2 NVMe™ PCIe® 3.0, 
VGA Intel® Iris® Xe Graphics, 
Display 15.6Inch OLED FHD (1920 x 1080) 16:9, 0.2ms, 600nits, 100% DCI-P3 color gamut, PANTONE Validated, 
Pin 3Cell Li-ion, 70WHrs, 
Tính năng Finger Print, 
Backlit Chiclet Keyboard, 
Color Silver (Bạc), 
Weight 1.70 kg, 
OS Windows 11 Home SL')
INSERT INTO Products(Name, Image, Price, CreateDate, Available, CategoryId, BrandId, Discription)
VALUES('Laptop Asus ZenBook 13 OLED UX325EA-KG656W', 'laptop_asus3.jpg', 18490000, '2022-10-4',0,1,2,'CPU Intel Core i5-1135G7 (8MB, upto 4.20GHz), 
RAM 8GB LPDDR4X 4266MHz onboard, 
SSD 512GB M.2 NVMe PCIe 3.0, 
Display 13.3Inch FHD WV OLED 400nits Glare, 
VGA Intel Iris Xe Graphics, 
Pin 4Cell 67WHrs, 
Color Pine Grey (Xám thông), 
Weight 1.11 kg, 
OS Windows 11 Home SL')
INSERT INTO Products(Name, Image, Price, CreateDate, Available, CategoryId, BrandId, Discription)
VALUES('Laptop Gaming ASUS TUF Dash F15 FX517ZM-HN480W', 'laptop_asus4.jpg', 29890000, '2022-10-4',0,1,2,'CPU Intel® Core™ i7-12650H Processor (24MB Cache, up to 4.70GHz), 
RAM 8GB DDR5-4800Mhz SO-DIMM (2 slots So-Dimm), 
SSD 512GB M.2 NVMe PCIe 3.0, 
VGA NVIDIA® GeForce RTX™ 3060 6GB GDDR6 + Intel® Iris Xᵉ Graphics, 
Display 15.6inch FHD IPS, Anti-Glare, 144Hz, AdaptiveSync, 
Pin 4-cell Li-ion, 76WHrs, 4S1P, 
Weight 2.00 kg, 
Color Black (Đen), 
OS Windows 11 Home SL')
INSERT INTO Products(Name, Image, Price, CreateDate, Available, CategoryId, BrandId, Discription)
VALUES('Laptop Asus X515EA-BQ3015W', 'laptop_asus5.jpg', 15990000, '2022-10-4',0,1,2,'CPU Intel® Core™ i7-1165G7 (12MB, upto 4.70GHz), 
RAM 8GB DDR4 3200Mhz, 
SSD 512GB M.2 NVMe PCIe, 
Display 15.6Inch FHD Anti-Glare 45%NTSC, 
VGA Intel Iris Xe Graphics, 
Pin 2Cell 37WHrs, 
Color Bạc, 
Finger Print, 
Weight 1.80 kg, 
OS Windows 11 Home SL')

	  --********************************  DELL   *************************************--

INSERT INTO Products(Name, Image, Price, CreateDate, Available, CategoryId, BrandId, Discription)
VALUES('Laptop Dell Latitude 3520 70267108', 'lap_dell_1.jpg', 11350000, '2022-10-4',0,1,1,'CPU Intel Core i3-1115G4 (6MB, up to 4.10GHz), 
RAM 4GB DDR4 3200MHz, 
SSD 256GB M.2 PCIe NVMe Gen3 x4, 
VGA Intel UHD Graphics, 
Display 15.6Inch FHD WVA Anti-glare 60Hz, 
Pin 3Cell 41WHrs, 
Color Black (Đen), 
Weight 1.79 kg, 
OS Windows 11 Home')
INSERT INTO Products(Name, Image, Price, CreateDate, Available, CategoryId, BrandId, Discription)
VALUES('Laptop Dell Latitude 3420 70264504', 'lap_dell_2.jpg', 11250000, '2022-10-4',0,1,1,'CPU Intel Core i3-1115G4 (6MB, 3.0GHz up to 4.10GHz), 
RAM 4GB DDR4 3200MHz, 
SSD 256GB M.2 PCIe NVMe, 
VGA Intel UHD Graphics, 
Display 14inch FHD Anti-Glare, 
Camera & Microphone, 
Pin 3Cell 41WHrs, 
Color Black (Đen), 
Weight 1.52 kg, 
OS Windows 10 Home')
INSERT INTO Products(Name, Image, Price, CreateDate, Available, CategoryId, BrandId, Discription)
VALUES('Laptop Dell Inspiron 3511 70270652', 'lap_del_3.jpg', 22090000, '2022-10-4',0,1,1,'CPU Intel Core i7-1165G7 (12MB, up to 4.70GHz), 
RAM 16GB DDR4 3200MHz (8GB + 8GB AKC tặng), 
SSD 512GB M.2 PCIe NVMe, 
VGA NVIDIA GeForce MX350 2GB GDDR5, 
Display 15.6Inch FHD WVA Anti-Glare 60Hz, 
Pin 3Cell 41WHrs, 
Color Platinum Silver (Bạc), 
Finger Print, 
Weight 1.85 kg, 
OS Windows 11 Home + Office 2021')
INSERT INTO Products(Name, Image, Price, CreateDate, Available, CategoryId, BrandId, Discription)
VALUES('Laptop Gaming Dell G15 5515 70266675', 'lap_dell_4.jpg', 25990000, '2022-10-4',0,1,1,'CPU AMD Ryzen R7-5800H (16MB, up to 4.40GHz), 
RAM 16GB DDR4 3200MHz (2x8GB), 
SSD 512GB M.2 PCIe NVMe, 
VGA NVIDIA GeForce RTX 3050Ti 4GB GDDR6, 
Display 15.6Inch FHD WVA Anti-Glare 120Hz, 
Pin 3Cell 56WHrs, 
Color Phantom Grey (Xám), 
English Single Backlit Keyboard, 
Weight 2.57 kg, 
OS Windows 11 Home + Office HS 2021')
INSERT INTO Products(Name, Image, Price, CreateDate, Available, CategoryId, BrandId, Discription)
VALUES('Laptop Gaming Dell Alienware M15 R6 P109F001ABL', 'lap_dell_5.jpg', 53990000, '2022-10-4',0,1,1,'CPU Intel Core i7-11800H (24MB, up to 4.60GHz), 
RAM 32GB DDR4 3200MHz, 
SSD 1TB M.2 PCIe NVMe, 
VGA NVIDIA GeForce RTX 3060 6GB GDDR6, 
Display 15.6Inch QHD WVA 240Hz 2ms, 
Pin 6Cell 86WHrs, 
Color Đen Xám, 
Alienware CherryMX ultra low-profile mechanical keyboard with per-key AlienFX RGB - US/International, 
Weight 2.69 kg, 
OS Windows 10 Home + Office HS 2019')

	  --********************************   HP  *************************************--

INSERT INTO Products(Name, Image, Price, CreateDate, Available, CategoryId, BrandId, Discription)
VALUES('Laptop HP ProBook 440 G9 6M0X8PA', 'lap_hp_1.jpg', 24990000, '2022-10-4',0,1,3,'CPU Intel Core i7-1255U (12MB, up to 4.70GHz), 
RAM 16GB DDR4 3200MHz, 
SSD 512GB PCIe NVMe M.2, 
Display 14.0Inch FHD (1920 x 1080) LED UWVA Anti-Glare, 250nits, 
VGA Intel Iris Xe Graphics, 
Pin 3Cell 45WHrs, 
Color Silver (Bạc), 
Finger Print, 
Weight 1.38 kg, 
OS Windows 11 Home 64')
INSERT INTO Products(Name, Image, Price, CreateDate, Available, CategoryId, BrandId, Discription)
VALUES('Laptop HP Pavilion X360 14-ek0055TU 6L293PA', 'lap_hp_2.jpg', 24390000, '2022-10-4',0,1,3,'CPU Intel Core i7-1255U (12MB, upto 4.70GHz), 
RAM 16GB DDR4 3200MHz Onboard, 
SSD 512GB PCIe® NVMe™ M.2, 
Display 14Inch FHD (1920 x 1080) Touch, IPS, edge-to-edge glass, micro-edge, 250 nits, 45% NTSC, 
VGA Intel® Iris® Xe Graphics, 
Pin 3Cell 43WHrs, 
Color Vàng Hồng, 
Weight 1.5 kg, 
Tính năng: Bảo mật vân tay, 
OS Windows 11 Home SL')
INSERT INTO Products(Name, Image, Price, CreateDate, Available, CategoryId, BrandId, Discription)
VALUES('Laptop HP VICTUS 16-e0177AX 4R0U9PA', 'lap_hp_3.jpg', 15690000, '2022-10-4',0,1,3,'CPU AMD Ryzen R5-5600H (16MB, up to 4.20GHz), 
RAM 8GB DDR4 3200MHz (2x4GB), 
SSD 512GB PCIe NVMe M.2, 
Display 16.1Inch FHD IPS 144Hz Anti-glare, 
VGA NVIDIA GeForce GTX 1650 4GB GDDR6, 
Pin 4Cell 70WHrs, 
Color Đen, 
Weight 2.46 kg, 
OS Windows 11 Home 64')
INSERT INTO Products(Name, Image, Price, CreateDate, Available, CategoryId, BrandId, Discription)
VALUES('Laptop HP Probook 450 G9 6M0Z9PA Sliver', 'lap_hp_4.jpg', 25190000, '2022-10-4',0,1,3,'CPU Intel Core i7-1255U (12MB, up to 4.740GHz), 
RAM 16GB DDR4 3200MHz, 
SSD 512GB PCIe NVMe, 
Display 15.6Inch FHD Anti-Glare, 
VGA Intel® Iris® Xᵉ Graphics, 
Pin 3Cell 45WHrs, 
Color Silver (Bạc), 
Vỏ Alu, Led Keyboard, 
Finger Print, 
Weight 1.74 kg, 
OS Windows 11 SL')
INSERT INTO Products(Name, Image, Price, CreateDate, Available, CategoryId, BrandId, Discription)
VALUES('Laptop HP Probook 450 G8 2H0W5PA', 'lap_hp_5.jpg', 23890000, '2022-10-4',0,1,3,'CPU Intel Core i7-1165G7 (12MB, up to 4.70GHz), 
RAM 8GB DDR4 3200MHz (1x8GB), 
SSD 512GB PCIe NVMe, 
Display 15.6Inch FHD IPS Anti-Glare, 
VGA Intel Iris Xᵉ Graphics, 
Pin 3Cell 45WHrs, 
Color Silver (Bạc), 
Vỏ Alu, Led Keyboard, 
Fingerprint, 
Weight 1.74 kg, 
OS Windows 10 SL')

	  --*********************************   MSI   ************************************--

INSERT INTO Products(Name, Image, Price, CreateDate, Available, CategoryId, BrandId, Discription)
VALUES('Laptop MSI Modern 15 A11MU 680VN', 'lap_msi_1.jpg', 14290000, '2022-10-4',0,1,4,'CPU Intel Core i5-1155G7 (8MB, up to 4.50GHz), 
RAM 16GB DDR4 3200MHz (8G + 8GB AKC tặng), 
SSD 512GB NVMe PCIe Gen3x4, 
VGA Intel Iris Xe Graphics, 
Display 15.6inch FHD IPS 60Hz 45%NTSC, 
Color Carbon Gray (Xám), 
Pin 3Cell 39WHrs, 
Weight 1.60 kg, 
OS Windows 10 Home')
INSERT INTO Products(Name, Image, Price, CreateDate, Available, CategoryId, BrandId, Discription)
VALUES('Laptop MSI GF63 Thin 11SC 665VN', 'lap_msi_2.jpg', 16390000, '2022-10-4',0,1,4,'CPU Intel Core i5-11400H (12MB, up to 4.50GHz), 
RAM 8GB DDR4 3200MHz, 
SSD 512GB NVMe PCIe, 
VGA NVIDIA GeForce GTX 1650 Max-Q 4GB GDDR6, 
Display 15.6Inch FHD IPS 144Hz 45%NTSC, 
Pin 3Cell 51WHrs, 
Color Black (Đen), 
Backlight Keyboard (Single-Color, Red), 
Weight 1.86 kg, 
OS Windows 11 Home')
INSERT INTO Products(Name, Image, Price, CreateDate, Available, CategoryId, BrandId, Discription)
VALUES('Laptop MSI GS66 Stealth 11UG 210VN', 'lap_msi_3.jpg', 64990000, '2022-10-4',0,1,4,'CPU Intel Core i7-11800H (24MB, up to 4.60GHz), 
RAM 32GB DDR4 3200MHz (2x16GB), 
SSD 2TB NVMe PCIe Gen4x4, 
VGA NVIDIA GeForce RTX 3070 Max-Q 8GB GDDR6, 
Display 15.6Inch FHD 360Hz 100%sRGB, 
Pin 4Cell 99.9WHrs, 
Per key RGB steelseries Keyboard, 
Color Core Black (Đen), 
Weight 2.10 kg, 
OS Windows 10 Home SEA')
INSERT INTO Products(Name, Image, Price, CreateDate, Available, CategoryId, BrandId, Discription)
VALUES('Laptop MSI Katana GF66 12UCK 804VN', 'lap_msi_4.jpg', 26990000, '2022-10-4',0,1,4,'CPU Intel Core i7-12650H (24MB, up to 4.70GHz), 
RAM 16GB DDR4 3200MHz (2x8GB), 
SSD 512GB NVMe PCIe Gen3x4, 
VGA NVIDIA GeForce RTX 3050 4GB GDDR6, 
Display 15.6Inch FHD IPS 144Hz 45%NTSC, 
Pin 3Cell 53.5WHrs, 
Color Black (Đen), 
RGB Keyboard, 
Weight 2.25 kg, 
OS Windows 11 Home')
INSERT INTO Products(Name, Image, Price, CreateDate, Available, CategoryId, BrandId, Discription)
VALUES('Laptop MSI Titan GT77 12UHS 204VN', 'lap_msi_5.jpg', 127390000, '2022-10-4',0,1,4,'CPU Intel Core i9-12900HX (30MB, up to 5.00GHz), 
RAM 64GB DDR5 4800MHz (2x32GB), 
SDD 2TB NVMe PCIe Gen4x4, 
VGA NVIDIA GeForce RTX 3080Ti 16GB GDDR6, 
Display 17.3Inch UHD 120Hz 100%DCI-P3, 
Pin 4Cell 99.9WHrs, 
Color Core Black, 
Weight 3.30 kg, 
OS Windows 11 Home')

	  --*********************************   LG  ************************************--

INSERT INTO Products(Name, Image, Price, CreateDate, Available, CategoryId, BrandId, Discription)
VALUES('Laptop LG Gram 2021 17Z90P-G.AH78A5', 'lap_lg_1.jpg', 39290000, '2022-10-4',0,1,5,'CPU Intel Core i7-1165G7 (12MB, upto 4.70GHz), 
RAM 16GB LPDDR4X 4266MHz Onboard, 
SSD 1TB PCIe NVMe M.2, 
Display 17.0Inch WQXGA 16:10 IPS, 
VGA Intel Iris Xe Graphics, 
Pin 80WHr, 
Color Obsidian Black (Đen), 
Finger Print, 
Weight 1.35 kg, 
OS Windows 10 Home')
INSERT INTO Products(Name, Image, Price, CreateDate, Available, CategoryId, BrandId, Discription)
VALUES('Laptop LG Gram 2022 16ZD90Q-G.AX72A5', 'lap_lg_2.jpg', 38390000, '2022-10-4',0,1,5,'CPU Intel Core i7-1260P (18MB, up to 4.70GHz), 
RAM 16GB LPDDR5 5200MHz, 
SSD 256GB PCIe NVMe M.2, 
Display 16.0Inch WQXGA 16:10 IPS PoL 99%DCI-P3 350nits, 
VGA Intel Iris Xe Graphics, 
Pin 80WHrs, 
Color Obsidian Black (Đen), 
Finger Print, 
Weight 1199 g, 
No OS')
INSERT INTO Products(Name, Image, Price, CreateDate, Available, CategoryId, BrandId, Discription)
VALUES('Laptop LG Gram 2022 14Z90Q-G.AJ32A5', 'lap_lg_3.jpg', 24890000, '2022-10-4',0,1,5,'CPU Intel Core i3-12th, 
RAM 8GB LPDDR5 5200MHz, 
SSD 256GB PCIe NVMe M.2, 
Display 14.0Inch WUXGA 16:10 IPS PoL 99%DCI-P3 350nits, 
VGA Intel UHD Graphics, 
Pin 72WHrs, 
Color Obsidian Black (Đen), 
Finger Print, 
Weight 999 g, 
OS Windows 11 Home')
INSERT INTO Products(Name, Image, Price, CreateDate, Available, CategoryId, BrandId, Discription)
VALUES('Laptop LG Gram 2022 17Z90Q-G.AH78A5', 'lap_lg_4.jpg', 45590000, '2022-10-4',0,1,5,'CPU Intel Core i7-1260P (18MB, up to 4.70GHz), 
RAM 16GB LPDDR5 5200MHz, 
SSD 1TB PCIe NVMe M.2, 
Display 17.0Inch WQXGA 16:10 IPS PoL 99%DCI-P3 350nits, 
VGA Intel Iris Xe Graphics, 
Pin 80WHrs, 
Color Obsidian Black (Đen), 
Finger Print, 
Weight 1350 g, 
OS Windows 11 Home')
INSERT INTO Products(Name, Image, Price, CreateDate, Available, CategoryId, BrandId, Discription)
VALUES('Laptop LG Gram 2022 14ZD90Q-G.AX31A5', 'lap_lg_5.jpg', 22190000, '2022-10-4',0,1,5,'CPU Intel Core i3-12th, 
RAM 8GB LPDDR5 5200MHz, 
SSD 256GB PCIe NVMe M.2, 
Display 14.0Inch WUXGA 16:10 IPS PoL 99%DCI-P3 350nits, 
VGA Intel UHD Graphics, 
Pin 72WHrs, 
Color White (Trắng Tuyết), 
Finger Print, 
Weight 999 g, 
No OS')

	  --********************************* LENOVO *********************************--

INSERT INTO Products(Name, Image, Price, CreateDate, Available, CategoryId, BrandId, Discription)
VALUES('Laptop Lenovo ThinkPad E14 Gen 4 21E300DQVA', 'lap_le_1.jpg', 18790000, '2022-10-4',0,1,6,'CPU Intel Core i5-1235U (12MB Cache, upto 4.40GHz), 
RAM 8GB DDR4 3200MHz Onboard, 
SSD 256GB M.2 2242 PCIe 4.0x4 NVMe Opal2, 
VGA Intel Iris Xe Graphics, 
Display 14.0Inch FHD IPS 300nits Anti-glare, 45% NTSC, 
Pin 3Cell 45WHrs, 
Color Black (Đen), 
Finger Print, 
Weight 1.64kg, 
OS No OS')
INSERT INTO Products(Name, Image, Price, CreateDate, Available, CategoryId, BrandId, Discription)
VALUES('Laptop Lenovo ThinkBook 13s G2 ITL 20V900E2VN', 'lap_le_2.jpg', 16990000, '2022-10-4',0,1,6,'CPU Intel Core i7-1165G7 (12MB, up to 4.70GHz), 
RAM 8GB LPDDR4x 4266MHz Onboard, 
SSD 512GB M.2 2242 PCIe 3.0x4 NVMe, 
VGA Intel Iris Xe Graphics, 
Display 13.3Inch WQXGA IPS 300nits Anti-glare, 100% sRGB, Dolby Vision, 
Pin 4Cell 56WHrs, 
Color Mineral Grey (Xám), 
Finger Print, 
Weight 1.26 kg, 
OS Windows 11 Home 64 bits')
INSERT INTO Products(Name, Image, Price, CreateDate, Available, CategoryId, BrandId, Discription)
VALUES('Laptop Lenovo ThinkPad X1 Nano Gen 1 20UN00B6VN', 'lap_le_3.jpg', 35990000, '2022-10-4',0,1,6,'CPU Intel® Core i5-1130G7 (8MB Cache, up to 4.0GHz), 
RAM 8GB LPDDR4 Onboard, 
SSD 512GB PCIe, 
VGA Intel®Iris®Xe Graphics, 
Display 13.0Inch 2K(2160 x 1350) Dolby Vision, 450 nit, sRGB 100%, 
Pin 3Cell 48WHrs, 
Color Black (Đen), 
Finger Print, 
Weight 962g, 
OS Windows 11 Pro 64 bits')
INSERT INTO Products(Name, Image, Price, CreateDate, Available, CategoryId, BrandId, Discription)
VALUES('Laptop Lenovo ThinkBook 13s G2 ITL 20V900E0VN', 'lap_le_4.jpg', 13990000, '2022-10-4',0,1,6,'CPU Intel Core i5-1135G7 (8MB, up to 4.20GHz), 
RAM 8GB LPDDR4x 4266MHz Onboard, 
SSD 256GB M.2 2242 PCIe 3.0x4 NVMe, 
VGA Intel Iris Xe Graphics, 
Display 13.3Inch WQXGA IPS 300nits Anti-glare, 100% sRGB, Dolby Vision, 
Pin 4Cell 56WHrs, 
Color Mineral Grey (Xám), 
Finger Print, 
Weight 1.26 kg, 
OS Windows 11 Home 64 bits')
INSERT INTO Products(Name, Image, Price, CreateDate, Available, CategoryId, BrandId, Discription)
VALUES('Laptop Lenovo ThinkPad X1 Nano Gen 2 21E8003FVN', 'lap_le_5.jpg', 51050000, '2022-10-4',0,1,6,'CPU Intel® Core ™ i7-1260P (18MB Cache, up to 4.7GHz), 
RAM 16GB LPDDR5-5200Mhz Onboard, 
SSD 1TB SSD M.2 2242 PCIe 4.0x4 NVMe Opal2, 
VGA Intel® Iris® Xe Graphics, 
Display 13inch 2K (2160x1350) IPS 450nits Anti-glare, 
Color Black (Đen), 
Finger Print, 
Intel AX211 Wi-Fi 6E, 2x2 + BT5.1, 
Weight 966g, 
Pin 3Cell 49.5Whr, 
OS Windows 11 Pro 64 bits')

	  --********************************** ACER ***********************************--

INSERT INTO Products(Name, Image, Price, CreateDate, Available, CategoryId, BrandId, Discription)
VALUES('Laptop Gaming Acer Nitro 5 Eagle AN515-57-5669', 'lap_acer_1.jpg', 18890000, '2022-10-4',0,1,7,'CPU Intel Core i5-11400H (12MB, up to 4.50GHz), 
RAM 8GB DDR4 3200MHz (1x8GB), 
SSD 512GB PCIe NVMe, 
VGA NVIDIA GeForce GTX 1650 4GB GDDR6, 
Display 15.6Inch FHD IPS 144Hz, 
Pin 4Cell 57.5WHrs, 
Color Shale Black (Đen), 
Red Backlit Keyboard, 
Weight 2.20 kg, 
OS Windows 11 Home')
INSERT INTO Products(Name, Image, Price, CreateDate, Available, CategoryId, BrandId, Discription)
VALUES('Laptop Acer Aspire 3 A315-58-35AG NX.ADDSV.00B', 'lap_acer_2.jpg', 9690000, '2022-10-4',0,1,7,'CPU Intel Core i3-1115G4 (6MB, up to 4.10GHz), 
RAM 4GB DDR4 2400MHz Onboard, 
SSD 256GB PCIe NVMe, 
VGA Intel UHD Graphics, 
Display 15.6inch FHD Acer ComfyView 60Hz, 
Color Pure Silver (Bạc), 
Pin 3Cell 36WHrs, 
Weight 1.70 kg, 
OS Windows 11 Home')
INSERT INTO Products(Name, Image, Price, CreateDate, Available, CategoryId, BrandId, Discription)
VALUES('Laptop Acer Aspire 3 A315-57G-32QP NX.HZRSV.00A', 'lap_acer_3.jpg', 10490000, '2022-10-4',0,1,7,'CPU Intel Core i3-1005G1 (4MB, up to 3.40GHz), 
RAM 4GB DDR4 2400MHz Onboard, 
SSD 256GB PCIe NVMe, 
VGA NVIDIA Geforce MX330 2GB GDDR5, 
Display 15.6Inch FHD Acer ComfyView LED backlit TFT LCD, 
Pin 3Cell 36WHrs, 
Color Charcoal Black (Đen), 
Weight 1.90 kg, 
OS Windows 11 Home')
INSERT INTO Products(Name, Image, Price, CreateDate, Available, CategoryId, BrandId, Discription)
VALUES('Laptop Gaming Acer Predator Triton 500 SE', 'lap_acer_4.jpg', 100990000, '2022-10-4',0,1,7,'CCPU Intel Core i9-12900H (24MB, up to 5.00GHz), 
RAM 32GB LPDDR5 4800MHz Onboard, 
SSD 2TB PCIe NVMe, 
Display 16.0Inch WQXGA IPS 240Hz 500nits 100%sRGB, 
VGA NVIDIA GeForce 3080Ti 16GB GDDR6, 
Pin 4Cell 99.98WHrs, 
Color Steel Gray (Xám), 
Finger Print, 
Weight 2.40 kg, 
OS Windows 11 Home')
INSERT INTO Products(Name, Image, Price, CreateDate, Available, CategoryId, BrandId, Discription)
VALUES('Laptop Gaming Acer Nitro 5 Eagle AN515-57-54MV', 'lap_acer_5.jpg', 20590000, '2022-10-4',0,1,7,'CPU Intel Core i5-11400H (12MB, up to 4.50GHz), 
RAM 8GB DDR4 3200MHz (1x8GB), 
SSD 512GB PCIe NVMe, 
VGA NVIDIA GeForce RTX 3050 4GB GDDR6, 
Display 15.6Inch FHD IPS 144Hz, 
Pin 4Cell 57.5WHrs, 
Color Shale Black (Đen), 
Weight 2.20 kg, 
OS Windows 11 Home')

	  --**********************************  INTEL ***********************************--

INSERT INTO Products(Name, Image, Price, CreateDate, Available, CategoryId, BrandId, Discription)
VALUES('Laptop Intel NUC M15 BBC710ECUXBC1 màu xám', 'lap_intel_1.jpg', 22490000, '2022-10-4',0,1,8,'CPU Intel Core i7-1165G7 (12MB, up to 4.70GHz), 
RAM 16GB LPDDR4X 4266MHz (2 x 8GB Onboard), 
SSD 512GB NVMe PCIe, 
VGA Intel Iris Xe Graphics, 
Display 15.6Inch FHD IPS Touch 60Hz 100%sRGB, 
Pin 73WHrs, 
Color Gray (Xám), 
Weight 1.65 kg, 
OS Windows 10 Home')
INSERT INTO Products(Name, Image, Price, CreateDate, Available, CategoryId, BrandId, Discription)
VALUES('Laptop Intel NUC M15 BBC510EAUXBC1 bản i5-1135G7', 'lap_intel_2.jpg', 14990000, '2022-10-4',0,1,8,'CPU Intel Core i5-1135G7 (8MB, up to 4.20GHz), 
RAM 16GB LPDDR4X 4266MHz (2 x 8GB Onboard), 
SSD 512GB NVMe PCIe, 
VGA Intel Iris Xe Graphics, 
Display 15.6Inch FHD IPS 60Hz 100%sRGB, 
Pin 73WHrs, 
Color Gray (Xám), 
Weight 1.65 kg, 
OS Windows 10 Home')

	  --***********************************  AVITA  **********************************--

INSERT INTO Products(Name, Image, Price, CreateDate, Available, CategoryId, BrandId, Discription)
VALUES('Laptop Avita Pura 14 NS14A6VNF541-SGC', 'lap_avita_1.jpg', 9990000, '2022-10-4',0,1,9,'CPU Intel Core i5-8279U (6MB, up to 4.10GHz), 
RAM 8GB DDR4 2400MHz, 
SSD 256GB Sata M.2, 
VGA Intel Iris Plus Graphics 655, 
Display 14.0Inch HD TFT Wide Bezel, 
Pin 2Cell 24WHrs 3200mAh, 
Color Shadow Grey (Xám), 
Weight 1.34 kg, 
OS Windows 10 Home')
INSERT INTO Products(Name, Image, Price, CreateDate, Available, CategoryId, BrandId, Discription)
VALUES('Laptop Avita Liber V14Q-SP NS14A8VNW561-SPAB', 'lap_avita_2.jpg', 15990000, '2022-10-4',0,1,9,'CPU AMD Ryzen R7-3700U (4MB, upto 4.00GHz), 
RAM 8GB DDR4 2400MHz, 
SSD 512GB Sata M.2, 
VGA AMD Radeon RX Vega 10 Graphics, 
Display 14.0Inch FHD IPS Anti-Glare, 
Pin 4830mAh, 
Color Summer Pink (Hồng), 
Finger Print, 
Weight 1.30 kg, 
OS Windows 10 Home')
INSERT INTO Products(Name, Image, Price, CreateDate, Available, CategoryId, BrandId, Discription)
VALUES('Laptop Avita Liber V14 NS14A9VNV561-CRAB', 'lap_avita_3.jpg', 16690000, '2022-10-4',0,1,9,'CPU AMD Ryzen R5-4500U (8MB, up to 4.00GHz), 
RAM 8GB LPDDR4 3200MHz, 
SSD 512GB Sata M.2, 
VGA AMD Radeon RX Vega 10 Graphics, 
Display 14.0Inch FHD IPS Anti-Glare, 
Pin 4830mAh, 
Color Charming Red (Đỏ), 
Weight 1.28kg, 
OS Windows 10 Home')

	  --*********************************************************************--

INSERT INTO Discounts(Name, Percentage, CreateDate, EndDate, ProductId, CreateBy)
VALUES(N'Tri ân khách hàng',10,'2022-10-4', '2022-12-30',1,'duylnk')
INSERT INTO Discounts(Name, Percentage, CreateDate, EndDate, ProductId, CreateBy)
VALUES(N'Tri ân khách hàng',10,'2022-10-4', '2022-12-30',2,'duylnk')

select * FROM ProductPhotos
INSERT INTO ProductPhotos(Id, ProductId)
VALUES('lap_asus_1_1.jpg',1), --ASUS
	  ('lap_asus_1_2.jpg',1),('lap_asus_1_3.jpg',1),
	  ('lap_asus_2_1.jpg',2),('lap_asus_2_2.jpg',2),('lap_asus_2_3.jpg',2),
	  ('lap_asus_3_1.jpg',3),('lap_asus_3_2.jpg',3),('lap_asus_3_3.jpg',3),
	  ('lap_asus_4_1.jpg',4),('lap_asus_4_2.jpg',4),('lap_asus_4_3.jpg',4),
	  ('lap_asus_5_1.jpg',5),('lap_asus_5_2.jpg',5),('lap_asus_5_3.jpg',5),
	  ('lap_dell_1_1.jpg',6), --DELL
	  ('lap_dell_1_2.jpg',6),('lap_dell_1_3.jpg',6),
	  ('lap_dell_2_1.jpg',7),('lap_dell_2_2.jpg',7),('lap_dell_2_3.jpg',7),
	  ('lap_dell_3_1.jpg',8),('lap_dell_3_2.jpg',8),('lap_dell_3_3.jpg',8),
	  ('lap_dell_4_1.jpg',9),('lap_dell_4_2.jpg',9),('lap_dell_4_3.jpg',9),
	  ('lap_dell_5_1.jpg',10),('lap_dell_5_2.jpg',10),('lap_dell_5_3.jpg',10),
	  ('lap_hp_1_1.jpg',11), -- HP
	  ('lap_hp_1_2.jpg',11),('lap_hp_1_3.jpg',11),
	  ('lap_hp_2_1.jpg',12),('lap_hp_2_2.jpg',12),('lap_hp_2_3.jpg',12),
	  ('lap_hp_3_1.jpg',13),('lap_hp_3_2.jpg',13),('lap_hp_3_3.jpg',13),
	  ('lap_hp_4_1.jpg',14),('lap_hp_4_2.jpg',14),('lap_hp_4_3.jpg',14),
	  ('lap_hp_5_1.jpg',15),('lap_hp_5_2.jpg',15),('lap_hp_5_3.jpg',15),
	  ('lap_msi_1_1.jpg',16), -- MSI
	  ('lap_msi_1_2.jpg',16),('lap_msi_1_3.jpg',16),
	  ('lap_msi_2_1.jpg',17),('lap_msi_2_2.jpg',17),('lap_msi_2_3.jpg',17),
	  ('lap_msi_3_1.jpg',18),('lap_msi_3_2.jpg',18),('lap_msi_3_3.jpg',18),
	  ('lap_msi_4_1.jpg',19),('lap_msi_4_2.jpg',19), ('lap_msi_4_3.jpg',19),
	  ('lap_msi_5_1.jpg',20),('lap_msi_5_2.jpg',20),('lap_msi_5_3.jpg',20),
	  ('lap_lg_1_1.jpg',21), -- LG
	  ('lap_lg_1_2.jpg',21),('lap_lg_1_3.jpg',21),
	  ('lap_lg_2_1.jpg',22),('lap_lg_2_2.jpg',22),('lap_lg_2_3.jpg',22),
	  ('lap_lg_3_1.jpg',23),('lap_lg_3_2.jpg',23),('lap_lg_3_3.jpg',23),
	  ('lap_lg_4_1.jpg',24),('lap_lg_4_2.jpg',24),('lap_lg_4_3.jpg',24),
	  ('lap_lg_5_1.jpg',25),('lap_lg_5_2.jpg',25),('lap_lg_5_3.jpg',25),
	  ('lap_le_1_1.jpg',26), --LENOVO	
	  ('lap_le_1_2.jpg',26),('lap_le_1_3.jpg',26),
	  ('lap_le_2_1.jpg',27),('lap_le_2_2.jpg',27),('lap_le_2_3.jpg',27),
	  ('lap_le_3_1.jpg',28),('lap_le_3_2.jpg',28),('lap_le_3_3.jpg',28),
	  ('lap_le_4_1.jpg',29),('lap_le_4_2.jpg',29),('lap_le_4_3.jpg',29),
	  ('lap_le_5_1.jpg',30),('lap_le_5_2.jpg',30),('lap_le_5_3.jpg',30),
	  ('lap_acer_1_1.jpg',31), -- ACER
	  ('lap_acer_1_2.jpg',31),('lap_acer_1_3.jpg',31),
	  ('lap_acer_2_1.jpg',32),('lap_acer_2_2.jpg',32),('lap_acer_2_3.jpg',32),
	  ('lap_acer_3_1.jpg',33),('lap_acer_3_2.jpg',33),('lap_acer_3_3.jpg',33),
	  ('lap_acer_4_1.jpg',34),('lap_acer_4_2.jpg',34),('lap_acer_4_3.jpg',34),
	  ('lap_acer_5_1.jpg',35),('lap_acer_5_2.jpg',35),('lap_acer_5_3.jpg',35),
	  ('lap_intel_1_1.jpg',36), --INTEL
	  ('lap_intel_1_2.jpg',36),('lap_intel_1_3.jpg',36),
	  ('lap_intel_2_1.jpg',37),('lap_intel_2_2.jpg',37),('lap_intel_2_3.jpg',37),
	  ('lap_avita_1_1.jpg',38), -- AVITA
	  ('lap_avita_1_2.jpg',38),('lap_avita_1_3.jpg',38),
	  ('lap_avita_2_1.jpg',39),('lap_avita_2_2.jpg',39),('lap_avita_2_3.jpg',39),
	  ('lap_avita_3_1.jpg',40),('lap_avita_3_2.jpg',40),('lap_avita_3_3.jpg',40)

	  --*********************************************************************--

INSERT INTO Orders(Username, CreateDate, Address, OrderStatus, Note)
VALUES('user1', '2022-10-4', N'Tô Ký, quận 12, Tp.HCM',N'Chưa xác nhận', N'Hàng dễ  vỡ'),
	  ('user1', '2022-10-5', N'Tô Ký, quận 12, Tp.HCM',N'Chưa xác nhận', N'Hàng dễ  vỡ')

	  --*********************************************************************--

INSERT INTO OrderDetails(OrderId, ProductId, Price, Quantity)
VALUES(1, 1, 11490000, 1),
	  (2, 2, 18590000, 1)

	  --*********************************************************************--

INSERT INTO Roles(Id, name)
VALUES('ADMIN','Adminitrators'),
	  ('USER','Users')

	  --*********************************************************************--

INSERT INTO Authorities(Username, RoleId)
VALUES('duylnk','ADMIN'),
	  ('user1','USER')

	  --*********************************************************************--

INSERT INTO ProductLikes(IsLiked, ProductId, Username)
VALUES(1, 1, 'user1')
	  
	  --*********************************************************************--

INSERT INTO ProductEvalutions(Evalution, Comment, ProductId, Username)
VALUES(1, N'Hàng rất ổn, giao đúng hạn.', 1, 'user1')

use Project
SELECT * FROM Orders

