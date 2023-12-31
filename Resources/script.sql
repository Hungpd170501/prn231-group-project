USE [master]
GO
/****** Object:  Database [ITManagementSystem]    Script Date: 7/17/2023 2:10:05 PM ******/
CREATE DATABASE [ITManagementSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ITManagementSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.KHOAHD7621\MSSQL\DATA\ITManagementSystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ITManagementSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.KHOAHD7621\MSSQL\DATA\ITManagementSystem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ITManagementSystem] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ITManagementSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ITManagementSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ITManagementSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ITManagementSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ITManagementSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ITManagementSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [ITManagementSystem] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ITManagementSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ITManagementSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ITManagementSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ITManagementSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ITManagementSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ITManagementSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ITManagementSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ITManagementSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ITManagementSystem] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ITManagementSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ITManagementSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ITManagementSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ITManagementSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ITManagementSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ITManagementSystem] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [ITManagementSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ITManagementSystem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ITManagementSystem] SET  MULTI_USER 
GO
ALTER DATABASE [ITManagementSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ITManagementSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ITManagementSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ITManagementSystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ITManagementSystem] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ITManagementSystem] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ITManagementSystem] SET QUERY_STORE = OFF
GO
USE [ITManagementSystem]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 7/17/2023 2:10:05 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Attendances]    Script Date: 7/17/2023 2:10:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendances](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime2](7) NOT NULL,
	[Hour] [float] NOT NULL,
	[OTHour] [float] NOT NULL,
	[Status] [int] NOT NULL,
	[Type] [int] NOT NULL,
	[EmployeeId] [int] NOT NULL,
 CONSTRAINT [PK_Attendances] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contracts]    Script Date: 7/17/2023 2:10:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contracts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[EmployeeType] [int] NOT NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[EndDate] [datetime2](7) NOT NULL,
	[BaseSalary] [decimal](18, 2) NOT NULL,
	[DateOffPerYear] [int] NOT NULL,
	[LevelId] [int] NOT NULL,
	[OTSalaryRate] [float] NOT NULL,
	[InsuranceRate] [float] NOT NULL,
	[TaxRate] [float] NOT NULL,
	[SalaryType] [int] NOT NULL,
	[PositionId] [int] NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Contracts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Levels]    Script Date: 7/17/2023 2:10:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Levels](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LevelName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Levels] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payrolls]    Script Date: 7/17/2023 2:10:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payrolls](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ContractId] [int] NOT NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[EndDate] [datetime2](7) NOT NULL,
	[TotalDeductionRate] [float] NOT NULL,
	[BaseSalaryPerHours] [decimal](18, 2) NOT NULL,
	[OTSalaryPerHours] [decimal](18, 2) NOT NULL,
	[BaseWorkingHours] [float] NOT NULL,
	[RealWorkingHours] [float] NOT NULL,
	[OTWorkingHours] [float] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[DayOfHasSalary] [int] NOT NULL,
	[Bonus] [decimal](18, 2) NOT NULL,
	[Status] [int] NOT NULL,
	[Total] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Payrolls] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Positions]    Script Date: 7/17/2023 2:10:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Positions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PositionName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Positions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TakeLeaves]    Script Date: 7/17/2023 2:10:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TakeLeaves](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[EndDate] [datetime2](7) NOT NULL,
	[Status] [int] NOT NULL,
	[Type] [int] NOT NULL,
	[Category] [int] NOT NULL,
	[Reason] [nvarchar](max) NULL,
	[LeaveDays] [int] NOT NULL,
	[EmployeeId] [int] NOT NULL,
 CONSTRAINT [PK_TakeLeaves] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/17/2023 2:10:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeName] [nvarchar](max) NOT NULL,
	[EmployeeCode] [nvarchar](450) NOT NULL,
	[Gender] [int] NOT NULL,
	[Role] [int] NOT NULL,
	[Dob] [datetime2](7) NOT NULL,
	[CCCD] [nvarchar](12) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](450) NOT NULL,
	[Phone] [nvarchar](max) NOT NULL,
	[Status] [int] NOT NULL,
	[IsFirstLogin] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230712135853_InitDB01', N'7.0.0')
GO
SET IDENTITY_INSERT [dbo].[Attendances] ON 

