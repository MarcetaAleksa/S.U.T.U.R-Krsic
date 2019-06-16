USE [master]
GO
/****** Object:  Database [Pogrebne_Usluge_Krsic]    Script Date: 17.6.19 00:14:00 ******/
CREATE DATABASE [Pogrebne_Usluge_Krsic]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Pogrebne_Usluge_Krsic', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS02\MSSQL\DATA\Pogrebne_Usluge_Krsic.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Pogrebne_Usluge_Krsic_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS02\MSSQL\DATA\Pogrebne_Usluge_Krsic_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Pogrebne_Usluge_Krsic] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Pogrebne_Usluge_Krsic].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Pogrebne_Usluge_Krsic] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Pogrebne_Usluge_Krsic] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Pogrebne_Usluge_Krsic] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Pogrebne_Usluge_Krsic] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Pogrebne_Usluge_Krsic] SET ARITHABORT OFF 
GO
ALTER DATABASE [Pogrebne_Usluge_Krsic] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Pogrebne_Usluge_Krsic] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Pogrebne_Usluge_Krsic] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Pogrebne_Usluge_Krsic] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Pogrebne_Usluge_Krsic] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Pogrebne_Usluge_Krsic] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Pogrebne_Usluge_Krsic] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Pogrebne_Usluge_Krsic] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Pogrebne_Usluge_Krsic] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Pogrebne_Usluge_Krsic] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Pogrebne_Usluge_Krsic] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Pogrebne_Usluge_Krsic] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Pogrebne_Usluge_Krsic] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Pogrebne_Usluge_Krsic] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Pogrebne_Usluge_Krsic] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Pogrebne_Usluge_Krsic] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Pogrebne_Usluge_Krsic] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Pogrebne_Usluge_Krsic] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Pogrebne_Usluge_Krsic] SET  MULTI_USER 
GO
ALTER DATABASE [Pogrebne_Usluge_Krsic] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Pogrebne_Usluge_Krsic] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Pogrebne_Usluge_Krsic] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Pogrebne_Usluge_Krsic] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Pogrebne_Usluge_Krsic] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Pogrebne_Usluge_Krsic] SET QUERY_STORE = OFF
GO
USE [Pogrebne_Usluge_Krsic]
GO
/****** Object:  Table [dbo].[Combination]    Script Date: 17.6.19 00:14:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Combination](
	[Worker_ID] [char](2) NOT NULL,
	[Month_ID] [char](3) NOT NULL,
	[Work_Days] [tinyint] NOT NULL,
	[Days_Worked] [tinyint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Login]    Script Date: 17.6.19 00:14:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[Worker_ID] [char](2) NOT NULL,
	[Account_type] [bit] NOT NULL,
	[Username] [char](16) NOT NULL,
	[Password] [char](32) NOT NULL,
 CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED 
(
	[Worker_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Month]    Script Date: 17.6.19 00:14:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Month](
	[Month_ID] [char](3) NOT NULL,
	[Month] [char](10) NOT NULL,
	[Days_In_Month] [tinyint] NOT NULL,
 CONSTRAINT [PK_Month] PRIMARY KEY CLUSTERED 
(
	[Month_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Position]    Script Date: 17.6.19 00:14:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Position](
	[Position_ID] [char](2) NOT NULL,
	[Salary_Per_Hour] [tinyint] NOT NULL,
	[Work_Hours_Per_Day] [tinyint] NOT NULL,
	[Base_Salary]  AS ([Work_hours_per_day]*[Work_days_in_week]),
	[Work_Days_In_Week] [tinyint] NOT NULL,
 CONSTRAINT [PK_Position] PRIMARY KEY CLUSTERED 
(
	[Position_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Workers]    Script Date: 17.6.19 00:14:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Workers](
	[Username] [char](16) NOT NULL,
	[Name] [char](12) NOT NULL,
	[Surname] [char](15) NOT NULL,
	[Email] [char](30) NOT NULL,
	[Birth] [date] NULL,
	[Position_ID] [char](2) NOT NULL,
	[Phone] [char](12) NULL,
	[Gender] [bit] NOT NULL,
	[Worker_ID] [char](2) NOT NULL,
 CONSTRAINT [PK_Workers] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Combination]  WITH CHECK ADD  CONSTRAINT [FK_Combination_Login] FOREIGN KEY([Worker_ID])
REFERENCES [dbo].[Login] ([Worker_ID])
GO
ALTER TABLE [dbo].[Combination] CHECK CONSTRAINT [FK_Combination_Login]
GO
ALTER TABLE [dbo].[Combination]  WITH CHECK ADD  CONSTRAINT [FK_Combination_Month] FOREIGN KEY([Month_ID])
REFERENCES [dbo].[Month] ([Month_ID])
GO
ALTER TABLE [dbo].[Combination] CHECK CONSTRAINT [FK_Combination_Month]
GO
ALTER TABLE [dbo].[Login]  WITH CHECK ADD  CONSTRAINT [FK_Login_Workers] FOREIGN KEY([Username])
REFERENCES [dbo].[Workers] ([Username])
GO
ALTER TABLE [dbo].[Login] CHECK CONSTRAINT [FK_Login_Workers]
GO
ALTER TABLE [dbo].[Workers]  WITH CHECK ADD  CONSTRAINT [FK_Workers_Login] FOREIGN KEY([Worker_ID])
REFERENCES [dbo].[Login] ([Worker_ID])
GO
ALTER TABLE [dbo].[Workers] CHECK CONSTRAINT [FK_Workers_Login]
GO
ALTER TABLE [dbo].[Workers]  WITH CHECK ADD  CONSTRAINT [FK_Workers_Position] FOREIGN KEY([Position_ID])
REFERENCES [dbo].[Position] ([Position_ID])
GO
ALTER TABLE [dbo].[Workers] CHECK CONSTRAINT [FK_Workers_Position]
GO
USE [master]
GO
ALTER DATABASE [Pogrebne_Usluge_Krsic] SET  READ_WRITE 
GO
