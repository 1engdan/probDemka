USE [demkamaster]
GO
/****** Object:  Table [dbo].[MaterialType]    Script Date: 28.02.2025 4:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialType](
	[IDMaterialType] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[Procent] [float] NOT NULL,
 CONSTRAINT [PK_MaterialType] PRIMARY KEY CLUSTERED 
(
	[IDMaterialType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Parthner]    Script Date: 28.02.2025 4:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parthner](
	[IDParthner] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[Surname] [varchar](25) NOT NULL,
	[Name] [varchar](15) NOT NULL,
	[Patronymic] [varchar](25) NULL,
	[Email] [varchar](50) NOT NULL,
	[Phone] [varchar](14) NOT NULL,
	[Address] [varchar](max) NOT NULL,
	[INN] [varchar](12) NULL,
	[Rate] [varchar](2) NOT NULL,
	[TypeID] [int] NOT NULL,
 CONSTRAINT [PK_Parthner] PRIMARY KEY CLUSTERED 
(
	[IDParthner] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ParthnerProduct]    Script Date: 28.02.2025 4:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParthnerProduct](
	[IDPProduct] [int] IDENTITY(1,1) NOT NULL,
	[Count] [int] NOT NULL,
	[DateSell] [date] NOT NULL,
	[ParthnerID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
 CONSTRAINT [PK_ParthnerProduct] PRIMARY KEY CLUSTERED 
(
	[IDPProduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ParthnerType]    Script Date: 28.02.2025 4:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParthnerType](
	[IDPathner] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](3) NOT NULL,
 CONSTRAINT [PK_ParthnerType] PRIMARY KEY CLUSTERED 
(
	[IDPathner] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 28.02.2025 4:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[IDProduct] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](max) NOT NULL,
	[Articul] [varchar](7) NOT NULL,
	[MinCost] [decimal](9, 2) NOT NULL,
	[TypeID] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[IDProduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 28.02.2025 4:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[IDProductType] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[Procent] [float] NOT NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[IDProductType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[MaterialType] ON 

INSERT [dbo].[MaterialType] ([IDMaterialType], [Title], [Procent]) VALUES (1, N'Тип материала 1', 0.100000001490116)
INSERT [dbo].[MaterialType] ([IDMaterialType], [Title], [Procent]) VALUES (2, N'Тип материала 2', 0.949999988079071)
INSERT [dbo].[MaterialType] ([IDMaterialType], [Title], [Procent]) VALUES (3, N'Тип материала 3', 0.280000001192093)
INSERT [dbo].[MaterialType] ([IDMaterialType], [Title], [Procent]) VALUES (4, N'Тип материала 4', 0.550000011920929)
INSERT [dbo].[MaterialType] ([IDMaterialType], [Title], [Procent]) VALUES (5, N'Тип материала 5', 0.340000003576279)
SET IDENTITY_INSERT [dbo].[MaterialType] OFF
GO
SET IDENTITY_INSERT [dbo].[Parthner] ON 

INSERT [dbo].[Parthner] ([IDParthner], [Title], [Surname], [Name], [Patronymic], [Email], [Phone], [Address], [INN], [Rate], [TypeID]) VALUES (1, N'База Строитель', N'Иванова', N'Александра', N'Ивановна', N'aleksandraivanova@ml.ru', N'493 123 45 67', N'652050, Кемеровская область, город Юрга, ул. Лесная, 15', N'2222455179
', N'7', 1)
INSERT [dbo].[Parthner] ([IDParthner], [Title], [Surname], [Name], [Patronymic], [Email], [Phone], [Address], [INN], [Rate], [TypeID]) VALUES (2, N'Паркет 29', N'Петров', N'Василий', N'Петрович', N'vppetrov@vl.ru', N'987 123 56 78', N'164500, Архангельская область, город Северодвинск, ул. Строителей, 18', N'3333888520
', N'7', 3)
INSERT [dbo].[Parthner] ([IDParthner], [Title], [Surname], [Name], [Patronymic], [Email], [Phone], [Address], [INN], [Rate], [TypeID]) VALUES (3, N'Стройсервис', N'Соловьев', N'Андрей', N'Николаевич', N'ansolovev@st.ru', N'812 223 32 00', N'188910, Ленинградская область, город Приморск, ул. Парковая, 21', N'4440391035
', N'7', 4)
INSERT [dbo].[Parthner] ([IDParthner], [Title], [Surname], [Name], [Patronymic], [Email], [Phone], [Address], [INN], [Rate], [TypeID]) VALUES (4, N'Ремонт и отделка', N'Воробьева', N'Екатерина', N'Валерьевна', N'ekaterina.vorobeva@ml.ru', N'444 222 33 11', N'143960, Московская область, город Реутов, ул. Свободы, 51', N'1111520857
', N'5', 2)
INSERT [dbo].[Parthner] ([IDParthner], [Title], [Surname], [Name], [Patronymic], [Email], [Phone], [Address], [INN], [Rate], [TypeID]) VALUES (5, N'МонтажПро', N'Степанов', N'Степан', N'Сергеевич', N'stepanov@stepan.ru', N'912 888 33 33', N'309500, Белгородская область, город Старый Оскол, ул. Рабочая, 122', N'5552431140
', N'10', 1)
SET IDENTITY_INSERT [dbo].[Parthner] OFF
GO
SET IDENTITY_INSERT [dbo].[ParthnerProduct] ON 

INSERT [dbo].[ParthnerProduct] ([IDPProduct], [Count], [DateSell], [ParthnerID], [ProductID]) VALUES (1, 15500, CAST(N'2023-03-23' AS Date), 1, 1)
INSERT [dbo].[ParthnerProduct] ([IDPProduct], [Count], [DateSell], [ParthnerID], [ProductID]) VALUES (2, 12350, CAST(N'2023-12-18' AS Date), 1, 3)
INSERT [dbo].[ParthnerProduct] ([IDPProduct], [Count], [DateSell], [ParthnerID], [ProductID]) VALUES (3, 37400, CAST(N'2024-06-07' AS Date), 1, 4)
INSERT [dbo].[ParthnerProduct] ([IDPProduct], [Count], [DateSell], [ParthnerID], [ProductID]) VALUES (4, 35000, CAST(N'2022-12-02' AS Date), 2, 2)
INSERT [dbo].[ParthnerProduct] ([IDPProduct], [Count], [DateSell], [ParthnerID], [ProductID]) VALUES (5, 1250, CAST(N'2023-05-17' AS Date), 2, 5)
INSERT [dbo].[ParthnerProduct] ([IDPProduct], [Count], [DateSell], [ParthnerID], [ProductID]) VALUES (6, 1000, CAST(N'2024-06-07' AS Date), 2, 3)
INSERT [dbo].[ParthnerProduct] ([IDPProduct], [Count], [DateSell], [ParthnerID], [ProductID]) VALUES (7, 7550, CAST(N'2024-07-01' AS Date), 2, 1)
INSERT [dbo].[ParthnerProduct] ([IDPProduct], [Count], [DateSell], [ParthnerID], [ProductID]) VALUES (8, 7250, CAST(N'2023-01-22' AS Date), 3, 1)
INSERT [dbo].[ParthnerProduct] ([IDPProduct], [Count], [DateSell], [ParthnerID], [ProductID]) VALUES (9, 2500, CAST(N'2024-07-05' AS Date), 3, 2)
INSERT [dbo].[ParthnerProduct] ([IDPProduct], [Count], [DateSell], [ParthnerID], [ProductID]) VALUES (10, 59050, CAST(N'2023-03-20' AS Date), 4, 4)
INSERT [dbo].[ParthnerProduct] ([IDPProduct], [Count], [DateSell], [ParthnerID], [ProductID]) VALUES (11, 37200, CAST(N'2024-03-12' AS Date), 4, 3)
INSERT [dbo].[ParthnerProduct] ([IDPProduct], [Count], [DateSell], [ParthnerID], [ProductID]) VALUES (12, 4500, CAST(N'2024-05-14' AS Date), 4, 5)
INSERT [dbo].[ParthnerProduct] ([IDPProduct], [Count], [DateSell], [ParthnerID], [ProductID]) VALUES (13, 50000, CAST(N'2023-09-19' AS Date), 5, 3)
INSERT [dbo].[ParthnerProduct] ([IDPProduct], [Count], [DateSell], [ParthnerID], [ProductID]) VALUES (14, 670000, CAST(N'2023-11-10' AS Date), 5, 4)
INSERT [dbo].[ParthnerProduct] ([IDPProduct], [Count], [DateSell], [ParthnerID], [ProductID]) VALUES (15, 35000, CAST(N'2024-04-15' AS Date), 5, 1)
INSERT [dbo].[ParthnerProduct] ([IDPProduct], [Count], [DateSell], [ParthnerID], [ProductID]) VALUES (16, 25000, CAST(N'2024-06-12' AS Date), 5, 2)
SET IDENTITY_INSERT [dbo].[ParthnerProduct] OFF
GO
SET IDENTITY_INSERT [dbo].[ParthnerType] ON 

INSERT [dbo].[ParthnerType] ([IDPathner], [Title]) VALUES (1, N'ЗАО')
INSERT [dbo].[ParthnerType] ([IDPathner], [Title]) VALUES (2, N'ОАО')
INSERT [dbo].[ParthnerType] ([IDPathner], [Title]) VALUES (3, N'ООО')
INSERT [dbo].[ParthnerType] ([IDPathner], [Title]) VALUES (4, N'ПАО')
SET IDENTITY_INSERT [dbo].[ParthnerType] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([IDProduct], [Title], [Articul], [MinCost], [TypeID]) VALUES (1, N'Паркетная доска Ясень темный однополосная 14 мм', N'8758385', CAST(4456.90 AS Decimal(9, 2)), 3)
INSERT [dbo].[Product] ([IDProduct], [Title], [Articul], [MinCost], [TypeID]) VALUES (2, N'Инженерная доска Дуб Французская елка однополосная 12 мм', N'8858958', CAST(7330.99 AS Decimal(9, 2)), 3)
INSERT [dbo].[Product] ([IDProduct], [Title], [Articul], [MinCost], [TypeID]) VALUES (3, N'Ламинат Дуб дымчато-белый 33 класс 12 мм', N'7750282', CAST(1799.33 AS Decimal(9, 2)), 1)
INSERT [dbo].[Product] ([IDProduct], [Title], [Articul], [MinCost], [TypeID]) VALUES (4, N'Ламинат Дуб серый 32 класс 8 мм с фаской', N'7028748', CAST(3890.41 AS Decimal(9, 2)), 1)
INSERT [dbo].[Product] ([IDProduct], [Title], [Articul], [MinCost], [TypeID]) VALUES (5, N'Пробковое напольное клеевое покрытие 32 класс 4 мм', N'5012543', CAST(5450.59 AS Decimal(9, 2)), 4)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductType] ON 

INSERT [dbo].[ProductType] ([IDProductType], [Title], [Procent]) VALUES (1, N'Ламинат', 2.35)
INSERT [dbo].[ProductType] ([IDProductType], [Title], [Procent]) VALUES (2, N'Массивная доска', 5.15)
INSERT [dbo].[ProductType] ([IDProductType], [Title], [Procent]) VALUES (3, N'Паркетная доска', 4.34)
INSERT [dbo].[ProductType] ([IDProductType], [Title], [Procent]) VALUES (4, N'Пробковое покрытие', 1.5)
SET IDENTITY_INSERT [dbo].[ProductType] OFF
GO
ALTER TABLE [dbo].[Parthner]  WITH CHECK ADD  CONSTRAINT [FK_Parthner_ParthnerType] FOREIGN KEY([TypeID])
REFERENCES [dbo].[ParthnerType] ([IDPathner])
GO
ALTER TABLE [dbo].[Parthner] CHECK CONSTRAINT [FK_Parthner_ParthnerType]
GO
ALTER TABLE [dbo].[ParthnerProduct]  WITH CHECK ADD  CONSTRAINT [FK_ParthnerProduct_Parthner] FOREIGN KEY([ParthnerID])
REFERENCES [dbo].[Parthner] ([IDParthner])
GO
ALTER TABLE [dbo].[ParthnerProduct] CHECK CONSTRAINT [FK_ParthnerProduct_Parthner]
GO
ALTER TABLE [dbo].[ParthnerProduct]  WITH CHECK ADD  CONSTRAINT [FK_ParthnerProduct_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([IDProduct])
GO
ALTER TABLE [dbo].[ParthnerProduct] CHECK CONSTRAINT [FK_ParthnerProduct_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductType] FOREIGN KEY([TypeID])
REFERENCES [dbo].[ProductType] ([IDProductType])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductType]
GO