INSERT [dbo].[Attendances] ([Id], [Date], [Hour], [OTHour], [Status], [Type], [EmployeeId]) VALUES (1, CAST(N'2023-07-13T10:24:12.8680000' AS DateTime2), 8, 0, 1, 0, 2)
INSERT [dbo].[Attendances] ([Id], [Date], [Hour], [OTHour], [Status], [Type], [EmployeeId]) VALUES (2, CAST(N'2023-07-14T10:24:25.0060000' AS DateTime2), 8, 0, 1, 0, 2)
INSERT [dbo].[Attendances] ([Id], [Date], [Hour], [OTHour], [Status], [Type], [EmployeeId]) VALUES (3, CAST(N'2023-07-17T10:24:39.8320000' AS DateTime2), 8, 0, 1, 0, 2)
INSERT [dbo].[Attendances] ([Id], [Date], [Hour], [OTHour], [Status], [Type], [EmployeeId]) VALUES (4, CAST(N'2023-07-18T10:24:56.1360000' AS DateTime2), 8, 0, 1, 0, 2)
INSERT [dbo].[Attendances] ([Id], [Date], [Hour], [OTHour], [Status], [Type], [EmployeeId]) VALUES (5, CAST(N'2023-07-19T10:25:03.0090000' AS DateTime2), 8, 0, 1, 0, 2)
INSERT [dbo].[Attendances] ([Id], [Date], [Hour], [OTHour], [Status], [Type], [EmployeeId]) VALUES (6, CAST(N'2023-07-13T10:33:02.7940000' AS DateTime2), 8, 0, 1, 0, 3)
INSERT [dbo].[Attendances] ([Id], [Date], [Hour], [OTHour], [Status], [Type], [EmployeeId]) VALUES (9, CAST(N'2023-07-25T13:34:47.8840000' AS DateTime2), 8, 0, 1, 0, 2)
INSERT [dbo].[Attendances] ([Id], [Date], [Hour], [OTHour], [Status], [Type], [EmployeeId]) VALUES (11, CAST(N'2023-07-27T13:36:11.0660000' AS DateTime2), 8, 0, 1, 0, 2)
SET IDENTITY_INSERT [dbo].[Attendances] OFF
GO
SET IDENTITY_INSERT [dbo].[Contracts] ON 

