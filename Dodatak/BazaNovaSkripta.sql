USE [S.U.T.U.R_Krsic]
GO
/****** Object:  Table [dbo].[korisnici]    Script Date: 12/6/2019 5:16:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[korisnici](
	[korisnicki_id] [varchar](50) NOT NULL,
	[ime_korisnika] [varchar](50) NULL,
	[prezime_korisnika] [varchar](50) NULL,
	[lozinka] [varchar](160) NOT NULL,
	[adresa_stanovanja] [varchar](60) NULL,
	[broj_telefona] [varchar](12) NULL,
	[email] [varchar](50) NULL,
	[datum_rodjenja] [date] NULL,
	[pol] [varchar](6) NULL,
	[radna_pozicija] [smallint] NULL,
 CONSTRAINT [PK_korisnici] PRIMARY KEY CLUSTERED 
(
	[korisnicki_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[kreditne_kartice]    Script Date: 12/6/2019 5:16:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[log_korisnici]    Script Date: 12/6/2019 5:16:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[log_korisnici](
	[Nadlezni] [varchar](50) NOT NULL,
	[Korisnik] [varchar](50) NOT NULL,
	[Datum] [datetime] NOT NULL,
	[Unos] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[log_kupovina]    Script Date: 12/6/2019 5:16:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[log_kupovina](
	[Kartica] [varchar](50) NOT NULL,
	[Iznos] [smallmoney] NOT NULL,
	[Ime] [varchar](50) NOT NULL,
	[Prezime] [varchar](50) NOT NULL,
	[broj_kartice] [varchar](16) NOT NULL,
	[Kupovina] [bit] NOT NULL,
	[Datum] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[log_prijavljivanje]    Script Date: 12/6/2019 5:16:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[log_prijavljivanje](
	[Korisnik] [varchar](50) NOT NULL,
	[Lozinka] [varchar](35) NOT NULL,
	[Datum] [datetime] NOT NULL,
	[Prijava] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[naziv_opreme]    Script Date: 12/6/2019 5:16:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[oprema]    Script Date: 12/6/2019 5:16:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[pozicija]    Script Date: 12/6/2019 5:16:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[Prijava]    Script Date: 12/6/2019 5:16:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prijava](
	[Vrijeme] [time](5) NULL,
	[Korisnik] [varchar](25) NULL,
	[Prijava] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[registracija]    Script Date: 12/6/2019 5:16:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[registracija](
	[Predlozen_ID] [varchar](50) NOT NULL,
	[ime_korisnika] [varchar](50) NOT NULL,
	[prezime_korisnika] [varchar](50) NULL,
	[predlozena_lozinka] [varchar](256) NOT NULL,
	[adresa_stanovanja] [varchar](60) NULL,
	[broj_telefona] [varchar](12) NULL,
	[kontakt_email] [varchar](50) NOT NULL,
	[pol] [varchar](6) NULL,
	[radna_pozicija] [smallint] NOT NULL,
	[datum_rodjenja] [date] NULL,
 CONSTRAINT [PK_registracija] PRIMARY KEY CLUSTERED 
(
	[Predlozen_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stanje_racuna]    Script Date: 12/6/2019 5:16:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
INSERT [dbo].[korisnici] ([korisnicki_id], [ime_korisnika], [prezime_korisnika], [lozinka], [adresa_stanovanja], [broj_telefona], [email], [datum_rodjenja], [pol], [radna_pozicija]) VALUES (N'AmarB', N'Amar', N'Badnjevic', N'€AF1790E2A0D7F678DE03692BA1BE47DE6A22351026D7AD5AEB71857C22521784A94CC121A543D9DB7379E4B69A8D8A8DF3EFC223182FBCE8A793D2B714281F38', N'Krajiskih Brigada 11e', N'38765420690', N'amar.badnjevic@suturk.ba', CAST(N'1998-03-11' AS Date), N'Muski', 6)
INSERT [dbo].[korisnici] ([korisnicki_id], [ime_korisnika], [prezime_korisnika], [lozinka], [adresa_stanovanja], [broj_telefona], [email], [datum_rodjenja], [pol], [radna_pozicija]) VALUES (N'HarunH', N'Harun', N'Hotic', N'€CEC5800574EDC9BF5CDBA63BB5B88C8394973131BF9EC2CD8977F1E2353D91994CF98A4A0B87A09C4D49AF78D39910A903FD6AE11403F4ED22592B89B874CB2C', N'Carice Milice 9b', N'38766404000', N'harun.hotic@suturk.ba', CAST(N'1998-12-25' AS Date), N'Muski', 4)
INSERT [dbo].[korisnici] ([korisnicki_id], [ime_korisnika], [prezime_korisnika], [lozinka], [adresa_stanovanja], [broj_telefona], [email], [datum_rodjenja], [pol], [radna_pozicija]) VALUES (N'IgorG', N'Igor', N'Gojkovic', N'€D37D104D437B355690703295E9E297E4EDBFC9AFB778F3456CFEA181C326A792B69DC99307C94F26F6062CDCCCB5CA81A2090E4121AC33FBB1F96F34C1DDD9B4', N'Zore Kovacevic 9a', N'38765422122', N'igor.gojkovic@sutur.ba', CAST(N'1998-05-22' AS Date), N'Muski', 3)
INSERT [dbo].[korisnici] ([korisnicki_id], [ime_korisnika], [prezime_korisnika], [lozinka], [adresa_stanovanja], [broj_telefona], [email], [datum_rodjenja], [pol], [radna_pozicija]) VALUES (N'MarLeksa', N'Aleksa', N'Marceta', N'€14CF66282C7049EA3752D204EDC145746BC488A4B639AD88AD0506A87E38C7136B4C224E4A8AB88E775D331DC2E0FD93E872AD021D82F3B39B2F4DB6CBD204AB', N'Zore Kovacevic 9a', N'38766311227', N'aleksa.marceta@suturk.ba', CAST(N'1998-01-23' AS Date), N'Muski', 1)
INSERT [dbo].[korisnici] ([korisnicki_id], [ime_korisnika], [prezime_korisnika], [lozinka], [adresa_stanovanja], [broj_telefona], [email], [datum_rodjenja], [pol], [radna_pozicija]) VALUES (N'NevenK', N'Neven', N'Krsic', N'€E6457001DC93F8CA14AE56A690D510A1CA3DE3B5A27AE01F73C6CB90AF94E5BADD2571BB4BF312B6468CE02CF816634FA7C9BE1197ACAEFD6D128BEF2CE24E2E', N'Slavka Rodica 2a', N'38765493201', N'neven.krsic@suturk.ba', CAST(N'1996-11-03' AS Date), N'Muski', 2)
INSERT [dbo].[korisnici] ([korisnicki_id], [ime_korisnika], [prezime_korisnika], [lozinka], [adresa_stanovanja], [broj_telefona], [email], [datum_rodjenja], [pol], [radna_pozicija]) VALUES (N'NikolaS', N'Nikola', N'Stankovic', N'€82AE8767186DF1011DAD8AA7F8B009CAF1FF0E0F7381B37165768D8F47174092654747E58FACF07A4D4813127BD2C19C7016E6BDC069DFE1F717179C9C46BD56', N'Slavka Rodica 2a', N'38766423123', N'nikola.stankovic@suturk.ba', CAST(N'1998-03-13' AS Date), N'Muski', 4)
INSERT [dbo].[korisnici] ([korisnicki_id], [ime_korisnika], [prezime_korisnika], [lozinka], [adresa_stanovanja], [broj_telefona], [email], [datum_rodjenja], [pol], [radna_pozicija]) VALUES (N'Panzo', N'Aleksandar', N'Panzalovic', N'€C4DC05786E6C09D8A2AE18DC16A21451CD3AFA88FCC1AEA26B129E8969A88DFF4765469C0F5F6431783C0F1D3CD23D02F8B5094B763046F6B862F9B09BD506C8', N'Slavka Rodica 2a', N'38766845565', N'aleksandar.panzalovic@suturk.ba', CAST(N'1998-05-21' AS Date), N'Muski', 1)
INSERT [dbo].[korisnici] ([korisnicki_id], [ime_korisnika], [prezime_korisnika], [lozinka], [adresa_stanovanja], [broj_telefona], [email], [datum_rodjenja], [pol], [radna_pozicija]) VALUES (N'PetarK', N'Petar', N'Krsic', N'€8D3B387A13D83CAE1B21D96A8AA911605C25F59E1A8542319E7429ECD2C3E9D372A41FBFBF51D903F506950FA3094DBE0CF63358BD1CE7C5B3B182097033C636', N'Osinjska EE', N'387632399099', N'petar.krsic@suturk.ba', CAST(N'2002-04-29' AS Date), N'Muski', 2)
INSERT [dbo].[korisnici] ([korisnicki_id], [ime_korisnika], [prezime_korisnika], [lozinka], [adresa_stanovanja], [broj_telefona], [email], [datum_rodjenja], [pol], [radna_pozicija]) VALUES (N'SinisaG', N'Sinisa', N'Gligoric', N'€63A0406BD183B428821070157BCE26B929C4D3E145D937F5412665E7FE66C308FD5426F76B31B54273FEF939C0972E46267691FEA68E09445C85A3EDD2668295', N'Junaci iz Borika 11a', N'38766301065', N'sinisa.gligoric@suturk.ba', CAST(N'1998-07-03' AS Date), N'Muski', 4)
INSERT [dbo].[kreditne_kartice] ([tip_kartice], [broj_kartice], [ime_vlasnika], [prezime_vlasnika], [datum_isteka], [CVV]) VALUES (N'AmericanExpress', N'377333620264515', N'Emmanuel', N'Harris', N'12/25', 141)
INSERT [dbo].[kreditne_kartice] ([tip_kartice], [broj_kartice], [ime_vlasnika], [prezime_vlasnika], [datum_isteka], [CVV]) VALUES (N'MasterCard', N'5551764569770236', N'Conner', N'Salas', N'02/28', 310)
INSERT [dbo].[kreditne_kartice] ([tip_kartice], [broj_kartice], [ime_vlasnika], [prezime_vlasnika], [datum_isteka], [CVV]) VALUES (N'Visa', N'4477503358419181', N'Saige', N'Parker', N'06/19', 372)
INSERT [dbo].[kreditne_kartice] ([tip_kartice], [broj_kartice], [ime_vlasnika], [prezime_vlasnika], [datum_isteka], [CVV]) VALUES (N'Visa', N'4740813614701251', N'Amber', N'Lewis', N'05/23', 391)
INSERT [dbo].[kreditne_kartice] ([tip_kartice], [broj_kartice], [ime_vlasnika], [prezime_vlasnika], [datum_isteka], [CVV]) VALUES (N'AmericanExpress', N'345456838433371', N'Madison', N'Walker', N'04/27', 475)
INSERT [dbo].[kreditne_kartice] ([tip_kartice], [broj_kartice], [ime_vlasnika], [prezime_vlasnika], [datum_isteka], [CVV]) VALUES (N'Visa', N'4089042164598698', N'Noah', N'Clark', N'01/28', 482)
INSERT [dbo].[kreditne_kartice] ([tip_kartice], [broj_kartice], [ime_vlasnika], [prezime_vlasnika], [datum_isteka], [CVV]) VALUES (N'MasterCard', N'5246997400974028', N'Ryleigh', N'Robinson', N'02/28', 549)
INSERT [dbo].[kreditne_kartice] ([tip_kartice], [broj_kartice], [ime_vlasnika], [prezime_vlasnika], [datum_isteka], [CVV]) VALUES (N'MasterCard', N'5241990319676045', N'Aditya', N'Jackson', N'02/24', 567)
INSERT [dbo].[kreditne_kartice] ([tip_kartice], [broj_kartice], [ime_vlasnika], [prezime_vlasnika], [datum_isteka], [CVV]) VALUES (N'AmericanExpress', N'378213882068888', N'Brooklyn', N'Lee', N'06/24', 674)
INSERT [dbo].[log_korisnici] ([Nadlezni], [Korisnik], [Datum], [Unos]) VALUES (N'MarLeksa', N'', CAST(N'2019-12-06T01:32:01.000' AS DateTime), 1)
INSERT [dbo].[log_korisnici] ([Nadlezni], [Korisnik], [Datum], [Unos]) VALUES (N'MarLeksa', N'', CAST(N'2019-12-06T01:32:23.000' AS DateTime), 1)
INSERT [dbo].[log_korisnici] ([Nadlezni], [Korisnik], [Datum], [Unos]) VALUES (N'MarLeksa', N'', CAST(N'2019-12-06T01:33:09.000' AS DateTime), 1)
INSERT [dbo].[log_korisnici] ([Nadlezni], [Korisnik], [Datum], [Unos]) VALUES (N'MarLeksa', N'AmarBa', CAST(N'2019-12-06T01:34:23.000' AS DateTime), 1)
INSERT [dbo].[log_korisnici] ([Nadlezni], [Korisnik], [Datum], [Unos]) VALUES (N'MarLeksa', N'AmarBa', CAST(N'2019-12-06T01:36:21.000' AS DateTime), 0)
INSERT [dbo].[log_korisnici] ([Nadlezni], [Korisnik], [Datum], [Unos]) VALUES (N'MarLeksa', N'SasaB', CAST(N'2019-12-06T01:41:43.000' AS DateTime), 1)
INSERT [dbo].[log_korisnici] ([Nadlezni], [Korisnik], [Datum], [Unos]) VALUES (N'MarLeksa', N'AmarB', CAST(N'2019-12-06T01:42:08.000' AS DateTime), 1)
INSERT [dbo].[log_korisnici] ([Nadlezni], [Korisnik], [Datum], [Unos]) VALUES (N'MarLeksa', N'SasaB', CAST(N'2019-12-06T01:44:37.000' AS DateTime), 0)
INSERT [dbo].[log_korisnici] ([Nadlezni], [Korisnik], [Datum], [Unos]) VALUES (N'Panzo', N'SasaB', CAST(N'2019-12-06T01:48:32.000' AS DateTime), 1)
INSERT [dbo].[log_korisnici] ([Nadlezni], [Korisnik], [Datum], [Unos]) VALUES (N'MarLeksa', N'SasaB', CAST(N'2019-12-06T01:49:30.000' AS DateTime), 0)
INSERT [dbo].[log_korisnici] ([Nadlezni], [Korisnik], [Datum], [Unos]) VALUES (N'MarLeksa', N'SasaB', CAST(N'2019-12-06T01:50:04.000' AS DateTime), 1)
INSERT [dbo].[log_korisnici] ([Nadlezni], [Korisnik], [Datum], [Unos]) VALUES (N'MarLeksa', N'SasaBa', CAST(N'2019-12-06T01:50:46.000' AS DateTime), 0)
INSERT [dbo].[log_korisnici] ([Nadlezni], [Korisnik], [Datum], [Unos]) VALUES (N'MarLeksa', N'SasaB', CAST(N'2019-12-06T01:50:49.000' AS DateTime), 0)
INSERT [dbo].[log_korisnici] ([Nadlezni], [Korisnik], [Datum], [Unos]) VALUES (N'MarLeksa', N'SasaB', CAST(N'2019-12-06T01:51:52.000' AS DateTime), 1)
INSERT [dbo].[log_korisnici] ([Nadlezni], [Korisnik], [Datum], [Unos]) VALUES (N'MarLeksa', N'BundaloS', CAST(N'2019-12-06T01:53:09.000' AS DateTime), 1)
INSERT [dbo].[log_korisnici] ([Nadlezni], [Korisnik], [Datum], [Unos]) VALUES (N'MarLeksa', N'BundaloS', CAST(N'2019-12-06T01:54:18.000' AS DateTime), 0)
INSERT [dbo].[log_korisnici] ([Nadlezni], [Korisnik], [Datum], [Unos]) VALUES (N'MarLeksa', N'SasaB', CAST(N'2019-12-06T01:54:22.000' AS DateTime), 0)
INSERT [dbo].[log_korisnici] ([Nadlezni], [Korisnik], [Datum], [Unos]) VALUES (N'MarLeksa', N'JoeyT', CAST(N'2019-12-06T01:54:25.000' AS DateTime), 0)
INSERT [dbo].[log_kupovina] ([Kartica], [Iznos], [Ime], [Prezime], [broj_kartice], [Kupovina], [Datum]) VALUES (N'', 0.1000, N'Emmanuel', N'Harris', N'377333620264514', 0, CAST(N'2019-12-06T00:00:00.000' AS DateTime))
INSERT [dbo].[log_kupovina] ([Kartica], [Iznos], [Ime], [Prezime], [broj_kartice], [Kupovina], [Datum]) VALUES (N'Visa', 0.1000, N'Emmanuel', N'Harris', N'377333620264515', 1, CAST(N'2019-12-06T00:00:00.000' AS DateTime))
INSERT [dbo].[log_kupovina] ([Kartica], [Iznos], [Ime], [Prezime], [broj_kartice], [Kupovina], [Datum]) VALUES (N'Visa', 0.1000, N'Emmanuel', N'Harris', N'377333620264514', 0, CAST(N'2019-12-06T00:00:00.000' AS DateTime))
INSERT [dbo].[log_prijavljivanje] ([Korisnik], [Lozinka], [Datum], [Prijava]) VALUES (N'Aleksa', N'Test', CAST(N'1998-01-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[log_prijavljivanje] ([Korisnik], [Lozinka], [Datum], [Prijava]) VALUES (N'Aleksa', N'Test', CAST(N'1998-01-01T21:05:12.000' AS DateTime), 1)
INSERT [dbo].[log_prijavljivanje] ([Korisnik], [Lozinka], [Datum], [Prijava]) VALUES (N'123', N'123', CAST(N'2019-12-06T01:24:26.000' AS DateTime), 0)
INSERT [dbo].[log_prijavljivanje] ([Korisnik], [Lozinka], [Datum], [Prijava]) VALUES (N'test', N'test', CAST(N'2019-12-06T01:24:28.000' AS DateTime), 0)
INSERT [dbo].[log_prijavljivanje] ([Korisnik], [Lozinka], [Datum], [Prijava]) VALUES (N'MarLeksa', N'MarLeksa', CAST(N'2019-12-06T01:27:33.000' AS DateTime), 1)
INSERT [dbo].[log_prijavljivanje] ([Korisnik], [Lozinka], [Datum], [Prijava]) VALUES (N'Panzo', N'Panzo', CAST(N'2019-12-06T01:28:23.000' AS DateTime), 1)
INSERT [dbo].[log_prijavljivanje] ([Korisnik], [Lozinka], [Datum], [Prijava]) VALUES (N'SinisaG', N'SinisaG', CAST(N'2019-12-06T01:28:55.000' AS DateTime), 0)
INSERT [dbo].[log_prijavljivanje] ([Korisnik], [Lozinka], [Datum], [Prijava]) VALUES (N'HarunH', N'HarunH', CAST(N'2019-12-06T01:29:04.000' AS DateTime), 0)
INSERT [dbo].[log_prijavljivanje] ([Korisnik], [Lozinka], [Datum], [Prijava]) VALUES (N'IgorG', N'IgorG', CAST(N'2019-12-06T01:29:39.000' AS DateTime), 1)
INSERT [dbo].[log_prijavljivanje] ([Korisnik], [Lozinka], [Datum], [Prijava]) VALUES (N'NevenK', N'NevenK', CAST(N'2019-12-06T01:29:51.000' AS DateTime), 1)
INSERT [dbo].[log_prijavljivanje] ([Korisnik], [Lozinka], [Datum], [Prijava]) VALUES (N'PetarK', N'PetarK', CAST(N'2019-12-06T01:30:02.000' AS DateTime), 1)
INSERT [dbo].[log_prijavljivanje] ([Korisnik], [Lozinka], [Datum], [Prijava]) VALUES (N'PetarK', N'PetarK', CAST(N'2019-12-06T01:30:12.000' AS DateTime), 1)
INSERT [dbo].[log_prijavljivanje] ([Korisnik], [Lozinka], [Datum], [Prijava]) VALUES (N'SasaB', N'SasaB', CAST(N'2019-12-06T01:30:28.000' AS DateTime), 0)
INSERT [dbo].[log_prijavljivanje] ([Korisnik], [Lozinka], [Datum], [Prijava]) VALUES (N'NikolaS', N'NikolaS', CAST(N'2019-12-06T01:30:35.000' AS DateTime), 0)
INSERT [dbo].[log_prijavljivanje] ([Korisnik], [Lozinka], [Datum], [Prijava]) VALUES (N'SinisaG', N'SinisaG', CAST(N'2019-12-06T01:31:23.000' AS DateTime), 0)
INSERT [dbo].[log_prijavljivanje] ([Korisnik], [Lozinka], [Datum], [Prijava]) VALUES (N'MarLeksa', N'MarLeksa', CAST(N'2019-12-06T01:31:32.000' AS DateTime), 0)
INSERT [dbo].[log_prijavljivanje] ([Korisnik], [Lozinka], [Datum], [Prijava]) VALUES (N'MarLeksa', N'MarLeksa', CAST(N'2019-12-06T01:31:35.000' AS DateTime), 1)
INSERT [dbo].[log_prijavljivanje] ([Korisnik], [Lozinka], [Datum], [Prijava]) VALUES (N'SinisaG', N'SinisaG', CAST(N'2019-12-06T01:35:03.000' AS DateTime), 0)
INSERT [dbo].[log_prijavljivanje] ([Korisnik], [Lozinka], [Datum], [Prijava]) VALUES (N'SinisaG', N'SinisaG', CAST(N'2019-12-06T01:35:06.000' AS DateTime), 0)
INSERT [dbo].[log_prijavljivanje] ([Korisnik], [Lozinka], [Datum], [Prijava]) VALUES (N'SasaB', N'SasaB', CAST(N'2019-12-06T01:35:15.000' AS DateTime), 0)
INSERT [dbo].[log_prijavljivanje] ([Korisnik], [Lozinka], [Datum], [Prijava]) VALUES (N'SasaB', N'SasaB', CAST(N'2019-12-06T01:35:17.000' AS DateTime), 0)
INSERT [dbo].[log_prijavljivanje] ([Korisnik], [Lozinka], [Datum], [Prijava]) VALUES (N'SasaB', N'SasaB', CAST(N'2019-12-06T01:35:20.000' AS DateTime), 0)
INSERT [dbo].[log_prijavljivanje] ([Korisnik], [Lozinka], [Datum], [Prijava]) VALUES (N'AmarB', N'AmarB', CAST(N'2019-12-06T01:35:31.000' AS DateTime), 0)
INSERT [dbo].[log_prijavljivanje] ([Korisnik], [Lozinka], [Datum], [Prijava]) VALUES (N'AmarB', N'AmarB', CAST(N'2019-12-06T01:35:33.000' AS DateTime), 0)
INSERT [dbo].[log_prijavljivanje] ([Korisnik], [Lozinka], [Datum], [Prijava]) VALUES (N'AmarB', N'AmarB', CAST(N'2019-12-06T01:35:38.000' AS DateTime), 0)
INSERT [dbo].[log_prijavljivanje] ([Korisnik], [Lozinka], [Datum], [Prijava]) VALUES (N'AmarB', N'AmarB', CAST(N'2019-12-06T01:35:45.000' AS DateTime), 0)
INSERT [dbo].[log_prijavljivanje] ([Korisnik], [Lozinka], [Datum], [Prijava]) VALUES (N'MarLeksa', N'MarLeksa', CAST(N'2019-12-06T01:40:36.000' AS DateTime), 1)
INSERT [dbo].[log_prijavljivanje] ([Korisnik], [Lozinka], [Datum], [Prijava]) VALUES (N'MarLeksa', N'MarLeksa', CAST(N'2019-12-06T01:44:32.000' AS DateTime), 1)
INSERT [dbo].[log_prijavljivanje] ([Korisnik], [Lozinka], [Datum], [Prijava]) VALUES (N'AmarB', N'AmarB', CAST(N'2019-12-06T01:45:12.000' AS DateTime), 0)
INSERT [dbo].[log_prijavljivanje] ([Korisnik], [Lozinka], [Datum], [Prijava]) VALUES (N'SasaB', N'SasaB', CAST(N'2019-12-06T01:45:25.000' AS DateTime), 0)
INSERT [dbo].[log_prijavljivanje] ([Korisnik], [Lozinka], [Datum], [Prijava]) VALUES (N'SasaB', N'SasaB', CAST(N'2019-12-06T01:45:36.000' AS DateTime), 0)
INSERT [dbo].[log_prijavljivanje] ([Korisnik], [Lozinka], [Datum], [Prijava]) VALUES (N'SasaB', N'SasaB', CAST(N'2019-12-06T01:45:41.000' AS DateTime), 0)
INSERT [dbo].[log_prijavljivanje] ([Korisnik], [Lozinka], [Datum], [Prijava]) VALUES (N'SasaB', N'SasaB', CAST(N'2019-12-06T01:45:46.000' AS DateTime), 0)
INSERT [dbo].[log_prijavljivanje] ([Korisnik], [Lozinka], [Datum], [Prijava]) VALUES (N'Panzo', N'Panzo', CAST(N'2019-12-06T01:45:55.000' AS DateTime), 1)
INSERT [dbo].[log_prijavljivanje] ([Korisnik], [Lozinka], [Datum], [Prijava]) VALUES (N'AmarB', N'AmarB', CAST(N'2019-12-06T01:46:09.000' AS DateTime), 0)
INSERT [dbo].[log_prijavljivanje] ([Korisnik], [Lozinka], [Datum], [Prijava]) VALUES (N'SinisaG', N'SinisaG', CAST(N'2019-12-06T01:46:19.000' AS DateTime), 0)
INSERT [dbo].[log_prijavljivanje] ([Korisnik], [Lozinka], [Datum], [Prijava]) VALUES (N'HarunH', N'HarunH', CAST(N'2019-12-06T01:46:27.000' AS DateTime), 0)
INSERT [dbo].[log_prijavljivanje] ([Korisnik], [Lozinka], [Datum], [Prijava]) VALUES (N'IgorG', N'IgorG', CAST(N'2019-12-06T01:46:34.000' AS DateTime), 1)
INSERT [dbo].[log_prijavljivanje] ([Korisnik], [Lozinka], [Datum], [Prijava]) VALUES (N'NeveK', N'NeveK', CAST(N'2019-12-06T01:46:43.000' AS DateTime), 0)
INSERT [dbo].[log_prijavljivanje] ([Korisnik], [Lozinka], [Datum], [Prijava]) VALUES (N'NeveK', N'NeveK', CAST(N'2019-12-06T01:46:47.000' AS DateTime), 0)
INSERT [dbo].[log_prijavljivanje] ([Korisnik], [Lozinka], [Datum], [Prijava]) VALUES (N'NeveK', N'NeveK', CAST(N'2019-12-06T01:46:52.000' AS DateTime), 0)
INSERT [dbo].[log_prijavljivanje] ([Korisnik], [Lozinka], [Datum], [Prijava]) VALUES (N'NevenK', N'NevenK', CAST(N'2019-12-06T01:46:57.000' AS DateTime), 1)
INSERT [dbo].[log_prijavljivanje] ([Korisnik], [Lozinka], [Datum], [Prijava]) VALUES (N'PetarK', N'PetarK', CAST(N'2019-12-06T01:47:09.000' AS DateTime), 0)
INSERT [dbo].[log_prijavljivanje] ([Korisnik], [Lozinka], [Datum], [Prijava]) VALUES (N'PetarK', N'PetarK', CAST(N'2019-12-06T01:47:18.000' AS DateTime), 1)
INSERT [dbo].[log_prijavljivanje] ([Korisnik], [Lozinka], [Datum], [Prijava]) VALUES (N'SasaB', N'SasaB', CAST(N'2019-12-06T01:47:28.000' AS DateTime), 0)
INSERT [dbo].[log_prijavljivanje] ([Korisnik], [Lozinka], [Datum], [Prijava]) VALUES (N'NikolaS', N'NikolaS', CAST(N'2019-12-06T01:47:35.000' AS DateTime), 0)
INSERT [dbo].[log_prijavljivanje] ([Korisnik], [Lozinka], [Datum], [Prijava]) VALUES (N'Panzo', N'Panzo', CAST(N'2019-12-06T01:47:59.000' AS DateTime), 1)
INSERT [dbo].[log_prijavljivanje] ([Korisnik], [Lozinka], [Datum], [Prijava]) VALUES (N'SasaB', N'SasaB', CAST(N'2019-12-06T01:48:58.000' AS DateTime), 0)
INSERT [dbo].[log_prijavljivanje] ([Korisnik], [Lozinka], [Datum], [Prijava]) VALUES (N'SasaB', N'SasaB', CAST(N'2019-12-06T01:49:02.000' AS DateTime), 0)
INSERT [dbo].[log_prijavljivanje] ([Korisnik], [Lozinka], [Datum], [Prijava]) VALUES (N'MarLeksa', N'MarLeksa', CAST(N'2019-12-06T01:49:25.000' AS DateTime), 1)
INSERT [dbo].[log_prijavljivanje] ([Korisnik], [Lozinka], [Datum], [Prijava]) VALUES (N'SasaB', N'SasaB', CAST(N'2019-12-06T01:50:35.000' AS DateTime), 0)
INSERT [dbo].[log_prijavljivanje] ([Korisnik], [Lozinka], [Datum], [Prijava]) VALUES (N'MarLeksa', N'MarLeksa', CAST(N'2019-12-06T01:50:42.000' AS DateTime), 1)
INSERT [dbo].[log_prijavljivanje] ([Korisnik], [Lozinka], [Datum], [Prijava]) VALUES (N'SasaB', N'SasaB', CAST(N'2019-12-06T01:52:00.000' AS DateTime), 0)
INSERT [dbo].[log_prijavljivanje] ([Korisnik], [Lozinka], [Datum], [Prijava]) VALUES (N'MarLeksa', N'MarLeksa', CAST(N'2019-12-06T01:52:26.000' AS DateTime), 1)
INSERT [dbo].[log_prijavljivanje] ([Korisnik], [Lozinka], [Datum], [Prijava]) VALUES (N'BundaloS', N'BundaloS', CAST(N'2019-12-06T01:53:35.000' AS DateTime), 0)
INSERT [dbo].[log_prijavljivanje] ([Korisnik], [Lozinka], [Datum], [Prijava]) VALUES (N'MarLeksa', N'MarLeksa', CAST(N'2019-12-06T01:54:14.000' AS DateTime), 1)
INSERT [dbo].[log_prijavljivanje] ([Korisnik], [Lozinka], [Datum], [Prijava]) VALUES (N'MarLeksa', N'P@$$w0rd', CAST(N'2019-12-06T02:56:05.000' AS DateTime), 1)
INSERT [dbo].[log_prijavljivanje] ([Korisnik], [Lozinka], [Datum], [Prijava]) VALUES (N'MarLeksa', N'P@$$w0rd', CAST(N'2019-12-06T05:03:00.000' AS DateTime), 1)
INSERT [dbo].[log_prijavljivanje] ([Korisnik], [Lozinka], [Datum], [Prijava]) VALUES (N'MarLeksa', N'P@$$w0r', CAST(N'2019-12-06T05:08:05.000' AS DateTime), 0)
INSERT [dbo].[log_prijavljivanje] ([Korisnik], [Lozinka], [Datum], [Prijava]) VALUES (N'MarLeksa', N'P@$$w0rd', CAST(N'2019-12-06T05:08:07.000' AS DateTime), 1)
INSERT [dbo].[log_prijavljivanje] ([Korisnik], [Lozinka], [Datum], [Prijava]) VALUES (N'MarLeksa', N'MarLeksa', CAST(N'2019-12-06T01:24:37.000' AS DateTime), 0)
INSERT [dbo].[log_prijavljivanje] ([Korisnik], [Lozinka], [Datum], [Prijava]) VALUES (N'MarLeksa', N'MarLeksa', CAST(N'2019-12-06T01:24:40.000' AS DateTime), 1)
INSERT [dbo].[log_prijavljivanje] ([Korisnik], [Lozinka], [Datum], [Prijava]) VALUES (N'MarLeksa', N'P@$$w0rd', CAST(N'2019-12-06T05:15:58.000' AS DateTime), 1)
INSERT [dbo].[log_prijavljivanje] ([Korisnik], [Lozinka], [Datum], [Prijava]) VALUES (N'MarLeksa', N'P@$$w0rd', CAST(N'2019-12-06T03:16:08.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[naziv_opreme] ON 

INSERT [dbo].[naziv_opreme] ([id_opreme], [ime]) VALUES (1, N'Krstovi')
INSERT [dbo].[naziv_opreme] ([id_opreme], [ime]) VALUES (2, N'Svijece')
INSERT [dbo].[naziv_opreme] ([id_opreme], [ime]) VALUES (3, N'Cvijece')
INSERT [dbo].[naziv_opreme] ([id_opreme], [ime]) VALUES (4, N'Sanduci')
SET IDENTITY_INSERT [dbo].[naziv_opreme] OFF
SET IDENTITY_INSERT [dbo].[oprema] ON 

INSERT [dbo].[oprema] ([id_robe], [ime], [kolicina], [tip_robe], [cijena]) VALUES (2, N'Plasticni krst', 157, 1, 40.0000)
INSERT [dbo].[oprema] ([id_robe], [ime], [kolicina], [tip_robe], [cijena]) VALUES (3, N'Aluminijumski krst', 50, 1, 120.0000)
INSERT [dbo].[oprema] ([id_robe], [ime], [kolicina], [tip_robe], [cijena]) VALUES (4, N'Mesing krst', 20, 1, 300.0000)
INSERT [dbo].[oprema] ([id_robe], [ime], [kolicina], [tip_robe], [cijena]) VALUES (5, N'Hrastov krst', 150, 1, 70.0000)
INSERT [dbo].[oprema] ([id_robe], [ime], [kolicina], [tip_robe], [cijena]) VALUES (6, N'Mala svijeca', 1000, 2, 0.1000)
INSERT [dbo].[oprema] ([id_robe], [ime], [kolicina], [tip_robe], [cijena]) VALUES (7, N'Srednja svijeca', 750, 2, 0.5000)
INSERT [dbo].[oprema] ([id_robe], [ime], [kolicina], [tip_robe], [cijena]) VALUES (8, N'Velika svijeca', 250, 2, 1.0000)
INSERT [dbo].[oprema] ([id_robe], [ime], [kolicina], [tip_robe], [cijena]) VALUES (9, N'Vostana svijeca', 20, 2, 5.0000)
INSERT [dbo].[oprema] ([id_robe], [ime], [kolicina], [tip_robe], [cijena]) VALUES (10, N'Mrtvacka svijeca', 13, 2, 15.0000)
INSERT [dbo].[oprema] ([id_robe], [ime], [kolicina], [tip_robe], [cijena]) VALUES (11, N'Vijenac S', 100, 3, 15.0000)
INSERT [dbo].[oprema] ([id_robe], [ime], [kolicina], [tip_robe], [cijena]) VALUES (12, N'Vijenac M', 80, 3, 20.0000)
INSERT [dbo].[oprema] ([id_robe], [ime], [kolicina], [tip_robe], [cijena]) VALUES (13, N'Vijenac L', 60, 3, 25.0000)
INSERT [dbo].[oprema] ([id_robe], [ime], [kolicina], [tip_robe], [cijena]) VALUES (14, N'Vijenac XL', 40, 3, 35.0000)
INSERT [dbo].[oprema] ([id_robe], [ime], [kolicina], [tip_robe], [cijena]) VALUES (15, N'Mali buket', 60, 3, 10.0000)
INSERT [dbo].[oprema] ([id_robe], [ime], [kolicina], [tip_robe], [cijena]) VALUES (16, N'Srednji buket', 60, 3, 15.0000)
INSERT [dbo].[oprema] ([id_robe], [ime], [kolicina], [tip_robe], [cijena]) VALUES (17, N'Veliki buket', 40, 3, 20.0000)
INSERT [dbo].[oprema] ([id_robe], [ime], [kolicina], [tip_robe], [cijena]) VALUES (18, N'Mala suza', 100, 3, 20.0000)
INSERT [dbo].[oprema] ([id_robe], [ime], [kolicina], [tip_robe], [cijena]) VALUES (19, N'Srednja suza', 80, 3, 25.0000)
INSERT [dbo].[oprema] ([id_robe], [ime], [kolicina], [tip_robe], [cijena]) VALUES (20, N'Velika suza', 50, 3, 30.0000)
INSERT [dbo].[oprema] ([id_robe], [ime], [kolicina], [tip_robe], [cijena]) VALUES (21, N'Ruza', 40, 3, 4.0000)
INSERT [dbo].[oprema] ([id_robe], [ime], [kolicina], [tip_robe], [cijena]) VALUES (22, N'Gerber', 25, 3, 2.5000)
INSERT [dbo].[oprema] ([id_robe], [ime], [kolicina], [tip_robe], [cijena]) VALUES (23, N'Gladiola', 15, 3, 1.5000)
INSERT [dbo].[oprema] ([id_robe], [ime], [kolicina], [tip_robe], [cijena]) VALUES (24, N'Americki sanduk', 12, 4, 1200.0000)
INSERT [dbo].[oprema] ([id_robe], [ime], [kolicina], [tip_robe], [cijena]) VALUES (25, N'Sarkofag', 30, 4, 850.0000)
INSERT [dbo].[oprema] ([id_robe], [ime], [kolicina], [tip_robe], [cijena]) VALUES (26, N'Sanduk L1', 50, 4, 490.0000)
INSERT [dbo].[oprema] ([id_robe], [ime], [kolicina], [tip_robe], [cijena]) VALUES (27, N'Sanduk L2', 40, 4, 600.0000)
INSERT [dbo].[oprema] ([id_robe], [ime], [kolicina], [tip_robe], [cijena]) VALUES (28, N'Jelov sanduk', 25, 4, 750.0000)
INSERT [dbo].[oprema] ([id_robe], [ime], [kolicina], [tip_robe], [cijena]) VALUES (29, N'Socijalni sanduk', 60, 4, 290.0000)
INSERT [dbo].[oprema] ([id_robe], [ime], [kolicina], [tip_robe], [cijena]) VALUES (30, N'Test', 150, 2, 75.0000)
INSERT [dbo].[oprema] ([id_robe], [ime], [kolicina], [tip_robe], [cijena]) VALUES (31, N'Jelov krst', 150, 1, 35.0000)
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
INSERT [dbo].[Prijava] ([Vrijeme], [Korisnik], [Prijava]) VALUES (CAST(N'22:01:00' AS Time), N'Aleksa', 1)
INSERT [dbo].[Prijava] ([Vrijeme], [Korisnik], [Prijava]) VALUES (CAST(N'22:38:00' AS Time), N'Aleksa', 1)
INSERT [dbo].[Prijava] ([Vrijeme], [Korisnik], [Prijava]) VALUES (CAST(N'22:39:00' AS Time), N'Aleksa', 0)
INSERT [dbo].[Prijava] ([Vrijeme], [Korisnik], [Prijava]) VALUES (CAST(N'02:41:00' AS Time), N'Aleksa', 0)
INSERT [dbo].[Prijava] ([Vrijeme], [Korisnik], [Prijava]) VALUES (CAST(N'11:15:00' AS Time), N'NikolaS', 1)
INSERT [dbo].[Prijava] ([Vrijeme], [Korisnik], [Prijava]) VALUES (CAST(N'11:17:00' AS Time), N'NikolaS', 0)
INSERT [dbo].[Prijava] ([Vrijeme], [Korisnik], [Prijava]) VALUES (CAST(N'11:18:00' AS Time), N'NikolaS', 1)
INSERT [dbo].[Prijava] ([Vrijeme], [Korisnik], [Prijava]) VALUES (CAST(N'11:18:00' AS Time), N'NikolaS', 0)
INSERT [dbo].[Prijava] ([Vrijeme], [Korisnik], [Prijava]) VALUES (CAST(N'11:18:00' AS Time), N'NikolaS', 1)
INSERT [dbo].[Prijava] ([Vrijeme], [Korisnik], [Prijava]) VALUES (CAST(N'11:18:00' AS Time), N'NikolaS', 0)
INSERT [dbo].[Prijava] ([Vrijeme], [Korisnik], [Prijava]) VALUES (CAST(N'11:18:00' AS Time), N'NikolaS', 1)
INSERT [dbo].[Prijava] ([Vrijeme], [Korisnik], [Prijava]) VALUES (CAST(N'16:03:00' AS Time), N'HarunH', 1)
INSERT [dbo].[Prijava] ([Vrijeme], [Korisnik], [Prijava]) VALUES (CAST(N'16:03:00' AS Time), N'HarunH', 0)
INSERT [dbo].[Prijava] ([Vrijeme], [Korisnik], [Prijava]) VALUES (CAST(N'16:03:00' AS Time), N'HarunH', 1)
INSERT [dbo].[Prijava] ([Vrijeme], [Korisnik], [Prijava]) VALUES (CAST(N'02:41:00' AS Time), N'Aleksa', 0)
INSERT [dbo].[Prijava] ([Vrijeme], [Korisnik], [Prijava]) VALUES (CAST(N'02:41:00' AS Time), N'Aleksa', 0)
INSERT [dbo].[Prijava] ([Vrijeme], [Korisnik], [Prijava]) VALUES (CAST(N'02:41:00' AS Time), N'Aleksa', 0)
INSERT [dbo].[Prijava] ([Vrijeme], [Korisnik], [Prijava]) VALUES (CAST(N'02:42:00' AS Time), N'Aleksa', 0)
INSERT [dbo].[Prijava] ([Vrijeme], [Korisnik], [Prijava]) VALUES (CAST(N'02:49:00' AS Time), N'Aleksa', 0)
INSERT [dbo].[Prijava] ([Vrijeme], [Korisnik], [Prijava]) VALUES (CAST(N'02:49:00' AS Time), N'Aleksa', 0)
INSERT [dbo].[Prijava] ([Vrijeme], [Korisnik], [Prijava]) VALUES (CAST(N'02:49:00' AS Time), N'Aleksa', 0)
INSERT [dbo].[registracija] ([Predlozen_ID], [ime_korisnika], [prezime_korisnika], [predlozena_lozinka], [adresa_stanovanja], [broj_telefona], [kontakt_email], [pol], [radna_pozicija], [datum_rodjenja]) VALUES (N'Panzola', N' Pan', N' pon', N'', N'a', N'a', N'a', N'Muški', 5, CAST(N'1985-04-04' AS Date))
INSERT [dbo].[stanje_racuna] ([CVV], [nalog], [banka], [kreditna_kartica], [novcani_iznos]) VALUES (141, N'Emmanuel.H', N'Principal Bank Inc.', N'AmericanExpress', 100.0000)
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
ALTER TABLE [dbo].[registracija]  WITH CHECK ADD  CONSTRAINT [FK_registracija_pozicija] FOREIGN KEY([radna_pozicija])
REFERENCES [dbo].[pozicija] ([pozicija_id])
GO
ALTER TABLE [dbo].[registracija] CHECK CONSTRAINT [FK_registracija_pozicija]
GO
ALTER TABLE [dbo].[stanje_racuna]  WITH CHECK ADD  CONSTRAINT [FK_stanje_racuna_kreditne_kartice] FOREIGN KEY([CVV])
REFERENCES [dbo].[kreditne_kartice] ([CVV])
GO
ALTER TABLE [dbo].[stanje_racuna] CHECK CONSTRAINT [FK_stanje_racuna_kreditne_kartice]
GO
