use PlantShop
drop database HereWeGo
GO
Create database HereWeGo
GO

use HereWeGo
Create table Company(
	companyId int primary key identity(1,1),
	name nvarchar(100) not null,
	email varchar(100) not null,
	phone varchar(12) not null,
	imgLink varchar(300),
	description nvarchar(2000),
	Password nvarchar(30)
)

Create table Place (
	placeId bigint primary key identity(1,1) not null,
	name nvarchar(200) not null
)

Create table Route (
	routeId bigint primary key identity(1,1) not null,
	companyId int foreign key references Company(companyId) not null,
	departId bigint foreign key references Place(placeId) not null,
	destinationId bigint foreign key references Place(placeId) not null
)

Create table BusType(
	busTypeId int primary key identity(1,1),
	capacity int not null,
	kind varchar(50) not null
)

Create table RouteDetail(
	routeDetailId bigint primary key identity(1,1) not null,
	routeId bigint foreign key references Route(routeId) not null,
	busTypeId int foreign key references BusType(busTypeId) not null,
	startTime datetime not null,
	price int not null,
	timeArrival datetime not null,
	departDetail nvarchar(200) not null,
	detinationDetail nvarchar(200) not null
)

create table [Role](
	roleId int primary key identity(1,1) not null,
	name nvarchar(50)
)

create table [User](
	userId bigint primary key identity(1,1) not null,
	name nvarchar(80) not null,
	googleId varchar(200),
	phone varchar(12),
	avatarLink varchar(200),
	roleId int foreign key references Role(roleId) not null,
	password nvarchar(20) not null,
	dateCreate datetime
)



create table Payment(
	paymentId bigint primary key identity(1,1) not null,
	paymentAccount varchar(100) not null,
	paymentDate datetime not null,
	creditCardNumber varchar(20) not null,
	creditCardEXPDate date not null,
	cardHolderName varchar(50) not null,
)
 create table [Order](
	orderId bigint primary key identity(1,1) not null,
	date datetime not null,
	customerId bigint foreign key references [User](UserId) not null,
	totalPrice int not null,
	paymentID bigint foreign key references Payment(paymentId),
 )
create table Ticket(
	ticketId bigint primary key identity(1,1) not null,
	orderId bigint foreign key references [Order](orderId) not null,
	routeDeTailId bigint foreign key references RouteDetail(routeDetailId) not null,
	position int not null,
	passengerName nvarchar(70) not null,
	purchaseDate datetime
)

create table Feedback(
	feedback bigint primary key identity(1,1) not null,
	ticketID bigint foreign key references Ticket(ticketId) not null,
	Description nvarchar(500),
)
create table [Notification](
	NId bigint primary key identity(1,1) not null,
	userId bigint foreign key references [User](userID) not null,
	message nvarchar(200) not null,
	date datetime not null
)

USE HereWeGo
INSERT INTO Company VALUES(N'Phương Trang Bus','phuongtrangstation@gmail.com','0929828338','','Nha xe Phuong Trang Description............................','phuongtrang123')
INSERT INTO Company VALUES(N'Thành Bưởi Bus','thanhbuoi@gmail.com','0928763562','','','thanhbuoi123')
INSERT INTO Company VALUES(N'Hà Nội Rides On Time','hnride.ontime@gmail.com','0989876537','','','hnride123')
INSERT INTO Company VALUES(N'Sapa Dragon','sapa.dragon@gmail.com','0987875625','','','sapadg123')
INSERT INTO Company VALUES(N'Hoàng Long Bus','hoanglong@gmailcom','0989877862','','','hoanglong123')
INSERT INTO Company VALUES(N'Huế Tourist Bus','huetour@gmail.com','0981452653','','','huetour123')
INSERT INTO Company VALUES(N'Mai Linh Express Bus','mailinh@gmail.com','0986273737','','','mailinh123')
INSERT INTO Company VALUES(N'Hải Vân Bus','haivan@gmail.com','0982935574','','','haivan123')
INSERT INTO Company VALUES(N'Interbus Lines','interbus@gmail.com','0983538821','','','interbus123')
INSERT INTO Company VALUES(N'Sapa Bus Lines','sapa.lines@gmail.com','0985662993','','','sapalines123')

INSERT INTO [Role] VALUES('ADMIN')
INSERT INTO [Role] VALUES('CUSTOMER')


INSERT INTO [User] VALUES(N'Đỗ Hoàng Huy Bu',null,'01272825170','',2,'hoanghuy123', CURRENT_TIMESTAMP)
INSERT INTO [User] VALUES(N'Nguyễn Anh Minh',null,'0987826546','',2,'anhminh123',CURRENT_TIMESTAMP)
INSERT INTO [User] VALUES(N'Hồ Ngọc Bảo Trâm',null,'0909887625','',2,'baotram123',CURRENT_TIMESTAMP)
INSERT INTO [User] VALUES(N'Trần Thị Hoàng Anh',null,'0987527365','',2,'hoanganh123',CURRENT_TIMESTAMP)
INSERT INTO [User] VALUES(N'Nguyễn Hồng Bảo Long',null,'09826716345','',2,'baolong123',CURRENT_TIMESTAMP)
INSERT INTO [User] VALUES(N'Võ Hoài Linh',null,'0928618276','',2,'hoailinh123',CURRENT_TIMESTAMP)
INSERT INTO [User] VALUES(N'Đàm Vĩnh Hưng',null,'0928717725','',1,'vinhhung123',CURRENT_TIMESTAMP)

