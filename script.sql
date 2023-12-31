USE [master]
GO
/****** Object:  Database [LeaveManagementSystem]    Script Date: 10/29/2023 10:21:42 PM ******/
CREATE DATABASE [LeaveManagementSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LeaveManagementSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\LeaveManagementSystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LeaveManagementSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\LeaveManagementSystem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [LeaveManagementSystem] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LeaveManagementSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LeaveManagementSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LeaveManagementSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LeaveManagementSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LeaveManagementSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LeaveManagementSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [LeaveManagementSystem] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [LeaveManagementSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LeaveManagementSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LeaveManagementSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LeaveManagementSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LeaveManagementSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LeaveManagementSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LeaveManagementSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LeaveManagementSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LeaveManagementSystem] SET  ENABLE_BROKER 
GO
ALTER DATABASE [LeaveManagementSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LeaveManagementSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LeaveManagementSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LeaveManagementSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LeaveManagementSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LeaveManagementSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LeaveManagementSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LeaveManagementSystem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LeaveManagementSystem] SET  MULTI_USER 
GO
ALTER DATABASE [LeaveManagementSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LeaveManagementSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LeaveManagementSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LeaveManagementSystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LeaveManagementSystem] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LeaveManagementSystem] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [LeaveManagementSystem] SET QUERY_STORE = ON
GO
ALTER DATABASE [LeaveManagementSystem] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [LeaveManagementSystem]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 10/29/2023 10:21:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [nvarchar](50) NULL,
	[Fname] [nvarchar](50) NULL,
	[Lname] [nvarchar](50) NULL,
	[Genderid] [int] NULL,
	[RoleTypeId] [int] NULL,
	[EmploymentDate] [date] NULL,
	[Vacation] [int] NULL,
	[Sick] [int] NULL,
	[Department] [int] NULL,
	[Personal] [int] NULL,
 CONSTRAINT [PK__Employee__3213E83F20488815] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LeaveTypes]    Script Date: 10/29/2023 10:21:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeaveTypes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LeaveSubmissionTable]    Script Date: 10/29/2023 10:21:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeaveSubmissionTable](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[EmpID] [int] NULL,
	[LeaveTypeId] [int] NULL,
	[LeaveStatusId] [int] NULL,
	[SubmissionDate] [date] NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[TotalDays] [int] NULL,
	[Comments] [nvarchar](max) NULL,
	[CancelId] [int] NULL,
 CONSTRAINT [PK__LeaveSub__3213E83F9EF87243] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LeaveStatus]    Script Date: 10/29/2023 10:21:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeaveStatus](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[status] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CancelationReasons]    Script Date: 10/29/2023 10:21:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CancelationReasons](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[reason] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 10/29/2023 10:21:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[gender] [nvarchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ViewAll]    Script Date: 10/29/2023 10:21:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view [dbo].[ViewAll] As
select 
sub.id,
e.EmployeeID,
g.gender,
e.Fname + e.Lname[Full Name],
lt.type,
sub.SubmissionDate,
sub.StartDate,
sub.EndDate,
sub.TotalDays,
sub.Comments,
ls.status,
c.reason
from LeaveSubmissionTable sub
left join Employee E on E.id = sub.EmpID
left join LeaveTypes lt on lt.id = sub.LeaveTypeId
left join LeaveStatus ls on ls.id = sub.LeaveStatusId
left join Gender g on g.id = e.Genderid
left join CancelationReasons c on c.id = sub.CancelId
GO
/****** Object:  Table [dbo].[RoleTypes]    Script Date: 10/29/2023 10:21:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleTypes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[roles] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ViewEmployees]    Script Date: 10/29/2023 10:21:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE View [dbo].[ViewEmployees] As
select 
E.id,
E.EmployeeID,
E.Fname,
E.Lname,
G.gender,
RT.roles,
E.EmploymentDate
,E.Vacation
,E.Sick
,E.Department
,E.Personal
from Employee E
left join Gender g on g.id = E.Genderid
Left Join RoleTypes RT on Rt.id = E.RoleTypeId
GO
/****** Object:  Table [dbo].[Student]    Script Date: 10/29/2023 10:21:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Id] [int] NOT NULL,
	[StudentName] [nchar](50) NULL,
	[StudentFees] [int] NULL,
	[StudentCity] [nchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CancelationReasons] ON 

INSERT [dbo].[CancelationReasons] ([id], [reason]) VALUES (1, N'Select Reason')
INSERT [dbo].[CancelationReasons] ([id], [reason]) VALUES (2, N'Cancellation Reason 1')
INSERT [dbo].[CancelationReasons] ([id], [reason]) VALUES (3, N'Cancellation Reason 2')
INSERT [dbo].[CancelationReasons] ([id], [reason]) VALUES (4, N'Cancellation Reason 3')
INSERT [dbo].[CancelationReasons] ([id], [reason]) VALUES (5, N'Cancellation Reason 4')
SET IDENTITY_INSERT [dbo].[CancelationReasons] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([id], [EmployeeID], [Fname], [Lname], [Genderid], [RoleTypeId], [EmploymentDate], [Vacation], [Sick], [Department], [Personal]) VALUES (1, N'1234', N'Kemoy', N'Gallimore', 2, 2, CAST(N'2010-02-20' AS Date), 10, 10, 9, 8)
INSERT [dbo].[Employee] ([id], [EmployeeID], [Fname], [Lname], [Genderid], [RoleTypeId], [EmploymentDate], [Vacation], [Sick], [Department], [Personal]) VALUES (2, N'4321', N'John', N'Brown', 2, 4, CAST(N'2020-03-30' AS Date), 15, 10, 9, 8)
INSERT [dbo].[Employee] ([id], [EmployeeID], [Fname], [Lname], [Genderid], [RoleTypeId], [EmploymentDate], [Vacation], [Sick], [Department], [Personal]) VALUES (3, N'2468', N'Mary', N'Jane', 3, 3, CAST(N'2000-01-10' AS Date), 17, 10, 9, 8)
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Gender] ON 

INSERT [dbo].[Gender] ([id], [gender]) VALUES (1, N'Select Gender')
INSERT [dbo].[Gender] ([id], [gender]) VALUES (2, N'M')
INSERT [dbo].[Gender] ([id], [gender]) VALUES (3, N'F')
SET IDENTITY_INSERT [dbo].[Gender] OFF
GO
SET IDENTITY_INSERT [dbo].[LeaveStatus] ON 

INSERT [dbo].[LeaveStatus] ([id], [status]) VALUES (1, N'Select Status')
INSERT [dbo].[LeaveStatus] ([id], [status]) VALUES (2, N'Approved')
INSERT [dbo].[LeaveStatus] ([id], [status]) VALUES (3, N'Denied')
INSERT [dbo].[LeaveStatus] ([id], [status]) VALUES (4, N'Escalated')
INSERT [dbo].[LeaveStatus] ([id], [status]) VALUES (5, N'Pending')
INSERT [dbo].[LeaveStatus] ([id], [status]) VALUES (6, N'Cancelled')
SET IDENTITY_INSERT [dbo].[LeaveStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[LeaveSubmissionTable] ON 

INSERT [dbo].[LeaveSubmissionTable] ([id], [EmpID], [LeaveTypeId], [LeaveStatusId], [SubmissionDate], [StartDate], [EndDate], [TotalDays], [Comments], [CancelId]) VALUES (2, 1, 2, 5, CAST(N'2023-10-11' AS Date), CAST(N'2023-01-10' AS Date), CAST(N'2023-05-10' AS Date), 4, N'test', 2)
INSERT [dbo].[LeaveSubmissionTable] ([id], [EmpID], [LeaveTypeId], [LeaveStatusId], [SubmissionDate], [StartDate], [EndDate], [TotalDays], [Comments], [CancelId]) VALUES (3, 1, 5, 5, CAST(N'2023-10-11' AS Date), CAST(N'2023-01-10' AS Date), CAST(N'2023-04-10' AS Date), 3, N'test', 3)
INSERT [dbo].[LeaveSubmissionTable] ([id], [EmpID], [LeaveTypeId], [LeaveStatusId], [SubmissionDate], [StartDate], [EndDate], [TotalDays], [Comments], [CancelId]) VALUES (4, 1, 4, 5, CAST(N'2023-10-14' AS Date), CAST(N'2023-10-06' AS Date), CAST(N'2023-10-10' AS Date), 4, N'Additional Comments', 2)
INSERT [dbo].[LeaveSubmissionTable] ([id], [EmpID], [LeaveTypeId], [LeaveStatusId], [SubmissionDate], [StartDate], [EndDate], [TotalDays], [Comments], [CancelId]) VALUES (5, 1, 3, 5, CAST(N'2023-10-14' AS Date), CAST(N'2023-10-06' AS Date), CAST(N'2023-10-10' AS Date), 4, N'Additional Comments', 3)
INSERT [dbo].[LeaveSubmissionTable] ([id], [EmpID], [LeaveTypeId], [LeaveStatusId], [SubmissionDate], [StartDate], [EndDate], [TotalDays], [Comments], [CancelId]) VALUES (6, 1, 2, 5, CAST(N'2023-10-14' AS Date), CAST(N'2023-10-01' AS Date), CAST(N'2023-11-04' AS Date), 34, N'', 4)
INSERT [dbo].[LeaveSubmissionTable] ([id], [EmpID], [LeaveTypeId], [LeaveStatusId], [SubmissionDate], [StartDate], [EndDate], [TotalDays], [Comments], [CancelId]) VALUES (7, 2, 3, 6, CAST(N'2023-10-14' AS Date), CAST(N'2023-10-12' AS Date), CAST(N'2023-10-20' AS Date), 8, N'john''s comments', 3)
INSERT [dbo].[LeaveSubmissionTable] ([id], [EmpID], [LeaveTypeId], [LeaveStatusId], [SubmissionDate], [StartDate], [EndDate], [TotalDays], [Comments], [CancelId]) VALUES (8, 2, 2, 5, CAST(N'2023-10-14' AS Date), CAST(N'2023-09-28' AS Date), CAST(N'2023-09-30' AS Date), 2, N'', 4)
INSERT [dbo].[LeaveSubmissionTable] ([id], [EmpID], [LeaveTypeId], [LeaveStatusId], [SubmissionDate], [StartDate], [EndDate], [TotalDays], [Comments], [CancelId]) VALUES (12, 1, 4, 5, CAST(N'2023-10-16' AS Date), CAST(N'2023-09-24' AS Date), CAST(N'2023-09-30' AS Date), 6, N'this is with popup', NULL)
INSERT [dbo].[LeaveSubmissionTable] ([id], [EmpID], [LeaveTypeId], [LeaveStatusId], [SubmissionDate], [StartDate], [EndDate], [TotalDays], [Comments], [CancelId]) VALUES (13, 1, 4, 5, CAST(N'2023-10-16' AS Date), CAST(N'2023-09-24' AS Date), CAST(N'2023-09-30' AS Date), 6, N'this is with popup', NULL)
INSERT [dbo].[LeaveSubmissionTable] ([id], [EmpID], [LeaveTypeId], [LeaveStatusId], [SubmissionDate], [StartDate], [EndDate], [TotalDays], [Comments], [CancelId]) VALUES (14, 1, 2, 2, CAST(N'2023-10-16' AS Date), CAST(N'2023-09-24' AS Date), CAST(N'2023-09-30' AS Date), 6, N'this is with popup', NULL)
INSERT [dbo].[LeaveSubmissionTable] ([id], [EmpID], [LeaveTypeId], [LeaveStatusId], [SubmissionDate], [StartDate], [EndDate], [TotalDays], [Comments], [CancelId]) VALUES (15, 1, 4, 5, CAST(N'2023-10-16' AS Date), CAST(N'2023-09-24' AS Date), CAST(N'2023-09-30' AS Date), 6, N'', NULL)
INSERT [dbo].[LeaveSubmissionTable] ([id], [EmpID], [LeaveTypeId], [LeaveStatusId], [SubmissionDate], [StartDate], [EndDate], [TotalDays], [Comments], [CancelId]) VALUES (16, 1, 3, 3, CAST(N'2023-10-16' AS Date), CAST(N'2023-09-24' AS Date), CAST(N'2023-09-30' AS Date), 6, N'', NULL)
INSERT [dbo].[LeaveSubmissionTable] ([id], [EmpID], [LeaveTypeId], [LeaveStatusId], [SubmissionDate], [StartDate], [EndDate], [TotalDays], [Comments], [CancelId]) VALUES (17, 1, 4, 2, CAST(N'2023-01-20' AS Date), CAST(N'2024-02-02' AS Date), CAST(N'2024-03-03' AS Date), 1, N'Testing', NULL)
INSERT [dbo].[LeaveSubmissionTable] ([id], [EmpID], [LeaveTypeId], [LeaveStatusId], [SubmissionDate], [StartDate], [EndDate], [TotalDays], [Comments], [CancelId]) VALUES (18, 2, 5, 2, CAST(N'2023-10-16' AS Date), CAST(N'2023-10-22' AS Date), CAST(N'2023-10-28' AS Date), 6, N'this is with popup', NULL)
SET IDENTITY_INSERT [dbo].[LeaveSubmissionTable] OFF
GO
SET IDENTITY_INSERT [dbo].[LeaveTypes] ON 

INSERT [dbo].[LeaveTypes] ([id], [Type]) VALUES (1, N'Select a Leave Type')
INSERT [dbo].[LeaveTypes] ([id], [Type]) VALUES (2, N'Sick')
INSERT [dbo].[LeaveTypes] ([id], [Type]) VALUES (3, N'Personal')
INSERT [dbo].[LeaveTypes] ([id], [Type]) VALUES (4, N'Department')
INSERT [dbo].[LeaveTypes] ([id], [Type]) VALUES (5, N'Vacation')
SET IDENTITY_INSERT [dbo].[LeaveTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[RoleTypes] ON 

INSERT [dbo].[RoleTypes] ([id], [roles]) VALUES (1, N'Select Role')
INSERT [dbo].[RoleTypes] ([id], [roles]) VALUES (2, N'Admin')
INSERT [dbo].[RoleTypes] ([id], [roles]) VALUES (3, N'Manager')
INSERT [dbo].[RoleTypes] ([id], [roles]) VALUES (4, N'Staff')
SET IDENTITY_INSERT [dbo].[RoleTypes] OFF
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK__Genderid__Gender] FOREIGN KEY([Genderid])
REFERENCES [dbo].[Gender] ([id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK__Genderid__Gender]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_RoleTypes] FOREIGN KEY([RoleTypeId])
REFERENCES [dbo].[RoleTypes] ([id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_RoleTypes]
GO
ALTER TABLE [dbo].[LeaveSubmissionTable]  WITH CHECK ADD  CONSTRAINT [FK LeaveTypeId_LeaveTypes] FOREIGN KEY([LeaveTypeId])
REFERENCES [dbo].[LeaveStatus] ([id])
GO
ALTER TABLE [dbo].[LeaveSubmissionTable] CHECK CONSTRAINT [FK LeaveTypeId_LeaveTypes]
GO
ALTER TABLE [dbo].[LeaveSubmissionTable]  WITH CHECK ADD  CONSTRAINT [FK__LeaveSubm__EmpID__29221CFB] FOREIGN KEY([EmpID])
REFERENCES [dbo].[Employee] ([id])
GO
ALTER TABLE [dbo].[LeaveSubmissionTable] CHECK CONSTRAINT [FK__LeaveSubm__EmpID__29221CFB]
GO
ALTER TABLE [dbo].[LeaveSubmissionTable]  WITH CHECK ADD  CONSTRAINT [FK_Cancelid_Cancel] FOREIGN KEY([CancelId])
REFERENCES [dbo].[CancelationReasons] ([id])
GO
ALTER TABLE [dbo].[LeaveSubmissionTable] CHECK CONSTRAINT [FK_Cancelid_Cancel]
GO
ALTER TABLE [dbo].[LeaveSubmissionTable]  WITH CHECK ADD  CONSTRAINT [FK_LeaveStatusid_LeaveStatus] FOREIGN KEY([LeaveStatusId])
REFERENCES [dbo].[LeaveStatus] ([id])
GO
ALTER TABLE [dbo].[LeaveSubmissionTable] CHECK CONSTRAINT [FK_LeaveStatusid_LeaveStatus]
GO
/****** Object:  StoredProcedure [dbo].[FilterbyAllFields]    Script Date: 10/29/2023 10:21:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[FilterbyAllFields] 
	-- Add the parameters for the stored procedure here
	@EmpID nvarchar(5),
	@type nvarchar(20) = '',
	@status nvarchar(20)= '',
	@StartDate nvarchar(10) = '',
	@EndDate nvarchar(10) = ''
	
AS
BEGIN
	DECLARE @sql NVARCHAR(MAX)

    SET @sql = 'SELECT * FROM [LeaveManagementSystem].[dbo].[ViewAll] WHERE EmployeeID = @EmpID'

    IF @Type <> ''
        SET @sql = @sql + ' AND Type = @Type'

    IF @Status <> ''
        SET @sql = @sql + ' AND Status = @Status'

    IF @StartDate <> ''
        SET @sql = @sql + ' AND StartDate >= @StartDate'

    IF @EndDate <> ''
        SET @sql = @sql + 'EndDate <= @EndDate'

    EXEC sp_executesql @sql, 
                       N'@EmpID NVARCHAR(5), @Type NVARCHAR(20), @Status NVARCHAR(20), @StartDate NVARCHAR(10), @EndDate NVARCHAR(10)',
                       @EmpID, @Type, @Status, @StartDate, @EndDate
END

GO
/****** Object:  StoredProcedure [dbo].[InsertLeaveRequest]    Script Date: 10/29/2023 10:21:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<This procedure should accept the values from the submission page and input into the leave submission table>
-- =============================================
CREATE PROCEDURE [dbo].[InsertLeaveRequest]
	-- Add the parameters for the stored procedure here
	@Empid int,
	@SubmissionDate date,
	@LeaveTypeId int,
	@StartDate Date,
	@EndDate Date,
	@TotalDays int,
	@Comments nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into LeaveSubmissionTable (EmpID, SubmissionDate, LeaveTypeId, StartDate, EndDate, TotalDays, Comments,leaveStatusId)
	VALUES (@Empid, @SubmissionDate, @LeaveTypeId, @StartDate, @EndDate, @TotalDays, @Comments, 5)
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateLeaveStatus]    Script Date: 10/29/2023 10:21:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<This procedure should update the leave status based on the selection>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateLeaveStatus] 
	-- Add the parameters for the stored procedure here
	@LeaveID int,
	@NewStatus int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update LeaveSubmissionTable
	set LeaveStatusId = @NewStatus
	where id=@LeaveID
END
GO
USE [master]
GO
ALTER DATABASE [LeaveManagementSystem] SET  READ_WRITE 
GO
