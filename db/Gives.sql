USE [master]
GO
/****** Object:  Database [Gives]    Script Date: 5/5/2018 21:16:00 ******/
CREATE DATABASE [Gives]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Gives', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Gives.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Gives_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Gives_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Gives] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Gives].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Gives] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Gives] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Gives] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Gives] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Gives] SET ARITHABORT OFF 
GO
ALTER DATABASE [Gives] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Gives] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Gives] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Gives] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Gives] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Gives] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Gives] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Gives] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Gives] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Gives] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Gives] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Gives] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Gives] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Gives] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Gives] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Gives] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Gives] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Gives] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Gives] SET  MULTI_USER 
GO
ALTER DATABASE [Gives] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Gives] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Gives] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Gives] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Gives] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Gives] SET QUERY_STORE = OFF
GO
USE [Gives]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Gives]
GO
/****** Object:  Table [dbo].[About_Masking]    Script Date: 5/5/2018 21:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[About_Masking](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Text_First] [nvarchar](50) NULL,
	[Text_Second] [nvarchar](50) NULL,
	[Image] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[About_Partners]    Script Date: 5/5/2018 21:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[About_Partners](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](255) NULL,
	[Website] [nvarchar](200) NULL,
	[Status] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[About_Section]    Script Date: 5/5/2018 21:16:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[About_Section](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Image] [nvarchar](255) NULL,
	[Information] [nvarchar](max) NULL,
	[Text_First] [nvarchar](max) NULL,
	[Text_Second] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Administrator]    Script Date: 5/5/2018 21:16:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Administrator](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Fullname] [nvarchar](50) NULL,
	[Password] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Become_Volunteer]    Script Date: 5/5/2018 21:16:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Become_Volunteer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Fullname] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Information] [nvarchar](max) NULL,
	[Image] [nvarchar](250) NULL,
	[Status] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blog_List_Masking]    Script Date: 5/5/2018 21:16:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog_List_Masking](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Text_First] [nvarchar](50) NULL,
	[Text_Second] [nvarchar](50) NULL,
	[Image] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blog_Single_Masking]    Script Date: 5/5/2018 21:16:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog_Single_Masking](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Text_First] [nvarchar](100) NULL,
	[Text_Second] [nvarchar](100) NULL,
	[Image] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 5/5/2018 21:16:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Status] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Causes_Grid_Masking]    Script Date: 5/5/2018 21:16:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Causes_Grid_Masking](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Text_First] [nvarchar](50) NULL,
	[Text_Second] [nvarchar](50) NULL,
	[Image] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Causes_Grid_Recent]    Script Date: 5/5/2018 21:16:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Causes_Grid_Recent](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title1] [nvarchar](50) NULL,
	[Title2] [nvarchar](50) NULL,
	[Image] [nvarchar](250) NULL,
	[Recent_Title] [nvarchar](50) NULL,
	[Content] [nvarchar](250) NULL,
	[First_Price] [decimal](18, 0) NULL,
	[Second_Price] [decimal](18, 0) NULL,
	[Progress] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Causes_List_Masking]    Script Date: 5/5/2018 21:16:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Causes_List_Masking](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Text_First] [nvarchar](50) NULL,
	[Text_Second] [nvarchar](50) NULL,
	[Image] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Causes_List_Recent]    Script Date: 5/5/2018 21:16:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Causes_List_Recent](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](250) NULL,
	[Recent_Title] [nvarchar](50) NULL,
	[Content] [nvarchar](250) NULL,
	[First_Price] [decimal](18, 0) NULL,
	[Second_Price] [decimal](18, 0) NULL,
	[Progress] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Causes_Single_Cards]    Script Date: 5/5/2018 21:16:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Causes_Single_Cards](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstPrice] [int] NULL,
	[SecondPrice] [int] NULL,
	[ThirdPrice] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Causes_Single_Masking]    Script Date: 5/5/2018 21:16:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Causes_Single_Masking](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Text_First] [nvarchar](50) NULL,
	[Text_Second] [nvarchar](50) NULL,
	[Image] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Causes_Single_Paypal]    Script Date: 5/5/2018 21:16:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Causes_Single_Paypal](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstPrice] [int] NULL,
	[SecondPrice] [int] NULL,
	[ThirdPrice] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Causes_Single_PayTitle]    Script Date: 5/5/2018 21:16:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Causes_Single_PayTitle](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Causes_Single_Recent]    Script Date: 5/5/2018 21:16:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Causes_Single_Recent](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](250) NULL,
	[Title] [nvarchar](50) NULL,
	[First_Price] [decimal](18, 0) NULL,
	[Second_Price] [decimal](18, 0) NULL,
	[Progress] [decimal](18, 0) NULL,
	[Donors] [int] NULL,
	[Days] [int] NULL,
	[Content1] [nvarchar](max) NULL,
	[Content2] [nvarchar](max) NULL,
	[Content3] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CommentNews]    Script Date: 5/5/2018 21:16:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommentNews](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](max) NULL,
	[Dates] [datetime] NULL,
	[News_Id] [int] NULL,
	[Users_Id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CommentPost]    Script Date: 5/5/2018 21:16:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommentPost](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](max) NULL,
	[Dates] [datetime] NULL,
	[Post_Id] [int] NULL,
	[Users_Id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact_Adress]    Script Date: 5/5/2018 21:16:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact_Adress](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Adress] [nvarchar](100) NULL,
	[First_Email] [nvarchar](50) NULL,
	[Second_Email] [nvarchar](50) NULL,
	[First_Number] [nvarchar](50) NULL,
	[Second_Number] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact_Map]    Script Date: 5/5/2018 21:16:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact_Map](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Map_Location] [nvarchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact_Masking]    Script Date: 5/5/2018 21:16:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact_Masking](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Text_First] [nvarchar](50) NULL,
	[Text_Second] [nvarchar](50) NULL,
	[Image] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact_Message]    Script Date: 5/5/2018 21:16:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact_Message](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Subject] [nvarchar](50) NULL,
	[Message_Content] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feature]    Script Date: 5/5/2018 21:16:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feature](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Content] [nvarchar](200) NULL,
	[Information] [nvarchar](max) NULL,
	[Fa_Icon] [nvarchar](50) NULL,
	[Style] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Footer]    Script Date: 5/5/2018 21:16:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Footer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Twitter] [nvarchar](200) NULL,
	[Google] [nvarchar](255) NULL,
	[Facebook] [nvarchar](255) NULL,
	[LInkedin] [nvarchar](255) NULL,
	[Scype] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gallery_Images]    Script Date: 5/5/2018 21:16:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gallery_Images](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](250) NULL,
	[Width] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gallery_Masking]    Script Date: 5/5/2018 21:16:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gallery_Masking](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Text_First] [nvarchar](50) NULL,
	[Text_Second] [nvarchar](50) NULL,
	[Image] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Home_Cause]    Script Date: 5/5/2018 21:16:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Home_Cause](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Title2] [nvarchar](50) NULL,
	[Content] [nvarchar](200) NULL,
	[First_Price] [decimal](18, 0) NULL,
	[Second_Price] [decimal](18, 0) NULL,
	[Image] [nvarchar](255) NULL,
	[Progress] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Home_Gallery]    Script Date: 5/5/2018 21:16:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Home_Gallery](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Home_Need]    Script Date: 5/5/2018 21:16:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Home_Need](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Image] [nvarchar](255) NULL,
	[Content] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Home_Recent]    Script Date: 5/5/2018 21:16:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Home_Recent](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title1] [nvarchar](50) NULL,
	[Title2] [nvarchar](50) NULL,
	[Recent_Title] [nvarchar](50) NULL,
	[Recent_Content] [nvarchar](255) NULL,
	[First_Price] [decimal](18, 0) NULL,
	[Second_Price] [decimal](18, 0) NULL,
	[Progres] [decimal](18, 0) NULL,
	[Image] [nvarchar](255) NULL,
	[Status] [tinyint] NULL,
	[Status3] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Home_Slider]    Script Date: 5/5/2018 21:16:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Home_Slider](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Content] [nvarchar](200) NULL,
	[Image] [nvarchar](250) NULL,
	[Content2] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Home_Volunteer]    Script Date: 5/5/2018 21:16:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Home_Volunteer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title1] [nvarchar](50) NULL,
	[Title2] [nvarchar](50) NULL,
	[Amount] [nvarchar](50) NULL,
	[Fullname] [nvarchar](50) NULL,
	[Content] [nvarchar](255) NULL,
	[Image] [nvarchar](255) NULL,
	[Twitter] [nvarchar](255) NULL,
	[Facebook] [nvarchar](255) NULL,
	[Youtube] [nvarchar](255) NULL,
	[Information] [nvarchar](max) NULL,
	[Status] [tinyint] NULL,
	[Status2] [tinyint] NULL,
	[Status3] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Home_Work_Us]    Script Date: 5/5/2018 21:16:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Home_Work_Us](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Title2] [nvarchar](50) NULL,
	[Image] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 5/5/2018 21:16:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NULL,
	[Dates] [datetime] NULL,
	[Content] [nvarchar](max) NULL,
	[First_Content] [nvarchar](max) NULL,
	[Second_Content] [nvarchar](max) NULL,
	[States] [nvarchar](max) NULL,
	[Status] [int] NOT NULL,
	[Image] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News_To_Category]    Script Date: 5/5/2018 21:16:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News_To_Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[News_Id] [int] NULL,
	[Category_Id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PayPal_Donate]    Script Date: 5/5/2018 21:16:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PayPal_Donate](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Amount] [int] NULL,
	[Card_Number] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 5/5/2018 21:16:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Image] [nvarchar](255) NULL,
	[Content] [nvarchar](max) NULL,
	[Date] [datetime] NULL,
	[Status] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post_To_Tag]    Script Date: 5/5/2018 21:16:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post_To_Tag](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Post_Id] [int] NULL,
	[Tag_Id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 5/5/2018 21:16:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Status] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Messages]    Script Date: 5/5/2018 21:16:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Messages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Subjects] [nvarchar](250) NULL,
	[Mesage] [nvarchar](max) NULL,
	[Status] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/5/2018 21:16:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[Password] [nvarchar](250) NULL,
	[Image] [nvarchar](250) NULL,
	[Name] [nvarchar](50) NULL,
	[Surname] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Visa_Master_Donate]    Script Date: 5/5/2018 21:16:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Visa_Master_Donate](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Firstname] [nvarchar](50) NULL,
	[Lastname] [nvarchar](50) NULL,
	[Amount] [nvarchar](50) NULL,
	[Pay_Type] [nvarchar](50) NULL,
	[Card_Type] [nvarchar](50) NULL,
	[Card_Number] [int] NULL,
	[Card_CVC] [int] NULL,
	[Date] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[About_Masking] ON 

INSERT [dbo].[About_Masking] ([Id], [Title], [Text_First], [Text_Second], [Image]) VALUES (1, N'About', N'Home', N'About', N'2018_4_9_15_35_34_732back3.jpg')
SET IDENTITY_INSERT [dbo].[About_Masking] OFF
SET IDENTITY_INSERT [dbo].[About_Partners] ON 

INSERT [dbo].[About_Partners] ([Id], [Image], [Website], [Status]) VALUES (1, N'2018_4_9_18_23_46_791logo-1.png', N'https://codecanyon.net/', 0)
INSERT [dbo].[About_Partners] ([Id], [Image], [Website], [Status]) VALUES (2, N'2018_4_9_18_13_28_845logo-2.png', N'https://graphicriver.net/', 0)
INSERT [dbo].[About_Partners] ([Id], [Image], [Website], [Status]) VALUES (3, N'2018_4_9_18_13_37_511logo-3.png', N'https://photodune.net/', 0)
INSERT [dbo].[About_Partners] ([Id], [Image], [Website], [Status]) VALUES (4, N'2018_4_9_18_13_45_562logo-4.png', N'https://themeforest.net/', 0)
INSERT [dbo].[About_Partners] ([Id], [Image], [Website], [Status]) VALUES (5, N'2018_4_9_18_13_52_361logo-5.png', N'https://audiojungle.net/', 0)
INSERT [dbo].[About_Partners] ([Id], [Image], [Website], [Status]) VALUES (6, N'2018_4_9_18_24_47_835logo-5.png', N'z', 1)
SET IDENTITY_INSERT [dbo].[About_Partners] OFF
SET IDENTITY_INSERT [dbo].[About_Section] ON 

INSERT [dbo].[About_Section] ([Id], [Title], [Image], [Information], [Text_First], [Text_Second]) VALUES (1, N'HI WE PROVIDE WORLDWIDE CHARITY SERVICE SINCE 1978', N'2018_4_12_19_12_32_798featured-image-11.png', N'orem ipsum dolor sit amet, consectetur adipisicing elit. Fuga voluptates dolor reprehenderit, deserunt, quibusdam repellat architecto blanditiis a, nulla inventore minima necessitatibus illum molestias, quas molestiae maiores tempora temporibus incidunt ea! Voluptate temporibus repellat nulla omnis nesciunt illum odit dicta fuga id!orem ipsum dolor sit amet, consectetur adipisicing elit. Fuga voluptates dolor reprehenderit, deserunt, quibusdam repellat architecto blanditiis a, nulla inventore minima necessitatibus illum molestias, quas molestiae maiores tempora temporibus incidunt ea! Voluptate temporibus repellat nulla omnis nesciunt illum odit dicta fuga id!orem ipsum dolor sit amet, consectetur adipisicing elit. Fuga voluptates dolor reprehenderit, deserunt, quibusdam repellat architecto blanditiis a, nulla inventore minima necessitatibus illum molestias, quas molestiae maiores tempora temporibus incidunt ea! Voluptate temporibus repellat nulla omnis nesciunt illum odit dicta fuga id!orem ipsum dolor sit amet, consectetur adipisicing elit. Fuga voluptates dolor reprehenderit, deserunt, quibusdam repellat architecto blanditiis a, nulla inventore minima necessitatibus illum molestias, quas molestiae maiores tempora temporibus incidunt ea! Voluptate temporibus repellat nulla omnis nesciunt illum odit dicta fuga id!orem ipsum dolor sit amet, consectetur adipisicing elit. Fuga voluptates dolor reprehenderit, deserunt, quibusdam repellat architecto blanditiis a, nulla inventore minima necessitatibus illum molestias, quas molestiae maiores tempora temporibus incidunt ea! Voluptate temporibus repellat nulla omnis nesciunt illum odit dicta fuga id!', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Necessitatibus sapiente deleniti commodi provident veniam vitae blanditiis rerum temporibus totam est, omnis sint excepturi maiores iure similique. Sequi magni, suscipit laudantium velit. Excepturi sint placeat vel, porro, saepe ratione sunt natus, quod rem error ipsum ipsa.', N'orem ipsum dolor sit amet, consectetur adipisicing elit. Fuga voluptates dolor reprehenderit, deserunt, quibusdam repellat architecto blanditiis a, nulla inventore minima necessitatibus illum molestias, quas molestiae maiores tempora temporibus incidunt ea! Voluptate temporibus repellat nulla omnis nesciunt illum odit dicta fuga id!')
SET IDENTITY_INSERT [dbo].[About_Section] OFF
SET IDENTITY_INSERT [dbo].[Administrator] ON 

INSERT [dbo].[Administrator] ([Id], [Fullname], [Password]) VALUES (1, N'admin', N'ABbN/tfiZ2Ng1efm9VM71B8AgZ2xMAXQE2ETDrHiR3k8Mgj/4LqNhBEAaJ61QIcgbA==')
SET IDENTITY_INSERT [dbo].[Administrator] OFF
SET IDENTITY_INSERT [dbo].[Become_Volunteer] ON 

INSERT [dbo].[Become_Volunteer] ([Id], [Fullname], [Email], [Information], [Image], [Status]) VALUES (1, N'Samir Hasanov', N'samireh@code.edu.az', N'Lorem ipsum dolor sit amet consecte tur adipiscing titor sit amet consecte tur adipiscing titorLorem ipsum dolor sit amet consecte tur adipiscing titor sit amet consecte tur adipiscing titorLorem ipsum dolor sit amet consecte tur adipiscing titor sit amet consecte tur adipiscing titLorem ipsum dolor sit amet consecte tur adipiscing titor sit amet consecte tur adipiscing titorLorem ipsum dolor sit amet consecte tur adipiscing titor sit amet consecte tur adipiscing titorLorem ipsum dolor sit amet consecte tur adipiscing titor sit amet consecte tur adipiscing titorLorem ipsum dolor sit amet consecte tur adipiscing titor sit amet consecte tur adipiscing titorLorem ipsum dolor sit amet consecte tur adipiscing titor sit amet consecte tur adipiscing titorLorem ipsum dolor sit amet consecte tur adipiscing titor sit amet consecte tur adipiscing titoror', N'2018_4_12_22_17_2_988Снимок экрана (17).png', 0)
INSERT [dbo].[Become_Volunteer] ([Id], [Fullname], [Email], [Information], [Image], [Status]) VALUES (2, N'Elnur Hasanov', N'elxan@code.az', N'Good Boy', N'2018_4_12_22_30_51_161Снимок экрана (15).png', 0)
INSERT [dbo].[Become_Volunteer] ([Id], [Fullname], [Email], [Information], [Image], [Status]) VALUES (3, N'Asif Meherremov', N'asif@gmail.com', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Necessitatibus sapiente deleniti commodi provident veniam vitae blanditiis rerum temporibus totam est, omnis sint excepturi maiores iure similique. Sequi magni, suscipit laudantium velit. Excepturi sint placeat vel, porro, saepe ratione sunt natus, quod rem error ipsum ipsa.

orem ipsum dolor sit amet, consectetur adipisicing elit. Fuga voluptates dolor reprehenderit, deserunt, quibusdam repellat architecto blanditiis a, nulla inventore minima necessitatibus illum molestias, quas molestiae maiores tempora temporibus incidunt ea! Voluptate temporibus repellat nulla omnis nesciunt illum odit dicta fuga id!

orem ipsum dolor sit amet, consectetur adipisicing elit. Fuga voluptates dolor reprehenderit, deserunt, quibusdam repellat architecto blanditiis a, nulla inventore minima necessitatibus illum molestias, quas molestiae maiores tempora temporibus incidunt ea! Voluptate temporibus repellat nulla omnis nesciunt illum odit dicta fuga id!orem ipsum dolor sit amet, consectetur adipisicing elit. Fuga voluptates dolor reprehenderit, deserunt, quibusdam repellat architecto blanditiis a, nulla inventore minima necessitatibus illum molestias, quas molestiae maiores tempora temporibus incidunt ea! Voluptate temporibus repellat nulla omnis nesciunt illum odit dicta fuga id!orem ipsum dolor sit amet, consectetur adipisicing elit. Fuga voluptates dolor reprehenderit, deserunt, quibusdam repellat architecto blanditiis a, nulla inventore minima necessitatibus illum molestias, quas molestiae maiores tempora temporibus incidunt ea! Voluptate temporibus repellat nulla omnis nesciunt illum odit dicta fuga id!orem ipsum dolor sit amet, consectetur adipisicing elit. Fuga voluptates dolor reprehenderit, deserunt, quibusdam repellat architecto blanditiis a, nulla inventore minima necessitatibus illum molestias, quas molestiae maiores tempora temporibus incidunt ea! Voluptate temporibus repellat nulla omnis nesciunt illum odit dicta fuga id!orem ipsum dolor sit amet, consectetur adipisicing elit. Fuga voluptates dolor reprehenderit, deserunt, quibusdam repellat architecto blanditiis a, nulla inventore minima necessitatibus illum molestias, quas molestiae maiores tempora temporibus incidunt ea! Voluptate temporibus repellat nulla omnis nesciunt illum odit dicta fuga id!', N'2018_4_13_1_26_42_709single-cause.jpg', 1)
INSERT [dbo].[Become_Volunteer] ([Id], [Fullname], [Email], [Information], [Image], [Status]) VALUES (4, N'Samir', N'samireh@code.edu.az', N'Godboy', N'2018_4_13_20_21_8_7661QslUB62JO.jpg', 0)
SET IDENTITY_INSERT [dbo].[Become_Volunteer] OFF
SET IDENTITY_INSERT [dbo].[Blog_List_Masking] ON 

INSERT [dbo].[Blog_List_Masking] ([Id], [Title], [Text_First], [Text_Second], [Image]) VALUES (1, N'News', N'Home', N'News List', N'2018_4_19_17_2_21_928back3.jpg')
SET IDENTITY_INSERT [dbo].[Blog_List_Masking] OFF
SET IDENTITY_INSERT [dbo].[Blog_Single_Masking] ON 

INSERT [dbo].[Blog_Single_Masking] ([Id], [Title], [Text_First], [Text_Second], [Image]) VALUES (1, N'Posts', N'Home', N'Post List', N'2018_4_19_17_20_8_443back3.jpg')
SET IDENTITY_INSERT [dbo].[Blog_Single_Masking] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name], [Status]) VALUES (2, N'Charity', 0)
INSERT [dbo].[Category] ([Id], [Name], [Status]) VALUES (4, N'Donations', 0)
INSERT [dbo].[Category] ([Id], [Name], [Status]) VALUES (5, N'Volunteers', 0)
INSERT [dbo].[Category] ([Id], [Name], [Status]) VALUES (6, N'Medicine', 0)
INSERT [dbo].[Category] ([Id], [Name], [Status]) VALUES (1002, N'Travel', 0)
INSERT [dbo].[Category] ([Id], [Name], [Status]) VALUES (1003, N'Events', 0)
INSERT [dbo].[Category] ([Id], [Name], [Status]) VALUES (1004, N'Health', 0)
INSERT [dbo].[Category] ([Id], [Name], [Status]) VALUES (1006, N'Education', 0)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Causes_Grid_Masking] ON 

INSERT [dbo].[Causes_Grid_Masking] ([Id], [Title], [Text_First], [Text_Second], [Image]) VALUES (1, N'CAUSES GRID', N'Home', N'Causes Grid', N'2018_4_6_15_40_24_65back3.jpg')
SET IDENTITY_INSERT [dbo].[Causes_Grid_Masking] OFF
SET IDENTITY_INSERT [dbo].[Causes_List_Masking] ON 

INSERT [dbo].[Causes_List_Masking] ([Id], [Title], [Text_First], [Text_Second], [Image]) VALUES (1, N'CAUSES LIST', N'Home', N'Causes List', N'2018_4_6_19_11_32_977back3.jpg')
SET IDENTITY_INSERT [dbo].[Causes_List_Masking] OFF
SET IDENTITY_INSERT [dbo].[Causes_Single_Cards] ON 

INSERT [dbo].[Causes_Single_Cards] ([Id], [FirstPrice], [SecondPrice], [ThirdPrice]) VALUES (1, 50, 100, 150)
SET IDENTITY_INSERT [dbo].[Causes_Single_Cards] OFF
SET IDENTITY_INSERT [dbo].[Causes_Single_Masking] ON 

INSERT [dbo].[Causes_Single_Masking] ([Id], [Title], [Text_First], [Text_Second], [Image]) VALUES (1, N'CAUSES Single', N'Home', N'Causes Single', N'2018_4_6_22_2_39_495back3.jpg')
SET IDENTITY_INSERT [dbo].[Causes_Single_Masking] OFF
SET IDENTITY_INSERT [dbo].[Causes_Single_Paypal] ON 

INSERT [dbo].[Causes_Single_Paypal] ([Id], [FirstPrice], [SecondPrice], [ThirdPrice]) VALUES (1, 50, 100, 150)
SET IDENTITY_INSERT [dbo].[Causes_Single_Paypal] OFF
SET IDENTITY_INSERT [dbo].[Causes_Single_PayTitle] ON 

INSERT [dbo].[Causes_Single_PayTitle] ([Id], [Title]) VALUES (1, N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reprehenderit, omnis, ad. Eligendi molestiae qui, modi minima voluptatibus est accusamus nisi reprehenderit mollitia vitae perferendis aliquam tenetur sequi enim tempora expedita, assumenda doloremque quos maxime esse.')
SET IDENTITY_INSERT [dbo].[Causes_Single_PayTitle] OFF
SET IDENTITY_INSERT [dbo].[Causes_Single_Recent] ON 

INSERT [dbo].[Causes_Single_Recent] ([Id], [Image], [Title], [First_Price], [Second_Price], [Progress], [Donors], [Days], [Content1], [Content2], [Content3]) VALUES (1, N'2018_4_6_22_59_30_117single-cause.jpg', N' Make a Better World for Disabled Kids', CAST(5000 AS Decimal(18, 0)), CAST(12000 AS Decimal(18, 0)), CAST(46 AS Decimal(18, 0)), 10, 50, N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis aliquid error, repellat, voluptatem at iste soluta veritatis aperiam, pariatur sunt odit, ad praesentium! Modi asperiores adipisci optio voluptatibus iste corporis, animi ducimus placeat tenetur reprehenderit impedit quam molestiae suscipit, eaque dignissimos eos quae omnis, quidem.', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem odio quasi nobis et aliquam deleniti, facilis corrupti quas, debitis modi? Autem repellat dolorum ipsa delectus adipisci culpa, quaerat quisquam dignissimos nihil tempora iste rem. Cupiditate, odit dolor numquam est non eveniet, perspiciatis dolorem commodi delectus maxime excepturi velit quos inventore?', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eius doloribus consequatur ratione, assumenda ipsum, quos itaque inventore ducimus voluptate, quas aliquid commodi sint. Nihil aut dolorem sed temporibus! At, ea dignissimos. Magni id fuga quidem tempora doloremque eaque dicta quia assumenda, odit ullam voluptate modi soluta, corrupti eum possimus. Possimus nesciunt cumque, consequuntur, sint aspernatur illum molestias atque consectetur voluptates quibusdam perspiciatis voluptate ipsa nostrum.')
SET IDENTITY_INSERT [dbo].[Causes_Single_Recent] OFF
SET IDENTITY_INSERT [dbo].[CommentNews] ON 

INSERT [dbo].[CommentNews] ([Id], [Content], [Dates], [News_Id], [Users_Id]) VALUES (1, N'Hi ,friends', CAST(N'2018-04-29T18:30:44.303' AS DateTime), 1013, 6)
INSERT [dbo].[CommentNews] ([Id], [Content], [Dates], [News_Id], [Users_Id]) VALUES (2, N'Samir', CAST(N'2018-04-29T18:34:58.660' AS DateTime), 1014, 6)
INSERT [dbo].[CommentNews] ([Id], [Content], [Dates], [News_Id], [Users_Id]) VALUES (3, N'saopghopfb', CAST(N'2018-04-29T18:36:46.280' AS DateTime), 1013, 6)
INSERT [dbo].[CommentNews] ([Id], [Content], [Dates], [News_Id], [Users_Id]) VALUES (4, N'New Comment', CAST(N'2018-04-29T18:42:38.407' AS DateTime), 1014, 6)
INSERT [dbo].[CommentNews] ([Id], [Content], [Dates], [News_Id], [Users_Id]) VALUES (5, N'sasasasa', CAST(N'2018-04-29T19:00:28.020' AS DateTime), 1013, 6)
INSERT [dbo].[CommentNews] ([Id], [Content], [Dates], [News_Id], [Users_Id]) VALUES (6, N'Heeeey', CAST(N'2018-04-30T12:49:03.003' AS DateTime), 1013, 6)
INSERT [dbo].[CommentNews] ([Id], [Content], [Dates], [News_Id], [Users_Id]) VALUES (7, N'samiiiiiir', CAST(N'2018-04-30T12:50:12.853' AS DateTime), 1013, 6)
INSERT [dbo].[CommentNews] ([Id], [Content], [Dates], [News_Id], [Users_Id]) VALUES (8, N'Hey', CAST(N'2018-04-30T12:54:21.587' AS DateTime), 1015, 6)
INSERT [dbo].[CommentNews] ([Id], [Content], [Dates], [News_Id], [Users_Id]) VALUES (9, N'Hey', CAST(N'2018-04-30T12:55:49.677' AS DateTime), 1015, 6)
INSERT [dbo].[CommentNews] ([Id], [Content], [Dates], [News_Id], [Users_Id]) VALUES (10, N'Hey', CAST(N'2018-04-30T12:55:56.743' AS DateTime), 1015, 6)
INSERT [dbo].[CommentNews] ([Id], [Content], [Dates], [News_Id], [Users_Id]) VALUES (11, N'Hey', CAST(N'2018-04-30T12:56:05.510' AS DateTime), 1015, 6)
INSERT [dbo].[CommentNews] ([Id], [Content], [Dates], [News_Id], [Users_Id]) VALUES (12, N'aaaaaaaaaaaaaa', CAST(N'2018-04-30T12:58:06.440' AS DateTime), 1015, 6)
INSERT [dbo].[CommentNews] ([Id], [Content], [Dates], [News_Id], [Users_Id]) VALUES (13, N'gfdgfdgfdgdf', CAST(N'2018-04-30T12:58:25.843' AS DateTime), 1015, 6)
INSERT [dbo].[CommentNews] ([Id], [Content], [Dates], [News_Id], [Users_Id]) VALUES (14, N'Hello!!', CAST(N'2018-04-30T19:24:50.403' AS DateTime), 1014, 4)
INSERT [dbo].[CommentNews] ([Id], [Content], [Dates], [News_Id], [Users_Id]) VALUES (15, N'Etiam at consectetur nisl. Donec rutrum volutpat turpis ac lobortis. Fusce sit amet orci ante. Duis faucibus interdumd. Mauris tempor sem at venenatis sagittis. Fusce vel maximus diam. Praesent ut vehicula eros. Nunc quis egestas turpis. Sed posuere unc at dui tempus maximus. In fringilla dui in eros blandit, ac pulvinar magna dapibus. Nunc in nisi id tellus placerat consectetur ac tincidunt turpis. Pellentesque ut metus lacus. Mauris non velit vulputate lorem scelerisque rutrum non tristique leo. Sed vitae arcu nec nibh egestas ultrices Lorem ipsum dolor sit amet, consectetur adipisicing elit. Provident aliquid porro a velit doloribus nobis cum sint beatae neque iusto molestias fuga, eaque vero natus maxime quam sunt optio praesentium. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Adipisci maxime beatae aut deleniti sapiente explicabo velit dolorem suscipit nesciunt non.

The main thing
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus dolorem, non omnis. Beatae quibusdam aperiam modi ut sed perspiciatis, quo doloremque in facilis eveniet porro inventore explicabo obcaecati. Aperiam ad nemo fugit in minima officiis accusantium aspernatur nobis, itaque incidunt ullam, laborum atque est ipsum ab voluptatibus quae inventore placeat voluptatum quo quia cum cumque cupiditate suscipit! Architecto voluptates blanditiis dignissimos fugit mollitia. Deserunt, perferendis.', CAST(N'2018-04-30T20:27:27.853' AS DateTime), 1013, 6)
INSERT [dbo].[CommentNews] ([Id], [Content], [Dates], [News_Id], [Users_Id]) VALUES (16, N'Salam millet', CAST(N'2018-04-30T20:46:01.077' AS DateTime), 1013, 7)
SET IDENTITY_INSERT [dbo].[CommentNews] OFF
SET IDENTITY_INSERT [dbo].[CommentPost] ON 

INSERT [dbo].[CommentPost] ([Id], [Content], [Dates], [Post_Id], [Users_Id]) VALUES (1, N'officiis accusantium aspernatur nobis, itaque incidunt ullam, laborum atque est ipsum ab voluptatibus quae inventore placeat voluptatum quo quia cum cumque cupiditate suscipit! Architecto voluptates blanditiis dignissimos fugit mollitia. Deserunt, perferendis. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Hic deserunt unde ratione odio temporibus officiis, nemo. Aperiam commodi, sapiente cul totam!', CAST(N'2018-04-30T22:17:29.273' AS DateTime), 3, 6)
INSERT [dbo].[CommentPost] ([Id], [Content], [Dates], [Post_Id], [Users_Id]) VALUES (2, N'officiis accusantium aspernatur nobis, itaque incidunt ullam, laborum atque est ipsum ab voluptatibus quae inventore placeat voluptatum quo quia cum cumque cupiditate suscipit! Architecto voluptates blanditiis dignissimos fugit mollitia. Deserunt, perferendis. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Hic deserunt unde ratione odio temporibus officiis, nemo. Aperiam commodi, sapiente cul totam!', CAST(N'2018-04-30T22:19:33.173' AS DateTime), 3, 6)
INSERT [dbo].[CommentPost] ([Id], [Content], [Dates], [Post_Id], [Users_Id]) VALUES (3, N'Sed vitae arcu nec nibh egestas ultrices Lorem ipsum dolor sit amet, consectetur adipisicing elit. Provident aliquid porro a velit doloribus nobis cum sint beatae neque iusto molestias fuga, eaque vero natus maxime quam sunt optio praesentium. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Adipisci maxime beatae aut deleniti sapiente explicabo velit dolorem suscipit nesciunt non.', CAST(N'2018-04-30T22:20:05.590' AS DateTime), 2, 6)
SET IDENTITY_INSERT [dbo].[CommentPost] OFF
SET IDENTITY_INSERT [dbo].[Contact_Adress] ON 

INSERT [dbo].[Contact_Adress] ([Id], [Adress], [First_Email], [Second_Email], [First_Number], [Second_Number]) VALUES (1, N'Adress no. 29, Some Street, Some Country', N'spam.gives@mail.com', N'spam.gives@mail.com', N'40712345678', N'40712345876')
SET IDENTITY_INSERT [dbo].[Contact_Adress] OFF
SET IDENTITY_INSERT [dbo].[Contact_Map] ON 

INSERT [dbo].[Contact_Map] ([Id], [Map_Location]) VALUES (1, N'45.29089379943499,-97.04930264577251')
SET IDENTITY_INSERT [dbo].[Contact_Map] OFF
SET IDENTITY_INSERT [dbo].[Contact_Masking] ON 

INSERT [dbo].[Contact_Masking] ([Id], [Title], [Text_First], [Text_Second], [Image]) VALUES (1, N'Contact', N'Home', N'Contact', N'2018_4_20_16_28_11_750back3.jpg')
SET IDENTITY_INSERT [dbo].[Contact_Masking] OFF
SET IDENTITY_INSERT [dbo].[Feature] ON 

INSERT [dbo].[Feature] ([Id], [Title], [Content], [Information], [Fa_Icon], [Style]) VALUES (1, N'Food Delivering', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiam', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiamLorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiamLorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiamLorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiamLorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiamLorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiamLorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiamLorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiamLorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiamLorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiamLorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiamLorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiamLorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiamLorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiamLorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiamLorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiamLorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiamLorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiamLorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiamLorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiamLorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiamLorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiamLorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiamLorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiam', N'fa-handshake-o', N'none')
INSERT [dbo].[Feature] ([Id], [Title], [Content], [Information], [Fa_Icon], [Style]) VALUES (2, N'Aids For Health', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiam', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiamLorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiamLorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiamLorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiamLorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiamLorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiamLorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiamLorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiamLorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiamLorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiamLorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiamLorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiamLorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiamLorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiamLorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiamLorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiamLorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiamLorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiamLorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiamLorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiamLorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiamLorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiamLorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiamLorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiam', N'fa-medkit', N'priory-feature')
INSERT [dbo].[Feature] ([Id], [Title], [Content], [Information], [Fa_Icon], [Style]) VALUES (3, N'Build Education', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiam', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiamLorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiamLorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiamLorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiamLorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiamLorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiamLorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiamLorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiamLorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiamLorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiamLorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiamLorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiamLorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiamLorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiamLorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiamLorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiamLorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiamLorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiamLorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiamLorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiamLorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiamLorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiamLorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiamLorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiam', N'fa-book', N'none')
SET IDENTITY_INSERT [dbo].[Feature] OFF
SET IDENTITY_INSERT [dbo].[Footer] ON 

INSERT [dbo].[Footer] ([Id], [Twitter], [Google], [Facebook], [LInkedin], [Scype]) VALUES (1, N'https://twitter.com', N'https://www.google.com', N'https://www.facebook.com', N'https://www.linkedin.com', N'https://www.skype.com')
SET IDENTITY_INSERT [dbo].[Footer] OFF
SET IDENTITY_INSERT [dbo].[Gallery_Images] ON 

INSERT [dbo].[Gallery_Images] ([Id], [Image], [Width]) VALUES (1, N'2018_4_8_22_23_4_0img-13.jpg', N'width-50')
INSERT [dbo].[Gallery_Images] ([Id], [Image], [Width]) VALUES (2, N'2018_4_8_22_23_9_508img-14.jpg', N'width-25')
INSERT [dbo].[Gallery_Images] ([Id], [Image], [Width]) VALUES (3, N'2018_4_8_22_23_15_108img-15.jpg', N'width-25')
INSERT [dbo].[Gallery_Images] ([Id], [Image], [Width]) VALUES (4, N'2018_4_8_22_23_25_97img-16.jpg', N'width-25')
INSERT [dbo].[Gallery_Images] ([Id], [Image], [Width]) VALUES (5, N'2018_4_8_22_23_30_912img-17.jpg', N'width-25')
INSERT [dbo].[Gallery_Images] ([Id], [Image], [Width]) VALUES (6, N'2018_4_8_22_23_37_658img-18.jpg', N'width-50')
SET IDENTITY_INSERT [dbo].[Gallery_Images] OFF
SET IDENTITY_INSERT [dbo].[Gallery_Masking] ON 

INSERT [dbo].[Gallery_Masking] ([Id], [Title], [Text_First], [Text_Second], [Image]) VALUES (1, N'Gallery', N'Home', N'Galery', N'2018_4_8_22_40_18_379back3.jpg')
SET IDENTITY_INSERT [dbo].[Gallery_Masking] OFF
SET IDENTITY_INSERT [dbo].[Home_Cause] ON 

INSERT [dbo].[Home_Cause] ([Id], [Title], [Title2], [Content], [First_Price], [Second_Price], [Image], [Progress]) VALUES (1, N'SPECIAL CAUSE RIGHT NOW', N'Giving Clean Drinking Water', N'Lorem Ipsum is simply dummy text of the printing type industry. Our Ipsum has been the industry''s standard dummy text ever the 1500 when unknown printer took galley homero untouched.', CAST(7870 AS Decimal(18, 0)), CAST(10299 AS Decimal(18, 0)), N'2018_4_6_18_6_59_736featured-image-1.jpg', CAST(100 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Home_Cause] OFF
SET IDENTITY_INSERT [dbo].[Home_Gallery] ON 

INSERT [dbo].[Home_Gallery] ([Id], [Image]) VALUES (1, N'2018_4_12_18_10_53_346img-1.jpg')
INSERT [dbo].[Home_Gallery] ([Id], [Image]) VALUES (2, N'2018_4_5_17_49_28_451img-7.jpg')
INSERT [dbo].[Home_Gallery] ([Id], [Image]) VALUES (3, N'2018_4_5_17_49_34_870img-8.jpg')
INSERT [dbo].[Home_Gallery] ([Id], [Image]) VALUES (4, N'2018_4_5_17_49_41_185img-9.jpg')
INSERT [dbo].[Home_Gallery] ([Id], [Image]) VALUES (5, N'2018_4_12_18_4_32_3551507907741732.jpg')
INSERT [dbo].[Home_Gallery] ([Id], [Image]) VALUES (6, N'2018_4_5_17_50_0_251img-7.jpg')
SET IDENTITY_INSERT [dbo].[Home_Gallery] OFF
SET IDENTITY_INSERT [dbo].[Home_Need] ON 

INSERT [dbo].[Home_Need] ([Id], [Title], [Image], [Content]) VALUES (1, N'WE NEED VOLUNTEERS', N'2018_4_5_17_15_49_431back2.jpg', N'Nullam turpis mauris, egestas sed rutrum quis, egestas quis diam. Morbi at congue justo, a co. Fusce eget ante volutpat, rutrum orci non, scelerisque enim. Fusce eget nibh ornare, fringillolvenenatis eros. Nulla laoreet sagittis est, quis dapibus justo malesuada sed.')
SET IDENTITY_INSERT [dbo].[Home_Need] OFF
SET IDENTITY_INSERT [dbo].[Home_Recent] ON 

INSERT [dbo].[Home_Recent] ([Id], [Title1], [Title2], [Recent_Title], [Recent_Content], [First_Price], [Second_Price], [Progres], [Image], [Status], [Status3]) VALUES (1, N'RECENT CAUSE', N'Your little support can bring smile of there', N'Stop Chilldern Abuse', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Assumenda consectetur deleniti fuga ear', CAST(12500 AS Decimal(18, 0)), CAST(45222 AS Decimal(18, 0)), CAST(55 AS Decimal(18, 0)), N'2018_4_5_16_50_48_367img-1.jpg', 1, 0)
INSERT [dbo].[Home_Recent] ([Id], [Title1], [Title2], [Recent_Title], [Recent_Content], [First_Price], [Second_Price], [Progres], [Image], [Status], [Status3]) VALUES (2, N'RECENT CAUSE', N'Your little support can bring smile of there', N'Don''t Hurt Me, Please!', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Assumenda consectetur deleniti fuga ear', CAST(14589 AS Decimal(18, 0)), CAST(32569 AS Decimal(18, 0)), CAST(35 AS Decimal(18, 0)), N'2018_4_5_15_28_45_297img-3.jpg', 1, 0)
INSERT [dbo].[Home_Recent] ([Id], [Title1], [Title2], [Recent_Title], [Recent_Content], [First_Price], [Second_Price], [Progres], [Image], [Status], [Status3]) VALUES (3, N'RECENT CAUSE', N'Your little support can bring smile of there', N'A Better Life for Disabled', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Assumenda consectetur deleniti fuga ear', CAST(58963 AS Decimal(18, 0)), CAST(78558 AS Decimal(18, 0)), CAST(85 AS Decimal(18, 0)), N'2018_4_5_15_29_22_705img-1.jpg', 1, 0)
INSERT [dbo].[Home_Recent] ([Id], [Title1], [Title2], [Recent_Title], [Recent_Content], [First_Price], [Second_Price], [Progres], [Image], [Status], [Status3]) VALUES (7, NULL, NULL, N'Stop Chilldern Abuse', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Assumenda consectetur deleniti fuga ear', CAST(10000 AS Decimal(18, 0)), CAST(20000 AS Decimal(18, 0)), CAST(50 AS Decimal(18, 0)), N'2018_4_6_18_10_49_711img-9.jpg', NULL, 0)
INSERT [dbo].[Home_Recent] ([Id], [Title1], [Title2], [Recent_Title], [Recent_Content], [First_Price], [Second_Price], [Progres], [Image], [Status], [Status3]) VALUES (8, NULL, NULL, N'Don''t Hurt Me, Please!', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Assumenda consectetur deleniti fuga ear', CAST(12000 AS Decimal(18, 0)), CAST(12000 AS Decimal(18, 0)), CAST(52 AS Decimal(18, 0)), N'2018_4_6_18_11_34_697img-8.jpg', NULL, 0)
INSERT [dbo].[Home_Recent] ([Id], [Title1], [Title2], [Recent_Title], [Recent_Content], [First_Price], [Second_Price], [Progres], [Image], [Status], [Status3]) VALUES (9, NULL, NULL, N'A Better Life for Disabled', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Assumenda consectetur deleniti fuga ear', CAST(5000 AS Decimal(18, 0)), CAST(10000 AS Decimal(18, 0)), CAST(60 AS Decimal(18, 0)), N'2018_4_6_18_12_12_691img-5.jpg', NULL, 0)
SET IDENTITY_INSERT [dbo].[Home_Recent] OFF
SET IDENTITY_INSERT [dbo].[Home_Slider] ON 

INSERT [dbo].[Home_Slider] ([Id], [Title], [Content], [Image], [Content2]) VALUES (1, N'Gives & Humanity', N'Lorem ipsum dolor sit amet consecte tur adipiscing titor sit amet consecte tur adipiscing titor', N'2018_4_4_20_12_32_112s1.jpg', N'a accumsan justo laoreetsit amet consecte tur adipiscing titor')
INSERT [dbo].[Home_Slider] ([Id], [Title], [Content], [Image], [Content2]) VALUES (2, N'Gives & Humanity', N'Lorem ipsum dolor sit amet consecte tur adipiscing titor sit amet consecte tur adipiscing titor', N'2018_4_4_20_11_43_203s2.jpg', N'a accumsan justo laoreetsit amet consecte tur adipiscing titor')
INSERT [dbo].[Home_Slider] ([Id], [Title], [Content], [Image], [Content2]) VALUES (3, N'Gives & Humanity', N'Lorem ipsum dolor sit amet consecte tur adipiscing titor sit amet consecte tur adipiscing titor', N'2018_4_4_17_16_37_909s3.jpg', N'a accumsan justo laoreetsit amet consecte tur adipiscing titor')
SET IDENTITY_INSERT [dbo].[Home_Slider] OFF
SET IDENTITY_INSERT [dbo].[Home_Volunteer] ON 

INSERT [dbo].[Home_Volunteer] ([Id], [Title1], [Title2], [Amount], [Fullname], [Content], [Image], [Twitter], [Facebook], [Youtube], [Information], [Status], [Status2], [Status3]) VALUES (1, NULL, NULL, N'Cheif Director', N'JONATHAN GREG', N'Lorem Jonathan Greg ipsum dolor sit amet, consectetur adipiscing elit, sed Jonathan Greg do...', N'2018_4_5_16_43_56_228best-volunte-1.jpg', N'https://twitter.com/', N'https://www.facebook.com/', N'https://www.youtube.com/', N'Lorem Jonathan Greg ipsum dolor sit amet, consectetur adipiscing elit, sed Jonathan Greg do...	Lorem Jonathan Greg ipsum dolor sit amet, consectetur adipiscing elit, sed Jonathan Greg do...	Lorem Jonathan Greg ipsum dolor sit amet, consectetur adipiscing elit, sed Jonathan Greg do...	Lorem Jonathan Greg ipsum dolor sit amet, consectetur adipiscing elit, sed Jonathan Greg do...	Lorem Jonathan Greg ipsum dolor sit amet, consectetur adipiscing elit, sed Jonathan Greg do...	Lorem Jonathan Greg ipsum dolor sit amet, consectetur adipiscing elit, sed Jonathan Greg do...	Lorem Jonathan Greg ipsum dolor sit amet, consectetur adipiscing elit, sed Jonathan Greg do...	Lorem Jonathan Greg ipsum dolor sit amet, consectetur adipiscing elit, sed Jonathan Greg do...	Lorem Jonathan Greg ipsum dolor sit amet, consectetur adipiscing elit, sed Jonathan Greg do...	Lorem Jonathan Greg ipsum dolor sit amet, consectetur adipiscing elit, sed Jonathan Greg do...	Lorem Jonathan Greg ipsum dolor sit amet, consectetur adipiscing elit, sed Jonathan Greg do...	Lorem Jonathan Greg ipsum dolor sit amet, consectetur adipiscing elit, sed Jonathan Greg do...	Lorem Jonathan Greg ipsum dolor sit amet, consectetur adipiscing elit, sed Jonathan Greg do...	Lorem Jonathan Greg ipsum dolor sit amet, consectetur adipiscing elit, sed Jonathan Greg do...	Lorem Jonathan Greg ipsum dolor sit amet, consectetur adipiscing elit, sed Jonathan Greg do...	Lorem Jonathan Greg ipsum dolor sit amet, consectetur adipiscing elit, sed Jonathan Greg do...	Lorem Jonathan Greg ipsum dolor sit amet, consectetur adipiscing elit, sed Jonathan Greg do...	Lorem Jonathan Greg ipsum dolor sit amet, consectetur adipiscing elit, sed Jonathan Greg do...	', 1, 1, 0)
INSERT [dbo].[Home_Volunteer] ([Id], [Title1], [Title2], [Amount], [Fullname], [Content], [Image], [Twitter], [Facebook], [Youtube], [Information], [Status], [Status2], [Status3]) VALUES (2, NULL, NULL, N'Cheif Volunteer', N'JENNIFIER KALVIN', N'Lorem Jonathan Greg ipsum dolor sit amet, consectetur adipiscing elit, sed Jonathan Greg do...', N'2018_4_5_16_40_20_669best-volunte-2.jpg', N'https://twitter.com/', N'https://www.facebook.com/', N'https://www.youtube.com/', N'Lorem Jonathan Greg ipsum dolor sit amet, consectetur adipiscing elit, sed Jonathan Greg do...', 1, 1, 0)
INSERT [dbo].[Home_Volunteer] ([Id], [Title1], [Title2], [Amount], [Fullname], [Content], [Image], [Twitter], [Facebook], [Youtube], [Information], [Status], [Status2], [Status3]) VALUES (3, NULL, NULL, N'Cheif Director', N'MIKEL WILLSON', N'Lorem Jonathan Greg ipsum dolor sit amet, consectetur adipiscing elit, sed Jonathan Greg do...', N'2018_4_5_16_40_27_278best-volunte-3.jpg', N'https://twitter.com/', N'https://www.facebook.com/', N'https://www.youtube.com/', N'Lorem Jonathan Greg ipsum dolor sit amet, consectetur adipiscing elit, sed Jonathan Greg do...', 1, 1, 0)
INSERT [dbo].[Home_Volunteer] ([Id], [Title1], [Title2], [Amount], [Fullname], [Content], [Image], [Twitter], [Facebook], [Youtube], [Information], [Status], [Status2], [Status3]) VALUES (15, NULL, NULL, N'Cheif Director', N'JONATHAN GREG', N'Lorem Jonathan Greg ipsum dolor sit amet, consectetur adipiscing elit, sed Jonathan Greg do...', N'2018_4_9_17_13_55_86best-volunte-1.jpg', N'https://twitter.com/', N'https://www.facebook.com/', N'https://www.youtube.com/', N'Lorem Jonathan Greg ipsum dolor sit amet, consectetur adipiscing elit, sed Jonathan Greg do...', NULL, NULL, 0)
INSERT [dbo].[Home_Volunteer] ([Id], [Title1], [Title2], [Amount], [Fullname], [Content], [Image], [Twitter], [Facebook], [Youtube], [Information], [Status], [Status2], [Status3]) VALUES (16, NULL, NULL, N'Cheif Director', N'JONATHAN GREG	', N'Lorem Jonathan Greg ipsum dolor sit amet, consectetur adipiscing elit, sed Jonathan Greg do...', N'2018_4_9_17_16_31_278best-volunte-2.jpg', N'https://twitter.com/', N'https://www.facebook.com/', N'https://www.youtube.com/', N'Lorem Jonathan Greg ipsum dolor sit amet, consectetur adipiscing elit, sed Jonathan Greg do...', NULL, NULL, 0)
INSERT [dbo].[Home_Volunteer] ([Id], [Title1], [Title2], [Amount], [Fullname], [Content], [Image], [Twitter], [Facebook], [Youtube], [Information], [Status], [Status2], [Status3]) VALUES (17, NULL, NULL, N'Cheif Director', N'JENNIFIER KALVIN', N'Lorem Jonathan Greg ipsum dolor sit amet, consectetur adipiscing elit, sed Jonathan Greg do...', N'2018_4_9_17_16_42_384best-volunte-3.jpg', N'https://twitter.com/', N'https://www.facebook.com/', N'https://www.youtube.com/', N'orem Jonathan Greg ipsum dolor sit amet, consectetur adipiscing elit, sed Jonathan Greg do...', NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[Home_Volunteer] OFF
SET IDENTITY_INSERT [dbo].[Home_Work_Us] ON 

INSERT [dbo].[Home_Work_Us] ([Id], [Title], [Title2], [Image]) VALUES (1, N'Give a little & change a lot.', N'LET’S WORK TOGATHER!!', N'2018_4_5_16_4_57_90back1.jpg')
SET IDENTITY_INSERT [dbo].[Home_Work_Us] OFF
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([Id], [Title], [Dates], [Content], [First_Content], [Second_Content], [States], [Status], [Image]) VALUES (1013, N'Helping kids Grow up Stronger', CAST(N'2018-04-17T00:00:00.000' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Necessitatibus sapiente deleniti commodi provident veniam vitae blanditiis rerum temporibus totam est, omnis sint excepturi maiores iure similique.', N'Etiam at consectetur nisl. Donec rutrum volutpat turpis ac lobortis. Fusce sit amet orci ante. Duis faucibus interdumd. Mauris tempor sem at venenatis sagittis. Fusce vel maximus diam. Praesent ut vehicula eros. Nunc quis egestas turpis. Sed posuere unc at dui tempus maximus. In fringilla dui in eros blandit, ac pulvinar magna dapibus. Nunc in nisi id tellus placerat consectetur ac tincidunt turpis. Pellentesque ut metus lacus. Mauris non velit vulputate lorem scelerisque rutrum non tristique leo. Sed vitae arcu nec nibh egestas ultrices

Lorem ipsum dolor sit amet, consectetur adipisicing elit. Provident aliquid porro a velit doloribus nobis cum sint beatae neque iusto molestias fuga, eaque vero natus maxime quam sunt optio praesentium. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Adipisci maxime beatae aut deleniti sapiente explicabo velit dolorem suscipit nesciunt non.', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus dolorem, non omnis. Beatae quibusdam aperiam modi ut sed perspiciatis, quo doloremque in facilis eveniet porro inventore explicabo obcaecati. Aperiam ad nemo fugit in minima officiis accusantium aspernatur nobis, itaque incidunt ullam, laborum atque est ipsum ab voluptatibus quae inventore placeat voluptatum quo quia cum cumque cupiditate suscipit! Architecto voluptates blanditiis dignissimos fugit mollitia. Deserunt, perferendis.', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Hic deserunt unde ratione odio temporibus officiis, nemo. Aperiam commodi, sapiente cul totam!', 0, N'2018_4_17_14_15_33_796img-9.jpg')
INSERT [dbo].[News] ([Id], [Title], [Dates], [Content], [First_Content], [Second_Content], [States], [Status], [Image]) VALUES (1014, N'Helping kids Grow up Stronger', CAST(N'2018-04-16T00:00:00.000' AS DateTime), N'Etiam at consectetur nisl. Donec rutrum volutpat turpis ac lobortis. Fusce sit amet orci ante. Duis faucibus interdumd. Mauris tempor sem at venenatis sagittis. Fusce vel maximus diam.', N'Etiam at consectetur nisl. Donec rutrum volutpat turpis ac lobortis. Fusce sit amet orci ante. Duis faucibus interdumd. Mauris tempor sem at venenatis sagittis. Fusce vel maximus diam. Praesent ut vehicula eros. Nunc quis egestas turpis. Sed posuere unc at dui tempus maximus. In fringilla dui in eros blandit, ac pulvinar magna dapibus. Nunc in nisi id tellus placerat consectetur ac tincidunt turpis. Pellentesque ut metus lacus. Mauris non velit vulputate lorem scelerisque rutrum non tristique leo. Sed vitae arcu nec nibh egestas ultrices

Lorem ipsum dolor sit amet, consectetur adipisicing elit. Provident aliquid porro a velit doloribus nobis cum sint beatae neque iusto molestias fuga, eaque vero natus maxime quam sunt optio praesentium. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Adipisci maxime beatae aut deleniti sapiente explicabo velit dolorem suscipit nesciunt non.', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus dolorem, non omnis. Beatae quibusdam aperiam modi ut sed perspiciatis, quo doloremque in facilis eveniet porro inventore explicabo obcaecati. Aperiam ad nemo fugit in minima officiis accusantium aspernatur nobis, itaque incidunt ullam, laborum atque est ipsum ab voluptatibus quae inventore placeat voluptatum quo quia cum cumque cupiditate suscipit! Architecto voluptates blanditiis dignissimos fugit mollitia. Deserunt, perferendis.', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Hic deserunt unde ratione odio temporibus officiis, nemo. Aperiam commodi, sapiente cul totam!', 0, N'2018_4_17_14_17_21_981img-11.jpg')
INSERT [dbo].[News] ([Id], [Title], [Dates], [Content], [First_Content], [Second_Content], [States], [Status], [Image]) VALUES (1015, N'Helping kids Grow up Stronger', CAST(N'2018-04-17T00:00:00.000' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Officia excepturi quae facere voluptate blanditiis, accusantium libero eaque nulla obcaecati quidem, aliquid quam magni perferendis .', N'Etiam at consectetur nisl. Donec rutrum volutpat turpis ac lobortis. Fusce sit amet orci ante. Duis faucibus interdumd. Mauris tempor sem at venenatis sagittis. Fusce vel maximus diam. Praesent ut vehicula eros. Nunc quis egestas turpis. Sed posuere unc at dui tempus maximus. In fringilla dui in eros blandit, ac pulvinar magna dapibus. Nunc in nisi id tellus placerat consectetur ac tincidunt turpis. Pellentesque ut metus lacus. Mauris non velit vulputate lorem scelerisque rutrum non tristique leo. Sed vitae arcu nec nibh egestas ultrices

Lorem ipsum dolor sit amet, consectetur adipisicing elit. Provident aliquid porro a velit doloribus nobis cum sint beatae neque iusto molestias fuga, eaque vero natus maxime quam sunt optio praesentium. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Adipisci maxime beatae aut deleniti sapiente explicabo velit dolorem suscipit nesciunt non.', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus dolorem, non omnis. Beatae quibusdam aperiam modi ut sed perspiciatis, quo doloremque in facilis eveniet porro inventore explicabo obcaecati. Aperiam ad nemo fugit in minima officiis accusantium aspernatur nobis, itaque incidunt ullam, laborum atque est ipsum ab voluptatibus quae inventore placeat voluptatum quo quia cum cumque cupiditate suscipit! Architecto voluptates blanditiis dignissimos fugit mollitia. Deserunt, perferendis.', N'orem ipsum dolor sit amet, consectetur adipisicing elit. Hic deserunt unde ratione odio temporibus officiis, nemo. Aperiam commodi, sapiente cul totam!', 0, N'2018_4_17_14_18_29_343img-10.jpg')
INSERT [dbo].[News] ([Id], [Title], [Dates], [Content], [First_Content], [Second_Content], [States], [Status], [Image]) VALUES (1016, N'Helping kids Grow up Stronger', CAST(N'2018-04-14T00:00:00.000' AS DateTime), N'Etiam at consectetur nisl. Donec rutrum volutpat turpis ac lobortis. Fusce sit amet orci ante. Duis faucibus interdumd. Mauris tempor sem at venenatis sagittis. Fusce vel maximus diam. ', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus dolorem, non omnis. Beatae quibusdam aperiam modi ut sed perspiciatis, quo doloremque in facilis eveniet porro inventore explicabo obcaecati. Aperiam ad nemo fugit in minima officiis accusantium aspernatur nobis, itaque incidunt ullam, laborum atque est ipsum ab voluptatibus quae inventore placeat voluptatum quo quia cum cumque cupiditate suscipit! Architecto voluptates blanditiis dignissimos fugit mollitia. Deserunt, perferendis.', N'Nunc vehicula eros.  Quis egestas turpis. Sed posuere unc at dui tempus maximus. In fringilla dui in eros blandit, ac pulvinar magna dapibus. Nunc in nisi id tellus placerat consectetur ac tincidunt turpis. Pellentesque ut metus lacus. Mauris non velit vulputate lorem scelerisque rutrum non tristique leo. Sed vitae arcu nec nibh egestas ultrices

Lorem ipsum dolor sit amet, consectetur adipisicing elit. Provident aliquid porro a velit doloribus nobis cum sint beatae neque iusto molestias fuga, eaque vero natus maxime quam sunt optio praesentium. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Adipisci maxime beatae aut deleniti sapiente explicabo velit dolorem suscipit nesciunt non.', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Hic deserunt unde ratione odio temporibus officiis, nemo. Aperiam commodi, sapiente cul totam!', 0, N'2018_4_17_14_20_17_970img-4.jpg')
INSERT [dbo].[News] ([Id], [Title], [Dates], [Content], [First_Content], [Second_Content], [States], [Status], [Image]) VALUES (1017, N'Helping kids Grow up Stronger', CAST(N'2018-04-17T00:00:00.000' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Doloremque nam, necessitatibus odio dignissimos nostrum unde iure veniam.', N'Etiam at consectetur nisl. Donec rutrum volutpat turpis ac lobortis. Fusce sit amet orci ante. Duis faucibus interdumd. Mauris tempor sem at venenatis sagittis. Fusce vel maximus diam. Praesent ut vehicula eros. Nunc quis egestas turpis. Sed posuere unc at dui tempus maximus. In fringilla dui in eros blandit, ac pulvinar magna dapibus. Nunc in nisi id tellus placerat consectetur ac tincidunt turpis. Pellentesque ut metus lacus. Mauris non velit vulputate lorem scelerisque rutrum non tristique leo. Sed vitae arcu nec nibh egestas ultrices

Lorem ipsum dolor sit amet, consectetur adipisicing elit. Provident aliquid porro a velit doloribus nobis cum sint beatae neque iusto molestias fuga, eaque vero natus maxime quam sunt optio praesentium. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Adipisci maxime beatae aut deleniti sapiente explicabo velit dolorem suscipit nesciunt non.', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Provident aliquid porro a velit doloribus nobis cum sint beatae neque iusto molestias fuga, eaque vero natus maxime quam sunt optio praesentium. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Adipisci maxime beatae aut deleniti sapiente explicabo velit dolorem suscipit nesciunt non.', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Provident aliquid porro a velit doloribus !', 0, N'2018_4_17_14_22_41_150img-5.jpg')
INSERT [dbo].[News] ([Id], [Title], [Dates], [Content], [First_Content], [Second_Content], [States], [Status], [Image]) VALUES (1018, N'Helping kids Grow up Stronger', CAST(N'2018-04-17T00:00:00.000' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Provident aliquid porro a velit doloribus nobis cum sint beatae neque iusto molestias fuga, eaque vero.', N'Etiam at consectetur nisl. Donec rutrum volutpat turpis ac lobortis. Fusce sit amet orci ante. Duis faucibus interdumd. Mauris tempor sem at venenatis sagittis. Fusce vel maximus diam. Praesent ut vehicula eros. Nunc quis egestas turpis. Sed posuere unc at dui tempus maximus. In fringilla dui in eros blandit, ac pulvinar magna dapibus. Nunc in nisi id tellus placerat consectetur ac tincidunt turpis. Pellentesque ut metus lacus. Mauris non velit vulputate lorem scelerisque rutrum non tristique leo. Sed vitae arcu nec nibh egestas ultrices

Lorem ipsum dolor sit amet, consectetur adipisicing elit. Provident aliquid porro a velit doloribus nobis cum sint beatae neque iusto molestias fuga, eaque vero natus maxime quam sunt optio praesentium. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Adipisci maxime beatae aut deleniti sapiente explicabo velit dolorem suscipit nesciunt non.', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Provident aliquid porro a velit doloribus nobis cum sint beatae neque iusto molestias fuga, eaque vero natus maxime quam sunt optio praesentium. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Adipisci maxime beatae aut deleniti sapiente explicabo velit dolorem suscipit nesciunt non.', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Provident aliquid porro a velit doloribus nobis cum sint beatae neque iusto molestias fuga.', 0, N'2018_4_17_14_24_0_652img-6.jpg')
SET IDENTITY_INSERT [dbo].[News] OFF
SET IDENTITY_INSERT [dbo].[News_To_Category] ON 

INSERT [dbo].[News_To_Category] ([Id], [News_Id], [Category_Id]) VALUES (1002, 1013, 2)
INSERT [dbo].[News_To_Category] ([Id], [News_Id], [Category_Id]) VALUES (1003, 1013, 4)
INSERT [dbo].[News_To_Category] ([Id], [News_Id], [Category_Id]) VALUES (1004, 1014, 1003)
INSERT [dbo].[News_To_Category] ([Id], [News_Id], [Category_Id]) VALUES (1005, 1014, 1006)
INSERT [dbo].[News_To_Category] ([Id], [News_Id], [Category_Id]) VALUES (1006, 1015, 5)
INSERT [dbo].[News_To_Category] ([Id], [News_Id], [Category_Id]) VALUES (1007, 1016, 6)
INSERT [dbo].[News_To_Category] ([Id], [News_Id], [Category_Id]) VALUES (1008, 1017, 1004)
INSERT [dbo].[News_To_Category] ([Id], [News_Id], [Category_Id]) VALUES (1009, 1018, 4)
INSERT [dbo].[News_To_Category] ([Id], [News_Id], [Category_Id]) VALUES (1010, 1018, 1002)
SET IDENTITY_INSERT [dbo].[News_To_Category] OFF
SET IDENTITY_INSERT [dbo].[PayPal_Donate] ON 

INSERT [dbo].[PayPal_Donate] ([Id], [Amount], [Card_Number]) VALUES (1, 150, 67657)
INSERT [dbo].[PayPal_Donate] ([Id], [Amount], [Card_Number]) VALUES (3, 50, 78797878)
INSERT [dbo].[PayPal_Donate] ([Id], [Amount], [Card_Number]) VALUES (4, 100, 44587545)
INSERT [dbo].[PayPal_Donate] ([Id], [Amount], [Card_Number]) VALUES (5, 100, 44587545)
INSERT [dbo].[PayPal_Donate] ([Id], [Amount], [Card_Number]) VALUES (6, 50, 1242424)
INSERT [dbo].[PayPal_Donate] ([Id], [Amount], [Card_Number]) VALUES (7, 50, 1242424)
INSERT [dbo].[PayPal_Donate] ([Id], [Amount], [Card_Number]) VALUES (8, 150, 5454545)
INSERT [dbo].[PayPal_Donate] ([Id], [Amount], [Card_Number]) VALUES (9, 150, 454545)
INSERT [dbo].[PayPal_Donate] ([Id], [Amount], [Card_Number]) VALUES (10, 150, 454545)
INSERT [dbo].[PayPal_Donate] ([Id], [Amount], [Card_Number]) VALUES (11, 150, 454545)
INSERT [dbo].[PayPal_Donate] ([Id], [Amount], [Card_Number]) VALUES (12, 150, 454545)
INSERT [dbo].[PayPal_Donate] ([Id], [Amount], [Card_Number]) VALUES (13, 150, 454545)
INSERT [dbo].[PayPal_Donate] ([Id], [Amount], [Card_Number]) VALUES (14, 150, 454545)
INSERT [dbo].[PayPal_Donate] ([Id], [Amount], [Card_Number]) VALUES (15, 150, 454545)
INSERT [dbo].[PayPal_Donate] ([Id], [Amount], [Card_Number]) VALUES (16, 150, 45545)
INSERT [dbo].[PayPal_Donate] ([Id], [Amount], [Card_Number]) VALUES (17, 150, 45545)
INSERT [dbo].[PayPal_Donate] ([Id], [Amount], [Card_Number]) VALUES (18, 150, 878787)
INSERT [dbo].[PayPal_Donate] ([Id], [Amount], [Card_Number]) VALUES (19, 100, 457857857)
INSERT [dbo].[PayPal_Donate] ([Id], [Amount], [Card_Number]) VALUES (20, 150, 454548578)
INSERT [dbo].[PayPal_Donate] ([Id], [Amount], [Card_Number]) VALUES (21, 50, 54544)
SET IDENTITY_INSERT [dbo].[PayPal_Donate] OFF
SET IDENTITY_INSERT [dbo].[Post] ON 

INSERT [dbo].[Post] ([Id], [Title], [Image], [Content], [Date], [Status]) VALUES (1, N'Samirs', N'2018_4_17_2_5_46_457img-5.jpg', N'Samirs', CAST(N'2018-04-17T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Post] ([Id], [Title], [Image], [Content], [Date], [Status]) VALUES (2, N'Help Them, Let’s Buy Them a Place To Live', N'2018_4_19_19_2_26_110img-18.jpg', N'Etiam at consectetur nisl. Donec rutrum volutpat turpis ac lobortis. Fusce sit amet orci ante. Duis faucibus interdumd. Mauris tempor sem at venenatis sagittis. Fusce vel maximus diam. Praesent ut vehicula eros. Nunc quis egestas turpis. Sed posuere unc at dui tempus maximus. In fringilla dui in eros blandit, ac pulvinar magna dapibus. Nunc in nisi id tellus placerat consectetur ac tincidunt turpis. Pellentesque ut metus lacus. Mauris non velit vulputate lorem scelerisque rutrum non tristique leo. Sed vitae arcu nec nibh egestas ultrices

Lorem ipsum dolor sit amet, consectetur adipisicing elit. Provident aliquid porro a velit doloribus nobis cum sint beatae neque iusto molestias fuga, eaque vero natus maxime quam sunt optio praesentium. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Adipisci maxime beatae aut deleniti sapiente explicabo velit dolorem suscipit nesciunt non.', CAST(N'2018-04-17T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Post] ([Id], [Title], [Image], [Content], [Date], [Status]) VALUES (3, N'Let''s Build Them a New School', N'2018_4_19_19_3_14_987img-4.jpg', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus dolorem, non omnis. Beatae quibusdam aperiam modi ut sed perspiciatis, quo doloremque in facilis eveniet porro inventore explicabo obcaecati. Aperiam ad nemo fugit in minima officiis accusantium aspernatur nobis, itaque incidunt ullam, laborum atque est ipsum ab voluptatibus quae inventore placeat voluptatum quo quia cum cumque cupiditate suscipit! Architecto voluptates blanditiis dignissimos fugit mollitia. Deserunt, perferendis.

Lorem ipsum dolor sit amet, consectetur adipisicing elit. Hic deserunt unde ratione odio temporibus officiis, nemo. Aperiam commodi, sapiente cul totam!', CAST(N'2018-04-19T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Post] ([Id], [Title], [Image], [Content], [Date], [Status]) VALUES (4, N'Helping kids Grow up Stronger', N'2018_4_19_19_4_51_851img-7.jpg', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eaque quas cum, culpa eum expedita soluta! Ipsum voluptatibus nesciunt tenetur, est vero culpa ipsam modi officia.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eaque quas cum, culpa eum expedita soluta! Ipsum voluptatibus nesciunt tenetur, est vero culpa ipsam modi officia.', CAST(N'2018-04-19T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Post] ([Id], [Title], [Image], [Content], [Date], [Status]) VALUES (5, N'Help Them, Let’s Buy Them a Place To Live', N'2018_4_19_19_5_45_870img-11.jpg', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus dolorem, non omnis. Beatae quibusdam aperiam modi ut sed perspiciatis, quo doloremque in facilis eveniet porro inventore explicabo obcaecati. Aperiam ad nemo fugit in minima officiis accusantium aspernatur nobis, itaque incidunt ullam, laborum atque est ipsum ab voluptatibus quae inventore placeat voluptatum quo quia cum cumque cupiditate suscipit! Architecto voluptates blanditiis dignissimos fugit mollitia. Deserunt, perferendis.', CAST(N'2018-04-19T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Post] ([Id], [Title], [Image], [Content], [Date], [Status]) VALUES (6, N'A Better Life for Disabled', N'2018_4_19_19_6_32_490img-10.jpg', N'Pellentesque ut metus lacus. Mauris non velit vulputate lorem scelerisque rutrum non tristique leo. Sed vitae arcu nec nibh egestas ultrices.

Lorem ipsum dolor sit amet, consectetur adipisicing elit. Provident aliquid porro a velit doloribus nobis cum sint beatae neque iusto molestias fuga, eaque vero natus maxime quam sunt optio praesentium. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Adipisci maxime beatae aut deleniti sapiente explicabo velit dolorem suscipit nesciunt non.', CAST(N'2018-04-19T00:00:00.000' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Post] OFF
SET IDENTITY_INSERT [dbo].[Post_To_Tag] ON 

INSERT [dbo].[Post_To_Tag] ([Id], [Post_Id], [Tag_Id]) VALUES (1, 1, 3)
INSERT [dbo].[Post_To_Tag] ([Id], [Post_Id], [Tag_Id]) VALUES (2, 2, 3)
INSERT [dbo].[Post_To_Tag] ([Id], [Post_Id], [Tag_Id]) VALUES (3, 2, 10)
INSERT [dbo].[Post_To_Tag] ([Id], [Post_Id], [Tag_Id]) VALUES (4, 2, 12)
INSERT [dbo].[Post_To_Tag] ([Id], [Post_Id], [Tag_Id]) VALUES (5, 3, 11)
INSERT [dbo].[Post_To_Tag] ([Id], [Post_Id], [Tag_Id]) VALUES (6, 4, 8)
INSERT [dbo].[Post_To_Tag] ([Id], [Post_Id], [Tag_Id]) VALUES (7, 4, 10)
INSERT [dbo].[Post_To_Tag] ([Id], [Post_Id], [Tag_Id]) VALUES (8, 5, 5)
INSERT [dbo].[Post_To_Tag] ([Id], [Post_Id], [Tag_Id]) VALUES (9, 6, 7)
SET IDENTITY_INSERT [dbo].[Post_To_Tag] OFF
SET IDENTITY_INSERT [dbo].[Tag] ON 

INSERT [dbo].[Tag] ([Id], [Name], [Status]) VALUES (3, N'Cause', 0)
INSERT [dbo].[Tag] ([Id], [Name], [Status]) VALUES (4, N'Lipsum', 0)
INSERT [dbo].[Tag] ([Id], [Name], [Status]) VALUES (5, N'Donation', 0)
INSERT [dbo].[Tag] ([Id], [Name], [Status]) VALUES (6, N'Charitable', 0)
INSERT [dbo].[Tag] ([Id], [Name], [Status]) VALUES (7, N'Homeless', 0)
INSERT [dbo].[Tag] ([Id], [Name], [Status]) VALUES (8, N'Blog', 0)
INSERT [dbo].[Tag] ([Id], [Name], [Status]) VALUES (9, N'Minimal', 0)
INSERT [dbo].[Tag] ([Id], [Name], [Status]) VALUES (10, N'Health', 0)
INSERT [dbo].[Tag] ([Id], [Name], [Status]) VALUES (11, N'Education', 0)
INSERT [dbo].[Tag] ([Id], [Name], [Status]) VALUES (12, N'LifStyle', 0)
SET IDENTITY_INSERT [dbo].[Tag] OFF
SET IDENTITY_INSERT [dbo].[User_Messages] ON 

INSERT [dbo].[User_Messages] ([Id], [Name], [Email], [Subjects], [Mesage], [Status]) VALUES (1016, N'Samir', N'samireh@code.edu.az', N'Donation', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Necessitatibus sapiente deleniti commodi provident veniam vitae blanditiis rerum temporibus totam est, omnis sint excepturi maiores iure similique.', 0)
INSERT [dbo].[User_Messages] ([Id], [Name], [Email], [Subjects], [Mesage], [Status]) VALUES (1017, N'Vaqif', N'vaqif@gmail.com', N'Medicine', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Necessitatibus sapiente deleniti commodi provident veniam vitae blanditiis rerum temporibus totam est, omnis sint excepturi maiores iure similique.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Necessitatibus sapiente deleniti commodi provident veniam vitae blanditiis rerum temporibus totam est, omnis sint excepturi maiores iure similique.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Necessitatibus sapiente deleniti commodi provident veniam vitae blanditiis rerum temporibus totam est, omnis sint excepturi maiores iure similique.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Necessitatibus sapiente deleniti commodi provident veniam vitae blanditiis rerum temporibus totam est, omnis sint excepturi maiores iure similique.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Necessitatibus sapiente deleniti commodi provident veniam vitae blanditiis rerum temporibus totam est, omnis sint excepturi maiores iure similique.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Necessitatibus sapiente deleniti commodi provident veniam vitae blanditiis rerum temporibus totam est, omnis sint excepturi maiores iure similique.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Necessitatibus sapiente deleniti commodi provident veniam vitae blanditiis rerum temporibus totam est, omnis sint excepturi maiores iure similique.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Necessitatibus sapiente deleniti commodi provident veniam vitae blanditiis rerum temporibus totam est, omnis sint excepturi maiores iure similique.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Necessitatibus sapiente deleniti commodi provident veniam vitae blanditiis rerum temporibus totam est, omnis sint excepturi maiores iure similique.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Necessitatibus sapiente deleniti commodi provident veniam vitae blanditiis rerum temporibus totam est, omnis sint excepturi maiores iure similique.', 1)
INSERT [dbo].[User_Messages] ([Id], [Name], [Email], [Subjects], [Mesage], [Status]) VALUES (1018, N'Vaqif', N'vaqif@gmail.com', N'Medicine', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Necessitatibus sapiente deleniti commodi provident veniam vitae blanditiis rerum temporibus totam est, omnis sint excepturi maiores iure similique.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Necessitatibus sapiente deleniti commodi provident veniam vitae blanditiis rerum temporibus totam est, omnis sint excepturi maiores iure similique.', 0)
SET IDENTITY_INSERT [dbo].[User_Messages] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Email], [Password], [Image], [Name], [Surname]) VALUES (2, N'samireh@code.az', N'ANyMqda5Ds1bA+1u0MZP4QhmZAAEB2r2lZrmsbKOOclH6OGXVU3eJrJdcx8u4sek7w==', N'2018_4_12_2_13_41_32921458005_1426876204092632_144713183967256214_o.jpg', N'Samir', N'Hesenov')
INSERT [dbo].[Users] ([Id], [Email], [Password], [Image], [Name], [Surname]) VALUES (4, N'mamed@code.az', N'AHJ2SylCkCzf36jL2d1e7Ec8t6DtL9qZ6ypt9NhNj90bMU2klQQzkvzywvBA8djJqw==', N'2018_4_12_1_42_0_359Снимок экрана (17).png', N'Mamed', N'Kerimli')
INSERT [dbo].[Users] ([Id], [Email], [Password], [Image], [Name], [Surname]) VALUES (6, N'samir@gmail.com', N'AMJLvRzGAHqsTOcUP84E8xZjfSK3ManJ+BiMgj+pG+e7MwrjGQ7AXzHXIN4KtEmr6A==', N'2018_4_12_3_8_9_951963fa763-79dc-4775-bf9c-a29285f72be6.jpg', N'Самир', N'Гасанов')
INSERT [dbo].[Users] ([Id], [Email], [Password], [Image], [Name], [Surname]) VALUES (7, N'asif@gmail.com', N'ANjJZ9jUNwKzdAKtVokYMrlBvGSqASe9aVdNm11QjUC4jymO7PvfveaxmRLvus7AUA==', N'2018_4_13_1_25_22_571single-cause.jpg', N'Asif', N'Suleymanov')
SET IDENTITY_INSERT [dbo].[Users] OFF
SET IDENTITY_INSERT [dbo].[Visa_Master_Donate] ON 

INSERT [dbo].[Visa_Master_Donate] ([Id], [Firstname], [Lastname], [Amount], [Pay_Type], [Card_Type], [Card_Number], [Card_CVC], [Date]) VALUES (3, N'Samir', N'Hasanov', N'150', N'one-time', N'Master Card', 78787878, 78787878, N'20.11')
INSERT [dbo].[Visa_Master_Donate] ([Id], [Firstname], [Lastname], [Amount], [Pay_Type], [Card_Type], [Card_Number], [Card_CVC], [Date]) VALUES (7, N'Vuqar', N'Abrahamov', N'100', N'one-time', N'Master Card', 44587545, 54545, N'2018')
INSERT [dbo].[Visa_Master_Donate] ([Id], [Firstname], [Lastname], [Amount], [Pay_Type], [Card_Type], [Card_Number], [Card_CVC], [Date]) VALUES (8, N'Vuqar', N'Abrahamov', N'100', N'one-time', N'Master Card', 44587545, 54545, N'2018')
INSERT [dbo].[Visa_Master_Donate] ([Id], [Firstname], [Lastname], [Amount], [Pay_Type], [Card_Type], [Card_Number], [Card_CVC], [Date]) VALUES (9, N'Elgun', N'Akberov', N'100', N'monthly', N'Master Card', 457857857, 4545457, N'20/12')
INSERT [dbo].[Visa_Master_Donate] ([Id], [Firstname], [Lastname], [Amount], [Pay_Type], [Card_Type], [Card_Number], [Card_CVC], [Date]) VALUES (10, N'Олег', N'Тиньков', N'50', N'yearly', N'Visa', 54544, 6546464, N'08/10')
SET IDENTITY_INSERT [dbo].[Visa_Master_Donate] OFF
ALTER TABLE [dbo].[About_Partners] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Become_Volunteer] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Category] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Home_Recent] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Home_Recent] ADD  DEFAULT ((1)) FOR [Status3]
GO
ALTER TABLE [dbo].[Home_Volunteer] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Home_Volunteer] ADD  DEFAULT ((1)) FOR [Status2]
GO
ALTER TABLE [dbo].[Home_Volunteer] ADD  DEFAULT ((1)) FOR [Status3]
GO
ALTER TABLE [dbo].[News] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Post] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Tag] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[User_Messages] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[CommentNews]  WITH CHECK ADD FOREIGN KEY([News_Id])
REFERENCES [dbo].[News] ([Id])
GO
ALTER TABLE [dbo].[CommentNews]  WITH CHECK ADD FOREIGN KEY([Users_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[CommentPost]  WITH CHECK ADD FOREIGN KEY([Post_Id])
REFERENCES [dbo].[Post] ([Id])
GO
ALTER TABLE [dbo].[CommentPost]  WITH CHECK ADD FOREIGN KEY([Users_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[News_To_Category]  WITH CHECK ADD FOREIGN KEY([Category_Id])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[News_To_Category]  WITH CHECK ADD FOREIGN KEY([News_Id])
REFERENCES [dbo].[News] ([Id])
GO
ALTER TABLE [dbo].[Post_To_Tag]  WITH CHECK ADD FOREIGN KEY([Post_Id])
REFERENCES [dbo].[Post] ([Id])
GO
ALTER TABLE [dbo].[Post_To_Tag]  WITH CHECK ADD FOREIGN KEY([Tag_Id])
REFERENCES [dbo].[Tag] ([Id])
GO
USE [master]
GO
ALTER DATABASE [Gives] SET  READ_WRITE 
GO
