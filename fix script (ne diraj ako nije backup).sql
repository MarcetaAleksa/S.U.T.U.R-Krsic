USE [master]
GO
/****** Object:  Database [S.U.T.U.R_Krsic]    Script Date: 9/4/2019 4:09:26 PM ******/
CREATE DATABASE [S.U.T.U.R_Krsic]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'S.U.T.U.R_Krsic', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\S.U.T.U.R_Krsic.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'S.U.T.U.R_Krsic_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\S.U.T.U.R_Krsic_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [S.U.T.U.R_Krsic] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [S.U.T.U.R_Krsic].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [S.U.T.U.R_Krsic] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [S.U.T.U.R_Krsic] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [S.U.T.U.R_Krsic] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [S.U.T.U.R_Krsic] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [S.U.T.U.R_Krsic] SET ARITHABORT OFF 
GO
ALTER DATABASE [S.U.T.U.R_Krsic] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [S.U.T.U.R_Krsic] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [S.U.T.U.R_Krsic] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [S.U.T.U.R_Krsic] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [S.U.T.U.R_Krsic] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [S.U.T.U.R_Krsic] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [S.U.T.U.R_Krsic] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [S.U.T.U.R_Krsic] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [S.U.T.U.R_Krsic] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [S.U.T.U.R_Krsic] SET  DISABLE_BROKER 
GO
ALTER DATABASE [S.U.T.U.R_Krsic] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [S.U.T.U.R_Krsic] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [S.U.T.U.R_Krsic] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [S.U.T.U.R_Krsic] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [S.U.T.U.R_Krsic] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [S.U.T.U.R_Krsic] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [S.U.T.U.R_Krsic] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [S.U.T.U.R_Krsic] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [S.U.T.U.R_Krsic] SET  MULTI_USER 
GO
ALTER DATABASE [S.U.T.U.R_Krsic] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [S.U.T.U.R_Krsic] SET DB_CHAINING OFF 
GO
ALTER DATABASE [S.U.T.U.R_Krsic] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [S.U.T.U.R_Krsic] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [S.U.T.U.R_Krsic] SET DELAYED_DURABILITY = DISABLED 
GO
USE [S.U.T.U.R_Krsic]
GO
/****** Object:  Table [dbo].[korisnici]    Script Date: 9/4/2019 4:09:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[korisnici](
	[korisnicki_id] [varchar](50) NOT NULL,
	[ime_korisnika] [varchar](50) NULL,
	[prezime_korisnika] [varchar](50) NULL,
	[lozinka] [varchar](35) NOT NULL,
	[adresa_stanovanja] [varchar](60) NULL,
	[broj_telefona] [varchar](12) NULL,
	[email] [varchar](50) NULL,
	[datum_rodjenja] [date] NULL,
	[pol] [varchar](6) NULL,
	[radna_pozicija] [smallint] NOT NULL,
 CONSTRAINT [PK_korisnici] PRIMARY KEY CLUSTERED 
(
	[korisnicki_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[kreditne_kartice]    Script Date: 9/4/2019 4:09:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[kreditne_kartice](
	[tip_kartice] [varchar](50) NOT NULL,
	[broj_kartice] [varchar](16) NOT NULL,
	[ime_vlasnika] [varchar](50) NOT NULL,
	[prezime_vlasnika] [varchar](50) NOT NULL,
	[datum_isteka] [varchar](5) NOT NULL,
	[CVV] [int] NOT NULL,
 CONSTRAINT [PK_CreditCard] PRIMARY KEY CLUSTERED 
(
	[CVV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[naziv_opreme]    Script Date: 9/4/2019 4:09:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[naziv_opreme](
	[id_opreme] [int] IDENTITY(1,1) NOT NULL,
	[ime] [varchar](9) NULL,
 CONSTRAINT [PK_naziv_opreme] PRIMARY KEY CLUSTERED 
(
	[id_opreme] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[oprema]    Script Date: 9/4/2019 4:09:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[oprema](
	[id_robe] [int] IDENTITY(1,1) NOT NULL,
	[ime] [varchar](20) NOT NULL,
	[kolicina] [smallint] NOT NULL,
	[tip_robe] [int] NOT NULL,
	[cijena] [smallmoney] NOT NULL,
 CONSTRAINT [PK_oprema] PRIMARY KEY CLUSTERED 
(
	[id_robe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[pozicija]    Script Date: 9/4/2019 4:09:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[pozicija](
	[pozicija_id] [smallint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ime_pozicije] [char](15) NOT NULL,
	[radni_sati_po_danu] [smallint] NOT NULL,
	[satnica] [smallint] NOT NULL,
 CONSTRAINT [PK_pozicija] PRIMARY KEY CLUSTERED 
(
	[pozicija_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[stanje_racuna]    Script Date: 9/4/2019 4:09:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[stanje_racuna](
	[CVV] [int] NOT NULL,
	[nalog] [varchar](50) NOT NULL,
	[banka] [varchar](50) NOT NULL,
	[kreditna_kartica] [varchar](50) NOT NULL,
	[novcani_iznos] [smallmoney] NOT NULL,
 CONSTRAINT [PK_Account_Balance] PRIMARY KEY CLUSTERED 
(
	[CVV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[korisnici] ([korisnicki_id], [ime_korisnika], [prezime_korisnika], [lozinka], [adresa_stanovanja], [broj_telefona], [email], [datum_rodjenja], [pol], [radna_pozicija]) VALUES (N'AmarB', N'Amar', N'Badnjevic', N'292C36B86220435947D492794CBCA50F', N'Krajiskih Brigada 11e', N'38766992224', N'amar.badnjevic@suturk.ba', CAST(N'1998-10-07' AS Date), N'Muski', 7)
INSERT [dbo].[korisnici] ([korisnicki_id], [ime_korisnika], [prezime_korisnika], [lozinka], [adresa_stanovanja], [broj_telefona], [email], [datum_rodjenja], [pol], [radna_pozicija]) VALUES (N'ElvirL', N'Elvir', N'Lovic', N'toGen', N'Krajiskih Brigada 11e', N'38765420690', N'elvir.lovic@suturk.ba', CAST(N'1998-03-11' AS Date), N'Muski', 6)
INSERT [dbo].[korisnici] ([korisnicki_id], [ime_korisnika], [prezime_korisnika], [lozinka], [adresa_stanovanja], [broj_telefona], [email], [datum_rodjenja], [pol], [radna_pozicija]) VALUES (N'HarunH', N'Harun', N'Hotic', N'toGen', N'Carice Milice 9b', N'38766404000', N'harun.hotic@suturk.ba', CAST(N'1998-12-25' AS Date), N'Muski', 4)
INSERT [dbo].[korisnici] ([korisnicki_id], [ime_korisnika], [prezime_korisnika], [lozinka], [adresa_stanovanja], [broj_telefona], [email], [datum_rodjenja], [pol], [radna_pozicija]) VALUES (N'IgorG', N'Igor', N'Gojkovic', N'toGen', N'Zore Kovacevic 9a', N'38765422122', N'igor.gojkovic@sutur.ba', CAST(N'1998-05-22' AS Date), N'Muski', 3)
INSERT [dbo].[korisnici] ([korisnicki_id], [ime_korisnika], [prezime_korisnika], [lozinka], [adresa_stanovanja], [broj_telefona], [email], [datum_rodjenja], [pol], [radna_pozicija]) VALUES (N'MarLeksa', N'Aleksa', N'Marceta', N'C53E479B03B3220D3D56DA88C4CACE20', N'Zore Kovacevic 9a', N'38766311227', N'aleksa.marceta@suturk.ba', CAST(N'1998-01-23' AS Date), N'Muski', 1)
INSERT [dbo].[korisnici] ([korisnicki_id], [ime_korisnika], [prezime_korisnika], [lozinka], [adresa_stanovanja], [broj_telefona], [email], [datum_rodjenja], [pol], [radna_pozicija]) VALUES (N'NevenK', N'Neven', N'Krsic', N'toGen', N'Slavka Rodica 2o', N'38765493201', N'neven.krsic@suturk.ba', CAST(N'1996-11-03' AS Date), N'Muski', 2)
INSERT [dbo].[korisnici] ([korisnicki_id], [ime_korisnika], [prezime_korisnika], [lozinka], [adresa_stanovanja], [broj_telefona], [email], [datum_rodjenja], [pol], [radna_pozicija]) VALUES (N'NikolaS', N'Nikola', N'Stankovic', N'toGen', N'Slavka Rodica 2o', N'38766423123', N'nikola.stankovic@suturk.ba', CAST(N'1998-03-13' AS Date), N'Muski', 4)
INSERT [dbo].[korisnici] ([korisnicki_id], [ime_korisnika], [prezime_korisnika], [lozinka], [adresa_stanovanja], [broj_telefona], [email], [datum_rodjenja], [pol], [radna_pozicija]) VALUES (N'Panzo', N'Aleksandar', N'Panzalovic', N'C53E479B03B3220D3D56DA88C4CACE20', N'Slavka Rodica 2o', N'38766845565', N'aleksandar.panzalovic@suturk.ba', CAST(N'1998-05-21' AS Date), N'Muski', 1)
INSERT [dbo].[korisnici] ([korisnicki_id], [ime_korisnika], [prezime_korisnika], [lozinka], [adresa_stanovanja], [broj_telefona], [email], [datum_rodjenja], [pol], [radna_pozicija]) VALUES (N'PetarK', N'Petar', N'Krsic', N'toGen', N'Osinjska EE', N'387632399099', N'petar.krsic@suturk.ba', CAST(N'2002-04-29' AS Date), N'Muski', 2)
INSERT [dbo].[korisnici] ([korisnicki_id], [ime_korisnika], [prezime_korisnika], [lozinka], [adresa_stanovanja], [broj_telefona], [email], [datum_rodjenja], [pol], [radna_pozicija]) VALUES (N'SasaB', N'Sasa', N'Bundalo', N'toGen', N'Slavka Rodica 5o', N'38766539219', N'sasa.bundalo@suturk.ba', CAST(N'1998-11-15' AS Date), N'Muski', 5)
INSERT [dbo].[korisnici] ([korisnicki_id], [ime_korisnika], [prezime_korisnika], [lozinka], [adresa_stanovanja], [broj_telefona], [email], [datum_rodjenja], [pol], [radna_pozicija]) VALUES (N'SinisaG', N'Sinisa', N'Gligoric', N'toGen', N'Junaci iz Borika 11a', N'38766301065', N'sinisa.gligoric@suturk.ba', CAST(N'1998-07-03' AS Date), N'Muski', 4)
INSERT [dbo].[kreditne_kartice] ([tip_kartice], [broj_kartice], [ime_vlasnika], [prezime_vlasnika], [datum_isteka], [CVV]) VALUES (N'AmericanExpress', N'377333620264515', N'Emmanuel', N'Harris', N'12/25', 141)
INSERT [dbo].[kreditne_kartice] ([tip_kartice], [broj_kartice], [ime_vlasnika], [prezime_vlasnika], [datum_isteka], [CVV]) VALUES (N'MasterCard', N'5551764569770236', N'Conner', N'Salas', N'02/28', 310)
INSERT [dbo].[kreditne_kartice] ([tip_kartice], [broj_kartice], [ime_vlasnika], [prezime_vlasnika], [datum_isteka], [CVV]) VALUES (N'Visa', N'4477503358419181', N'Saige', N'Parker', N'06/19', 372)
INSERT [dbo].[kreditne_kartice] ([tip_kartice], [broj_kartice], [ime_vlasnika], [prezime_vlasnika], [datum_isteka], [CVV]) VALUES (N'Visa', N'4740813614701251', N'Amber', N'Lewis', N'05/23', 391)
INSERT [dbo].[kreditne_kartice] ([tip_kartice], [broj_kartice], [ime_vlasnika], [prezime_vlasnika], [datum_isteka], [CVV]) VALUES (N'AmericanExpress', N'345456838433371', N'Madison', N'Walker', N'04/27', 475)
INSERT [dbo].[kreditne_kartice] ([tip_kartice], [broj_kartice], [ime_vlasnika], [prezime_vlasnika], [datum_isteka], [CVV]) VALUES (N'Visa', N'4089042164598698', N'Noah', N'Clark', N'01/28', 482)
INSERT [dbo].[kreditne_kartice] ([tip_kartice], [broj_kartice], [ime_vlasnika], [prezime_vlasnika], [datum_isteka], [CVV]) VALUES (N'MasterCard', N'5246997400974028', N'Ryleigh', N'Robinson', N'02/28', 549)
INSERT [dbo].[kreditne_kartice] ([tip_kartice], [broj_kartice], [ime_vlasnika], [prezime_vlasnika], [datum_isteka], [CVV]) VALUES (N'MasterCard', N'5241990319676045', N'Aditya', N'Jackson', N'02/24', 567)
INSERT [dbo].[kreditne_kartice] ([tip_kartice], [broj_kartice], [ime_vlasnika], [prezime_vlasnika], [datum_isteka], [CVV]) VALUES (N'AmericanExpress', N'378213882068888', N'Brooklyn', N'Lee', N'06/24', 674)
SET IDENTITY_INSERT [dbo].[naziv_opreme] ON 

INSERT [dbo].[naziv_opreme] ([id_opreme], [ime]) VALUES (1, N'Krstovi')
INSERT [dbo].[naziv_opreme] ([id_opreme], [ime]) VALUES (2, N'Svijece')
INSERT [dbo].[naziv_opreme] ([id_opreme], [ime]) VALUES (3, N'Cvijece')
INSERT [dbo].[naziv_opreme] ([id_opreme], [ime]) VALUES (4, N'Sanduci')
SET IDENTITY_INSERT [dbo].[naziv_opreme] OFF
SET IDENTITY_INSERT [dbo].[oprema] ON 

INSERT [dbo].[oprema] ([id_robe], [ime], [kolicina], [tip_robe], [cijena]) VALUES (1, N'Jelov krst', 150, 1, 35.0000)
INSERT [dbo].[oprema] ([id_robe], [ime], [kolicina], [tip_robe], [cijena]) VALUES (2, N'Plasticni krst', 157, 1, 40.0000)
INSERT [dbo].[oprema] ([id_robe], [ime], [kolicina], [tip_robe], [cijena]) VALUES (3, N'Aluminijumski krst', 50, 1, 120.0000)
INSERT [dbo].[oprema] ([id_robe], [ime], [kolicina], [tip_robe], [cijena]) VALUES (4, N'Mesing krst', 20, 1, 300.0000)
INSERT [dbo].[oprema] ([id_robe], [ime], [kolicina], [tip_robe], [cijena]) VALUES (6, N'Hrastov krst', 150, 1, 70.0000)
INSERT [dbo].[oprema] ([id_robe], [ime], [kolicina], [tip_robe], [cijena]) VALUES (7, N'Mala svijeca', 1000, 2, 0.1000)
INSERT [dbo].[oprema] ([id_robe], [ime], [kolicina], [tip_robe], [cijena]) VALUES (8, N'Srednja svijeca', 750, 2, 0.5000)
INSERT [dbo].[oprema] ([id_robe], [ime], [kolicina], [tip_robe], [cijena]) VALUES (9, N'Velika svijeca', 250, 2, 1.0000)
INSERT [dbo].[oprema] ([id_robe], [ime], [kolicina], [tip_robe], [cijena]) VALUES (10, N'Vostana svijeca', 20, 2, 5.0000)
INSERT [dbo].[oprema] ([id_robe], [ime], [kolicina], [tip_robe], [cijena]) VALUES (11, N'Mrtvacka svijeca', 13, 2, 15.0000)
INSERT [dbo].[oprema] ([id_robe], [ime], [kolicina], [tip_robe], [cijena]) VALUES (12, N'Vijenac S', 100, 3, 15.0000)
INSERT [dbo].[oprema] ([id_robe], [ime], [kolicina], [tip_robe], [cijena]) VALUES (13, N'Vijenac M', 80, 3, 20.0000)
INSERT [dbo].[oprema] ([id_robe], [ime], [kolicina], [tip_robe], [cijena]) VALUES (14, N'Vijenac L', 60, 3, 25.0000)
INSERT [dbo].[oprema] ([id_robe], [ime], [kolicina], [tip_robe], [cijena]) VALUES (15, N'Vijenac XL', 40, 3, 35.0000)
INSERT [dbo].[oprema] ([id_robe], [ime], [kolicina], [tip_robe], [cijena]) VALUES (16, N'Mali buket', 60, 3, 10.0000)
INSERT [dbo].[oprema] ([id_robe], [ime], [kolicina], [tip_robe], [cijena]) VALUES (17, N'Srednji buket', 60, 3, 15.0000)
INSERT [dbo].[oprema] ([id_robe], [ime], [kolicina], [tip_robe], [cijena]) VALUES (18, N'Veliki buket', 40, 3, 20.0000)
INSERT [dbo].[oprema] ([id_robe], [ime], [kolicina], [tip_robe], [cijena]) VALUES (19, N'Mala suza', 100, 3, 20.0000)
INSERT [dbo].[oprema] ([id_robe], [ime], [kolicina], [tip_robe], [cijena]) VALUES (20, N'Srednja suza', 80, 3, 25.0000)
INSERT [dbo].[oprema] ([id_robe], [ime], [kolicina], [tip_robe], [cijena]) VALUES (21, N'Velika suza', 50, 3, 30.0000)
INSERT [dbo].[oprema] ([id_robe], [ime], [kolicina], [tip_robe], [cijena]) VALUES (22, N'Ruza', 40, 3, 4.0000)
INSERT [dbo].[oprema] ([id_robe], [ime], [kolicina], [tip_robe], [cijena]) VALUES (23, N'Gerber', 25, 3, 2.5000)
INSERT [dbo].[oprema] ([id_robe], [ime], [kolicina], [tip_robe], [cijena]) VALUES (24, N'Gladiola', 15, 3, 1.5000)
INSERT [dbo].[oprema] ([id_robe], [ime], [kolicina], [tip_robe], [cijena]) VALUES (25, N'Americki sanduk', 12, 4, 1200.0000)
INSERT [dbo].[oprema] ([id_robe], [ime], [kolicina], [tip_robe], [cijena]) VALUES (26, N'Sarkofag', 30, 4, 850.0000)
INSERT [dbo].[oprema] ([id_robe], [ime], [kolicina], [tip_robe], [cijena]) VALUES (27, N'Sanduk L1', 50, 4, 490.0000)
INSERT [dbo].[oprema] ([id_robe], [ime], [kolicina], [tip_robe], [cijena]) VALUES (28, N'Sanduk L2', 40, 4, 600.0000)
INSERT [dbo].[oprema] ([id_robe], [ime], [kolicina], [tip_robe], [cijena]) VALUES (29, N'Jelov sanduk', 25, 4, 750.0000)
INSERT [dbo].[oprema] ([id_robe], [ime], [kolicina], [tip_robe], [cijena]) VALUES (30, N'Socijalni sanduk', 60, 4, 290.0000)
SET IDENTITY_INSERT [dbo].[oprema] OFF
SET IDENTITY_INSERT [dbo].[pozicija] ON 

INSERT [dbo].[pozicija] ([pozicija_id], [ime_pozicije], [radni_sati_po_danu], [satnica]) VALUES (1, N'Administrator  ', 8, 22)
INSERT [dbo].[pozicija] ([pozicija_id], [ime_pozicije], [radni_sati_po_danu], [satnica]) VALUES (2, N'Vlasnik        ', 4, 60)
INSERT [dbo].[pozicija] ([pozicija_id], [ime_pozicije], [radni_sati_po_danu], [satnica]) VALUES (3, N'Menadzer       ', 6, 30)
INSERT [dbo].[pozicija] ([pozicija_id], [ime_pozicije], [radni_sati_po_danu], [satnica]) VALUES (4, N'Grobar         ', 3, 25)
INSERT [dbo].[pozicija] ([pozicija_id], [ime_pozicije], [radni_sati_po_danu], [satnica]) VALUES (5, N'Vozac          ', 10, 3)
INSERT [dbo].[pozicija] ([pozicija_id], [ime_pozicije], [radni_sati_po_danu], [satnica]) VALUES (6, N'Kuhar          ', 6, 10)
INSERT [dbo].[pozicija] ([pozicija_id], [ime_pozicije], [radni_sati_po_danu], [satnica]) VALUES (7, N'Konbar         ', 6, 14)
SET IDENTITY_INSERT [dbo].[pozicija] OFF
INSERT [dbo].[stanje_racuna] ([CVV], [nalog], [banka], [kreditna_kartica], [novcani_iznos]) VALUES (141, N'Emmanuel.H', N'Principal Bank Inc.', N'AmericanExpress', 150.0000)
INSERT [dbo].[stanje_racuna] ([CVV], [nalog], [banka], [kreditna_kartica], [novcani_iznos]) VALUES (310, N'Conner.S', N'Gold Credit Bancshares', N'MasterCard', 2500.0000)
INSERT [dbo].[stanje_racuna] ([CVV], [nalog], [banka], [kreditna_kartica], [novcani_iznos]) VALUES (372, N'Saige.P', N'Grand Market Trust', N'Visa', 269.0000)
INSERT [dbo].[stanje_racuna] ([CVV], [nalog], [banka], [kreditna_kartica], [novcani_iznos]) VALUES (391, N'Amber.L', N'Grand Market Trust', N'Visa', 1750.0000)
INSERT [dbo].[stanje_racuna] ([CVV], [nalog], [banka], [kreditna_kartica], [novcani_iznos]) VALUES (475, N'Madison.W', N'Principal Bank Inc.', N'AmericanExpress', 1562.0000)
INSERT [dbo].[stanje_racuna] ([CVV], [nalog], [banka], [kreditna_kartica], [novcani_iznos]) VALUES (482, N'Noah.C', N'Grand Market Trust', N'Visa', 1853.0000)
INSERT [dbo].[stanje_racuna] ([CVV], [nalog], [banka], [kreditna_kartica], [novcani_iznos]) VALUES (549, N'Ryleigh.R', N'Gold Credit Bancshares', N'MasterCard', 7862.0000)
INSERT [dbo].[stanje_racuna] ([CVV], [nalog], [banka], [kreditna_kartica], [novcani_iznos]) VALUES (567, N'Aditya.J', N'Gold Credit Bancshares', N'MasterCard', -50.0000)
INSERT [dbo].[stanje_racuna] ([CVV], [nalog], [banka], [kreditna_kartica], [novcani_iznos]) VALUES (674, N'Brooklyn.L', N'Principal Bank Inc.', N'AmericanExpress', -850.0000)
ALTER TABLE [dbo].[korisnici]  WITH CHECK ADD  CONSTRAINT [FK_korisnici_korisnici] FOREIGN KEY([radna_pozicija])
REFERENCES [dbo].[pozicija] ([pozicija_id])
GO
ALTER TABLE [dbo].[korisnici] CHECK CONSTRAINT [FK_korisnici_korisnici]
GO
ALTER TABLE [dbo].[oprema]  WITH CHECK ADD  CONSTRAINT [FK_oprema_naziv_opreme] FOREIGN KEY([tip_robe])
REFERENCES [dbo].[naziv_opreme] ([id_opreme])
GO
ALTER TABLE [dbo].[oprema] CHECK CONSTRAINT [FK_oprema_naziv_opreme]
GO
ALTER TABLE [dbo].[stanje_racuna]  WITH CHECK ADD  CONSTRAINT [FK_stanje_racuna_kreditne_kartice] FOREIGN KEY([CVV])
REFERENCES [dbo].[kreditne_kartice] ([CVV])
GO
ALTER TABLE [dbo].[stanje_racuna] CHECK CONSTRAINT [FK_stanje_racuna_kreditne_kartice]
GO
USE [master]
GO
ALTER DATABASE [S.U.T.U.R_Krsic] SET  READ_WRITE 
GO
