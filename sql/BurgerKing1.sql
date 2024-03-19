USE [master]
GO
/****** Object:  Database [BurgerKing1]    Script Date: 3/18/2024 12:00:25 AM ******/
CREATE DATABASE [BurgerKing1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BurgerKing1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\BurgerKing1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BurgerKing1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\BurgerKing1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [BurgerKing1] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BurgerKing1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BurgerKing1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BurgerKing1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BurgerKing1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BurgerKing1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BurgerKing1] SET ARITHABORT OFF 
GO
ALTER DATABASE [BurgerKing1] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BurgerKing1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BurgerKing1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BurgerKing1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BurgerKing1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BurgerKing1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BurgerKing1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BurgerKing1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BurgerKing1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BurgerKing1] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BurgerKing1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BurgerKing1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BurgerKing1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BurgerKing1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BurgerKing1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BurgerKing1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BurgerKing1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BurgerKing1] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BurgerKing1] SET  MULTI_USER 
GO
ALTER DATABASE [BurgerKing1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BurgerKing1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BurgerKing1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BurgerKing1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BurgerKing1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BurgerKing1] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BurgerKing1] SET QUERY_STORE = ON
GO
ALTER DATABASE [BurgerKing1] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [BurgerKing1]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/18/2024 12:00:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[name] [nvarchar](100) NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NULL,
	[email] [varchar](100) NULL,
	[role] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bill]    Script Date: 3/18/2024 12:00:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bill](
	[name] [nvarchar](100) NULL,
	[username] [varchar](50) NULL,
	[phone] [varchar](15) NULL,
	[email] [varchar](100) NULL,
	[address] [nvarchar](200) NULL,
	[quantity] [int] NULL,
	[sumprice] [float] NULL,
	[pid] [nchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 3/18/2024 12:00:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[id] [int] NOT NULL,
	[name] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 3/18/2024 12:00:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[id] [nchar](20) NOT NULL,
	[name] [nvarchar](max) NULL,
	[quantity] [int] NULL,
	[price] [money] NULL,
	[describe] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[cid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Account] ([name], [Username], [Password], [email], [role]) VALUES (N'Nguyễn Hữu Hoàng', N'hwang', N'12345', N'hoangnhhe172374@fpt.edu.vn', 1)
INSERT [dbo].[Account] ([name], [Username], [Password], [email], [role]) VALUES (N'Hoang', N'lailahoangday', N'1', N'linhlinhqo@gmail.com', 2)
GO
INSERT [dbo].[Categories] ([id], [name]) VALUES (1, N'Burger')
INSERT [dbo].[Categories] ([id], [name]) VALUES (2, N'Fired Chicken')
INSERT [dbo].[Categories] ([id], [name]) VALUES (3, N'Drink')
INSERT [dbo].[Categories] ([id], [name]) VALUES (4, N'Combo')
GO
INSERT [dbo].[Products] ([id], [name], [quantity], [price], [describe], [image], [cid]) VALUES (N'burger1             ', N'Burger Cá Hồi', 10, 69.0000, N'Được làm bằng than tre, bánh mì mè đen tạo thêm hương vị hơi khác cho chiếc bánh mì kẹp thịt. Nó có dạng miếng thịt bò Whopper hoặc miếng gà rán TenderCrisp', N'images/burger1.jpg', 1)
INSERT [dbo].[Products] ([id], [name], [quantity], [price], [describe], [image], [cid]) VALUES (N'chicken1            ', N'Giòn 1 cái', 10, 45.0000, N'1 miếng gà được chiên giòn mang lại cảm giác giòn tan với từng miếng cắn', N'images/ga1.jpg', 2)
INSERT [dbo].[Products] ([id], [name], [quantity], [price], [describe], [image], [cid]) VALUES (N'combo1              ', N'Combo Chicken Love', 10, 69.0000, N'Combo cánh gà tình yêu cho bạn và tình nhân hạnh phúc', N'images/fire1.jpg', 4)
INSERT [dbo].[Products] ([id], [name], [quantity], [price], [describe], [image], [cid]) VALUES (N'drink1              ', N'Danasi', 10, 15.0000, N'Giải khát cùng 1 chai Danasi', N'images/nuoc1.jpg', 3)
GO
ALTER TABLE [dbo].[bill]  WITH CHECK ADD FOREIGN KEY([pid])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([cid])
REFERENCES [dbo].[Categories] ([id])
GO
USE [master]
GO
ALTER DATABASE [BurgerKing1] SET  READ_WRITE 
GO
