USE [TransactionDB]
GO
ALTER TABLE [dbo].[Transactions] DROP CONSTRAINT [FK_Transactions_Categories_CategoryId]
GO
/****** Object:  Index [IX_Transactions_CategoryId]    Script Date: 8/8/2022 8:36:44 PM ******/
DROP INDEX [IX_Transactions_CategoryId] ON [dbo].[Transactions]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 8/8/2022 8:36:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Transactions]') AND type in (N'U'))
DROP TABLE [dbo].[Transactions]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 8/8/2022 8:36:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Categories]') AND type in (N'U'))
DROP TABLE [dbo].[Categories]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 8/8/2022 8:36:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__EFMigrationsHistory]') AND type in (N'U'))
DROP TABLE [dbo].[__EFMigrationsHistory]
GO
USE [master]
GO
/****** Object:  Database [TransactionDB]    Script Date: 8/8/2022 8:36:44 PM ******/
DROP DATABASE [TransactionDB]
GO
/****** Object:  Database [TransactionDB]    Script Date: 8/8/2022 8:36:44 PM ******/
CREATE DATABASE [TransactionDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TransactionDB', FILENAME = N'C:\Program Files\Sql Server 2019\MSSQL15.SQLEXPRESS\MSSQL\DATA\TransactionDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TransactionDB_log', FILENAME = N'C:\Program Files\Sql Server 2019\MSSQL15.SQLEXPRESS\MSSQL\DATA\TransactionDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TransactionDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TransactionDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TransactionDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TransactionDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TransactionDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TransactionDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [TransactionDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [TransactionDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TransactionDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TransactionDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TransactionDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TransactionDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TransactionDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TransactionDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TransactionDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TransactionDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TransactionDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TransactionDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TransactionDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TransactionDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TransactionDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TransactionDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [TransactionDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TransactionDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TransactionDB] SET  MULTI_USER 
GO
ALTER DATABASE [TransactionDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TransactionDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TransactionDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TransactionDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
USE [TransactionDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 8/8/2022 8:36:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 8/8/2022 8:36:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Icon] [nvarchar](50) NOT NULL,
	[Type] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 8/8/2022 8:36:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[TransactionId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Amount] [int] NOT NULL,
	[Note] [nvarchar](50) NULL,
	[Date] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Transactions] PRIMARY KEY CLUSTERED 
(
	[TransactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220801092940_Initial', N'6.0.7')
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryId], [Title], [Icon], [Type]) VALUES (3, N'Travel', N'✈️', N'Expense')
INSERT [dbo].[Categories] ([CategoryId], [Title], [Icon], [Type]) VALUES (4, N'Salary', N'👔', N'Income')
INSERT [dbo].[Categories] ([CategoryId], [Title], [Icon], [Type]) VALUES (6, N'Bus', N'🚌', N'Expense')
INSERT [dbo].[Categories] ([CategoryId], [Title], [Icon], [Type]) VALUES (7, N'Gym', N'🏋️', N'Expense')
INSERT [dbo].[Categories] ([CategoryId], [Title], [Icon], [Type]) VALUES (8, N'Food', N'🥘', N'Expense')
INSERT [dbo].[Categories] ([CategoryId], [Title], [Icon], [Type]) VALUES (9, N'Bills for the House', N'🏠', N'Expense')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Transactions] ON 

INSERT [dbo].[Transactions] ([TransactionId], [CategoryId], [Amount], [Note], [Date]) VALUES (2, 4, 900, N'Plata.', CAST(N'2022-08-08T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Transactions] ([TransactionId], [CategoryId], [Amount], [Note], [Date]) VALUES (3, 3, 300, NULL, CAST(N'2022-08-08T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Transactions] ([TransactionId], [CategoryId], [Amount], [Note], [Date]) VALUES (4, 7, 30, NULL, CAST(N'2022-08-08T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Transactions] ([TransactionId], [CategoryId], [Amount], [Note], [Date]) VALUES (5, 6, 40, NULL, CAST(N'2022-08-08T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Transactions] ([TransactionId], [CategoryId], [Amount], [Note], [Date]) VALUES (6, 8, 200, NULL, CAST(N'2022-08-08T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Transactions] ([TransactionId], [CategoryId], [Amount], [Note], [Date]) VALUES (7, 9, 250, NULL, CAST(N'2022-08-08T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Transactions] OFF
GO
/****** Object:  Index [IX_Transactions_CategoryId]    Script Date: 8/8/2022 8:36:45 PM ******/
CREATE NONCLUSTERED INDEX [IX_Transactions_CategoryId] ON [dbo].[Transactions]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_Categories_CategoryId]
GO
USE [master]
GO
ALTER DATABASE [TransactionDB] SET  READ_WRITE 
GO
