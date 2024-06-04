USE [QLNhapcanh]
GO
/****** Object:  Table [dbo].[Immigrant]    Script Date: 6/4/2024 8:53:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Immigrant](
	[Type] [int] NULL,
	[ImmigrantID] [varchar](10) NOT NULL,
	[Name] [varchar](100) NULL,
	[BirthDate] [date] NULL,
	[Passport] [varchar](20) NULL,
	[Nationality] [varchar](50) NULL,
	[ImmigrantDate] [date] NULL,
	[StayLength] [varchar](20) NULL,
	[University] [varchar](100) NULL,
	[Majors] [varchar](100) NULL,
	[Company] [varchar](100) NULL,
	[LaborType] [varchar](50) NULL,
	[StayPlace] [varchar](100) NULL,
	[DiscountRate] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[ImmigrantID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Immigrant] ([Type], [ImmigrantID], [Name], [BirthDate], [Passport], [Nationality], [ImmigrantDate], [StayLength], [University], [Majors], [Company], [LaborType], [StayPlace], [DiscountRate]) VALUES (1, N'IM001', N'Nguyen Bao Anh', CAST(N'1983-06-03' AS Date), N'36A5333532', N'Anh', CAST(N'2020-11-05' AS Date), N'2 n-âm', N'Seoul', N'CNTT', NULL, NULL, NULL, NULL)
INSERT [dbo].[Immigrant] ([Type], [ImmigrantID], [Name], [BirthDate], [Passport], [Nationality], [ImmigrantDate], [StayLength], [University], [Majors], [Company], [LaborType], [StayPlace], [DiscountRate]) VALUES (2, N'IM002', N'Pham Anh Minh', CAST(N'2018-05-02' AS Date), N'ff4455rrrtgw', N'VietNam', CAST(N'2021-06-15' AS Date), N'3 n-âm', NULL, NULL, N'Bß¦úo Thß+ïnh', N'Phß+ò th+¦ng', NULL, NULL)
INSERT [dbo].[Immigrant] ([Type], [ImmigrantID], [Name], [BirthDate], [Passport], [Nationality], [ImmigrantDate], [StayLength], [University], [Majors], [Company], [LaborType], [StayPlace], [DiscountRate]) VALUES (3, N'IM003', N'Le Duong Phuc', CAST(N'1975-10-03' AS Date), N'gfheke4444', N'Nhat', CAST(N'2020-05-24' AS Date), N'6 th+íng', NULL, NULL, N'SaiGonTourist', NULL, N'Morin Hotel', NULL)
INSERT [dbo].[Immigrant] ([Type], [ImmigrantID], [Name], [BirthDate], [Passport], [Nationality], [ImmigrantDate], [StayLength], [University], [Majors], [Company], [LaborType], [StayPlace], [DiscountRate]) VALUES (1, N'IM004', N'Tran Cong Minh', CAST(N'1972-04-04' AS Date), N'fjhi4444yw2', N'Phap', CAST(N'2021-05-04' AS Date), N'2 n-âm', N'Osaka', N'Sinh hß+ìc', NULL, NULL, NULL, NULL)
INSERT [dbo].[Immigrant] ([Type], [ImmigrantID], [Name], [BirthDate], [Passport], [Nationality], [ImmigrantDate], [StayLength], [University], [Majors], [Company], [LaborType], [StayPlace], [DiscountRate]) VALUES (2, N'IM005', N'Tran Dinh Nghia', CAST(N'2015-07-08' AS Date), N'kjsnw66666', N'Due', CAST(N'2021-04-06' AS Date), N'2 n-âm', NULL, NULL, N'VINACO', N'Chuy+¬n ng+ánh', NULL, NULL)
INSERT [dbo].[Immigrant] ([Type], [ImmigrantID], [Name], [BirthDate], [Passport], [Nationality], [ImmigrantDate], [StayLength], [University], [Majors], [Company], [LaborType], [StayPlace], [DiscountRate]) VALUES (3, N'IM006', N'Tran Gia Bao', CAST(N'1980-03-15' AS Date), N'983492hfr', N'Y', CAST(N'2021-07-08' AS Date), N'2 n-âm', NULL, NULL, N'Bß¦+n Th+ánh', NULL, N'Novotel Hotel', NULL)
INSERT [dbo].[Immigrant] ([Type], [ImmigrantID], [Name], [BirthDate], [Passport], [Nationality], [ImmigrantDate], [StayLength], [University], [Majors], [Company], [LaborType], [StayPlace], [DiscountRate]) VALUES (1, N'IM007', N'Nguyen Minh Phuong', CAST(N'1979-06-07' AS Date), N'ehfi877778', N'Uc', CAST(N'2020-12-04' AS Date), N'1 n-âm', N'Harvard', N'Vß¦¡t l++', NULL, NULL, NULL, NULL)
INSERT [dbo].[Immigrant] ([Type], [ImmigrantID], [Name], [BirthDate], [Passport], [Nationality], [ImmigrantDate], [StayLength], [University], [Majors], [Company], [LaborType], [StayPlace], [DiscountRate]) VALUES (2, N'IM008', N'Pham Ba Chau', CAST(N'2017-04-05' AS Date), N'kdj2222njr9', N'Anh', CAST(N'2021-06-03' AS Date), N'4 n-âm', NULL, NULL, N'VINACO', N'Phß+ò th+¦ng', NULL, NULL)
INSERT [dbo].[Immigrant] ([Type], [ImmigrantID], [Name], [BirthDate], [Passport], [Nationality], [ImmigrantDate], [StayLength], [University], [Majors], [Company], [LaborType], [StayPlace], [DiscountRate]) VALUES (3, N'IM009', N'Tran Nhu Thu', CAST(N'1970-06-09' AS Date), N'jfijf9euf77', N'Nhat', CAST(N'2021-08-25' AS Date), N'3 th+íng', NULL, NULL, N'TST', NULL, N'Imperial Hotel', NULL)
INSERT [dbo].[Immigrant] ([Type], [ImmigrantID], [Name], [BirthDate], [Passport], [Nationality], [ImmigrantDate], [StayLength], [University], [Majors], [Company], [LaborType], [StayPlace], [DiscountRate]) VALUES (1, N'IM010', N'Nguyen Thi Thuy', CAST(N'1989-04-02' AS Date), N'jifu9999933', N'Phap', CAST(N'2021-09-25' AS Date), N'2 n-âm', N'Monash', N'To+ín', NULL, NULL, NULL, NULL)
GO
