USE [master]
GO
/****** Object:  Database [gr602_chuded]    Script Date: 23.03.2022 14:53:36 ******/
CREATE DATABASE [gr602_chuded]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'gr602_chuded', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\gr602_chuded.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'gr602_chuded_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\gr602_chuded_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [gr602_chuded] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [gr602_chuded].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [gr602_chuded] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [gr602_chuded] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [gr602_chuded] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [gr602_chuded] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [gr602_chuded] SET ARITHABORT OFF 
GO
ALTER DATABASE [gr602_chuded] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [gr602_chuded] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [gr602_chuded] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [gr602_chuded] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [gr602_chuded] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [gr602_chuded] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [gr602_chuded] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [gr602_chuded] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [gr602_chuded] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [gr602_chuded] SET  ENABLE_BROKER 
GO
ALTER DATABASE [gr602_chuded] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [gr602_chuded] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [gr602_chuded] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [gr602_chuded] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [gr602_chuded] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [gr602_chuded] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [gr602_chuded] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [gr602_chuded] SET RECOVERY FULL 
GO
ALTER DATABASE [gr602_chuded] SET  MULTI_USER 
GO
ALTER DATABASE [gr602_chuded] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [gr602_chuded] SET DB_CHAINING OFF 
GO
ALTER DATABASE [gr602_chuded] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [gr602_chuded] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [gr602_chuded] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'gr602_chuded', N'ON'
GO
ALTER DATABASE [gr602_chuded] SET QUERY_STORE = OFF
GO
USE [gr602_chuded]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [gr602_chuded]
GO
/****** Object:  Table [dbo].[Dish]    Script Date: 23.03.2022 14:53:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dish](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Price] [money] NOT NULL,
	[CookingTime] [int] NOT NULL,
 CONSTRAINT [PK_Dish] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 23.03.2022 14:53:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[PlaceId] [int] NOT NULL,
	[OrderStatusId] [int] NOT NULL,
	[Created] [datetime] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStatus]    Script Date: 23.03.2022 14:53:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_OrderStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Place]    Script Date: 23.03.2022 14:53:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Place](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Place] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 23.03.2022 14:53:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reserve]    Script Date: 23.03.2022 14:53:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reserve](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DishId] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
 CONSTRAINT [PK_Reserve] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 23.03.2022 14:53:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[MiddleName] [nvarchar](50) NOT NULL,
	[PostId] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Dish] ON 

INSERT [dbo].[Dish] ([Id], [Title], [Price], [CookingTime]) VALUES (41, N'опомо (opomo)', 487.3700, 15)
INSERT [dbo].[Dish] ([Id], [Title], [Price], [CookingTime]) VALUES (42, N'угюбо (ugyubo)', 339.5800, 23)
INSERT [dbo].[Dish] ([Id], [Title], [Price], [CookingTime]) VALUES (43, N'ямуде (yamude)', 1575.3400, 47)
INSERT [dbo].[Dish] ([Id], [Title], [Price], [CookingTime]) VALUES (44, N'гисек (gisek)', 4096.0300, 12)
INSERT [dbo].[Dish] ([Id], [Title], [Price], [CookingTime]) VALUES (45, N'эмоху (emohu)', 354.8800, 52)
INSERT [dbo].[Dish] ([Id], [Title], [Price], [CookingTime]) VALUES (46, N'эзего (ezego)', 4014.9000, 52)
INSERT [dbo].[Dish] ([Id], [Title], [Price], [CookingTime]) VALUES (47, N'матит (matit)', 1228.1500, 34)
INSERT [dbo].[Dish] ([Id], [Title], [Price], [CookingTime]) VALUES (48, N'абуно (abuno)', 2117.1400, 15)
INSERT [dbo].[Dish] ([Id], [Title], [Price], [CookingTime]) VALUES (49, N'югупа (yugupa)', 531.6600, 53)
INSERT [dbo].[Dish] ([Id], [Title], [Price], [CookingTime]) VALUES (50, N'амулу (amulu)', 903.5800, 25)
INSERT [dbo].[Dish] ([Id], [Title], [Price], [CookingTime]) VALUES (51, N'евако (evako)', 3791.9200, 36)
INSERT [dbo].[Dish] ([Id], [Title], [Price], [CookingTime]) VALUES (52, N'етомо (etomo)', 2020.1200, 41)
INSERT [dbo].[Dish] ([Id], [Title], [Price], [CookingTime]) VALUES (53, N'акоке (akoke)', 4281.2900, 44)
INSERT [dbo].[Dish] ([Id], [Title], [Price], [CookingTime]) VALUES (54, N'фанув (fanuv)', 438.0200, 16)
INSERT [dbo].[Dish] ([Id], [Title], [Price], [CookingTime]) VALUES (55, N'уселе (usele)', 1695.4300, 52)
INSERT [dbo].[Dish] ([Id], [Title], [Price], [CookingTime]) VALUES (56, N'етите (etite)', 4136.4500, 41)
INSERT [dbo].[Dish] ([Id], [Title], [Price], [CookingTime]) VALUES (57, N'исуду (isudu)', 887.1800, 24)
INSERT [dbo].[Dish] ([Id], [Title], [Price], [CookingTime]) VALUES (58, N'эриди (eridi)', 277.1900, 29)
INSERT [dbo].[Dish] ([Id], [Title], [Price], [CookingTime]) VALUES (59, N'анокэ (anoke)', 2411.0200, 69)
INSERT [dbo].[Dish] ([Id], [Title], [Price], [CookingTime]) VALUES (60, N'имала (imala)', 1984.6400, 21)
INSERT [dbo].[Dish] ([Id], [Title], [Price], [CookingTime]) VALUES (61, N'асуту (asutu)', 1311.7100, 25)
INSERT [dbo].[Dish] ([Id], [Title], [Price], [CookingTime]) VALUES (62, N'алище (alische)', 2894.3200, 45)
INSERT [dbo].[Dish] ([Id], [Title], [Price], [CookingTime]) VALUES (63, N'гелоп (gelop)', 1351.6100, 20)
INSERT [dbo].[Dish] ([Id], [Title], [Price], [CookingTime]) VALUES (64, N'упити (upiti)', 488.6400, 48)
INSERT [dbo].[Dish] ([Id], [Title], [Price], [CookingTime]) VALUES (65, N'ореси (oresi)', 2199.2400, 20)
INSERT [dbo].[Dish] ([Id], [Title], [Price], [CookingTime]) VALUES (66, N'югика (yugika)', 470.9900, 14)
INSERT [dbo].[Dish] ([Id], [Title], [Price], [CookingTime]) VALUES (67, N'ецюру (ecyuru)', 3980.4300, 16)
INSERT [dbo].[Dish] ([Id], [Title], [Price], [CookingTime]) VALUES (68, N'океба (okeba)', 612.7500, 14)
INSERT [dbo].[Dish] ([Id], [Title], [Price], [CookingTime]) VALUES (69, N'кюгэг (kyugeg)', 1396.5600, 28)
INSERT [dbo].[Dish] ([Id], [Title], [Price], [CookingTime]) VALUES (70, N'якиме (yakime)', 4157.8700, 23)
INSERT [dbo].[Dish] ([Id], [Title], [Price], [CookingTime]) VALUES (71, N'ухуди (uhudi)', 3321.1700, 34)
INSERT [dbo].[Dish] ([Id], [Title], [Price], [CookingTime]) VALUES (72, N'оруко (oruko)', 3272.7800, 43)
INSERT [dbo].[Dish] ([Id], [Title], [Price], [CookingTime]) VALUES (73, N'дагим (dagim)', 3925.8900, 36)
INSERT [dbo].[Dish] ([Id], [Title], [Price], [CookingTime]) VALUES (74, N'екуци (ekuci)', 1081.7100, 39)
INSERT [dbo].[Dish] ([Id], [Title], [Price], [CookingTime]) VALUES (75, N'енугу (enugu)', 383.5400, 41)
INSERT [dbo].[Dish] ([Id], [Title], [Price], [CookingTime]) VALUES (76, N'пирин (pirin)', 837.4800, 21)
INSERT [dbo].[Dish] ([Id], [Title], [Price], [CookingTime]) VALUES (77, N'омиби (omibi)', 3579.1800, 12)
INSERT [dbo].[Dish] ([Id], [Title], [Price], [CookingTime]) VALUES (78, N'адиве (adive)', 1828.4800, 19)
INSERT [dbo].[Dish] ([Id], [Title], [Price], [CookingTime]) VALUES (79, N'пюном (pyunom)', 3405.8000, 62)
INSERT [dbo].[Dish] ([Id], [Title], [Price], [CookingTime]) VALUES (80, N'улока (uloka)', 3470.7000, 47)
SET IDENTITY_INSERT [dbo].[Dish] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Id], [UserId], [PlaceId], [OrderStatusId], [Created]) VALUES (1, 1, 1, 2, CAST(N'2022-03-11T12:30:00.000' AS DateTime))
INSERT [dbo].[Order] ([Id], [UserId], [PlaceId], [OrderStatusId], [Created]) VALUES (3, 2, 3, 2, CAST(N'2022-03-11T12:35:00.000' AS DateTime))
INSERT [dbo].[Order] ([Id], [UserId], [PlaceId], [OrderStatusId], [Created]) VALUES (4, 1, 2, 1, CAST(N'2022-03-11T11:57:00.000' AS DateTime))
INSERT [dbo].[Order] ([Id], [UserId], [PlaceId], [OrderStatusId], [Created]) VALUES (5, 2, 5, 1, CAST(N'2022-03-18T19:19:47.907' AS DateTime))
INSERT [dbo].[Order] ([Id], [UserId], [PlaceId], [OrderStatusId], [Created]) VALUES (6, 2, 6, 1, CAST(N'2022-03-18T19:33:17.413' AS DateTime))
INSERT [dbo].[Order] ([Id], [UserId], [PlaceId], [OrderStatusId], [Created]) VALUES (7, 2, 5, 1, CAST(N'2022-03-18T19:38:59.587' AS DateTime))
INSERT [dbo].[Order] ([Id], [UserId], [PlaceId], [OrderStatusId], [Created]) VALUES (8, 2, 4, 1, CAST(N'2022-03-21T14:30:56.163' AS DateTime))
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderStatus] ON 

INSERT [dbo].[OrderStatus] ([Id], [Title]) VALUES (1, N'принят')
INSERT [dbo].[OrderStatus] ([Id], [Title]) VALUES (2, N'готовится')
INSERT [dbo].[OrderStatus] ([Id], [Title]) VALUES (3, N'готов')
INSERT [dbo].[OrderStatus] ([Id], [Title]) VALUES (4, N'оплачен')
SET IDENTITY_INSERT [dbo].[OrderStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[Place] ON 

INSERT [dbo].[Place] ([Id], [Title]) VALUES (1, N'Столик 1')
INSERT [dbo].[Place] ([Id], [Title]) VALUES (2, N'Столик 2')
INSERT [dbo].[Place] ([Id], [Title]) VALUES (3, N'Столик 3')
INSERT [dbo].[Place] ([Id], [Title]) VALUES (4, N'Столик 4')
INSERT [dbo].[Place] ([Id], [Title]) VALUES (5, N'Диван 1')
INSERT [dbo].[Place] ([Id], [Title]) VALUES (6, N'Диван в углу')
SET IDENTITY_INSERT [dbo].[Place] OFF
GO
SET IDENTITY_INSERT [dbo].[Post] ON 

INSERT [dbo].[Post] ([Id], [Title]) VALUES (1, N'Повар')
INSERT [dbo].[Post] ([Id], [Title]) VALUES (2, N'Официант')
SET IDENTITY_INSERT [dbo].[Post] OFF
GO
SET IDENTITY_INSERT [dbo].[Reserve] ON 

INSERT [dbo].[Reserve] ([Id], [DishId], [OrderId]) VALUES (3, 42, 1)
INSERT [dbo].[Reserve] ([Id], [DishId], [OrderId]) VALUES (6, 53, 3)
INSERT [dbo].[Reserve] ([Id], [DishId], [OrderId]) VALUES (7, 53, 3)
INSERT [dbo].[Reserve] ([Id], [DishId], [OrderId]) VALUES (8, 53, 3)
INSERT [dbo].[Reserve] ([Id], [DishId], [OrderId]) VALUES (9, 53, 3)
INSERT [dbo].[Reserve] ([Id], [DishId], [OrderId]) VALUES (10, 46, 4)
INSERT [dbo].[Reserve] ([Id], [DishId], [OrderId]) VALUES (11, 55, 4)
INSERT [dbo].[Reserve] ([Id], [DishId], [OrderId]) VALUES (12, 54, 1)
INSERT [dbo].[Reserve] ([Id], [DishId], [OrderId]) VALUES (13, 53, 5)
INSERT [dbo].[Reserve] ([Id], [DishId], [OrderId]) VALUES (14, 53, 5)
INSERT [dbo].[Reserve] ([Id], [DishId], [OrderId]) VALUES (15, 53, 5)
INSERT [dbo].[Reserve] ([Id], [DishId], [OrderId]) VALUES (16, 53, 5)
INSERT [dbo].[Reserve] ([Id], [DishId], [OrderId]) VALUES (17, 42, 6)
INSERT [dbo].[Reserve] ([Id], [DishId], [OrderId]) VALUES (18, 72, 7)
INSERT [dbo].[Reserve] ([Id], [DishId], [OrderId]) VALUES (19, 73, 7)
INSERT [dbo].[Reserve] ([Id], [DishId], [OrderId]) VALUES (20, 74, 7)
INSERT [dbo].[Reserve] ([Id], [DishId], [OrderId]) VALUES (21, 42, 8)
INSERT [dbo].[Reserve] ([Id], [DishId], [OrderId]) VALUES (22, 58, 8)
SET IDENTITY_INSERT [dbo].[Reserve] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [Login], [Password], [LastName], [FirstName], [MiddleName], [PostId]) VALUES (1, N'Elley', N'wzFd4v', N'Гущин', N'Александр', N'Улебович', 1)
INSERT [dbo].[User] ([Id], [Login], [Password], [LastName], [FirstName], [MiddleName], [PostId]) VALUES (2, N'Ollay', N'mEwRoQ', N'Казаков', N'Гавриил', N'Геннадьевич', 2)
INSERT [dbo].[User] ([Id], [Login], [Password], [LastName], [FirstName], [MiddleName], [PostId]) VALUES (3, N'Blakery', N'tUwVqf', N'Брагин', N'Юлий', N'Фролович', 2)
INSERT [dbo].[User] ([Id], [Login], [Password], [LastName], [FirstName], [MiddleName], [PostId]) VALUES (4, N'Edex', N'lZmplZ', N'Щукин', N'Борис', N'Геннадиевич', 2)
INSERT [dbo].[User] ([Id], [Login], [Password], [LastName], [FirstName], [MiddleName], [PostId]) VALUES (5, N'Tomseph', N'nHl8DE', N'Гурьев', N'Ибрагил', N'Павлович', 1)
INSERT [dbo].[User] ([Id], [Login], [Password], [LastName], [FirstName], [MiddleName], [PostId]) VALUES (6, N'Louiecha', N'tDx6Is', N'Панфилов', N'Рудольф', N'Лукьевич', 2)
INSERT [dbo].[User] ([Id], [Login], [Password], [LastName], [FirstName], [MiddleName], [PostId]) VALUES (7, N'Bobam', N'Yjqxd3', N'Сафонов', N'Ираклий', N'Павлович', 2)
INSERT [dbo].[User] ([Id], [Login], [Password], [LastName], [FirstName], [MiddleName], [PostId]) VALUES (8, N'Ausni', N'wbicYa', N'Зуев', N'Семен', N'Богданович', 2)
INSERT [dbo].[User] ([Id], [Login], [Password], [LastName], [FirstName], [MiddleName], [PostId]) VALUES (9, N'Blakeot', N'POtncQ', N'Ковалёв', N'Игнат', N'Тарасович', 1)
INSERT [dbo].[User] ([Id], [Login], [Password], [LastName], [FirstName], [MiddleName], [PostId]) VALUES (10, N'Oscas', N'zvvDV9', N'Потапов', N'Мечеслав', N'Васильевич', 1)
INSERT [dbo].[User] ([Id], [Login], [Password], [LastName], [FirstName], [MiddleName], [PostId]) VALUES (11, N'Lukethan', N'WUbbSS', N'Маслов', N'Арсений', N'Семёнович', 2)
INSERT [dbo].[User] ([Id], [Login], [Password], [LastName], [FirstName], [MiddleName], [PostId]) VALUES (12, N'Brooketha', N'YdL5dx', N'Павлова', N'Анна', N'Антониновна', 2)
INSERT [dbo].[User] ([Id], [Login], [Password], [LastName], [FirstName], [MiddleName], [PostId]) VALUES (13, N'Avasica', N'mF5pSy', N'Ларионова', N'Джема', N'Богдановна', 1)
INSERT [dbo].[User] ([Id], [Login], [Password], [LastName], [FirstName], [MiddleName], [PostId]) VALUES (14, N'Mato', N'bS5D48', N'Якушева', N'Аэлита', N'Макаровна', 2)
INSERT [dbo].[User] ([Id], [Login], [Password], [LastName], [FirstName], [MiddleName], [PostId]) VALUES (15, N'Fretha', N'WyhoaP', N'Меркушева', N'Веста', N'Валентиновна', 2)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_OrderStatus] FOREIGN KEY([OrderStatusId])
REFERENCES [dbo].[OrderStatus] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_OrderStatus]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Place] FOREIGN KEY([PlaceId])
REFERENCES [dbo].[Place] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Place]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[Reserve]  WITH CHECK ADD  CONSTRAINT [FK_Reserve_Dish] FOREIGN KEY([DishId])
REFERENCES [dbo].[Dish] ([Id])
GO
ALTER TABLE [dbo].[Reserve] CHECK CONSTRAINT [FK_Reserve_Dish]
GO
ALTER TABLE [dbo].[Reserve]  WITH CHECK ADD  CONSTRAINT [FK_Reserve_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[Reserve] CHECK CONSTRAINT [FK_Reserve_Order]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Post] FOREIGN KEY([PostId])
REFERENCES [dbo].[Post] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Post]
GO
USE [master]
GO
ALTER DATABASE [gr602_chuded] SET  READ_WRITE 
GO