INSERT INTO Place VALUES(N'Huyện Cai Lậy, Tỉnh Tiền Giang')
INSERT INTO Place VALUES(N'Quận Hoàn Kiếm, Thành phố Hà Nội')
INSERT INTO Place VALUES(N'Thành phố Rạch Giá, Tỉnh Kiên Giang')
INSERT INTO Place VALUES(N'Thành phố Đà Lạt, Tỉnh Lâm Đồng')
INSERT INTO Place VALUES(N'Quận Thủ Đức, Thành phố Hồ Chí Minh')
INSERT INTO Place VALUES(N'Quận Ninh Kiều, Thành phố Cần Thơ')
INSERT INTO Place VALUES(N'Huyện Châu Thành, Tỉnh Vĩnh Long')
INSERT INTO Place VALUES(N'Tỉnh Khánh Hòa')

INSERT INTO Route VALUES(1,2,3)
INSERT INTO Route VALUES(1,1,2)
INSERT INTO Route VALUES(1,2,4)
INSERT INTO Route VALUES(1,5,2)
INSERT INTO Route VALUES(2,3,4)
INSERT INTO Route VALUES(3,4,5)
INSERT INTO Route VALUES(4,2,1)
INSERT INTO Route VALUES(3,2,1)
INSERT INTO Route VALUES(4,2,1)
INSERT INTO Route VALUES(3,2,1)
INSERT INTO Route VALUES(4,2,3)
INSERT INTO Route VALUES(5,2,1)

INSERT INTO BusType VALUES(29, 'Normal Bus')
INSERT INTO BusType VALUES(52, 'Sleeper Bus')
INSERT INTO BusType VALUES(20, 'Sleeper Bus')

INSERT INTO RouteDetail VALUES(1,1,'2022-11-13 07:00:00',100000,'2022-10-18 22:00:00', N'123 Lê Hồng Phong', N'321 Phan Đình Giót')
INSERT INTO RouteDetail VALUES(2,2,'2022-11-14 09:00:00',300000,'2022-10-18 21:00:00', N'345 Hồ Hảo Hớn', N'543 Nguyễn Cư Trinh')
INSERT INTO RouteDetail VALUES(3,3,'2022-11-18 10:00:00',400000,'2022-10-18 23:00:00', N'284 Trần Đình Xu', N'756 Nguyễn Văn Cừ')
INSERT INTO RouteDetail VALUES(2,1,'2022-11-18 12:00:00',500000,'2022-10-18 20:00:00', N'456 Lương Định Của', N'241 Võ Thi Sáu')
INSERT INTO RouteDetail VALUES(4,2,'2022-11-18 14:00:00',600000,'2022-10-18 19:00:00', N'6213/123 Nguyễn Duy Dương', N'2613 Nguyễn Chí Thanh')
INSERT INTO RouteDetail VALUES(6,3,'2022-11-19 16:00:00',700000,'2022-10-18 23:00:00', N'123 Đốc Binh Kiều', N'564 Nguyễn Thị Minh Khai')
INSERT INTO RouteDetail VALUES(7,2,'2022-11-12 18:00:00',800000,'2022-10-18 21:00:00', N'80 Trần Bình Trọng', N'21 Ngô Gia Tự')
INSERT INTO RouteDetail VALUES(8,2,'2022-10-28 23:00:00',900000,'2022-10-18 22:00:00', N'28 Nguyễn Đình Chiểu', N'87 Độc Lập')

INSERT INTO [Order] VALUES('2022-09-28 19:23:11',1,600000,null)
INSERT INTO [Order] VALUES('2022-09-25 20:23:11',2,300000,null)
INSERT INTO [Order] VALUES('2022-09-25 19:23:11',3,300000,null)
INSERT INTO [Order] VALUES('2022-09-28 18:23:11',4,300000,null)
INSERT INTO [Order] VALUES('2022-09-28 20:23:11',1,300000,null)

INSERT INTO Ticket VALUES(1,1,1, N'Khá Bảnh', CURRENT_TIMESTAMP)
INSERT INTO Ticket VALUES(1,2,3, N'Huấn Hoa Hồng',CURRENT_TIMESTAMP)
INSERT INTO Ticket VALUES(2,2,4, N'Tiến Bịp',CURRENT_TIMESTAMP)
INSERT INTO Ticket VALUES(3,1,2, N'Chi Pu',CURRENT_TIMESTAMP)
INSERT INTO Ticket VALUES(4,1,3, N'Lộc Fuho',CURRENT_TIMESTAMP)
INSERT INTO Ticket VALUES(5,1,4, N'Đạt Vila',CURRENT_TIMESTAMP)

INSERT INTO [Order] VALUES('2022-09-12 19:23:11',1,300000, null)
INSERT INTO RouteDetail VALUES(8,2,'2022-09-18 18:00:00',300000,'2022-10-18 22:00:00',N'123 Tân Kỳ Tân Quý', N'123 Lũy Bán Bích')
INSERT INTO Ticket VALUES(1,9,1, 'Châu Việt Cường', CURRENT_TIMESTAMP)




