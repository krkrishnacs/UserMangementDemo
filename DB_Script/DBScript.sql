USE [master]
GO
/****** Object:  Database [EuphoriaInfotech]    Script Date: 5/31/2023 9:59:54 PM ******/
CREATE DATABASE [EuphoriaInfotech]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EuphoriaInfotech', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\EuphoriaInfotech.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EuphoriaInfotech_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\EuphoriaInfotech_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [EuphoriaInfotech] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EuphoriaInfotech].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EuphoriaInfotech] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EuphoriaInfotech] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EuphoriaInfotech] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EuphoriaInfotech] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EuphoriaInfotech] SET ARITHABORT OFF 
GO
ALTER DATABASE [EuphoriaInfotech] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [EuphoriaInfotech] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EuphoriaInfotech] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EuphoriaInfotech] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EuphoriaInfotech] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EuphoriaInfotech] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EuphoriaInfotech] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EuphoriaInfotech] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EuphoriaInfotech] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EuphoriaInfotech] SET  ENABLE_BROKER 
GO
ALTER DATABASE [EuphoriaInfotech] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EuphoriaInfotech] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EuphoriaInfotech] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EuphoriaInfotech] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EuphoriaInfotech] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EuphoriaInfotech] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EuphoriaInfotech] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EuphoriaInfotech] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EuphoriaInfotech] SET  MULTI_USER 
GO
ALTER DATABASE [EuphoriaInfotech] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EuphoriaInfotech] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EuphoriaInfotech] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EuphoriaInfotech] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EuphoriaInfotech] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EuphoriaInfotech] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [EuphoriaInfotech] SET QUERY_STORE = ON
GO
ALTER DATABASE [EuphoriaInfotech] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [EuphoriaInfotech]
GO
/****** Object:  Table [dbo].[ExcelMatchTbl]    Script Date: 5/31/2023 9:59:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExcelMatchTbl](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [varchar](50) NULL,
	[CourseName] [varchar](50) NULL,
 CONSTRAINT [PK_ExcelMatchTbl] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudenDetails]    Script Date: 5/31/2023 9:59:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudenDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentName] [varchar](50) NULL,
	[SchoolName] [varchar](50) NULL,
	[Degree] [varchar](50) NULL,
	[DateOfBirth] [date] NULL,
	[FatherName] [varchar](50) NULL,
	[MotherName] [varchar](50) NULL,
	[StudentAddress] [varchar](50) NULL,
	[Gender] [varchar](50) NULL,
	[StudentEmail] [varchar](50) NULL,
	[StudentPhoneNo] [varchar](50) NULL,
	[ParentsPhoneNo] [varchar](50) NULL,
	[Photo] [varchar](max) NULL,
 CONSTRAINT [PK_StudenDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransactionYear]    Script Date: 5/31/2023 9:59:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionYear](
	[TransactionId] [int] IDENTITY(1,1) NOT NULL,
	[TransactionYearName] [varchar](50) NULL,
	[FromMonth] [date] NULL,
	[ToMonth] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRegister]    Script Date: 5/31/2023 9:59:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRegister](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Address] [varchar](250) NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](10) NULL,
	[RoleName] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[StudenDetails] ON 

INSERT [dbo].[StudenDetails] ([Id], [StudentName], [SchoolName], [Degree], [DateOfBirth], [FatherName], [MotherName], [StudentAddress], [Gender], [StudentEmail], [StudentPhoneNo], [ParentsPhoneNo], [Photo]) VALUES (1, N'Rahul kr', N'D D I C SHER', N'1OTH', CAST(N'2023-05-14' AS Date), N'Rajesh sah', N'Rukh devi', N'Bihar', N'Male', N'kumarkrishna@gmailcom', N'7301263668', N'7544075228', NULL)
INSERT [dbo].[StudenDetails] ([Id], [StudentName], [SchoolName], [Degree], [DateOfBirth], [FatherName], [MotherName], [StudentAddress], [Gender], [StudentEmail], [StudentPhoneNo], [ParentsPhoneNo], [Photo]) VALUES (2, N'Aaarti Kumari', N'G G U BILASHPUR', N'B.TECH', CAST(N'2023-05-28' AS Date), N'Raju Sah', N'Meena Devi', N'Bliaspur', N'Female', N'aarti@gmail.com', N'6206510871', N'8789556654', N'System.Web.HttpPostedFileWrapper')
INSERT [dbo].[StudenDetails] ([Id], [StudentName], [SchoolName], [Degree], [DateOfBirth], [FatherName], [MotherName], [StudentAddress], [Gender], [StudentEmail], [StudentPhoneNo], [ParentsPhoneNo], [Photo]) VALUES (3, N'Krishna Kumar', N'M M H U PATNA', N'BCA', CAST(N'2023-05-22' AS Date), N'Raju Sah', N'Meena Devi', N'Ahemdbad Gujarat', N'Male', N'krishna@gmail.com', N'7301263668', N'9934707519', N'System.Web.HttpPostedFileWrapper')
INSERT [dbo].[StudenDetails] ([Id], [StudentName], [SchoolName], [Degree], [DateOfBirth], [FatherName], [MotherName], [StudentAddress], [Gender], [StudentEmail], [StudentPhoneNo], [ParentsPhoneNo], [Photo]) VALUES (4, N'Krishna Kumar', N'M M H U PATNA', N'BCA', CAST(N'2023-05-22' AS Date), N'Raju Sah', N'Meena Devi', N'Ahemdbad Gujarat', N'Male', N'krishna@gmail.com', N'7301263668', N'9934707519', N'System.Web.HttpPostedFileWrapper')
INSERT [dbo].[StudenDetails] ([Id], [StudentName], [SchoolName], [Degree], [DateOfBirth], [FatherName], [MotherName], [StudentAddress], [Gender], [StudentEmail], [StudentPhoneNo], [ParentsPhoneNo], [Photo]) VALUES (5, N'RTPD', N'MNDV', N'B.TECH', CAST(N'2023-05-20' AS Date), N'NBPI', N'MNGI', N'BIHAR', N'FEMALE', N'nmip@gmail.com', N'8356201250', N'8023567810', N'System.Web.HttpPostedFileWrapper')
INSERT [dbo].[StudenDetails] ([Id], [StudentName], [SchoolName], [Degree], [DateOfBirth], [FatherName], [MotherName], [StudentAddress], [Gender], [StudentEmail], [StudentPhoneNo], [ParentsPhoneNo], [Photo]) VALUES (6, N'Sonu', N'DDIC SHER', N'12TH', CAST(N'2023-05-17' AS Date), N'RAM singh', N'Meera devi', N'Thawe', N'Male', N'sonu@gmail.com', N'9850126301', N'8523456015', N'System.Web.HttpPostedFileWrapper')
INSERT [dbo].[StudenDetails] ([Id], [StudentName], [SchoolName], [Degree], [DateOfBirth], [FatherName], [MotherName], [StudentAddress], [Gender], [StudentEmail], [StudentPhoneNo], [ParentsPhoneNo], [Photo]) VALUES (7, N'Sonu', N'DDIC SHER', N'12TH', CAST(N'2023-05-17' AS Date), N'RAM singh', N'Meera devi', N'Thawe', N'Male', N'sonu@gmail.com', N'9850126301', N'8523456015', N'System.Web.HttpPostedFileWrapper')
INSERT [dbo].[StudenDetails] ([Id], [StudentName], [SchoolName], [Degree], [DateOfBirth], [FatherName], [MotherName], [StudentAddress], [Gender], [StudentEmail], [StudentPhoneNo], [ParentsPhoneNo], [Photo]) VALUES (8, N'Sonu', N'NFP BIAHR', N'B.TECH', CAST(N'2023-05-16' AS Date), N'RAM singh', N'Meera devi', N'BIHAR', N'Male', N'sonu@gmail.com', N'7452185623', N'8956105248', N'System.Web.HttpPostedFileWrapper')
INSERT [dbo].[StudenDetails] ([Id], [StudentName], [SchoolName], [Degree], [DateOfBirth], [FatherName], [MotherName], [StudentAddress], [Gender], [StudentEmail], [StudentPhoneNo], [ParentsPhoneNo], [Photo]) VALUES (9, N'Ravi Raj', N'D A V Gopalganj', N'8th', CAST(N'2010-05-15' AS Date), N'Raj bhagat', N'Jagni Devi', N'Gopalganj', N'Male', N'ravi@gmail.com', N'7544285210', N'9570502580', N'System.Web.HttpPostedFileWrapper')
INSERT [dbo].[StudenDetails] ([Id], [StudentName], [SchoolName], [Degree], [DateOfBirth], [FatherName], [MotherName], [StudentAddress], [Gender], [StudentEmail], [StudentPhoneNo], [ParentsPhoneNo], [Photo]) VALUES (10, N'Jai', N'D I C ', N'BCA', CAST(N'2023-05-19' AS Date), N'Ravi', N'Meera Bi', N'Thana Mumbai', N'Male', N'jai32@gmail.com', N'7542805018', N'9575201050', N'System.Web.HttpPostedFileWrapper')
INSERT [dbo].[StudenDetails] ([Id], [StudentName], [SchoolName], [Degree], [DateOfBirth], [FatherName], [MotherName], [StudentAddress], [Gender], [StudentEmail], [StudentPhoneNo], [ParentsPhoneNo], [Photo]) VALUES (11, N'Jai', N'D I C ', N'BCA', CAST(N'2023-05-19' AS Date), N'Ravi', N'Meera Bi', N'Thana Mumbai', N'Male', N'jai32@gmail.com', N'7542805018', N'9575201050', N'12thMarksheet.jpg')
INSERT [dbo].[StudenDetails] ([Id], [StudentName], [SchoolName], [Degree], [DateOfBirth], [FatherName], [MotherName], [StudentAddress], [Gender], [StudentEmail], [StudentPhoneNo], [ParentsPhoneNo], [Photo]) VALUES (12, N'Ramlakhan kumar yadav ', N'S S Balika Gopalganj', N'BCA', CAST(N'2023-06-07' AS Date), N'ramanath ', N'sita', N'Bishunpura', N'Male', N'ram52088@gmail.com', N'7301263668', N'9540502541', N'System.Web.HttpPostedFileWrapper')
INSERT [dbo].[StudenDetails] ([Id], [StudentName], [SchoolName], [Degree], [DateOfBirth], [FatherName], [MotherName], [StudentAddress], [Gender], [StudentEmail], [StudentPhoneNo], [ParentsPhoneNo], [Photo]) VALUES (13, N'Ramlakhan kumar yadav ', N'S S Balika Gopalganj', N'BCA', CAST(N'2023-06-07' AS Date), N'ramanath ', N'sita', N'Bishunpura', N'Male', N'ram52088@gmail.com', N'7301263668', N'9540502541', N'System.Web.HttpPostedFileWrapper')
INSERT [dbo].[StudenDetails] ([Id], [StudentName], [SchoolName], [Degree], [DateOfBirth], [FatherName], [MotherName], [StudentAddress], [Gender], [StudentEmail], [StudentPhoneNo], [ParentsPhoneNo], [Photo]) VALUES (14, N'JaiRAM SINGH', N'Dr nandi grasses', N'BCA', CAST(N'2023-05-18' AS Date), N'Sure Singh', N'Hira devi', N'Baliya Jila Bihar', N'Male', N'jairamjii@gmail.com', N'6205020108', N'9985201058', N'System.Web.HttpPostedFileWrapper')
SET IDENTITY_INSERT [dbo].[StudenDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[TransactionYear] ON 

INSERT [dbo].[TransactionYear] ([TransactionId], [TransactionYearName], [FromMonth], [ToMonth]) VALUES (1, N'2022', CAST(N'2021-10-14' AS Date), CAST(N'2023-05-13' AS Date))
SET IDENTITY_INSERT [dbo].[TransactionYear] OFF
GO
SET IDENTITY_INSERT [dbo].[UserRegister] ON 

INSERT [dbo].[UserRegister] ([Id], [Name], [Address], [UserName], [Password], [RoleName]) VALUES (2, N'Krishna Kumar', N'Bihar Gopalganj', N'krishna@gmail.com', N'123456', NULL)
INSERT [dbo].[UserRegister] ([Id], [Name], [Address], [UserName], [Password], [RoleName]) VALUES (3, N'Krishna Kumar', N'Bihar Gopalganj', N'kumarkrishna@gmail.com', N'123456', NULL)
INSERT [dbo].[UserRegister] ([Id], [Name], [Address], [UserName], [Password], [RoleName]) VALUES (4, N'JayRam Jii', N'Gopalganj Bihar', N'jayram@gmail.com', N'Ramji@123', NULL)
INSERT [dbo].[UserRegister] ([Id], [Name], [Address], [UserName], [Password], [RoleName]) VALUES (5, N'Ramlakhan Yadav', N'Ahemdbad Gujarat', N'ramlakahan@gmail.com', N'Ram@12345', N'0')
INSERT [dbo].[UserRegister] ([Id], [Name], [Address], [UserName], [Password], [RoleName]) VALUES (6, N'Phision', N'Baruli Goaplaganj Bihar', N'phision@gmail.com', N'Phision', N'1')
INSERT [dbo].[UserRegister] ([Id], [Name], [Address], [UserName], [Password], [RoleName]) VALUES (7, N'mahi ', N'Rakanpur Village, Rakanpur', N'mahi@gmail.com', N'Mahi@123', N'0')
INSERT [dbo].[UserRegister] ([Id], [Name], [Address], [UserName], [Password], [RoleName]) VALUES (8, N'Sonu Ram', N'Bihar', N'sonuram@gmail.com', N'Sonu@3435', N'0')
INSERT [dbo].[UserRegister] ([Id], [Name], [Address], [UserName], [Password], [RoleName]) VALUES (9, N'Sonu Ram', N'Bihar', N'sonuram@gmail.com', N'Sonu@3435', N'0')
INSERT [dbo].[UserRegister] ([Id], [Name], [Address], [UserName], [Password], [RoleName]) VALUES (10, N'Mohan Ray', N'Bihar Gopalganj', N'mohan@gmail.com', N'Mohan@123', N'0')
INSERT [dbo].[UserRegister] ([Id], [Name], [Address], [UserName], [Password], [RoleName]) VALUES (11, N'RamSita', N'Uttarpardesh Yodya', N'ramsita21@gmail.com', N'Ramsita@12', N'1')
INSERT [dbo].[UserRegister] ([Id], [Name], [Address], [UserName], [Password], [RoleName]) VALUES (12, N'Phision', N'vill-ayama post-sikatiya ps-bhagwanpur hat dist-siwan', N'Madhu', N'Kkrwer', N'1')
SET IDENTITY_INSERT [dbo].[UserRegister] OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_AddStudentData]    Script Date: 5/31/2023 10:00:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AddStudentData](
@StudentName varchar(50),
@SchoolName varchar(50),
@Degree varchar(50),
@DateOfBirth date,
@FatherName varchar(50),
@MotherName varchar(50),
@StudentAddress varchar(50),
@Gender varchar(50),
@StudentEmail varchar(50),
@StudentPhoneNo varchar(10),
@ParentsPhoneNo varchar(10),
@Photo nvarchar(max)
)
as
begin
insert into StudenDetails(StudentName,SchoolName,Degree,DateOfBirth,FatherName,MotherName,StudentAddress,Gender,StudentEmail,StudentPhoneNo,ParentsPhoneNo,Photo)values(@StudentName,@SchoolName,@Degree,@DateOfBirth,@FatherName,@MotherName,@StudentAddress,@Gender,@StudentEmail,@StudentPhoneNo,@ParentsPhoneNo,@Photo)
end
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetAllData]    Script Date: 5/31/2023 10:00:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Sp_GetAllData]
as
begin
select *from UserRegister
end
GO
/****** Object:  StoredProcedure [dbo].[Sp_UserRegister]    Script Date: 5/31/2023 10:00:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Sp_UserRegister]
(
@Name varchar(50),
@Address varchar(250),
@UserName varchar(50),
@Password varchar(50),
@RoleName varchar(10)
)
as
begin
insert into UserRegister(Name,Address,UserName,Password,RoleName) values(@Name,@Address,@UserName,@Password,@RoleName)
end
GO
/****** Object:  StoredProcedure [dbo].[TransactionYearName]    Script Date: 5/31/2023 10:00:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[TransactionYearName]
(
@TransactionYearName varchar(50),
@FromMonth date,
@ToMonth date
)
as
begin
insert into TransactionYear(TransactionYearName,FromMonth,ToMonth) values(@TransactionYearName,@FromMonth,@ToMonth)
end
GO
USE [master]
GO
ALTER DATABASE [EuphoriaInfotech] SET  READ_WRITE 
GO
