USE [master]
GO
/****** Object:  Database [Projekat]    Script Date: 8/7/2019 1:33:33 AM ******/
CREATE DATABASE [Projekat]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Projekat', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Projekat.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Projekat_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Projekat_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Projekat] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Projekat].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Projekat] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Projekat] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Projekat] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Projekat] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Projekat] SET ARITHABORT OFF 
GO
ALTER DATABASE [Projekat] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Projekat] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Projekat] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Projekat] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Projekat] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Projekat] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Projekat] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Projekat] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Projekat] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Projekat] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Projekat] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Projekat] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Projekat] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Projekat] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Projekat] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Projekat] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Projekat] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Projekat] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Projekat] SET  MULTI_USER 
GO
ALTER DATABASE [Projekat] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Projekat] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Projekat] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Projekat] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Projekat] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Projekat]
GO
/****** Object:  User [Aleksandar]    Script Date: 8/7/2019 1:33:33 AM ******/
CREATE USER [Aleksandar] FOR LOGIN [Aleksandar] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Aleksa]    Script Date: 8/7/2019 1:33:33 AM ******/
CREATE USER [Aleksa] FOR LOGIN [Aleksa] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Login]    Script Date: 8/7/2019 1:33:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Login](
	[ID] [int] NOT NULL,
	[Account_Type] [bit] NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Month]    Script Date: 8/7/2019 1:33:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Month](
	[MonthID] [int] NOT NULL,
	[Month] [varchar](50) NOT NULL,
	[DaysInMonth] [int] NOT NULL,
 CONSTRAINT [PK_Month] PRIMARY KEY CLUSTERED 
(
	[MonthID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Position]    Script Date: 8/7/2019 1:33:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Position](
	[Name] [varchar](50) NOT NULL,
	[SalaryPerhour] [int] NOT NULL,
	[WorkHoursPerDay] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Salary]    Script Date: 8/7/2019 1:33:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Salary](
	[WorkerID] [int] NOT NULL,
	[Possition] [varchar](50) NOT NULL,
	[MonthID] [int] NOT NULL,
	[WorkDays] [int] NULL,
	[Salary] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Workers]    Script Date: 8/7/2019 1:33:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Workers](
	[ID] [int] NOT NULL CONSTRAINT [DF_Workers_ID]  DEFAULT ((1)),
	[Name] [varchar](25) NOT NULL,
	[Surname] [varchar](25) NULL,
	[Email] [varchar](50) NULL,
	[Birth] [date] NULL,
	[Username] [varchar](50) NOT NULL,
	[Position] [varchar](50) NOT NULL,
	[Phone] [char](11) NULL,
	[Gender] [varchar](6) NOT NULL,
 CONSTRAINT [PK_Workers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Login] ([ID], [Account_Type], [Username], [Password]) VALUES (1, 1, N'Aleksa', N'C53E479B03B3220D3D56DA88C4CACE20')
INSERT [dbo].[Login] ([ID], [Account_Type], [Username], [Password]) VALUES (2, 1, N'Aleksandar', N'C53E479B03B3220D3D56DA88C4CACE20')
INSERT [dbo].[Login] ([ID], [Account_Type], [Username], [Password]) VALUES (3, 1, N'Admin', N'E3AFED0047B08059D0FADA10F400C1E5')
INSERT [dbo].[Login] ([ID], [Account_Type], [Username], [Password]) VALUES (4, 0, N'Joe', N'292C36B86220435947D492794CBCA50F')
INSERT [dbo].[Login] ([ID], [Account_Type], [Username], [Password]) VALUES (5, 0, N'Nick', N'425AAEEBE7B0DDB18E1AC0FFC59FA62A')
INSERT [dbo].[Login] ([ID], [Account_Type], [Username], [Password]) VALUES (6, 0, N'Edvin', N'E2F60289C2C94201A4090B20B8CD5822')
INSERT [dbo].[Login] ([ID], [Account_Type], [Username], [Password]) VALUES (7, 0, N'Rickon', N'26A10E82C687BFBA02AFF0F59C42AC6C')
INSERT [dbo].[Login] ([ID], [Account_Type], [Username], [Password]) VALUES (8, 0, N'Severick', N'FDC3C398D67615C64F200910C45C2D98')
INSERT [dbo].[Login] ([ID], [Account_Type], [Username], [Password]) VALUES (9, 0, N'Jon Snow', N'1DA2427004FF563B076DA4AEA6DF8F98')
INSERT [dbo].[Login] ([ID], [Account_Type], [Username], [Password]) VALUES (10, 0, N'Nikolaj', N'831116ADDD26FF4C21E2720CBB82DFBA')
INSERT [dbo].[Login] ([ID], [Account_Type], [Username], [Password]) VALUES (11, 0, N'Simens', N'0FC3A668B8F1945C10694EAEF5D2F797')
INSERT [dbo].[Login] ([ID], [Account_Type], [Username], [Password]) VALUES (12, 0, N'NNikolica', N'0568B6CD0670A95948B390B9412E84A7')
INSERT [dbo].[Login] ([ID], [Account_Type], [Username], [Password]) VALUES (13, 0, N'User', N'8F9BFE9D1345237CB3B2B205864DA075')
INSERT [dbo].[Login] ([ID], [Account_Type], [Username], [Password]) VALUES (14, 1, N'MarLeksa', N'292C36B86220435947D492794CBCA50F')
INSERT [dbo].[Month] ([MonthID], [Month], [DaysInMonth]) VALUES (1, N'January', 31)
INSERT [dbo].[Month] ([MonthID], [Month], [DaysInMonth]) VALUES (2, N'February', 28)
INSERT [dbo].[Month] ([MonthID], [Month], [DaysInMonth]) VALUES (3, N'March', 31)
INSERT [dbo].[Month] ([MonthID], [Month], [DaysInMonth]) VALUES (4, N'April', 30)
INSERT [dbo].[Month] ([MonthID], [Month], [DaysInMonth]) VALUES (5, N'May', 31)
INSERT [dbo].[Month] ([MonthID], [Month], [DaysInMonth]) VALUES (6, N'June', 30)
INSERT [dbo].[Month] ([MonthID], [Month], [DaysInMonth]) VALUES (7, N'July', 31)
INSERT [dbo].[Month] ([MonthID], [Month], [DaysInMonth]) VALUES (8, N'August', 31)
INSERT [dbo].[Month] ([MonthID], [Month], [DaysInMonth]) VALUES (9, N'September', 30)
INSERT [dbo].[Month] ([MonthID], [Month], [DaysInMonth]) VALUES (10, N'October', 31)
INSERT [dbo].[Month] ([MonthID], [Month], [DaysInMonth]) VALUES (11, N'November', 30)
INSERT [dbo].[Month] ([MonthID], [Month], [DaysInMonth]) VALUES (12, N'December', 31)
INSERT [dbo].[Position] ([Name], [SalaryPerhour], [WorkHoursPerDay]) VALUES (N'Accounting', 27, 8)
INSERT [dbo].[Position] ([Name], [SalaryPerhour], [WorkHoursPerDay]) VALUES (N'Administrator', 16, 8)
INSERT [dbo].[Position] ([Name], [SalaryPerhour], [WorkHoursPerDay]) VALUES (N'Driver', 7, 4)
INSERT [dbo].[Position] ([Name], [SalaryPerhour], [WorkHoursPerDay]) VALUES (N'Gravedigger', 3, 10)
INSERT [dbo].[Position] ([Name], [SalaryPerhour], [WorkHoursPerDay]) VALUES (N'Manager', 30, 5)
INSERT [dbo].[Position] ([Name], [SalaryPerhour], [WorkHoursPerDay]) VALUES (N'Owner', 35, 4)
INSERT [dbo].[Salary] ([WorkerID], [Possition], [MonthID], [WorkDays], [Salary]) VALUES (1, N'Administrator(IT)', 1, 22, 2640)
INSERT [dbo].[Salary] ([WorkerID], [Possition], [MonthID], [WorkDays], [Salary]) VALUES (1, N'Administrator(IT)', 2, 19, 2280)
INSERT [dbo].[Salary] ([WorkerID], [Possition], [MonthID], [WorkDays], [Salary]) VALUES (1, N'Administrator(IT)', 3, 21, 2520)
INSERT [dbo].[Salary] ([WorkerID], [Possition], [MonthID], [WorkDays], [Salary]) VALUES (1, N'Administrator(IT)', 4, 22, 2640)
INSERT [dbo].[Salary] ([WorkerID], [Possition], [MonthID], [WorkDays], [Salary]) VALUES (2, N'Administrator(IT)', 1, 22, 2640)
INSERT [dbo].[Salary] ([WorkerID], [Possition], [MonthID], [WorkDays], [Salary]) VALUES (2, N'Administrator(IT)', 2, 19, 2280)
INSERT [dbo].[Salary] ([WorkerID], [Possition], [MonthID], [WorkDays], [Salary]) VALUES (2, N'Administrator(IT)', 3, 21, 2520)
INSERT [dbo].[Salary] ([WorkerID], [Possition], [MonthID], [WorkDays], [Salary]) VALUES (2, N'Administrator(IT)', 4, 22, 2640)
INSERT [dbo].[Workers] ([ID], [Name], [Surname], [Email], [Birth], [Username], [Position], [Phone], [Gender]) VALUES (1, N'Aleksa', N'Marceta', N'marceta.aleksa@sahrane.grob', CAST(N'1998-01-23' AS Date), N'Aleksa', N'Administrator', N'38766311227', N'Male')
INSERT [dbo].[Workers] ([ID], [Name], [Surname], [Email], [Birth], [Username], [Position], [Phone], [Gender]) VALUES (2, N'Aleksandar', N'Panzalovic', N'panzalovic.aleksandar@sahrane.grob', CAST(N'1998-05-22' AS Date), N'Aleksandar', N'Administrator', N'38766257486', N'Male')
INSERT [dbo].[Workers] ([ID], [Name], [Surname], [Email], [Birth], [Username], [Position], [Phone], [Gender]) VALUES (3, N'Admin', N'', N'admin@sahrane.grob', NULL, N'Admin', N'Administrator', N'           ', N'Male')
INSERT [dbo].[Workers] ([ID], [Name], [Surname], [Email], [Birth], [Username], [Position], [Phone], [Gender]) VALUES (4, N'Joe', N'Jonson', N'jonson.joe@sahrane.grob', CAST(N'1985-05-25' AS Date), N'Joe', N'Gravedigger', N'38765447882', N'Male')
INSERT [dbo].[Workers] ([ID], [Name], [Surname], [Email], [Birth], [Username], [Position], [Phone], [Gender]) VALUES (5, N'Nick', N'Smith', N'smith.nick@sahrane.grob', CAST(N'1994-03-15' AS Date), N'Nick', N'Gravedigger', N'38763457836', N'Male')
INSERT [dbo].[Workers] ([ID], [Name], [Surname], [Email], [Birth], [Username], [Position], [Phone], [Gender]) VALUES (6, N'Edvin', N'Rockefeller', N'rockefeller.edvin@sahrane.grob', CAST(N'1981-08-11' AS Date), N'Edvin', N'Accountant', N'38764400053', N'Male')
INSERT [dbo].[Workers] ([ID], [Name], [Surname], [Email], [Birth], [Username], [Position], [Phone], [Gender]) VALUES (7, N'Rickon', N'Goldenberg', N'goldenberg.rickon@sahrane.grob', CAST(N'1976-11-28' AS Date), N'Rickon', N'Owner', N'38764444444', N'Male')
INSERT [dbo].[Workers] ([ID], [Name], [Surname], [Email], [Birth], [Username], [Position], [Phone], [Gender]) VALUES (8, N'Severick', N'Uller', N'uller.severick@sahrane.grob', CAST(N'1977-09-02' AS Date), N'Severick', N'Manager', N'38766789425', N'Male')
INSERT [dbo].[Workers] ([ID], [Name], [Surname], [Email], [Birth], [Username], [Position], [Phone], [Gender]) VALUES (9, N'Jon', N'Snow', N'snow.jon@sahrane.grob', CAST(N'1996-05-27' AS Date), N'Jon Snow', N'Nothing', N'38766587824', N'Male')
INSERT [dbo].[Workers] ([ID], [Name], [Surname], [Email], [Birth], [Username], [Position], [Phone], [Gender]) VALUES (10, N'Nikolaj', N'Raskjevich', N'raskjevich.nikolaj@grobari.grob', CAST(N'1973-05-12' AS Date), N'Nikolaj', N'Gravedigger', N'38766985124', N'Male')
INSERT [dbo].[Workers] ([ID], [Name], [Surname], [Email], [Birth], [Username], [Position], [Phone], [Gender]) VALUES (11, N'Simens', N'Lokovich', N'lokovich.simens@grobari.grob', CAST(N'1988-12-25' AS Date), N'Simens', N'Lokovich', N'38766452258', N'Male')
INSERT [dbo].[Workers] ([ID], [Name], [Surname], [Email], [Birth], [Username], [Position], [Phone], [Gender]) VALUES (12, N'Nikola', N'Stankovic', N'nikola.nbv@grobari.grob', CAST(N'1998-03-04' AS Date), N'NNikolica', N'Nikola', N'38765027997', N'Male')
INSERT [dbo].[Workers] ([ID], [Name], [Surname], [Email], [Birth], [Username], [Position], [Phone], [Gender]) VALUES (13, N'User', N'', N'', CAST(N'1900-01-01' AS Date), N'User', N'User', N'           ', N'Male')
INSERT [dbo].[Workers] ([ID], [Name], [Surname], [Email], [Birth], [Username], [Position], [Phone], [Gender]) VALUES (14, N'Aleksa', N'Marceta', N'marceta.aleksa@outlook.com', CAST(N'1998-01-23' AS Date), N'MarLeksa', N'Administrator', N'38713554332', N'Muški')
ALTER TABLE [dbo].[Login]  WITH CHECK ADD  CONSTRAINT [FK_Login_Workers] FOREIGN KEY([ID])
REFERENCES [dbo].[Workers] ([ID])
GO
ALTER TABLE [dbo].[Login] CHECK CONSTRAINT [FK_Login_Workers]
GO
USE [master]
GO
ALTER DATABASE [Projekat] SET  READ_WRITE 
GO
