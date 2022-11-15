use FoodManagement
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
	description nvarchar(4000),
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
	dateCreate datetime,
	gender varchar(10),
	email varchar(100)
)


 create table [Order](
	orderId bigint primary key identity(1,1) not null,
	date datetime not null,
	customerId bigint foreign key references [User](UserId) not null,
	totalPrice int not null
 )
create table Ticket(
	ticketId bigint primary key identity(1,1) not null,
	orderId bigint foreign key references [Order](orderId) not null,
	routeDeTailId bigint foreign key references RouteDetail(routeDetailId) not null,
	position int not null,
	passengerName nvarchar(70) not null,
	passengerPhone nvarchar(13) not null,
	purchaseDate datetime
)


create table Feedback(
	feedback bigint primary key identity(1,1) not null,
	companyId int foreign key references Company(companyId) not null,
	userId bigint foreign key references [User](userId) not null,
	Description nvarchar(500),
	star int,
	dateComment datetime
)

SELECT * FROM Feedback WHERE companyId = 7


create table [Notification](
	NId bigint primary key identity(1,1) not null,
	userId bigint foreign key references [User](userID) not null,
	message nvarchar(200) not null,
	date datetime not null
)

USE HereWeGo
INSERT INTO Company VALUES(N'Phương Trang Bus','phuongtrangstation@gmail.com','0929828338','phuongtranglogo.png','Founded in 2001 focusing on supporting the transportation needs of Vietnamese people, Phuong Trang Group (FUTA Group) has become the industry leaders and contributed to the country’s development. Our efforts to improve products and services have been recognized through many prestigious awards such as “Top 5&nbsp;Reputable Transportation &amp;amp; Logistics Companies In Vietnam&nbsp;In 2020”, “Asian Quality Products-Services” and “Top 10 of Asian famous brands”, etc.','phuongtrang123')
INSERT INTO Company VALUES(N'Thành Bưởi Bus','thanhbuoi@gmail.com','0928763562','thanhbuoilogo.png','Established in 2000 until now, with more than 10 years of experience in the field of transportation, Thanh Buoi has served more than thousands of bus routes across the country. With the motto "Serving customers from a dedicated heart", Thanh Buoi always constantly improves, improves service quality and expands the size of its company every day in order to bring customers the best service and most diverse.
With the unremitting efforts and efforts of the staff of company during its operation, Thanh Buoi has achieved many great achievements, being voted by consumers as "Enterprise providing transportation services". most satisfied in 2008, 2010, 2011, 2013" and won the title of "Prestigious Brand 2009". Not stopping there, the size of the company also increased significantly. From a company specializing in transporting passengers and goods, Thanh Buoi has now become a multi-industry, multi-field company across the country.','thanhbuoi123')
INSERT INTO Company VALUES(N'Hà Nội Rides On Time','hnride.ontime@gmail.com','0989876537','hanoiridelogo.jpg','Hanoi Rides on time’s management team leaders have a background in Bachelor of Business Administration, and degree of hospitality management at Vatel international business school hotel & tourism management USA and many years of customer service experience which ensures that our operations run smoothly and efficiently Hanoi Rides On Time specializes in professional and efficient transportation services in the Hanoi area. We offer affordable rates and experienced drivers who take you from your location to your final destination, in a safe and timely matter','hnride123')
INSERT INTO Company VALUES(N'Sapa Dragon','sapa.dragon@gmail.com','0987875625','sapadragonlogo.png','Sapa Dragon Express is a Vietnamese bus company serving routes between Hanoi and Sapa.','sapadg123')
INSERT INTO Company VALUES(N'Hoàng Long Bus','hoanglong@gmailcom','0989877862','hoanglonglogo.png','Hoang Long company would like to send customers a respectfully greeting and thank you for choosing Hoang Long brand. During the 10 years of company building and development, we have pleasured to serve tens of millions passengers along the routes from North to South. HOANG LONG became the most popular brand in Viet Nam by choosing and decision of customers with three consecutive times Vietnam Gold Star award winning. This is our honor and great encouragement to continue serving customers better. We hope the selected information will help customers get more understanding about the works and enthusiasm of HOANG LONG company employees, and the contents on the website of company will help you get the necessary information for journeys as well as other services of the HOANG LONG company.','hoanglong123')
INSERT INTO Company VALUES(N'Huế Tourist Bus','huetour@gmail.com','0981452653','huetouristlogo.png','Since 2006, Hue Trading and Tourist Service Corporation - Huetourist Company in Hue, Vietnam is focused on inbound market and other travel services and operating successfully in another primary tourism fields including outbound, and domestic travel. Especially, Huetourist is confident to organize events and bring you the best solutions in the field of events in order to build and create the brand equity.','huetour123')
INSERT INTO Company VALUES(N'Mai Linh Express Bus','mailinh@gmail.com','0986273737','mailinhlogo.jpg','Mai Linh Express is a member of Mai Linh Group. Currently, the company has more than 150 vehicles operating on 12 routes connecting over 10 provinces and cities nationwide. With the motto "car departs on time - no smoke. drugs - do not pick up customers along the way", along with a professional, dedicated, thoughtful and honest service style, so far the Mai Linh Express brand has become familiar to customers.','mailinh123')
INSERT INTO Company VALUES(N'Hải Vân Bus','haivan@gmail.com','0982935574','haivanlogo.jpg','Established in 1994, after more than 2 decades, Hai Van has now become one of the leading passenger transport companies in Vietnam in the high-end segment, with more than 1,000 employees. Hai Van is headquartered in Hanoi and has a nationwide service network. With the mission of providing high-class, kind and reliable transportation services to all customers, we are not only regular update the latest transport trends in the world to apply and launch unique products and services, but also invest in research and understanding to best meet all the needs of all customers. With a strong commitment to ensuring quality and safety, we always periodically take care of and maintain transport vehicles according to strict standards. Hai Van team of drivers - reliable companions and protection of all customers are experienced drivers, carefully selected by us and undergo standard and methodical training. In order to further improve service quality and promptly adjust when it is not suitable, Hai Van has built a customer feedback collection system to further improve our services.','haivan123')
INSERT INTO Company VALUES(N'Interbus Lines','interbus@gmail.com','0983538821','interbuslogo.png','Inter Bus Line was established in 2005 by Inter Bus Line Joint Stock Company. This is a facility with offices in Hanoi and Sapa, specializing in providing transportation services for tourists. With more than 15 years in the field of providing this service, this has become the first choice of many travelers and is trusted for its professionalism.','interbus123')
INSERT INTO Company VALUES(N'Cúc Phương Bus','cuc.phuong@gmail.com','0985662993','cucphuonglogo.png','In recent years, the trend of transportation services has developed strongly with many garages springing up to bring good quality services to customers. One of the prominent bus companies with the route Saigon - Long Khanh, Dong Nai is Cuc Phuong bus. With many years of operation, providing safe and quality trips for many passengers.','cucphuong123')

INSERT INTO [Role] VALUES('ADMIN')
INSERT INTO [Role] VALUES('CUSTOMER')


INSERT INTO [User] VALUES(N'Đỗ Hoàng Huy Bu',null,'01272825170','',2,'hoanghuy123', CURRENT_TIMESTAMP,'man')
INSERT INTO [User] VALUES(N'Nguyễn Anh Minh',null,'0987826546','',2,'anhminh123',CURRENT_TIMESTAMP,'man')
INSERT INTO [User] VALUES(N'Hồ Ngọc Bảo Trâm',null,'0909887625','',2,'baotram123',CURRENT_TIMESTAMP,'woman')
INSERT INTO [User] VALUES(N'Trần Thị Hoàng Anh',null,'0987527365','',2,'hoanganh123',CURRENT_TIMESTAMP,'woman')
INSERT INTO [User] VALUES(N'Nguyễn Hồng Bảo Long',null,'09826716345','',2,'baolong123',CURRENT_TIMESTAMP,'man')
INSERT INTO [User] VALUES(N'Võ Hoài Linh',null,'0928618276','',2,'hoailinh123',CURRENT_TIMESTAMP,'man')
INSERT INTO [User] VALUES(N'Đàm Vĩnh Hưng',null,'0928717725','',1,'vinhhung123',CURRENT_TIMESTAMP,'man')

INSERT INTO Place VALUES(N'Huyện Cai Lậy, Tỉnh Tiền Giang')
INSERT INTO Place VALUES(N'Quận Hoàn Kiếm, Thành phố Hà Nội')
INSERT INTO Place VALUES(N'Thành phố Rạch Giá, Tỉnh Kiên Giang')
INSERT INTO Place VALUES(N'Thành phố Đà Lạt, Tỉnh Lâm Đồng')
INSERT INTO Place VALUES(N'Quận Thủ Đức, Thành phố Hồ Chí Minh')
INSERT INTO Place VALUES(N'Quận Ninh Kiều, Thành phố Cần Thơ')
INSERT INTO Place VALUES(N'Huyện Châu Thành, Tỉnh Vĩnh Long')
INSERT INTO Place VALUES(N'Tỉnh Khánh Hòa')
INSERT INTO Place VALUES(N'Thành phố Huế, Tỉnh Thừa Thiên Huế')
INSERT INTO Place VALUES(N'Quận Ngũ Hành Sơn, Thành phố Đà Nẵng')
INSERT INTO Place VALUES(N'Quận Ba Đình, Thành phố Hà Nội')
INSERT INTO Place VALUES(N'Thị xã Sapa, Tỉnh Lào Cai')
INSERT INTO Place VALUES(N'Quận Ninh Kiều, Thành phố Cần Thơ')

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
INSERT INTO Route VALUES(1,5,4)
INSERT INTO Route VALUES(2,9,10)
INSERT INTO Route VALUES(3,11,12)
INSERT INTO Route VALUES(4,5,13)

INSERT INTO BusType VALUES(29, 'Normal Bus')
INSERT INTO BusType VALUES(52, 'Sleeper Bus')
INSERT INTO BusType VALUES(20, 'Sleeper Room Bus')

INSERT INTO RouteDetail VALUES(1,1,'2022-11-13 07:00:00',100000,'2022-10-18 22:00:00', N'123 Lê Hồng Phong', N'321 Phan Đình Giót')
INSERT INTO RouteDetail VALUES(2,2,'2022-11-14 09:00:00',300000,'2022-10-18 21:00:00', N'345 Hồ Hảo Hớn', N'543 Nguyễn Cư Trinh')
INSERT INTO RouteDetail VALUES(3,3,'2022-11-18 10:00:00',400000,'2022-10-18 23:00:00', N'284 Trần Đình Xu', N'756 Nguyễn Văn Cừ')
INSERT INTO RouteDetail VALUES(2,1,'2022-11-18 12:00:00',500000,'2022-10-18 20:00:00', N'456 Lương Định Của', N'241 Võ Thi Sáu')
INSERT INTO RouteDetail VALUES(4,2,'2022-11-18 14:00:00',600000,'2022-10-18 19:00:00', N'6213/123 Nguyễn Duy Dương', N'2613 Nguyễn Chí Thanh')
INSERT INTO RouteDetail VALUES(6,3,'2022-11-19 16:00:00',700000,'2022-10-18 23:00:00', N'123 Đốc Binh Kiều', N'564 Nguyễn Thị Minh Khai')
INSERT INTO RouteDetail VALUES(7,2,'2022-11-12 18:00:00',800000,'2022-10-18 21:00:00', N'80 Trần Bình Trọng', N'21 Ngô Gia Tự')
INSERT INTO RouteDetail VALUES(8,2,'2022-10-28 23:00:00',900000,'2022-10-18 22:00:00', N'28 Nguyễn Đình Chiểu', N'87 Độc Lập')
INSERT INTO RouteDetail VALUES(13,1,'2022-11-28 23:00:00',100000,'2022-10-18 22:00:00', N'6213/123 Nguyễn Duy Dương', N'đường Nguyễn Thị Minh Khai, phường 1')
INSERT INTO RouteDetail VALUES(14,1,'2022-11-28 23:00:00',300000,'2022-10-18 22:00:00', N'Đường Tôn Đức Thắng, Hòa Minh', N'97 An Dương Vương')
INSERT INTO RouteDetail VALUES(15,1,'2022-11-28 23:00:00',500000,'2022-10-18 22:00:00', N'Số 1 Tràng Tiền', N'Bến xe Sapa, Quốc lộ 4D')
INSERT INTO RouteDetail VALUES(16,1,'2022-11-28 23:00:00',400000,'2022-10-18 22:00:00', N'395 Kinh Dương Vương', N'Quốc Lộ 91')

INSERT INTO [Order] VALUES('2022-09-28 19:23:11',1,600000)
INSERT INTO [Order] VALUES('2022-09-25 20:23:11',2,300000)
INSERT INTO [Order] VALUES('2022-09-25 19:23:11',3,300000)
INSERT INTO [Order] VALUES('2022-09-28 18:23:11',4,300000)
INSERT INTO [Order] VALUES('2022-09-28 20:23:11',1,300000)

INSERT INTO Ticket VALUES(1,1,1, N'Khá Bảnh', '0908277560', CURRENT_TIMESTAMP)
INSERT INTO Ticket VALUES(1,2,3, N'Huấn Hoa Hồng', '0973224890', CURRENT_TIMESTAMP)
INSERT INTO Ticket VALUES(2,2,4, N'Tiến Bịp', '0835268912', CURRENT_TIMESTAMP)
INSERT INTO Ticket VALUES(3,1,2, N'Chi Pu', '0908535767', CURRENT_TIMESTAMP)
INSERT INTO Ticket VALUES(4,1,3, N'Lộc Fuho', '0937299535', CURRENT_TIMESTAMP)
INSERT INTO Ticket VALUES(5,1,4, N'Đạt Vila', '0783999402', CURRENT_TIMESTAMP)

INSERT INTO [Order] VALUES('2022-09-12 19:23:11',1,300000)
INSERT INTO RouteDetail VALUES(8,2,'2022-09-18 18:00:00',300000,'2022-10-18 22:00:00',N'123 Tân Kỳ Tân Quý', N'123 Lũy Bán Bích')
INSERT INTO Feedback VALUES(1,1,N'hhihah hoos dd', 4, CURRENT_TIMESTAMP)



select * from Place
select * from RouteDetail where 
delete from RouteDetail where routeDetailId > 0

use HereWeGo
select * from [User] where userId = 7


select * from Notification

select  e.orderId from[dbo].[User] join [dbo].[Order] as e on [dbo].[User].userId=e.customerId and [dbo].[User].userId=1 join [dbo].[Ticket] as d on e.orderId=d.orderId

DELETE FROM [dbo].[Feedback] WHERE [dbo].[Feedback].userId=1
DELETE FROM [dbo].[User] WHERE [dbo].[User].userId=2


SELECT tbl1.routeDetailId, bus.capacity, bus.kind, tbl1.startTime, tbl1.price, tbl1.timeArrival, tbl1.departDetail, tbl1.detinationDetail, tbl1.routeId, tbl1.name, tbl1.depart, tbl1.destination
                    FROM (SELECT rd.routeDetailId,rd.busTypeId, rd.startTime, rd.price, rd.timeArrival,rd.departDetail,rd.detinationDetail, rd.routeId, r.name,r.depart, r.destination
                    FROM [RouteDetail] rd
                    inner join
                    (SELECT Route.companyId, Route.departId, Route.destinationId, Route.routeId, com.name, PlaceName.depart, PlaceName.destination FROM [Route], [Company] com,
                    (SELECT dep.routeId,dep.name depart,des.name destination 
                     FROM
                    (SELECT * 
                    FROM Route,Place 
                    WHERE Route.departId = Place.placeId) dep,
                   (SELECT * 
                    FROM Route,Place 
                    WHERE Route.destinationId = Place.placeId) des
                    WHERE des.routeId = dep.routeId) PlaceName
                    WHERE PlaceName.depart like N'%, %' and PlaceName.destination like N'%, %' and com.companyId = Route.companyId and PlaceName.routeId = Route.routeId) r
                    ON rd.routeId = r.routeId) tbl1, BusType bus
                    WHERE tbl1.busTypeId = bus.busTypeId and tbl1.startTime > '' and tbl1.startTime > CURRENT_TIMESTAMP

