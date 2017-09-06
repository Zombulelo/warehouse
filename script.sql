USE [master]
GO
/****** Object:  Database [WareHouseStore]    Script Date: 9/6/2017 11:53:19 AM ******/
CREATE DATABASE [WareHouseStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WareHouseStore', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.MSSQLSERVER1\MSSQL\DATA\WareHouseStore.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'WareHouseStore_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.MSSQLSERVER1\MSSQL\DATA\WareHouseStore_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [WareHouseStore] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WareHouseStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WareHouseStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WareHouseStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WareHouseStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WareHouseStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WareHouseStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [WareHouseStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WareHouseStore] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [WareHouseStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WareHouseStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WareHouseStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WareHouseStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WareHouseStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WareHouseStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WareHouseStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WareHouseStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WareHouseStore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WareHouseStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WareHouseStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WareHouseStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WareHouseStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WareHouseStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WareHouseStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WareHouseStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WareHouseStore] SET RECOVERY FULL 
GO
ALTER DATABASE [WareHouseStore] SET  MULTI_USER 
GO
ALTER DATABASE [WareHouseStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WareHouseStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WareHouseStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WareHouseStore] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'WareHouseStore', N'ON'
GO
USE [WareHouseStore]
GO
/****** Object:  Table [dbo].[BackEndStatus]    Script Date: 9/6/2017 11:53:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BackEndStatus](
	[BackEndStatusId] [int] NOT NULL,
	[BackEndStatusName] [varchar](max) NOT NULL,
 CONSTRAINT [PK_BackEndStatus] PRIMARY KEY CLUSTERED 
(
	[BackEndStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ClientStatuses]    Script Date: 9/6/2017 11:53:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ClientStatuses](
	[ClientStatusId] [int] NOT NULL,
	[ClientStatusName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ClientStatuses] PRIMARY KEY CLUSTERED 
(
	[ClientStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Order]    Script Date: 9/6/2017 11:53:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[CardID] [int] NULL,
	[OrderPrice] [money] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[ClientStatusId] [int] NOT NULL,
	[BackEndStatusId] [int] NOT NULL,
	[UserId] [int] NULL,
	[ProductTypeId] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 9/6/2017 11:53:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductTypeId] [int] NOT NULL,
	[Date] [datetime] NULL,
	[Description] [varchar](max) NOT NULL,
	[Price] [money] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Image64String] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductCard]    Script Date: 9/6/2017 11:53:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductCard](
	[CardId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[ProductTypeId] [int] NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[UserId] [int] NOT NULL,
	[Quantity] [int] NULL,
	[isRemoved] [varchar](5) NULL,
	[isRemovedDate] [datetime] NULL,
 CONSTRAINT [PK_ProductCard] PRIMARY KEY CLUSTERED 
(
	[CardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 9/6/2017 11:53:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductType](
	[productTypeId] [int] NOT NULL,
	[productCategory] [varchar](max) NOT NULL,
	[productTypeName] [varchar](max) NOT NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[productTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 9/6/2017 11:53:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[userId] [int] IDENTITY(1,1) NOT NULL,
	[firstName] [varchar](50) NOT NULL,
	[lastName] [varchar](50) NOT NULL,
	[emailAdress] [varchar](50) NOT NULL,
	[Adress] [varchar](50) NOT NULL,
	[contactNumber] [varchar](50) NULL,
	[authenticationLevel] [varchar](1) NOT NULL,
	[password] [varchar](max) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
USE [master]
GO
ALTER DATABASE [WareHouseStore] SET  READ_WRITE 
GO
