USE [master]
GO
/****** Object:  Database [muledemo]    Script Date: 23/11/2012 07:03:03 p.m. ******/
CREATE DATABASE [muledemo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'muledemo', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\muledemo.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'muledemo_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\muledemo_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [muledemo] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [muledemo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [muledemo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [muledemo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [muledemo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [muledemo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [muledemo] SET ARITHABORT OFF 
GO
ALTER DATABASE [muledemo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [muledemo] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [muledemo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [muledemo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [muledemo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [muledemo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [muledemo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [muledemo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [muledemo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [muledemo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [muledemo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [muledemo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [muledemo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [muledemo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [muledemo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [muledemo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [muledemo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [muledemo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [muledemo] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [muledemo] SET  MULTI_USER 
GO
ALTER DATABASE [muledemo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [muledemo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [muledemo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [muledemo] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [muledemo]
GO
/****** Object:  StoredProcedure [dbo].[sp_createOrder]    Script Date: 23/11/2012 07:03:03 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_createOrder] 
	-- Add the parameters for the stored procedure here
	@customerName VARCHAR(100),
	@customerAddress VARCHAR(100),
	@customerEmail VARCHAR(100),
	@customerNumber VARCHAR(100),
	@orderDetails VARCHAR(255),
	@orderId BIGINT OUTPUT
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO orders 
		(customerName, customerAddress, customerEmail, customerNumber, orderDetails, orderStatus) 
		VALUES 
		(@customerName, @customerAddress, @customerEmail, @customerNumber, @orderDetails, 'Pending confirmation');

	SELECT @orderId = @@IDENTITY;	
END

GO
/****** Object:  Table [dbo].[orders]    Script Date: 23/11/2012 07:03:03 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[orders](
	[orderId] [bigint] IDENTITY(1,1) NOT NULL,
	[customerName] [varchar](100) NULL,
	[customerAddress] [varchar](100) NULL,
	[customerEmail] [varchar](100) NULL,
	[customerNumber] [varchar](100) NULL,
	[orderDetails] [varchar](255) NULL,
	[orderStatus] [varchar](100) NULL,
 CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED 
(
	[orderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
USE [master]
GO
ALTER DATABASE [muledemo] SET  READ_WRITE 
GO
