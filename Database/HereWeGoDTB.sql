drop database HereWeGo
Create database HereWeGo

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
)

create table [Role](
	roleId int primary key identity(1,1) not null,
	name nvarchar(50)
)

create table [User](
	userId bigint primary key identity(1,1) not null,
	name nvarchar(50) not null,
	phone varchar(12) not null,
	avatarLink varchar(200),
	roleId int foreign key references Role(roleId) not null,
	password nvarchar(20) not null
)

 create table [Order](
	orderId bigint primary key identity(1,1) not null,
	date datetime not null,
	customerId bigint foreign key references [User](UserId) not null,
	totalPrice int not null
 )

create table Payment(
	paymentId bigint primary key identity(1,1) not null,
	orderId bigint foreign key references [Order](orderId) not null,
	paymentAccount varchar(100) not null,
	paymentDate datetime not null,
	creditCardNumber varchar(20) not null,
	creditCardEXPDate date not null,
	cardHolderName varchar(50) not null,
)

create table Ticket(
	ticketId bigint primary key identity(1,1) not null,
	orderId bigint foreign key references [Order](orderId) not null,
	routeDeTailId bigint foreign key references RouteDetail(routeDetailId) not null,
	position int not null, 
)

create table Feedback(
	feedback bigint primary key identity(1,1) not null,
	ticketID bigint foreign key references Ticket(ticketId) not null,
	Description nvarchar(500),
)

USE HereWeGo
INSERT INTO Company VALUES(N'Phương Trang','phuongtrangstation@gmail.com','0929828338','','Nha xe Phuong Trang Description............................','phuongtrang123')
INSERT INTO Company VALUES(N'Thành Bưởi','thanhbuoi@gmail.com','0928763562','','','thanhbuoi123')
INSERT INTO Company VALUES(N'Cúc Phương','cucphuong@gmail.com','0989876537','','','cucphuong123')
INSERT INTO Company VALUES(N'Hải Duyên','haiduyen@gmail.com','0987875625','','','haiduyen123')
INSERT INTO Company VALUES(N'Anh Minh','anhminhbus@gmailcom','0989877862','','','anhminh123')
INSERT INTO Company VALUES(N'Đại Ngân','dainganbus@gmail.com','0981452653','','','daingan123')
INSERT INTO Company VALUES(N'Phước Sang','phuocsang@gmail.com','1231233243','','','phuocsang123')

INSERT INTO [Role] VALUES('ADMIN')
INSERT INTO [Role] VALUES('CUSTOMER')


INSERT INTO [User] VALUES(N'Đỗ Hoàng Huy Bu','01272825170','',2,'hoanghuy123')
INSERT INTO [User] VALUES(N'Nguyễn Anh Minh','0987826546','',2,'anhminh123')
INSERT INTO [User] VALUES(N'Hồ Ngọc Bảo Trâm','0909887625','',2,'baotram123')
INSERT INTO [User] VALUES(N'Trần Thị Hoàng Anh','0987527365','',2,'hoanganh123')
INSERT INTO [User] VALUES(N'Nguyễn Hồng Bảo Long','09826716345','',2,'baolong123')
INSERT INTO [User] VALUES(N'Võ Hoài Linh','0928618276','',2,'hoailinh123')
INSERT INTO [User] VALUES(N'Đàm Vĩnh Hưng','0928717725','',1,'vinhhung123')