INSERT [dbo].[Contracts] ([Id], [EmployeeId], [EmployeeType], [StartDate], [EndDate], [BaseSalary], [DateOffPerYear], [LevelId], [OTSalaryRate], [InsuranceRate], [TaxRate], [SalaryType], [PositionId], [Status]) VALUES (1, 2, 0, CAST(N'2023-07-13T07:30:49.5800000' AS DateTime2), CAST(N'2024-07-13T07:30:56.0120000' AS DateTime2), CAST(15000000.00 AS Decimal(18, 2)), 14, 3, 10, 10, 10, 1, 1, 1)
INSERT [dbo].[Contracts] ([Id], [EmployeeId], [EmployeeType], [StartDate], [EndDate], [BaseSalary], [DateOffPerYear], [LevelId], [OTSalaryRate], [InsuranceRate], [TaxRate], [SalaryType], [PositionId], [Status]) VALUES (2, 3, 0, CAST(N'2023-07-13T07:41:08.0510000' AS DateTime2), CAST(N'2024-07-01T07:41:13.3490000' AS DateTime2), CAST(45000000.00 AS Decimal(18, 2)), 14, 4, 10, 10, 10, 1, 4, 0)
INSERT [dbo].[Contracts] ([Id], [EmployeeId], [EmployeeType], [StartDate], [EndDate], [BaseSalary], [DateOffPerYear], [LevelId], [OTSalaryRate], [InsuranceRate], [TaxRate], [SalaryType], [PositionId], [Status]) VALUES (3, 4, 0, CAST(N'2023-07-13T07:47:32.4090000' AS DateTime2), CAST(N'2023-10-12T07:47:37.0360000' AS DateTime2), CAST(18000000.00 AS Decimal(18, 2)), 14, 2, 10, 0, 0, 0, 2, 0)
INSERT [dbo].[Contracts] ([Id], [EmployeeId], [EmployeeType], [StartDate], [EndDate], [BaseSalary], [DateOffPerYear], [LevelId], [OTSalaryRate], [InsuranceRate], [TaxRate], [SalaryType], [PositionId], [Status]) VALUES (4, 5, 0, CAST(N'2023-07-13T07:48:01.4180000' AS DateTime2), CAST(N'2024-01-02T07:48:02.4010000' AS DateTime2), CAST(65000000.00 AS Decimal(18, 2)), 14, 5, 10, 10, 10, 1, 5, 0)
INSERT [dbo].[Contracts] ([Id], [EmployeeId], [EmployeeType], [StartDate], [EndDate], [BaseSalary], [DateOffPerYear], [LevelId], [OTSalaryRate], [InsuranceRate], [TaxRate], [SalaryType], [PositionId], [Status]) VALUES (5, 6, 0, CAST(N'2023-07-13T07:51:47.7660000' AS DateTime2), CAST(N'2023-07-31T07:51:50.1330000' AS DateTime2), CAST(55000000.00 AS Decimal(18, 2)), 14, 4, 10, 0, 0, 0, 5, 0)
INSERT [dbo].[Contracts] ([Id], [EmployeeId], [EmployeeType], [StartDate], [EndDate], [BaseSalary], [DateOffPerYear], [LevelId], [OTSalaryRate], [InsuranceRate], [TaxRate], [SalaryType], [PositionId], [Status]) VALUES (6, 3, 1, CAST(N'2023-07-13T10:32:21.5840000' AS DateTime2), CAST(N'2023-07-31T10:32:24.4180000' AS DateTime2), CAST(30000.00 AS Decimal(18, 2)), 0, 2, 1, 10, 10, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[Contracts] OFF
GO
SET IDENTITY_INSERT [dbo].[Levels] ON 

INSERT [dbo].[Levels] ([Id], [LevelName]) VALUES (1, N'Intern')
INSERT [dbo].[Levels] ([Id], [LevelName]) VALUES (2, N'Fresher')
INSERT [dbo].[Levels] ([Id], [LevelName]) VALUES (3, N'Junior')
INSERT [dbo].[Levels] ([Id], [LevelName]) VALUES (4, N'Senior')
INSERT [dbo].[Levels] ([Id], [LevelName]) VALUES (5, N'Specialized')
SET IDENTITY_INSERT [dbo].[Levels] OFF
GO
SET IDENTITY_INSERT [dbo].[Payrolls] ON 

INSERT [dbo].[Payrolls] ([Id], [ContractId], [StartDate], [EndDate], [TotalDeductionRate], [BaseSalaryPerHours], [OTSalaryPerHours], [BaseWorkingHours], [RealWorkingHours], [OTWorkingHours], [CreatedDate], [DayOfHasSalary], [Bonus], [Status], [Total]) VALUES (6, 6, CAST(N'2023-07-01T00:00:00.0000000' AS DateTime2), CAST(N'2023-07-31T00:00:00.0000000' AS DateTime2), 20, CAST(30000.00 AS Decimal(18, 2)), CAST(30000.00 AS Decimal(18, 2)), 168, 8, 0, CAST(N'2023-07-13T00:00:00.0000000' AS DateTime2), 0, CAST(0.00 AS Decimal(18, 2)), 2, CAST(192000.00 AS Decimal(18, 2)))
INSERT [dbo].[Payrolls] ([Id], [ContractId], [StartDate], [EndDate], [TotalDeductionRate], [BaseSalaryPerHours], [OTSalaryPerHours], [BaseWorkingHours], [RealWorkingHours], [OTWorkingHours], [CreatedDate], [DayOfHasSalary], [Bonus], [Status], [Total]) VALUES (7, 1, CAST(N'2023-07-01T00:00:00.0000000' AS DateTime2), CAST(N'2023-07-31T00:00:00.0000000' AS DateTime2), 20, CAST(89285.71 AS Decimal(18, 2)), CAST(98214.29 AS Decimal(18, 2)), 168, 40, 0, CAST(N'2023-07-13T00:00:00.0000000' AS DateTime2), 2, CAST(0.00 AS Decimal(18, 2)), 2, CAST(4000000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Payrolls] OFF
GO
SET IDENTITY_INSERT [dbo].[Positions] ON 

INSERT [dbo].[Positions] ([Id], [PositionName]) VALUES (1, N'Software Engineering')
INSERT [dbo].[Positions] ([Id], [PositionName]) VALUES (2, N'Business Analysis')
INSERT [dbo].[Positions] ([Id], [PositionName]) VALUES (3, N'Automation Tester')
INSERT [dbo].[Positions] ([Id], [PositionName]) VALUES (4, N'Project Manager')
INSERT [dbo].[Positions] ([Id], [PositionName]) VALUES (5, N'Solution Architecture')
SET IDENTITY_INSERT [dbo].[Positions] OFF
GO
SET IDENTITY_INSERT [dbo].[TakeLeaves] ON 

INSERT [dbo].[TakeLeaves] ([Id], [StartDate], [EndDate], [Status], [Type], [Category], [Reason], [LeaveDays], [EmployeeId]) VALUES (1, CAST(N'2023-07-13T10:26:28.2940000' AS DateTime2), CAST(N'2023-07-13T10:26:28.2940000' AS DateTime2), 1, 0, 0, N'Sick', 1, 2)
INSERT [dbo].[TakeLeaves] ([Id], [StartDate], [EndDate], [Status], [Type], [Category], [Reason], [LeaveDays], [EmployeeId]) VALUES (2, CAST(N'2023-07-14T10:26:38.4700000' AS DateTime2), CAST(N'2023-07-14T10:26:38.4700000' AS DateTime2), 1, 0, 0, N'Sick', 1, 2)
INSERT [dbo].[TakeLeaves] ([Id], [StartDate], [EndDate], [Status], [Type], [Category], [Reason], [LeaveDays], [EmployeeId]) VALUES (3, CAST(N'2023-07-17T10:26:47.8360000' AS DateTime2), CAST(N'2023-07-17T10:26:47.8360000' AS DateTime2), 1, 0, 0, N'Sick', 1, 2)
INSERT [dbo].[TakeLeaves] ([Id], [StartDate], [EndDate], [Status], [Type], [Category], [Reason], [LeaveDays], [EmployeeId]) VALUES (4, CAST(N'2023-07-17T10:26:57.4910000' AS DateTime2), CAST(N'2023-07-19T10:26:57.4910000' AS DateTime2), 1, 0, 1, N'Sick', 3, 2)
INSERT [dbo].[TakeLeaves] ([Id], [StartDate], [EndDate], [Status], [Type], [Category], [Reason], [LeaveDays], [EmployeeId]) VALUES (5, CAST(N'2023-07-20T10:52:22.3860000' AS DateTime2), CAST(N'2023-07-20T10:52:22.3860000' AS DateTime2), 2, 0, 0, N'Sick', 1, 2)
INSERT [dbo].[TakeLeaves] ([Id], [StartDate], [EndDate], [Status], [Type], [Category], [Reason], [LeaveDays], [EmployeeId]) VALUES (6, CAST(N'2023-07-21T10:54:13.0560000' AS DateTime2), CAST(N'2023-07-21T10:54:13.0560000' AS DateTime2), 2, 0, 0, N'Sick', 1, 2)
INSERT [dbo].[TakeLeaves] ([Id], [StartDate], [EndDate], [Status], [Type], [Category], [Reason], [LeaveDays], [EmployeeId]) VALUES (7, CAST(N'2023-07-24T13:31:01.4090000' AS DateTime2), CAST(N'2023-07-26T13:31:01.4090000' AS DateTime2), 2, 0, 1, N'Hahaha', 3, 2)
INSERT [dbo].[TakeLeaves] ([Id], [StartDate], [EndDate], [Status], [Type], [Category], [Reason], [LeaveDays], [EmployeeId]) VALUES (8, CAST(N'2023-07-24T13:32:49.3070000' AS DateTime2), CAST(N'2023-07-24T13:32:49.3070000' AS DateTime2), 4, 0, 0, N'Cancer', 1, 2)
INSERT [dbo].[TakeLeaves] ([Id], [StartDate], [EndDate], [Status], [Type], [Category], [Reason], [LeaveDays], [EmployeeId]) VALUES (9, CAST(N'2023-07-27T13:36:18.7890000' AS DateTime2), CAST(N'2023-07-27T13:36:18.7890000' AS DateTime2), 1, 0, 0, N'Cancer Treatment', 1, 2)
SET IDENTITY_INSERT [dbo].[TakeLeaves] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [EmployeeName], [EmployeeCode], [Gender], [Role], [Dob], [CCCD], [Address], [CreatedDate], [Password], [Email], [Phone], [Status], [IsFirstLogin]) VALUES (1, N'Admin', N'SD0001', 0, 0, CAST(N'2001-01-01T00:00:00.0000000' AS DateTime2), N'1234567890', N'HCM', CAST(N'2023-07-12T20:58:52.9299441' AS DateTime2), N'$2a$11$Unt4hinWxCS5QU.JfXyj.OlAUEO/PnX79Lt5LcL7Bzp9eoo7bTOtK', N'admin@projectx.com', N'0792123456', 0, 0)
INSERT [dbo].[Users] ([Id], [EmployeeName], [EmployeeCode], [Gender], [Role], [Dob], [CCCD], [Address], [CreatedDate], [Password], [Email], [Phone], [Status], [IsFirstLogin]) VALUES (2, N'Hoang Dang Khoa', N'SD0002', 0, 1, CAST(N'2001-06-05T20:00:00.0000000' AS DateTime2), N'123456789', N'Dong Nai', CAST(N'2023-07-13T14:08:53.5787280' AS DateTime2), N'$2a$11$WmHapUEbwqW6o.z6kUuO1u0DJAuD/F0BWpxyWd5.tOUIOUk/PpYNa', N'khoahd@projectx.com', N'0792123456', 0, 0)
INSERT [dbo].[Users] ([Id], [EmployeeName], [EmployeeCode], [Gender], [Role], [Dob], [CCCD], [Address], [CreatedDate], [Password], [Email], [Phone], [Status], [IsFirstLogin]) VALUES (3, N'Pham Phu Hung', N'SD0003', 0, 1, CAST(N'2001-01-01T07:19:34.6170000' AS DateTime2), N'123456710', N'Nha Trang', CAST(N'2023-07-13T14:25:22.3640967' AS DateTime2), N'Hungphamphu@112001', N'hungpp@projectx.com', N'0909123456', 0, 1)
INSERT [dbo].[Users] ([Id], [EmployeeName], [EmployeeCode], [Gender], [Role], [Dob], [CCCD], [Address], [CreatedDate], [Password], [Email], [Phone], [Status], [IsFirstLogin]) VALUES (4, N'Pham Thanh Kien', N'SD0004', 0, 1, CAST(N'2000-12-31T17:00:00.0000000' AS DateTime2), N'123456712', N'HCM', CAST(N'2023-07-13T14:26:35.2530754' AS DateTime2), N'Kienphamthanh@31122000', N'kienpt@projectx.com', N'0792123456', 0, 1)
INSERT [dbo].[Users] ([Id], [EmployeeName], [EmployeeCode], [Gender], [Role], [Dob], [CCCD], [Address], [CreatedDate], [Password], [Email], [Phone], [Status], [IsFirstLogin]) VALUES (5, N'Pham Duc Hung Hung', N'SD0005', 0, 1, CAST(N'2000-12-31T17:00:00.0000000' AS DateTime2), N'123456123', N'HCM', CAST(N'2023-07-13T14:27:08.3385511' AS DateTime2), N'$2a$11$EJhLew.KPTQKS6fYeNiVx.1q8mXYJC70LGLOrjaqJzltnEDj97Vbq', N'hungpdh@projectx.com', N'0902123456', 0, 1)
INSERT [dbo].[Users] ([Id], [EmployeeName], [EmployeeCode], [Gender], [Role], [Dob], [CCCD], [Address], [CreatedDate], [Password], [Email], [Phone], [Status], [IsFirstLogin]) VALUES (6, N'Ho Hai Nam', N'SD0006', 0, 1, CAST(N'2000-12-31T17:00:00.0000000' AS DateTime2), N'123123123', N'Vung Tau', CAST(N'2023-07-13T14:27:50.8133503' AS DateTime2), N'$2a$11$2yMFcGOCTgwhGZBKxkQHJOtHvgsY0uWXQ8lxVd5ek57zasRwMso8q', N'namhh@projectx.com', N'0909123456', 0, 1)
INSERT [dbo].[Users] ([Id], [EmployeeName], [EmployeeCode], [Gender], [Role], [Dob], [CCCD], [Address], [CreatedDate], [Password], [Email], [Phone], [Status], [IsFirstLogin]) VALUES (7, N'Tran Hoai Nam', N'SD0007', 0, 1, CAST(N'2000-12-31T17:00:00.0000000' AS DateTime2), N'123456456', N'Binh Chanh', CAST(N'2023-07-13T14:28:21.5686490' AS DateTime2), N'$2a$11$hKD6ET0lBqHoGxmpLdNmwexnKF6Uz0BVl2elEORrCXP9ibCpv5OoG', N'namth@projectx.com', N'0792123123', 0, 1)
INSERT [dbo].[Users] ([Id], [EmployeeName], [EmployeeCode], [Gender], [Role], [Dob], [CCCD], [Address], [CreatedDate], [Password], [Email], [Phone], [Status], [IsFirstLogin]) VALUES (8, N'Doan Le Truc Huynh', N'SD0008', 1, 1, CAST(N'2000-12-31T17:00:00.0000000' AS DateTime2), N'123456444', N'HCM', CAST(N'2023-07-13T14:29:22.0394397' AS DateTime2), N'$2a$11$M2ObrEHOzCyreSkEBZO7eeIRH9i.07hxiv0B60Ox0yBanZWPZhJiq', N'huynhdlt@projectx.com', N'0792123123', 0, 1)
INSERT [dbo].[Users] ([Id], [EmployeeName], [EmployeeCode], [Gender], [Role], [Dob], [CCCD], [Address], [CreatedDate], [Password], [Email], [Phone], [Status], [IsFirstLogin]) VALUES (9, N'Nguyen Le Quynh Thien', N'SD0009', 0, 1, CAST(N'2000-12-31T17:00:00.0000000' AS DateTime2), N'123456721', N'Can Tho', CAST(N'2023-07-13T14:30:01.0673303' AS DateTime2), N'$2a$11$fLVOcgRSob4CANpW5FEf3egEpHSQCzQfDhxW2KoBNtMvFtZtmco7O', N'thiennlq@projectx.com', N'0792123123', 0, 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
/****** Object:  Index [IX_Attendances_EmployeeId]    Script Date: 7/17/2023 2:10:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_Attendances_EmployeeId] ON [dbo].[Attendances]
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Contracts_EmployeeId]    Script Date: 7/17/2023 2:10:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_Contracts_EmployeeId] ON [dbo].[Contracts]
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Contracts_LevelId]    Script Date: 7/17/2023 2:10:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_Contracts_LevelId] ON [dbo].[Contracts]
(
	[LevelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Contracts_PositionId]    Script Date: 7/17/2023 2:10:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_Contracts_PositionId] ON [dbo].[Contracts]
(
	[PositionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Payrolls_ContractId]    Script Date: 7/17/2023 2:10:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_Payrolls_ContractId] ON [dbo].[Payrolls]
(
	[ContractId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TakeLeaves_EmployeeId]    Script Date: 7/17/2023 2:10:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_TakeLeaves_EmployeeId] ON [dbo].[TakeLeaves]
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users_CCCD]    Script Date: 7/17/2023 2:10:05 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_CCCD] ON [dbo].[Users]
(
	[CCCD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users_Email]    Script Date: 7/17/2023 2:10:05 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_Email] ON [dbo].[Users]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users_EmployeeCode]    Script Date: 7/17/2023 2:10:05 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_EmployeeCode] ON [dbo].[Users]
(
	[EmployeeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Attendances]  WITH CHECK ADD  CONSTRAINT [FK_Attendances_Users_EmployeeId] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Attendances] CHECK CONSTRAINT [FK_Attendances_Users_EmployeeId]
GO
ALTER TABLE [dbo].[Contracts]  WITH CHECK ADD  CONSTRAINT [FK_Contracts_Levels_LevelId] FOREIGN KEY([LevelId])
REFERENCES [dbo].[Levels] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Contracts] CHECK CONSTRAINT [FK_Contracts_Levels_LevelId]
GO
ALTER TABLE [dbo].[Contracts]  WITH CHECK ADD  CONSTRAINT [FK_Contracts_Positions_PositionId] FOREIGN KEY([PositionId])
REFERENCES [dbo].[Positions] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Contracts] CHECK CONSTRAINT [FK_Contracts_Positions_PositionId]
GO
ALTER TABLE [dbo].[Contracts]  WITH CHECK ADD  CONSTRAINT [FK_Contracts_Users_EmployeeId] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Contracts] CHECK CONSTRAINT [FK_Contracts_Users_EmployeeId]
GO
ALTER TABLE [dbo].[Payrolls]  WITH CHECK ADD  CONSTRAINT [FK_Payrolls_Contracts_ContractId] FOREIGN KEY([ContractId])
REFERENCES [dbo].[Contracts] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Payrolls] CHECK CONSTRAINT [FK_Payrolls_Contracts_ContractId]
GO
ALTER TABLE [dbo].[TakeLeaves]  WITH CHECK ADD  CONSTRAINT [FK_TakeLeaves_Users_EmployeeId] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TakeLeaves] CHECK CONSTRAINT [FK_TakeLeaves_Users_EmployeeId]
GO
USE [master]
GO
ALTER DATABASE [ITManagementSystem] SET  READ_WRITE 
GO
