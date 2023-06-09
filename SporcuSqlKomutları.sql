USE [master]
GO
/****** Object:  Database [Sporcu]    Script Date: 20.03.2023 16:49:48 ******/
CREATE DATABASE [Sporcu]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Sporcu', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Sporcu.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Sporcu_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Sporcu_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Sporcu] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Sporcu].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Sporcu] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Sporcu] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Sporcu] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Sporcu] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Sporcu] SET ARITHABORT OFF 
GO
ALTER DATABASE [Sporcu] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Sporcu] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Sporcu] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Sporcu] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Sporcu] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Sporcu] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Sporcu] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Sporcu] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Sporcu] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Sporcu] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Sporcu] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Sporcu] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Sporcu] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Sporcu] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Sporcu] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Sporcu] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Sporcu] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Sporcu] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Sporcu] SET  MULTI_USER 
GO
ALTER DATABASE [Sporcu] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Sporcu] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Sporcu] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Sporcu] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Sporcu] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Sporcu] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Sporcu] SET QUERY_STORE = ON
GO
ALTER DATABASE [Sporcu] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Sporcu]
GO
/****** Object:  Table [dbo].[EgitmenlerBilgi]    Script Date: 20.03.2023 16:49:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EgitmenlerBilgi](
	[EgitmenNo] [int] IDENTITY(1,1) NOT NULL,
	[EgitmenAdSoyad] [varchar](50) NULL,
	[EgitmenAdres] [varchar](50) NULL,
	[EgitmenTelefon] [varchar](50) NULL,
	[SporcuNo] [int] NOT NULL,
 CONSTRAINT [PK_EgitmenlerBilgi] PRIMARY KEY CLUSTERED 
(
	[EgitmenNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KullanicilarBilgi]    Script Date: 20.03.2023 16:49:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KullanicilarBilgi](
	[KullaniciNo] [int] IDENTITY(1,1) NOT NULL,
	[KullaniciAdi] [varchar](50) NULL,
	[Sifre] [varchar](50) NULL,
 CONSTRAINT [PK_KullanicilarBilgi] PRIMARY KEY CLUSTERED 
(
	[KullaniciNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalonlarBilgi]    Script Date: 20.03.2023 16:49:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalonlarBilgi](
	[SalonNo] [int] IDENTITY(1,1) NOT NULL,
	[SalonAdi] [varchar](50) NULL,
	[Salonm2] [varchar](50) NULL,
	[EgitmenNo] [int] NOT NULL,
 CONSTRAINT [PK_SalonlarBilgi] PRIMARY KEY CLUSTERED 
(
	[SalonNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SporcularBilgi]    Script Date: 20.03.2023 16:49:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SporcularBilgi](
	[SporcuNo] [int] IDENTITY(1,1) NOT NULL,
	[SporcuAdSoyad] [varchar](50) NULL,
	[SporcuYas] [varchar](50) NULL,
	[SporcuBoy] [varchar](50) NULL,
	[SporcuKilo] [varchar](50) NULL,
	[SporcuAdres] [varchar](50) NULL,
	[SporcuTelefon] [varchar](50) NULL,
 CONSTRAINT [PK_SporcularBilgi] PRIMARY KEY CLUSTERED 
(
	[SporcuNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[EgitmenlerBilgi] ON 

INSERT [dbo].[EgitmenlerBilgi] ([EgitmenNo], [EgitmenAdSoyad], [EgitmenAdres], [EgitmenTelefon], [SporcuNo]) VALUES (1, N'Caner Aslan', N'Kocaelii', N'5478495126', 1)
INSERT [dbo].[EgitmenlerBilgi] ([EgitmenNo], [EgitmenAdSoyad], [EgitmenAdres], [EgitmenTelefon], [SporcuNo]) VALUES (2, N'Ece Çetin', N'Kadıköy', N'5468521479', 2)
SET IDENTITY_INSERT [dbo].[EgitmenlerBilgi] OFF
GO
SET IDENTITY_INSERT [dbo].[SporcularBilgi] ON 

INSERT [dbo].[SporcularBilgi] ([SporcuNo], [SporcuAdSoyad], [SporcuYas], [SporcuBoy], [SporcuKilo], [SporcuAdres], [SporcuTelefon]) VALUES (1, N'Aykut Olgun', N'27', N'176', N'80', N'Maltepe', N'5497821315')
INSERT [dbo].[SporcularBilgi] ([SporcuNo], [SporcuAdSoyad], [SporcuYas], [SporcuBoy], [SporcuKilo], [SporcuAdres], [SporcuTelefon]) VALUES (2, N'Dogan Türkoğlu', N'35', N'180', N'75', N'Ataşehir', N'5498751215')
SET IDENTITY_INSERT [dbo].[SporcularBilgi] OFF
GO
ALTER TABLE [dbo].[EgitmenlerBilgi]  WITH CHECK ADD  CONSTRAINT [FK_EgitmenlerBilgi_SporcularBilgi] FOREIGN KEY([SporcuNo])
REFERENCES [dbo].[SporcularBilgi] ([SporcuNo])
GO
ALTER TABLE [dbo].[EgitmenlerBilgi] CHECK CONSTRAINT [FK_EgitmenlerBilgi_SporcularBilgi]
GO
ALTER TABLE [dbo].[SalonlarBilgi]  WITH CHECK ADD  CONSTRAINT [FK_SalonlarBilgi_EgitmenlerBilgi] FOREIGN KEY([EgitmenNo])
REFERENCES [dbo].[EgitmenlerBilgi] ([EgitmenNo])
GO
ALTER TABLE [dbo].[SalonlarBilgi] CHECK CONSTRAINT [FK_SalonlarBilgi_EgitmenlerBilgi]
GO
/****** Object:  StoredProcedure [dbo].[EgitmenEkle]    Script Date: 20.03.2023 16:49:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[EgitmenEkle]
@EgitmenAdSoyad varchar(50),
@EgitmenAdres varchar(50),
@EgitmenTelefon varchar(50),
@SporcuNo int
as begin
insert into EgitmenlerBilgi
(EgitmenAdSoyad,EgitmenAdres,EgitmenTelefon,SporcuNo)values
(@EgitmenAdSoyad,@EgitmenAdres,@EgitmenTelefon,@SporcuNo)
end
GO
/****** Object:  StoredProcedure [dbo].[EgitmenListele]    Script Date: 20.03.2023 16:49:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[EgitmenListele]
as begin
select*from EgitmenlerBilgi
end
GO
/****** Object:  StoredProcedure [dbo].[EgitmenSil]    Script Date: 20.03.2023 16:49:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[EgitmenSil]
@EgitmenNo int
as begin
delete from EgitmenlerBilgi where EgitmenNo=@EgitmenNo
end
GO
/****** Object:  StoredProcedure [dbo].[EgitmenYenile]    Script Date: 20.03.2023 16:49:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[EgitmenYenile]
@EgitmenNo int,
@EgitmenAdSoyad varchar(50),
@EgitmenAdres varchar(50),
@EgitmenTelefon varchar(50),
@SporcuNo int
as begin
update EgitmenlerBilgi set
EgitmenAdSoyad=@EgitmenAdSoyad,EgitmenAdres=@EgitmenAdres,EgitmenTelefon=@EgitmenTelefon,SporcuNo=@SporcuNo where EgitmenNo=@EgitmenNo
end
GO
/****** Object:  StoredProcedure [dbo].[SalonEkle]    Script Date: 20.03.2023 16:49:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SalonEkle]
@SalonAdi varchar(50),
@Salonm2 varchar(50),
@EgitmenNo int
as begin
insert into SalonlarBilgi
(SalonAdi,Salonm2,EgitmenNo)values(@SalonAdi,@SalonAdi,@EgitmenNo)
end
GO
/****** Object:  StoredProcedure [dbo].[SalonListele]    Script Date: 20.03.2023 16:49:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SalonListele]
as begin
select *from SalonlarBilgi
end
GO
/****** Object:  StoredProcedure [dbo].[SalonSil]    Script Date: 20.03.2023 16:49:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SalonSil]
@SalonNo int
as begin
delete from SalonlarBilgi where SalonNo=@SalonNo
end
GO
/****** Object:  StoredProcedure [dbo].[SalonYenile]    Script Date: 20.03.2023 16:49:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SalonYenile]
@SalonNo int,
@SalonAdi varchar(50),
@Salonm2 varchar(50),
@EgitmenNo int
as begin
update SalonlarBilgi set
SalonAdi=@SalonAdi,Salonm2=@Salonm2,EgitmenNo=@EgitmenNo where SalonNo=@SalonNo
end
GO
/****** Object:  StoredProcedure [dbo].[SporcuEkle]    Script Date: 20.03.2023 16:49:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SporcuEkle]
@SporcuAdSoyad varchar(50),
@SporcuYas varchar(50),
@SporcuBoy varchar(50),
@SporcuKilo varchar(50),
@SporcuAdres varchar(50),
@SporcuTelefon varchar(50)
as begin
insert into SporcularBilgi
(SporcuAdSoyad,SporcuYas,SporcuBoy,SporcuKilo,SporcuAdres,SporcuTelefon)values
(@SporcuAdSoyad,@SporcuYas,@SporcuBoy,@SporcuKilo,@SporcuAdres,@SporcuTelefon)
end
GO
/****** Object:  StoredProcedure [dbo].[SporcuListele]    Script Date: 20.03.2023 16:49:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SporcuListele]
as begin
select *from SporcularBilgi
end
GO
/****** Object:  StoredProcedure [dbo].[SporcuSil]    Script Date: 20.03.2023 16:49:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SporcuSil]
@SporcuNo int
as begin
delete from SporcularBilgi where SporcuNo=@SporcuNo
end
GO
/****** Object:  StoredProcedure [dbo].[SporcuYenile]    Script Date: 20.03.2023 16:49:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SporcuYenile]
@SporcuNo int,
@SporcuAdSoyad varchar(50),
@SporcuYas varchar(50),
@SporcuBoy varchar(50),
@SporcuKilo varchar(50),
@SporcuAdres varchar(50),
@SporcuTelefon varchar(50)
as begin 
update SporcularBilgi set
SporcuAdSoyad=@SporcuAdSoyad,SporcuYas=@SporcuYas,SporcuBoy=@SporcuBoy,SporcuKilo=@SporcuKilo,SporcuAdres=@SporcuAdres,SporcuTelefon=@SporcuTelefon where SporcuNo=@SporcuNo
end
GO
USE [master]
GO
ALTER DATABASE [Sporcu] SET  READ_WRITE 
GO
