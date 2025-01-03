USE [m_checklist2]
GO
/****** Object:  Table [dbo].[AppConfig]    Script Date: 11/11/2024 4:41:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppConfig](
	[AppID] [nchar](2) NULL,
	[AppName] [nvarchar](50) NOT NULL,
	[GroupMachine] [nvarchar](9) NOT NULL,
	[Machine] [nvarchar](9) NOT NULL,
	[CheckList] [nvarchar](9) NOT NULL,
	[GroupCheckList] [nvarchar](9) NOT NULL,
	[CheckListOption] [nvarchar](9) NOT NULL,
	[MatchCheckListOption] [nvarchar](9) NOT NULL,
	[MatchFormMachine] [nvarchar](9) NOT NULL,
	[Form] [nvarchar](9) NOT NULL,
	[SubForm] [nvarchar](9) NOT NULL,
	[ExpectedResult] [nvarchar](9) NOT NULL,
	[UsersPermission] [nvarchar](9) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CheckListOptions]    Script Date: 11/11/2024 4:41:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CheckListOptions](
	[CLOptionID] [nvarchar](9) NOT NULL,
	[CLOptionName] [nvarchar](150) NOT NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK__CheckLis__97C19B3B38B96646] PRIMARY KEY CLUSTERED 
(
	[CLOptionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CheckLists]    Script Date: 11/11/2024 4:41:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CheckLists](
	[CListID] [nvarchar](9) NOT NULL,
	[CListName] [nvarchar](150) NOT NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK__CheckLis__E7FFED9434E8D562] PRIMARY KEY CLUSTERED 
(
	[CListID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CheckListTypes]    Script Date: 11/11/2024 4:41:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CheckListTypes](
	[CTypeID] [nvarchar](9) NOT NULL,
	[CTypeName] [nvarchar](150) NOT NULL,
	[Icon] [nvarchar](150) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK__CheckLis__E83DD3152D47B39A] PRIMARY KEY CLUSTERED 
(
	[CTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DataTypes]    Script Date: 11/11/2024 4:41:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataTypes](
	[DTypeID] [nvarchar](9) NOT NULL,
	[DTypeName] [nvarchar](150) NOT NULL,
	[Icon] [nvarchar](150) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK__DataType__81BD9F023118447E] PRIMARY KEY CLUSTERED 
(
	[DTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExpectedResults]    Script Date: 11/11/2024 4:41:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExpectedResults](
	[EResultID] [int] IDENTITY(1,1) NOT NULL,
	[MCListID] [int] NULL,
	[FormID] [nvarchar](9) NULL,
	[MachineID] [nvarchar](9) NULL,
	[GCLOptionID] [nvarchar](9) NULL,
	[UserID] [nvarchar](9) NULL,
	[TableID] [nvarchar](9) NULL,
	[EResult] [nvarchar](255) NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK__Expected__436EC1725B0E7E4A] PRIMARY KEY CLUSTERED 
(
	[EResultID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Forms]    Script Date: 11/11/2024 4:41:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Forms](
	[FormID] [nvarchar](9) NOT NULL,
	[FormName] [nvarchar](150) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK__Forms__FB05B7BD414EAC47] PRIMARY KEY CLUSTERED 
(
	[FormID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupCheckListOptions]    Script Date: 11/11/2024 4:41:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupCheckListOptions](
	[GCLOptionID] [nvarchar](9) NOT NULL,
	[GCLOptionName] [nvarchar](150) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_GroupCheckListOptions] PRIMARY KEY CLUSTERED 
(
	[GCLOptionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupMachines]    Script Date: 11/11/2024 4:41:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupMachines](
	[GMachineID] [nvarchar](9) NOT NULL,
	[GMachineName] [nvarchar](150) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK__MachineG__4E2BE5D149E3F248] PRIMARY KEY CLUSTERED 
(
	[GMachineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupPermissions]    Script Date: 11/11/2024 4:41:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupPermissions](
	[GuserID] [nvarchar](9) NOT NULL,
	[PermissionID] [int] NOT NULL,
	[PermissionStatus] [bit] NULL,
	[IsActive] [bit] NULL,
	[Create_Date] [datetime] NULL,
 CONSTRAINT [PK__GroupPer__6D5BC11D7E7D8112] PRIMARY KEY CLUSTERED 
(
	[GuserID] ASC,
	[PermissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupUsers]    Script Date: 11/11/2024 4:41:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupUsers](
	[GUserID] [nvarchar](9) NOT NULL,
	[GUserName] [nvarchar](150) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_GroupUsers] PRIMARY KEY CLUSTERED 
(
	[GUserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Importants]    Script Date: 11/11/2024 4:41:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Importants](
	[ImportantID] [int] IDENTITY(1,1) NOT NULL,
	[MCListID] [int] NULL,
	[Value] [nvarchar](9) NULL,
	[MinLength] [float] NULL,
	[MaxLength] [float] NULL,
 CONSTRAINT [PK_Importants_1] PRIMARY KEY CLUSTERED 
(
	[ImportantID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Logs]    Script Date: 11/11/2024 4:41:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Author] [nvarchar](150) NULL,
	[Messages] [nvarchar](max) NULL,
	[Type] [nvarchar](9) NULL,
	[Create_Date] [datetime2](7) NOT NULL,
 CONSTRAINT [PK__Logs__3214EC07113584D1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Machines]    Script Date: 11/11/2024 4:41:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Machines](
	[MachineID] [nvarchar](9) NOT NULL,
	[FormID] [nvarchar](9) NULL,
	[GMachineID] [nvarchar](9) NULL,
	[MachineCode] [nvarchar](15) NULL,
	[MachineName] [nvarchar](150) NOT NULL,
	[Building] [nvarchar](150) NULL,
	[Floor] [nvarchar](150) NULL,
	[Area] [nvarchar](150) NULL,
	[Description] [nvarchar](255) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK__Machines__44EE5B584DB4832C] PRIMARY KEY CLUSTERED 
(
	[MachineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MatchCheckList]    Script Date: 11/11/2024 4:41:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MatchCheckList](
	[MCListID] [int] IDENTITY(1,1) NOT NULL,
	[CListID] [nvarchar](9) NULL,
	[GCLOptionID] [nvarchar](9) NULL,
	[CTypeID] [nvarchar](9) NULL,
	[DTypeID] [nvarchar](9) NULL,
	[DTypeValue] [tinyint] NULL,
	[SFormID] [nvarchar](9) NULL,
	[Important] [bit] NULL,
	[GImportantID] [nvarchar](9) NULL,
	[Required] [bit] NOT NULL,
	[MinLength] [float] NULL,
	[MaxLength] [float] NULL,
	[Description] [nvarchar](max) NULL,
	[Placeholder] [nvarchar](150) NULL,
	[Hint] [nvarchar](150) NULL,
	[DisplayOrder] [tinyint] NOT NULL,
 CONSTRAINT [PK__MatchChe__7989A385536D5C82] PRIMARY KEY CLUSTERED 
(
	[MCListID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MatchCheckListOption]    Script Date: 11/11/2024 4:41:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MatchCheckListOption](
	[MCLOptionID] [nvarchar](9) NOT NULL,
	[GCLOptionID] [nvarchar](9) NULL,
	[CLOptionID] [nvarchar](9) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_MatchCheckListOption] PRIMARY KEY CLUSTERED 
(
	[MCLOptionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 11/11/2024 4:41:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[MenuID] [int] IDENTITY(1,1) NOT NULL,
	[MenuPermission] [nvarchar](50) NOT NULL,
	[MenuLabel] [nvarchar](50) NULL,
	[Description] [nvarchar](255) NULL,
	[ParentMenuID] [int] NULL,
	[PermissionID] [int] NULL,
	[Path] [nvarchar](150) NULL,
	[NavigationTo] [nvarchar](50) NULL,
	[OrderNo] [int] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK__Menu__C99ED2506608FE5D] PRIMARY KEY CLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permissions]    Script Date: 11/11/2024 4:41:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permissions](
	[PermissionID] [int] IDENTITY(1,1) NOT NULL,
	[PermissionName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[PermissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubForms]    Script Date: 11/11/2024 4:41:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubForms](
	[SFormID] [nvarchar](9) NOT NULL,
	[FormID] [nvarchar](9) NULL,
	[SFormName] [nvarchar](150) NOT NULL,
	[Columns] [tinyint] NOT NULL,
	[DisplayOrder] [tinyint] NOT NULL,
 CONSTRAINT [PK__SubForms__B7312FA8451F3D2B] PRIMARY KEY CLUSTERED 
(
	[SFormID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/11/2024 4:41:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [nvarchar](9) NOT NULL,
	[UserName] [nvarchar](150) NULL,
	[GUserID] [nvarchar](9) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AppConfig] ([AppID], [AppName], [GroupMachine], [Machine], [CheckList], [GroupCheckList], [CheckListOption], [MatchCheckListOption], [MatchFormMachine], [Form], [SubForm], [ExpectedResult], [UsersPermission]) VALUES (N'A1', N'PMChecklist2', N'GMmm', N'MLG', N'CL', N'GCL', N'CLO', N'MCLO', N'MCLO', N'F', N'SF', N'ER', N'U')
GO
INSERT [dbo].[CheckListOptions] ([CLOptionID], [CLOptionName], [IsActive]) VALUES (N'CLO000001', N'ปน', 1)
INSERT [dbo].[CheckListOptions] ([CLOptionID], [CLOptionName], [IsActive]) VALUES (N'CLO000002', N'ไม่ปน', 1)
INSERT [dbo].[CheckListOptions] ([CLOptionID], [CLOptionName], [IsActive]) VALUES (N'CLO000003', N'ลมดูด', 1)
INSERT [dbo].[CheckListOptions] ([CLOptionID], [CLOptionName], [IsActive]) VALUES (N'CLO000004', N'ลมไม่ดูด', 1)
INSERT [dbo].[CheckListOptions] ([CLOptionID], [CLOptionName], [IsActive]) VALUES (N'CLO000005', N'ปกติ', 1)
INSERT [dbo].[CheckListOptions] ([CLOptionID], [CLOptionName], [IsActive]) VALUES (N'CLO000006', N'ไม่ปกติ', 1)
INSERT [dbo].[CheckListOptions] ([CLOptionID], [CLOptionName], [IsActive]) VALUES (N'CLO000007', N'ผิดปกติ', 1)
INSERT [dbo].[CheckListOptions] ([CLOptionID], [CLOptionName], [IsActive]) VALUES (N'CLO000008', N'ละเอียด', 1)
INSERT [dbo].[CheckListOptions] ([CLOptionID], [CLOptionName], [IsActive]) VALUES (N'CLO000009', N'หยาบ', 1)
INSERT [dbo].[CheckListOptions] ([CLOptionID], [CLOptionName], [IsActive]) VALUES (N'CLO000010', N'ตัน', 1)
INSERT [dbo].[CheckListOptions] ([CLOptionID], [CLOptionName], [IsActive]) VALUES (N'CLO000011', N'ไม่ตัน', 1)
INSERT [dbo].[CheckListOptions] ([CLOptionID], [CLOptionName], [IsActive]) VALUES (N'CLO000012', N'ชนิดของวัสดุ', 1)
INSERT [dbo].[CheckListOptions] ([CLOptionID], [CLOptionName], [IsActive]) VALUES (N'CLO000013', N'อื่นๆ', 1)
GO
INSERT [dbo].[CheckLists] ([CListID], [CListName], [IsActive]) VALUES (N'CL0000001', N'เวลา', 1)
INSERT [dbo].[CheckLists] ([CListID], [CListName], [IsActive]) VALUES (N'CL0000002', N'ชนิดข้าว', 1)
INSERT [dbo].[CheckLists] ([CListID], [CListName], [IsActive]) VALUES (N'CL0000003', N'กากข้าวมีข้าวดีปนหรือไม่', 1)
INSERT [dbo].[CheckLists] ([CListID], [CListName], [IsActive]) VALUES (N'CL0000004', N'ระบบลมดูด', 1)
INSERT [dbo].[CheckLists] ([CListID], [CListName], [IsActive]) VALUES (N'CL0000005', N'สภาพตะแกรง', 1)
INSERT [dbo].[CheckLists] ([CListID], [CListName], [IsActive]) VALUES (N'CL0000006', N'การทำงานของเครื่องจักร', 1)
INSERT [dbo].[CheckLists] ([CListID], [CListName], [IsActive]) VALUES (N'CL0000007', N'วิธีการแก้ไข', 1)
INSERT [dbo].[CheckLists] ([CListID], [CListName], [IsActive]) VALUES (N'CL0000008', N'ผู้ตรวจ', 1)
INSERT [dbo].[CheckLists] ([CListID], [CListName], [IsActive]) VALUES (N'CL0000009', N'ตรวจสอบโดย หัวหน้ากะ', 1)
INSERT [dbo].[CheckLists] ([CListID], [CListName], [IsActive]) VALUES (N'CL0000010', N'หมายเหตุ', 1)
INSERT [dbo].[CheckLists] ([CListID], [CListName], [IsActive]) VALUES (N'CL0000011', N'ให้เช็คเครื่องจักรอย่างน้อย 1 ครั้ง ใน 2 ชั่วโมง', 1)
INSERT [dbo].[CheckLists] ([CListID], [CListName], [IsActive]) VALUES (N'CL0000012', N'รายการช่อง 1 ให้ระบุ "ปน" หรือ "ไม่ปน"  ถ้าระบุ "ปน" ให้แจ้งหัวหน้างานทำการแก้ไข', 1)
INSERT [dbo].[CheckLists] ([CListID], [CListName], [IsActive]) VALUES (N'CL0000013', N'รายการช่อง 3 ให้ระบุ "ปกติ" หรือ "ไม่ปกติ" ถ้าระบุ "ไม่ปกติ" ให้แจ้งหัวหน้างานทำการแก้ไข', 1)
INSERT [dbo].[CheckLists] ([CListID], [CListName], [IsActive]) VALUES (N'CL0000014', N'รายการช่อง 4 ให้ระบุ "ปกติ" หรือ "ผิดปกติ" ถ้าระบุ "ผิดปกติ" ให้แจ้งหัวหน้างานหรือช่างทำการแก้ไข', 1)
INSERT [dbo].[CheckLists] ([CListID], [CListName], [IsActive]) VALUES (N'CL0000015', N'ผู้มีหน้าที่ทำ  CHECK  LIST  คือ  พนักงาน  MILLHAND  ขึ้นไป  ', 1)
INSERT [dbo].[CheckLists] ([CListID], [CListName], [IsActive]) VALUES (N'CL0000016', N'ระบบเครื่องจักรมีปัญหาให้แจ้งหัวหน้างาน', 1)
INSERT [dbo].[CheckLists] ([CListID], [CListName], [IsActive]) VALUES (N'CL0000017', N'ลักษณะ  STOCK', 1)
INSERT [dbo].[CheckLists] ([CListID], [CListName], [IsActive]) VALUES (N'CL0000018', N'ปัญหาที่พบ', 1)
INSERT [dbo].[CheckLists] ([CListID], [CListName], [IsActive]) VALUES (N'CL0000019', N'ช่อง  "ละเอียด"  ให้ระบุ  "ละเอียด"', 1)
INSERT [dbo].[CheckLists] ([CListID], [CListName], [IsActive]) VALUES (N'CL0000020', N'ช่อง  "หยาบ"  ให้ระบุ  "หยาบ"', 1)
INSERT [dbo].[CheckLists] ([CListID], [CListName], [IsActive]) VALUES (N'CL0000021', N'ถ้า  STOCK  ละเอียด   คือ  STOCK   ดี', 1)
INSERT [dbo].[CheckLists] ([CListID], [CListName], [IsActive]) VALUES (N'CL0000022', N'ถ้า  STOCK   หยาบ  คือ   STOCK  ไม่ดี  ให้แจ้งหัวหน้างานทำการแก้ไข', 1)
INSERT [dbo].[CheckLists] ([CListID], [CListName], [IsActive]) VALUES (N'CL0000023', N'ผู้มีหน้าที่  CHECK  LIST  คือ  พนักงาน  MILLHAND   ขึ้นไป', 1)
INSERT [dbo].[CheckLists] ([CListID], [CListName], [IsActive]) VALUES (N'CL0000024', N'ระบบเครื่องจักรมีปํญหาให้แจ้งหัวหน้างาน', 1)
INSERT [dbo].[CheckLists] ([CListID], [CListName], [IsActive]) VALUES (N'CL0000025', N'ช่องระบาย Aข้าวดีปนหรือไม่', 1)
INSERT [dbo].[CheckLists] ([CListID], [CListName], [IsActive]) VALUES (N'CL0000026', N'ช่องระบาย Bข้าวดีปนหรือไม่', 1)
INSERT [dbo].[CheckLists] ([CListID], [CListName], [IsActive]) VALUES (N'CL0000027', N'สภาพตะแกรงก่อนSTARTเครื่อง', 1)
INSERT [dbo].[CheckLists] ([CListID], [CListName], [IsActive]) VALUES (N'CL0000028', N'รายการช่อง 2  ให้ระบุ "ปน"  หรือ "ไม่ปน"  ถ้าระบุ  "ปน "ให้แจ้งหัวหน้างานทำการแก้ไข', 1)
INSERT [dbo].[CheckLists] ([CListID], [CListName], [IsActive]) VALUES (N'CL0000029', N'รายการช่อง 3 ให้ระบุ "ลมดูด"หรือ "ลมไม่ดูด" ถ้าระบุ "ลมไม่ดูด" ให้แจ้งหัวหน้างานทำการแก้ไข', 1)
INSERT [dbo].[CheckLists] ([CListID], [CListName], [IsActive]) VALUES (N'CL0000030', N'รายการช่อง 5 ให้ระบุสภาพตะแกรงปกติ หรือไม่ปกติ ถ้าระบุว่าไม่ปกติ ให้แจ้งหัวหน้ากะทำการแก้ไข ให้ปฏิบัติก่อนการเดินเครื่องจักรทุกครั้ง ', 1)
INSERT [dbo].[CheckLists] ([CListID], [CListName], [IsActive]) VALUES (N'CL0000031', N'ระบบ JET', 1)
INSERT [dbo].[CheckLists] ([CListID], [CListName], [IsActive]) VALUES (N'CL0000032', N'ฝุ่นตันในถัง', 1)
INSERT [dbo].[CheckLists] ([CListID], [CListName], [IsActive]) VALUES (N'CL0000033', N'ให้เช็คอย่างน้อย 1  ครั้ง  ใน  2  ชั่วโมง', 1)
INSERT [dbo].[CheckLists] ([CListID], [CListName], [IsActive]) VALUES (N'CL0000034', N'ระบบ JET ถ้าปกติให้ใส่เครื่องหมายในช่องปกติ ถ้าไม่ปกติให้ใส่เครื่องหมายในช่องไม่ปกติ ', 1)
INSERT [dbo].[CheckLists] ([CListID], [CListName], [IsActive]) VALUES (N'CL0000035', N'ฝุ่นตันในถัง ถ้าไม่ตันให้ใส่เครื่องหมายในช่องไม่ตัน ถ้าตันให้ใส่เครื่องหมายในช่องตัน ', 1)
INSERT [dbo].[CheckLists] ([CListID], [CListName], [IsActive]) VALUES (N'CL0000036', N'รายการตรวจเช็ค', 1)
INSERT [dbo].[CheckLists] ([CListID], [CListName], [IsActive]) VALUES (N'CL0000037', N'ช่องเศษฟางมีข้าวดีปนหรือไม่', 1)
INSERT [dbo].[CheckLists] ([CListID], [CListName], [IsActive]) VALUES (N'CL0000038', N'ช่องฝุ่นมีข้าวดีปนหรือไม่', 1)
INSERT [dbo].[CheckLists] ([CListID], [CListName], [IsActive]) VALUES (N'CL0000039', N'ชนิดของวัสดุ', 1)
INSERT [dbo].[CheckLists] ([CListID], [CListName], [IsActive]) VALUES (N'CL0000040', N'อื่นๆ', 1)
INSERT [dbo].[CheckLists] ([CListID], [CListName], [IsActive]) VALUES (N'CL0000041', N'วัสดุที่พบในแม่เหล็ก', 1)
INSERT [dbo].[CheckLists] ([CListID], [CListName], [IsActive]) VALUES (N'CL0000042', N'ให้ทำการตรวจแม่เหล็กอย่างน้อย 1 ครั้งใน 4 ชั่วโมง (2 ครั้ง ต่อ 1 กะ)', 1)
INSERT [dbo].[CheckLists] ([CListID], [CListName], [IsActive]) VALUES (N'CL0000043', N'หากไม่พบวัสดุในแม่เหล็กให้ระบุ "ไม่พบ"  หาก "พบ"  ให้ระบุชนิดที่พบ', 1)
INSERT [dbo].[CheckLists] ([CListID], [CListName], [IsActive]) VALUES (N'CL0000044', N'ถ้าพบวัสดุให้ระบุชนิดของวัสดุนั้น ๆ แล้วสวมถุงมือผ้าเก็บวัสดุออก', 1)
INSERT [dbo].[CheckLists] ([CListID], [CListName], [IsActive]) VALUES (N'CL0000045', N'ช่องหินออกปกติ หรือไม่ปกติ', 1)
INSERT [dbo].[CheckLists] ([CListID], [CListName], [IsActive]) VALUES (N'CL0000046', N'ระบบลมดูด 0-15', 1)
INSERT [dbo].[CheckLists] ([CListID], [CListName], [IsActive]) VALUES (N'CL0000047', N'ค่าความสั่นของเครื่อง MIN - MIX 4 - 5 ', 1)
INSERT [dbo].[CheckLists] ([CListID], [CListName], [IsActive]) VALUES (N'CL0000048', N'รายการตรวจเช็คระบบ', 1)
INSERT [dbo].[CheckLists] ([CListID], [CListName], [IsActive]) VALUES (N'CL0000049', N'รายการช่อง 1  ให้ระบุ  "ปกติ"  หรือ "ไม่ปกติ"  ถ้าระบุ  "ไม่ปกติ "  ให้ปฏิบัติตามวิธีการแก้ไข', 1)
INSERT [dbo].[CheckLists] ([CListID], [CListName], [IsActive]) VALUES (N'CL0000050', N'รายการช่อง 2 ให้ระบุ "ตัวเลขค่าของลมดูด" ตามค่าที่กำหนดถ้าสูงกว่าให้ปฏิบัติตามวิธีการแก้ไข', 1)
INSERT [dbo].[CheckLists] ([CListID], [CListName], [IsActive]) VALUES (N'CL0000051', N'รายการช่อง 3  ให้ระบุความสั่นของเครื่อง ถ้าความสั่น ต่ำ หรือ สูง กว่ากำหนด  ให้แจ้งหัวหน้ากะ ทันที หัวหน้ากะแจ้งช่างประจำกะ ให้ทำการตรวจสอบทันที', 1)
INSERT [dbo].[CheckLists] ([CListID], [CListName], [IsActive]) VALUES (N'CL0000052', N'พนักงาน  Millhand  แจ้งให้  Miller  ทราบ', 1)
INSERT [dbo].[CheckLists] ([CListID], [CListName], [IsActive]) VALUES (N'CL0000053', N'Miller แจ้งหัวหน้าแผนกผลิต และแจ้งช่างซ่อมประจำกะให้ทำการตรวจสอบและแก้ไขทันที', 1)
INSERT [dbo].[CheckLists] ([CListID], [CListName], [IsActive]) VALUES (N'CL0000054', N'Miller ทำการปรับลดกำลังการล้างข้าวสาลีลง เพื่อให้การแยกหิน - ทราย  ออกในขั้นตอนการล้างข้าวต่อไป', 1)
INSERT [dbo].[CheckLists] ([CListID], [CListName], [IsActive]) VALUES (N'CL0000055', N'ถ้าพบว่าในช่องหินไม่มีข้าวปนเลย  รวมทั้งระบบลมดูด และค่าความสั่นของเครื่องไม่อยู่ในเกณฑ์ให้ดำเนินการดังนี้', 1)
INSERT [dbo].[CheckLists] ([CListID], [CListName], [IsActive]) VALUES (N'CL0000056', N'ระบุเลข Presser Dust 0 - 20', 1)
INSERT [dbo].[CheckLists] ([CListID], [CListName], [IsActive]) VALUES (N'CL0000057', N'ระบุตัวเลข แรงดันลม 4 - 5 Bar', 1)
INSERT [dbo].[CheckLists] ([CListID], [CListName], [IsActive]) VALUES (N'CL0000058', N'ระบุตัวเลข Feed Product', 1)
INSERT [dbo].[CheckLists] ([CListID], [CListName], [IsActive]) VALUES (N'CL0000059', N'เปอร์เซ็นต์(%)ของค่าการคัดแยก โปรดระบุเป็นตัวเลข						 						', 1)
INSERT [dbo].[CheckLists] ([CListID], [CListName], [IsActive]) VALUES (N'CL0000060', N'ถ้าพบ  Presser Dust สูงกว่าที่กำหนด ให้ทำการตรวจเช็คการทำงานของระบบ Dust และถ้าผิดปกติให้ทำการแจ้งช่างทันที', 1)
INSERT [dbo].[CheckLists] ([CListID], [CListName], [IsActive]) VALUES (N'CL0000061', N'ถ้าแรงดันลมต่ำให้ตรวจสอบ % การคัดแยก และปั๊มลม', 1)
INSERT [dbo].[CheckLists] ([CListID], [CListName], [IsActive]) VALUES (N'CL0000062', N'การทำงานของเครื่องจักรผิดปกติ ให้ทำการแจ้งหัวหน้างาน เพื่อทำการแจ้งซ่อม', 1)
INSERT [dbo].[CheckLists] ([CListID], [CListName], [IsActive]) VALUES (N'CL0000063', N'เวลาทำความสะอาด', 1)
INSERT [dbo].[CheckLists] ([CListID], [CListName], [IsActive]) VALUES (N'CL0000064', N'รายการทำความสะอาด', 1)
INSERT [dbo].[CheckLists] ([CListID], [CListName], [IsActive]) VALUES (N'CL0000065', N'เวลาเริ่มเดินเครื่อง', 1)
INSERT [dbo].[CheckLists] ([CListID], [CListName], [IsActive]) VALUES (N'CL0000066', N'ผู้ปฎิบัติงาน', 1)
INSERT [dbo].[CheckLists] ([CListID], [CListName], [IsActive]) VALUES (N'CL0000067', N'ผู้ตรวจเช็ค', 1)
INSERT [dbo].[CheckLists] ([CListID], [CListName], [IsActive]) VALUES (N'CL0000068', N'ให้ทำความสะอาดแม่เหล็กก่อนเดินเครื่องจักรทุกครั้ง', 1)
INSERT [dbo].[CheckLists] ([CListID], [CListName], [IsActive]) VALUES (N'CL0000069', N'ผู้ทำ  CHECK LIST   คือ  พนักงาน  ASSISTANT  ขึ้นไป', 1)
GO
INSERT [dbo].[CheckListTypes] ([CTypeID], [CTypeName], [Icon], [IsActive]) VALUES (N'CT01', N'Textinput', N'format-text', 1)
INSERT [dbo].[CheckListTypes] ([CTypeID], [CTypeName], [Icon], [IsActive]) VALUES (N'CT02', N'Textarea', N'text-long', 1)
INSERT [dbo].[CheckListTypes] ([CTypeID], [CTypeName], [Icon], [IsActive]) VALUES (N'CT03', N'Radio', N'order-bool-ascending', 1)
INSERT [dbo].[CheckListTypes] ([CTypeID], [CTypeName], [Icon], [IsActive]) VALUES (N'CT04', N'Checkbox', N'order-bool-ascending-variant', 1)
INSERT [dbo].[CheckListTypes] ([CTypeID], [CTypeName], [Icon], [IsActive]) VALUES (N'CT05', N'Dropdown', N'format-list-group', 1)
INSERT [dbo].[CheckListTypes] ([CTypeID], [CTypeName], [Icon], [IsActive]) VALUES (N'CT06', N'Text', N'format-color-text', 1)
GO
INSERT [dbo].[DataTypes] ([DTypeID], [DTypeName], [Icon], [IsActive]) VALUES (N'DT01', N'String', N'format-color-text', 1)
INSERT [dbo].[DataTypes] ([DTypeID], [DTypeName], [Icon], [IsActive]) VALUES (N'DT02', N'Number', N'numeric', 1)
GO
SET IDENTITY_INSERT [dbo].[ExpectedResults] ON 

INSERT [dbo].[ExpectedResults] ([EResultID], [MCListID], [FormID], [MachineID], [GCLOptionID], [UserID], [TableID], [EResult], [CreateDate]) VALUES (326, 636, N'F00000001', N'M00000001', NULL, N'U00000001', N'ER0000001', N'APW', CAST(N'2024-11-06T15:25:24.000' AS DateTime))
INSERT [dbo].[ExpectedResults] ([EResultID], [MCListID], [FormID], [MachineID], [GCLOptionID], [UserID], [TableID], [EResult], [CreateDate]) VALUES (327, 637, N'F00000001', N'M00000001', N'GCL000001', N'U00000001', N'ER0000001', N'CLO000002', CAST(N'2024-11-06T15:25:24.000' AS DateTime))
INSERT [dbo].[ExpectedResults] ([EResultID], [MCListID], [FormID], [MachineID], [GCLOptionID], [UserID], [TableID], [EResult], [CreateDate]) VALUES (328, 638, N'F00000001', N'M00000001', N'GCL000002', N'U00000001', N'ER0000001', N'CLO000003', CAST(N'2024-11-06T15:25:24.000' AS DateTime))
INSERT [dbo].[ExpectedResults] ([EResultID], [MCListID], [FormID], [MachineID], [GCLOptionID], [UserID], [TableID], [EResult], [CreateDate]) VALUES (329, 639, N'F00000001', N'M00000001', N'GCL000003', N'U00000001', N'ER0000001', N'CLO000005', CAST(N'2024-11-06T15:25:24.000' AS DateTime))
INSERT [dbo].[ExpectedResults] ([EResultID], [MCListID], [FormID], [MachineID], [GCLOptionID], [UserID], [TableID], [EResult], [CreateDate]) VALUES (330, 640, N'F00000001', N'M00000001', N'GCL000004', N'U00000001', N'ER0000001', N'CLO000005', CAST(N'2024-11-06T15:25:24.000' AS DateTime))
INSERT [dbo].[ExpectedResults] ([EResultID], [MCListID], [FormID], [MachineID], [GCLOptionID], [UserID], [TableID], [EResult], [CreateDate]) VALUES (331, 641, N'F00000001', N'M00000001', NULL, N'U00000001', N'ER0000001', NULL, CAST(N'2024-11-06T15:25:24.000' AS DateTime))
INSERT [dbo].[ExpectedResults] ([EResultID], [MCListID], [FormID], [MachineID], [GCLOptionID], [UserID], [TableID], [EResult], [CreateDate]) VALUES (332, 642, N'F00000001', N'M00000001', NULL, N'U00000001', N'ER0000001', N'ขวัญชัย', CAST(N'2024-11-06T15:25:24.000' AS DateTime))
INSERT [dbo].[ExpectedResults] ([EResultID], [MCListID], [FormID], [MachineID], [GCLOptionID], [UserID], [TableID], [EResult], [CreateDate]) VALUES (333, 643, N'F00000001', N'M00000001', NULL, N'U00000001', N'ER0000001', N'กันตนา', CAST(N'2024-11-06T15:25:24.000' AS DateTime))
INSERT [dbo].[ExpectedResults] ([EResultID], [MCListID], [FormID], [MachineID], [GCLOptionID], [UserID], [TableID], [EResult], [CreateDate]) VALUES (334, 644, N'F00000001', N'M00000001', NULL, N'U00000001', N'ER0000001', NULL, CAST(N'2024-11-06T15:25:24.000' AS DateTime))
INSERT [dbo].[ExpectedResults] ([EResultID], [MCListID], [FormID], [MachineID], [GCLOptionID], [UserID], [TableID], [EResult], [CreateDate]) VALUES (335, 645, N'F00000001', N'M00000001', NULL, N'U00000001', N'ER0000001', NULL, CAST(N'2024-11-06T15:25:24.000' AS DateTime))
INSERT [dbo].[ExpectedResults] ([EResultID], [MCListID], [FormID], [MachineID], [GCLOptionID], [UserID], [TableID], [EResult], [CreateDate]) VALUES (336, 646, N'F00000001', N'M00000001', NULL, N'U00000001', N'ER0000001', NULL, CAST(N'2024-11-06T15:25:24.000' AS DateTime))
INSERT [dbo].[ExpectedResults] ([EResultID], [MCListID], [FormID], [MachineID], [GCLOptionID], [UserID], [TableID], [EResult], [CreateDate]) VALUES (337, 647, N'F00000001', N'M00000001', NULL, N'U00000001', N'ER0000001', NULL, CAST(N'2024-11-06T15:25:24.000' AS DateTime))
INSERT [dbo].[ExpectedResults] ([EResultID], [MCListID], [FormID], [MachineID], [GCLOptionID], [UserID], [TableID], [EResult], [CreateDate]) VALUES (338, 648, N'F00000001', N'M00000001', NULL, N'U00000001', N'ER0000001', NULL, CAST(N'2024-11-06T15:25:24.000' AS DateTime))
INSERT [dbo].[ExpectedResults] ([EResultID], [MCListID], [FormID], [MachineID], [GCLOptionID], [UserID], [TableID], [EResult], [CreateDate]) VALUES (339, 649, N'F00000001', N'M00000001', NULL, N'U00000001', N'ER0000001', NULL, CAST(N'2024-11-06T15:25:24.000' AS DateTime))
INSERT [dbo].[ExpectedResults] ([EResultID], [MCListID], [FormID], [MachineID], [GCLOptionID], [UserID], [TableID], [EResult], [CreateDate]) VALUES (340, 650, N'F00000001', N'M00000001', NULL, N'U00000001', N'ER0000001', NULL, CAST(N'2024-11-06T15:25:24.000' AS DateTime))
INSERT [dbo].[ExpectedResults] ([EResultID], [MCListID], [FormID], [MachineID], [GCLOptionID], [UserID], [TableID], [EResult], [CreateDate]) VALUES (341, 888, N'F00000013', N'MLG000008', N'GCL000015', N'U00000001', N'ER0000002', N'CLO000012', CAST(N'2024-11-08T10:55:13.000' AS DateTime))
INSERT [dbo].[ExpectedResults] ([EResultID], [MCListID], [FormID], [MachineID], [GCLOptionID], [UserID], [TableID], [EResult], [CreateDate]) VALUES (342, 889, N'F00000013', N'MLG000008', NULL, N'U00000001', N'ER0000002', N'เเเ', CAST(N'2024-11-08T10:55:13.000' AS DateTime))
INSERT [dbo].[ExpectedResults] ([EResultID], [MCListID], [FormID], [MachineID], [GCLOptionID], [UserID], [TableID], [EResult], [CreateDate]) VALUES (343, 890, N'F00000013', N'MLG000008', NULL, N'U00000001', N'ER0000002', N'ข', CAST(N'2024-11-08T10:55:13.000' AS DateTime))
INSERT [dbo].[ExpectedResults] ([EResultID], [MCListID], [FormID], [MachineID], [GCLOptionID], [UserID], [TableID], [EResult], [CreateDate]) VALUES (344, 891, N'F00000013', N'MLG000008', NULL, N'U00000001', N'ER0000002', N'ก', CAST(N'2024-11-08T10:55:13.000' AS DateTime))
INSERT [dbo].[ExpectedResults] ([EResultID], [MCListID], [FormID], [MachineID], [GCLOptionID], [UserID], [TableID], [EResult], [CreateDate]) VALUES (345, 892, N'F00000013', N'MLG000008', NULL, N'U00000001', N'ER0000002', NULL, CAST(N'2024-11-08T10:55:13.000' AS DateTime))
INSERT [dbo].[ExpectedResults] ([EResultID], [MCListID], [FormID], [MachineID], [GCLOptionID], [UserID], [TableID], [EResult], [CreateDate]) VALUES (346, 893, N'F00000013', N'MLG000008', NULL, N'U00000001', N'ER0000002', NULL, CAST(N'2024-11-08T10:55:13.000' AS DateTime))
INSERT [dbo].[ExpectedResults] ([EResultID], [MCListID], [FormID], [MachineID], [GCLOptionID], [UserID], [TableID], [EResult], [CreateDate]) VALUES (347, 894, N'F00000013', N'MLG000008', NULL, N'U00000001', N'ER0000002', NULL, CAST(N'2024-11-08T10:55:13.000' AS DateTime))
INSERT [dbo].[ExpectedResults] ([EResultID], [MCListID], [FormID], [MachineID], [GCLOptionID], [UserID], [TableID], [EResult], [CreateDate]) VALUES (348, 895, N'F00000013', N'MLG000008', NULL, N'U00000001', N'ER0000002', NULL, CAST(N'2024-11-08T10:55:13.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[ExpectedResults] OFF
GO
INSERT [dbo].[Forms] ([FormID], [FormName], [Description], [IsActive]) VALUES (N'F00000001', N'SCOURER - ASPIRATOR  ชั้น 2', N'ตารางการตรวจเช็คเครื่องจักร   SCOURER - ASPIRATOR  ชั้น 2', 1)
INSERT [dbo].[Forms] ([FormID], [FormName], [Description], [IsActive]) VALUES (N'F00000002', N'D_SCOURER - ASPIRATOR  ชั้น 2', N'D_ตารางการตรวจเช็คเครื่องจักร   SCOURER - ASPIRATOR  ชั้น 2', 1)
INSERT [dbo].[Forms] ([FormID], [FormName], [Description], [IsActive]) VALUES (N'F00000003', N'HAMMERMILL', N'ตารางการตรวจเช็คเครื่องจักร   HAMMERMILL', 1)
INSERT [dbo].[Forms] ([FormID], [FormName], [Description], [IsActive]) VALUES (N'F00000004', N'D_TestComponent', N'D_TestComponent', 1)
INSERT [dbo].[Forms] ([FormID], [FormName], [Description], [IsActive]) VALUES (N'F00000005', N'SEPARATOR ชั้น 7', N'ตารางการตรวจเช็คเครื่องจักร  SEPARATOR ชั้น 7', 1)
INSERT [dbo].[Forms] ([FormID], [FormName], [Description], [IsActive]) VALUES (N'F00000006', N'FILTER FC 1120, FC1382', N'ตารางการตรวจเช็คถัง FILTER FC 1120, FC1382', 1)
INSERT [dbo].[Forms] ([FormID], [FormName], [Description], [IsActive]) VALUES (N'F00000007', N'SEPARATOR-ASPIRATOR ชั้น 6', N'ตารางการตรวจเช็คเครื่องจักร  SEPARATOR-ASPIRATOR ชั้น 6', 1)
INSERT [dbo].[Forms] ([FormID], [FormName], [Description], [IsActive]) VALUES (N'F00000008', N'DE STONER (OPRP)', N'ตารางการตรวจเช็คเครื่องจักร  DE STONER  (จุด OPRP)', 1)
INSERT [dbo].[Forms] ([FormID], [FormName], [Description], [IsActive]) VALUES (N'F00000009', N'Sortex', N'ตารางการตรวจเช็คเครื่อง Sortex', 1)
INSERT [dbo].[Forms] ([FormID], [FormName], [Description], [IsActive]) VALUES (N'F00000010', N'Magnet E1', N'การทำความสะอาดแม่เหล็ก E1', 1)
INSERT [dbo].[Forms] ([FormID], [FormName], [Description], [IsActive]) VALUES (N'F00000011', N'SCOURER - ASPIRATOR  ชั้น 7_A', N'ตารางการตรวจเช็คเครื่องจักร   SCOURER - ASPIRATOR  ชั้น 7/รายการตรวจแม่เหล็ก   SCOURER - ASPIRATOR  (MILL WHEAT) ชั้น 7', 1)
INSERT [dbo].[Forms] ([FormID], [FormName], [Description], [IsActive]) VALUES (N'F00000012', N'Clean HAMMERMILL ', N'การทำความสะอาดแม่เหล็ก HAMMERMILL', 1)
INSERT [dbo].[Forms] ([FormID], [FormName], [Description], [IsActive]) VALUES (N'F00000013', N'แม่เหล็กตาชั่ง 1', N'รายการตรวจแม่เหล็กตาชั่ง B1', 1)
INSERT [dbo].[Forms] ([FormID], [FormName], [Description], [IsActive]) VALUES (N'F00000014', N'B1', N'B1', 1)
INSERT [dbo].[Forms] ([FormID], [FormName], [Description], [IsActive]) VALUES (N'F00000015', N'Magnet F1', N'รายการตรวจแม่เหล็ก F1 (MILL A)', 1)
GO
INSERT [dbo].[GroupCheckListOptions] ([GCLOptionID], [GCLOptionName], [IsActive]) VALUES (N'GCL000001', N'กากข้าวมีข้าวดีปนหรือไม่.', 1)
INSERT [dbo].[GroupCheckListOptions] ([GCLOptionID], [GCLOptionName], [IsActive]) VALUES (N'GCL000002', N'ระบบลมดูด', 1)
INSERT [dbo].[GroupCheckListOptions] ([GCLOptionID], [GCLOptionName], [IsActive]) VALUES (N'GCL000003', N'สภาพตะแกรง', 1)
INSERT [dbo].[GroupCheckListOptions] ([GCLOptionID], [GCLOptionName], [IsActive]) VALUES (N'GCL000004', N'การทำงานของเครื่องจักร', 1)
INSERT [dbo].[GroupCheckListOptions] ([GCLOptionID], [GCLOptionName], [IsActive]) VALUES (N'GCL000005', N'ลักษณะ  STOCK', 1)
INSERT [dbo].[GroupCheckListOptions] ([GCLOptionID], [GCLOptionName], [IsActive]) VALUES (N'GCL000006', N'ช่องระบาย Aข้าวดีปนหรือไม่', 1)
INSERT [dbo].[GroupCheckListOptions] ([GCLOptionID], [GCLOptionName], [IsActive]) VALUES (N'GCL000007', N'ช่องระบาย Bข้าวดีปนหรือไม่', 1)
INSERT [dbo].[GroupCheckListOptions] ([GCLOptionID], [GCLOptionName], [IsActive]) VALUES (N'GCL000008', N'สภาพตะแกรงก่อนSTARTเครื่อง', 1)
INSERT [dbo].[GroupCheckListOptions] ([GCLOptionID], [GCLOptionName], [IsActive]) VALUES (N'GCL000009', N'ระบบ JET', 1)
INSERT [dbo].[GroupCheckListOptions] ([GCLOptionID], [GCLOptionName], [IsActive]) VALUES (N'GCL000010', N'ฝุ่นตันในถัง', 1)
INSERT [dbo].[GroupCheckListOptions] ([GCLOptionID], [GCLOptionName], [IsActive]) VALUES (N'GCL000011', N'ช่องเศษฟางมีข้าวดีปนหรือไม่', 1)
INSERT [dbo].[GroupCheckListOptions] ([GCLOptionID], [GCLOptionName], [IsActive]) VALUES (N'GCL000012', N'ช่องฝุ่นมีข้าวดีปนหรือไม่', 1)
INSERT [dbo].[GroupCheckListOptions] ([GCLOptionID], [GCLOptionName], [IsActive]) VALUES (N'GCL000013', N'ชนิดของวัสดุ', 1)
INSERT [dbo].[GroupCheckListOptions] ([GCLOptionID], [GCLOptionName], [IsActive]) VALUES (N'GCL000014', N'อื่นๆ', 1)
INSERT [dbo].[GroupCheckListOptions] ([GCLOptionID], [GCLOptionName], [IsActive]) VALUES (N'GCL000015', N'วัสดุที่พบในแม่เหล็ก', 1)
INSERT [dbo].[GroupCheckListOptions] ([GCLOptionID], [GCLOptionName], [IsActive]) VALUES (N'GCL000016', N'ให้ทำการตรวจแม่เหล็กอย่างน้อย 1 ครั้งใน 4 ชั่วโมง (2 ครั้ง ต่อ 1 กะ)', 1)
INSERT [dbo].[GroupCheckListOptions] ([GCLOptionID], [GCLOptionName], [IsActive]) VALUES (N'GCL000017', N'หากไม่พบวัสดุในแม่เหล็กให้ระบุ "ไม่พบ"  หาก "พบ"  ให้ระบุชนิดที่พบ', 1)
INSERT [dbo].[GroupCheckListOptions] ([GCLOptionID], [GCLOptionName], [IsActive]) VALUES (N'GCL000018', N'ถ้าพบวัสดุให้ระบุชนิดของวัสดุนั้น ๆ แล้วสวมถุงมือผ้าเก็บวัสดุออก', 1)
INSERT [dbo].[GroupCheckListOptions] ([GCLOptionID], [GCLOptionName], [IsActive]) VALUES (N'GCL000019', N'ช่องหินออกปกติ หรือไม่ปกติ', 1)
INSERT [dbo].[GroupCheckListOptions] ([GCLOptionID], [GCLOptionName], [IsActive]) VALUES (N'GCL000020', N'ระบบลมดูด 0-15 ', 1)
INSERT [dbo].[GroupCheckListOptions] ([GCLOptionID], [GCLOptionName], [IsActive]) VALUES (N'GCL000021', N'ค่าความสั่นของเครื่อง MIN - MIX 4 - 5 ', 1)
INSERT [dbo].[GroupCheckListOptions] ([GCLOptionID], [GCLOptionName], [IsActive]) VALUES (N'GCL000022', N'รายการตรวจเช็คระบบ', 1)
INSERT [dbo].[GroupCheckListOptions] ([GCLOptionID], [GCLOptionName], [IsActive]) VALUES (N'GCL000023', N'ระบุเลข Presser Dust 0 - 20', 1)
INSERT [dbo].[GroupCheckListOptions] ([GCLOptionID], [GCLOptionName], [IsActive]) VALUES (N'GCL000024', N'ระบุตัวเลข แรงดันลม 4 - 5 Bar', 1)
INSERT [dbo].[GroupCheckListOptions] ([GCLOptionID], [GCLOptionName], [IsActive]) VALUES (N'GCL000025', N'ระบุตัวเลข Feed Product', 1)
INSERT [dbo].[GroupCheckListOptions] ([GCLOptionID], [GCLOptionName], [IsActive]) VALUES (N'GCL000026', N'เปอร์เซ็นต์ (%) ของค่าการคัดแยก โปรดระบุ						 						', 1)
INSERT [dbo].[GroupCheckListOptions] ([GCLOptionID], [GCLOptionName], [IsActive]) VALUES (N'GCL000027', N'ผู้ทำหน้าที่ Check List คือพนักงานระดับ Assistant ขึ้นไป', 1)
INSERT [dbo].[GroupCheckListOptions] ([GCLOptionID], [GCLOptionName], [IsActive]) VALUES (N'GCL000028', N'TestGroup', 1)
GO
INSERT [dbo].[GroupMachines] ([GMachineID], [GMachineName], [Description], [IsActive]) VALUES (N'GMmm00001', N'Cleanning', N'Cleanning', 1)
INSERT [dbo].[GroupMachines] ([GMachineID], [GMachineName], [Description], [IsActive]) VALUES (N'GMmm00002', N'Milling', N'Milling', 1)
INSERT [dbo].[GroupMachines] ([GMachineID], [GMachineName], [Description], [IsActive]) VALUES (N'GMmm00003', N'Packing', N'Packing', 1)
GO
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU01', 1, 1, 1, CAST(N'2024-11-10T18:01:42.267' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU01', 2, 1, 1, CAST(N'2024-11-10T18:02:02.477' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU01', 3, 1, 1, CAST(N'2024-11-10T18:02:09.093' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU01', 4, 1, 1, CAST(N'2024-11-10T18:02:14.137' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU01', 5, 1, 1, CAST(N'2024-11-10T18:02:18.843' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU01', 6, 1, 1, CAST(N'2024-11-10T18:02:22.793' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU01', 7, 1, 1, CAST(N'2024-11-10T18:02:25.937' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU01', 8, 1, 1, CAST(N'2024-11-10T18:02:30.203' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU01', 9, 1, 1, CAST(N'2024-11-10T18:02:37.327' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU01', 10, 1, 1, CAST(N'2024-11-10T18:02:41.597' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU01', 11, 1, 1, CAST(N'2024-11-10T18:02:44.627' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU01', 12, 1, 1, CAST(N'2024-11-10T18:02:47.600' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU01', 13, 1, 1, CAST(N'2024-11-10T18:02:50.923' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU01', 14, 1, 1, CAST(N'2024-11-10T18:02:53.443' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU01', 15, 1, 1, CAST(N'2024-11-10T18:02:56.180' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU01', 16, 1, 1, CAST(N'2024-11-10T18:02:58.670' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU01', 17, 1, 1, CAST(N'2024-11-10T18:03:01.723' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU01', 18, 1, 1, CAST(N'2024-11-10T18:03:05.137' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU01', 19, 1, 1, CAST(N'2024-11-10T18:03:08.467' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU01', 20, 1, 1, CAST(N'2024-11-10T18:03:11.837' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU01', 21, 1, 1, CAST(N'2024-11-11T08:55:56.790' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU01', 22, 1, 1, CAST(N'2024-11-11T08:56:49.850' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU02', 1, 1, 1, CAST(N'2024-11-10T18:04:33.497' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU02', 2, 1, 1, CAST(N'2024-11-10T18:04:37.920' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU02', 3, 1, 1, CAST(N'2024-11-10T18:04:41.850' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU02', 4, 1, 1, CAST(N'2024-11-10T18:04:44.790' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU02', 5, 1, 1, CAST(N'2024-11-10T18:04:47.490' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU02', 6, 1, 1, CAST(N'2024-11-10T18:04:49.783' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU02', 7, 1, 1, CAST(N'2024-11-10T18:04:52.377' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU02', 8, 1, 1, CAST(N'2024-11-10T18:04:54.630' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU02', 9, 1, 1, CAST(N'2024-11-10T18:04:57.477' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU02', 10, 1, 1, CAST(N'2024-11-10T18:04:59.987' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU02', 12, 1, 1, CAST(N'2024-11-10T18:05:03.720' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU02', 13, 1, 1, CAST(N'2024-11-10T18:05:06.050' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU02', 14, 1, 1, CAST(N'2024-11-10T18:05:08.693' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU02', 15, 1, 1, CAST(N'2024-11-10T18:05:12.770' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU02', 16, 1, 1, CAST(N'2024-11-10T18:05:24.550' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU02', 17, 1, 1, CAST(N'2024-11-10T18:05:26.850' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU02', 18, 0, 1, CAST(N'2024-11-10T18:07:10.747' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU02', 19, 0, 1, CAST(N'2024-11-10T18:07:13.770' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU02', 20, 1, 1, CAST(N'2024-11-10T18:05:38.173' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU02', 21, 1, 1, CAST(N'2024-11-11T08:56:04.027' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU02', 22, 1, 1, CAST(N'2024-11-11T08:57:00.340' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU03', 1, 1, 1, CAST(N'2024-11-10T18:06:25.373' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU03', 2, 0, 1, CAST(N'2024-11-10T18:07:24.260' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU03', 3, 0, 1, CAST(N'2024-11-10T18:07:27.240' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU03', 4, 0, 1, CAST(N'2024-11-10T18:07:30.543' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU03', 5, 0, 1, CAST(N'2024-11-10T18:07:33.087' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU03', 6, 0, 1, CAST(N'2024-11-10T18:07:35.310' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU03', 7, 0, 1, CAST(N'2024-11-10T18:07:42.240' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU03', 8, 0, 1, CAST(N'2024-11-10T18:07:44.580' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU03', 9, 0, 1, CAST(N'2024-11-10T18:07:46.880' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU03', 10, 0, 1, CAST(N'2024-11-10T18:07:49.393' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU03', 11, 0, 1, CAST(N'2024-11-10T18:07:51.790' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU03', 12, 0, 1, CAST(N'2024-11-10T18:07:54.950' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU03', 13, 0, 1, CAST(N'2024-11-10T18:08:01.247' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU03', 14, 1, 1, CAST(N'2024-11-10T18:08:03.283' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU03', 15, 0, 1, CAST(N'2024-11-10T18:08:05.463' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU03', 16, 1, 1, CAST(N'2024-11-10T18:08:07.397' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU03', 17, 1, 1, CAST(N'2024-11-10T18:08:10.433' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU03', 18, 0, 1, CAST(N'2024-11-10T18:08:12.430' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU03', 19, 0, 1, CAST(N'2024-11-10T18:08:14.347' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU03', 20, 0, 1, CAST(N'2024-11-10T18:08:16.553' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU03', 21, 0, 1, CAST(N'2024-11-11T08:56:12.167' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU03', 22, 0, 1, CAST(N'2024-11-11T08:57:06.830' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU04', 1, 1, 1, CAST(N'2024-11-10T18:08:33.853' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU04', 2, 0, 1, CAST(N'2024-11-10T18:08:36.333' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU04', 3, 0, 1, CAST(N'2024-11-10T18:08:38.590' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU04', 4, 0, 1, CAST(N'2024-11-10T18:08:40.360' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU04', 5, 0, 1, CAST(N'2024-11-10T18:08:42.430' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU04', 6, 0, 1, CAST(N'2024-11-10T18:08:44.380' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU04', 7, 0, 1, CAST(N'2024-11-10T18:08:46.160' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU04', 8, 0, 1, CAST(N'2024-11-10T18:08:47.773' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU04', 9, 0, 1, CAST(N'2024-11-10T18:08:49.690' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU04', 10, 1, 1, CAST(N'2024-11-10T18:08:51.643' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU04', 11, 0, 1, CAST(N'2024-11-10T18:08:53.390' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU04', 12, 0, 1, CAST(N'2024-11-10T18:08:56.227' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU04', 13, 0, 1, CAST(N'2024-11-10T18:09:00.530' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU04', 14, 0, 1, CAST(N'2024-11-10T18:09:02.743' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU04', 15, 0, 1, CAST(N'2024-11-10T18:09:04.917' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU04', 16, 0, 1, CAST(N'2024-11-10T18:09:06.913' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU04', 17, 1, 1, CAST(N'2024-11-10T18:09:09.327' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU04', 18, 0, 1, CAST(N'2024-11-10T18:09:11.600' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU04', 19, 0, 1, CAST(N'2024-11-10T18:09:14.067' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU04', 20, 1, 1, CAST(N'2024-11-10T18:09:15.927' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU04', 21, 0, 1, CAST(N'2024-11-11T08:56:23.773' AS DateTime))
INSERT [dbo].[GroupPermissions] ([GuserID], [PermissionID], [PermissionStatus], [IsActive], [Create_Date]) VALUES (N'GU04', 22, 0, 1, CAST(N'2024-11-11T08:57:23.140' AS DateTime))
GO
INSERT [dbo].[GroupUsers] ([GUserID], [GUserName], [IsActive]) VALUES (N'GU01', N'SuperAdmin', 1)
INSERT [dbo].[GroupUsers] ([GUserID], [GUserName], [IsActive]) VALUES (N'GU02', N'Admin', 1)
INSERT [dbo].[GroupUsers] ([GUserID], [GUserName], [IsActive]) VALUES (N'GU03', N'GeneralUser', 1)
INSERT [dbo].[GroupUsers] ([GUserID], [GUserName], [IsActive]) VALUES (N'GU04', N'Head', 1)
GO
SET IDENTITY_INSERT [dbo].[Logs] ON 

INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1285, N'Save Success : Save Data - Group Machine ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Group Machine 
User: Rattana Chomwihok
Date: 2024-11-06 14:49:08
Host: 10.99.100.105
Save Success : Save Data - Group Machine 
New Group machine id :  =  
New Group machine name :  = Cleanning 
New Description :  = Cleanning 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-06T14:49:08.1030000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1286, N'Save Success : Save Data - Group Machine ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Group Machine 
User: Rattana Chomwihok
Date: 2024-11-06 14:49:29
Host: 10.99.100.105
Save Success : Save Data - Group Machine 
New Group machine id :  =  
New Group machine name :  = Milling 
New Description :  = Milling 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-06T14:49:29.7600000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1287, N'Save Success : Save Data - Group Machine ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Group Machine 
User: Rattana Chomwihok
Date: 2024-11-06 14:49:47
Host: 10.99.100.105
Save Success : Save Data - Group Machine 
New Group machine id :  =  
New Group machine name :  = Packing 
New Description :  = Packing 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-06T14:49:47.5070000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1288, N'String or binary data would be truncated.
The statement has been terminated.', N'Rattana Chomwihok', N'
Title: String or binary data would be truncated.
The statement has been terminated.
User: Rattana Chomwihok
Date: 2024-11-06 14:51:38
Host: 10.99.100.105
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.RunExecuteNonQueryTds(String methodName, Boolean async, Int32 timeout, Boolean asyncWrite)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at m_checklist.Connection.ExecuteData(String strConn, String strSQL) in C:\Users\rattana.c\source\repos\m_checklist\m_checklist\class\connect\Connection.vb:line 69
   at m_checklist.MachineClass.SaveMachine(String Prefix, String MachineID, String GMachineID, String MachineName, String Description, String MachineCode, String Building, String Floor, String Area, String IsActive, Dictionary`2& logs) in C:\Users\rattana.c\source\repos\m_checklist\m_checklist\class\MachineClass.vb:line 68', N'Error', CAST(N'2024-11-06T14:51:38.1970000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1289, N'String or binary data would be truncated.
The statement has been terminated.', N'Rattana Chomwihok', N'
Title: String or binary data would be truncated.
The statement has been terminated.
User: Rattana Chomwihok
Date: 2024-11-06 14:52:29
Host: 10.99.100.105
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.RunExecuteNonQueryTds(String methodName, Boolean async, Int32 timeout, Boolean asyncWrite)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at m_checklist.Connection.ExecuteData(String strConn, String strSQL) in C:\Users\rattana.c\source\repos\m_checklist\m_checklist\class\connect\Connection.vb:line 69
   at m_checklist.MachineClass.SaveMachine(String Prefix, String MachineID, String GMachineID, String MachineName, String Description, String MachineCode, String Building, String Floor, String Area, String IsActive, Dictionary`2& logs) in C:\Users\rattana.c\source\repos\m_checklist\m_checklist\class\MachineClass.vb:line 68', N'Error', CAST(N'2024-11-06T14:52:29.8270000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1290, N'String or binary data would be truncated.
The statement has been terminated.', N'Rattana Chomwihok', N'
Title: String or binary data would be truncated.
The statement has been terminated.
User: Rattana Chomwihok
Date: 2024-11-06 14:53:39
Host: 10.99.100.105
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.RunExecuteNonQueryTds(String methodName, Boolean async, Int32 timeout, Boolean asyncWrite)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at m_checklist.Connection.ExecuteData(String strConn, String strSQL) in C:\Users\rattana.c\source\repos\m_checklist\m_checklist\class\connect\Connection.vb:line 69
   at m_checklist.MachineClass.SaveMachine(String Prefix, String MachineID, String GMachineID, String MachineName, String Description, String MachineCode, String Building, String Floor, String Area, String IsActive, Dictionary`2& logs) in C:\Users\rattana.c\source\repos\m_checklist\m_checklist\class\MachineClass.vb:line 68', N'Error', CAST(N'2024-11-06T14:53:39.4770000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1291, N'Save Success : Save Data - Machine ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Machine 
User: Rattana Chomwihok
Date: 2024-11-06 14:57:39
Host: 10.99.100.105
Save Success : Save Data - Machine 
New Machine id :  =  
New Group machine id :  = GMmm00001 
New Machine name :  = HAMMERMILL 
New Description :  = ตารางการตรวจเช็คเครื่องจักร   HAMMERMILL 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-06T14:57:39.8070000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1292, N'Save Success : Save Data - Machine ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Machine 
User: Rattana Chomwihok
Date: 2024-11-06 14:58:37
Host: 10.99.100.105
Save Success : Save Data - Machine 
New Machine id :  =  
New Group machine id :  = GMmm00001 
New Machine name :  = De STONER  
New Description :  = ตารางการตรวจเช็คเครื่องจักร   DE STONER (จุด OPRP) 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-06T14:58:37.4930000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1293, N'Save Success : Save Data - Machine ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Machine 
User: Rattana Chomwihok
Date: 2024-11-06 14:59:26
Host: 10.99.100.105
Save Success : Save Data - Machine 
New Machine id :  =  
New Group machine id :  = GMmm00001 
New Machine name :  = SEPARATOR-ASPRATOR 
New Description :  = ตารางการตรวจเช็คเครื่องจักร   SEPARATOR-ASPRATOR 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-06T14:59:26.8300000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1294, N'Save Success : Save Data - Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-06 15:00:43
Host: 10.99.100.105
Save Success : Save Data - Check List 
New Check list id :  =  
New Check list name :  = เวลา 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-06T15:00:43.6200000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1295, N'Save Success : Save Data - Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-06 15:00:54
Host: 10.99.100.105
Save Success : Save Data - Check List 
New Check list id :  =  
New Check list name :  = ชนิดข้าว 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-06T15:00:54.3100000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1296, N'Save Success : Save Data - Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-06 15:01:31
Host: 10.99.100.105
Save Success : Save Data - Check List 
New Check list id :  =  
New Check list name :  = กากข้าวมีข้าวดีปนหรือไม่ 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-06T15:01:31.1670000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1297, N'Save Success : Save Data - Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-06 15:01:39
Host: 10.99.100.105
Save Success : Save Data - Check List 
New Check list id :  =  
New Check list name :  = ระบบลมดูด 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-06T15:01:39.4900000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1298, N'Save Success : Save Data - Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-06 15:01:49
Host: 10.99.100.105
Save Success : Save Data - Check List 
New Check list id :  =  
New Check list name :  = สภาพตะแกรง 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-06T15:01:49.5900000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1299, N'Save Success : Save Data - Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-06 15:01:55
Host: 10.99.100.105
Save Success : Save Data - Check List 
New Check list id :  =  
New Check list name :  = การทำงานของเครื่องจักร 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-06T15:01:55.7400000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1300, N'Save Success : Save Data - Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-06 15:02:08
Host: 10.99.100.105
Save Success : Save Data - Check List 
New Check list id :  =  
New Check list name :  = วิธีการแก้ไข 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-06T15:02:08.0400000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1301, N'Save Success : Save Data - Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-06 15:02:11
Host: 10.99.100.105
Save Success : Save Data - Check List 
New Check list id :  =  
New Check list name :  = ผู้ตรวจ 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-06T15:02:11.6530000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1302, N'Save Success : Save Data - Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-06 15:02:18
Host: 10.99.100.105
Save Success : Save Data - Check List 
New Check list id :  =  
New Check list name :  = ตรวจสอบโดย หัวหน้ากะ 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-06T15:02:18.6900000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1303, N'Save Success : Save Data - Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-06 15:02:23
Host: 10.99.100.105
Save Success : Save Data - Check List 
New Check list id :  =  
New Check list name :  = หมายเหตุ 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-06T15:02:23.7830000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1304, N'Save Success : Save Data - Group Check List Option ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Group Check List Option 
User: Rattana Chomwihok
Date: 2024-11-06 15:03:21
Host: 10.99.100.105
Save Success : Save Data - Group Check List Option 
New Group check list option id :  =  
New Group check list option name :  = กากข้าวมีข้าวดีปนหรือไม่ 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-06T15:03:21.0500000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1305, N'Save Success : Save Data - Check List Option ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List Option 
User: Rattana Chomwihok
Date: 2024-11-06 15:03:36
Host: 10.99.100.105
Save Success : Save Data - Check List Option 
New Check list option id :  =  
New Check list option name :  = ปน 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-06T15:03:36.7700000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1306, N'Save Success : Save Data - Check List Option ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List Option 
User: Rattana Chomwihok
Date: 2024-11-06 15:03:41
Host: 10.99.100.105
Save Success : Save Data - Check List Option 
New Check list option id :  =  
New Check list option name :  = ไม่ปน 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-06T15:03:41.0800000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1307, N'Save Success : Save Data - Match Check List Option ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Match Check List Option 
User: Rattana Chomwihok
Date: 2024-11-06 15:04:14
Host: 10.99.100.105
Save Success : Save Data - Match Check List Option 
New Match check list option id :  =  
New Group check list option id :  = GCL000001 
New Group check list option name :  =  
1 -  = 
New Check list option id : = CLO000001
New IsActive : = true 
2 -  = 
New Check list option id : = CLO000002
New IsActive : = true 
', N'Info', CAST(N'2024-11-06T15:04:14.1770000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1308, N'Save Success : Save Data - Group Check List Option ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Group Check List Option 
User: Rattana Chomwihok
Date: 2024-11-06 15:04:32
Host: 10.99.100.105
Save Success : Save Data - Group Check List Option 
New Group check list option id :  =  
New Group check list option name :  = ระบบลมดูด 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-06T15:04:32.5300000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1309, N'Save Success : Save Data - Group Check List Option ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Group Check List Option 
User: Rattana Chomwihok
Date: 2024-11-06 15:04:41
Host: 10.99.100.105
Save Success : Save Data - Group Check List Option 
New Group check list option id :  =  
New Group check list option name :  = สภาพตะแกรง 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-06T15:04:41.3370000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1310, N'Save Success : Save Data - Group Check List Option ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Group Check List Option 
User: Rattana Chomwihok
Date: 2024-11-06 15:04:46
Host: 10.99.100.105
Save Success : Save Data - Group Check List Option 
New Group check list option id :  =  
New Group check list option name :  = การทำงานของเครื่องจักร 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-06T15:04:46.1070000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1311, N'Save Success : Save Data - Group Check List Option ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Group Check List Option 
User: Rattana Chomwihok
Date: 2024-11-06 15:05:17
Host: 10.99.100.105
Save Success : Save Data - Group Check List Option 

Before =  
Group check list option id :  = GCL000001 
Group check list option name :  = กากข้าวมีข้าวดีปนหรือไม่ 
IsActive :  = True 
Update =  

New Group check list option id :  = GCL000001 
New Group check list option name :  = กากข้าวมีข้าวดีปนหรือไม่. 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-06T15:05:17.5830000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1312, N'Change Success : Change Status Data - Group Check List Option ', N'Rattana Chomwihok', N'
Title: Change Success : Change Status Data - Group Check List Option 
User: Rattana Chomwihok
Date: 2024-11-06 15:05:26
Host: 10.99.100.105
Change Success : Change Status Data - Group Check List Option 
Group check list option id :  = GCL000002 
Group check list option name :  = ระบบลมดูด 
IsActive :  = True 
NewIsActive :  = False 
', N'Info', CAST(N'2024-11-06T15:05:26.7400000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1313, N'Change Success : Change Status Data - Group Check List Option ', N'Rattana Chomwihok', N'
Title: Change Success : Change Status Data - Group Check List Option 
User: Rattana Chomwihok
Date: 2024-11-06 15:05:48
Host: 10.99.100.105
Change Success : Change Status Data - Group Check List Option 
Group check list option id :  = GCL000002 
Group check list option name :  = ระบบลมดูด 
IsActive :  = False 
NewIsActive :  = True 
', N'Info', CAST(N'2024-11-06T15:05:48.3630000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1314, N'Save Success : Save Data - Check List Option ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List Option 
User: Rattana Chomwihok
Date: 2024-11-06 15:05:58
Host: 10.99.100.105
Save Success : Save Data - Check List Option 
New Check list option id :  =  
New Check list option name :  = ลมดูด 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-06T15:05:58.5870000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1315, N'Save Success : Save Data - Check List Option ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List Option 
User: Rattana Chomwihok
Date: 2024-11-06 15:06:04
Host: 10.99.100.105
Save Success : Save Data - Check List Option 
New Check list option id :  =  
New Check list option name :  = ลมไม่ดูด 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-06T15:06:04.9830000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1316, N'Save Success : Save Data - Match Check List Option ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Match Check List Option 
User: Rattana Chomwihok
Date: 2024-11-06 15:06:18
Host: 10.99.100.105
Save Success : Save Data - Match Check List Option 
New Match check list option id :  =  
New Group check list option id :  = GCL000002 
New Group check list option name :  =  
1 -  = 
New Check list option id : = CLO000003
New IsActive : = true 
2 -  = 
New Check list option id : = CLO000004
New IsActive : = true 
', N'Info', CAST(N'2024-11-06T15:06:18.2200000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1317, N'Save Success : Save Data - Check List Option ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List Option 
User: Rattana Chomwihok
Date: 2024-11-06 15:07:24
Host: 10.99.100.105
Save Success : Save Data - Check List Option 
New Check list option id :  =  
New Check list option name :  = ปกติ 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-06T15:07:24.8530000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1318, N'Save Success : Save Data - Check List Option ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List Option 
User: Rattana Chomwihok
Date: 2024-11-06 15:07:35
Host: 10.99.100.105
Save Success : Save Data - Check List Option 
New Check list option id :  =  
New Check list option name :  = ไม่ปกติ 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-06T15:07:35.5470000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1319, N'Save Success : Save Data - Match Check List Option ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Match Check List Option 
User: Rattana Chomwihok
Date: 2024-11-06 15:07:57
Host: 10.99.100.105
Save Success : Save Data - Match Check List Option 
New Match check list option id :  =  
New Group check list option id :  = GCL000003 
New Group check list option name :  =  
1 -  = 
New Check list option id : = CLO000006
New IsActive : = true 
2 -  = 
New Check list option id : = CLO000005
New IsActive : = true 
', N'Info', CAST(N'2024-11-06T15:07:57.0300000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1320, N'Save Not Success : Check List Option ', N'Rattana Chomwihok', N'
Title: Save Not Success : Check List Option 
User: Rattana Chomwihok
Date: 2024-11-06 15:08:18
Host: 10.99.100.105
Save Not Success : Check List Option 
 The check list option name field is duplicate: ปกติ.', N'Error', CAST(N'2024-11-06T15:08:18.7470000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1321, N'Save Success : Save Data - Check List Option ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List Option 
User: Rattana Chomwihok
Date: 2024-11-06 15:08:30
Host: 10.99.100.105
Save Success : Save Data - Check List Option 
New Check list option id :  =  
New Check list option name :  = ผิดปกติ 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-06T15:08:30.0130000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1322, N'Save Success : Save Data - Match Check List Option ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Match Check List Option 
User: Rattana Chomwihok
Date: 2024-11-06 15:08:47
Host: 10.99.100.105
Save Success : Save Data - Match Check List Option 
New Match check list option id :  =  
New Group check list option id :  = GCL000004 
New Group check list option name :  =  
1 -  = 
New Check list option id : = CLO000005
New IsActive : = true 
2 -  = 
New Check list option id : = CLO000007
New IsActive : = true 
', N'Info', CAST(N'2024-11-06T15:08:47.5100000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1323, N'Save Success : Save Data - Match Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Match Check List 
User: Rattana Chomwihok
Date: 2024-11-06 15:17:35
Host: 10.99.100.105
Save Success : Save Data - Match Check List 

Generate new form =  
New Form id :  = F00000001 
New Form name :  = SCOURER - ASPIRATOR  ชั้น 2 
New Description :  = ตารางการตรวจเช็คเครื่องจักร   SCOURER - ASPIRATOR  ชั้น 2 
All Sub Form New =  
New 1 sf :  = 
Sub form id : SF0000001
Sub form name : ส่วนที่ 1 
New 2 sf :  = 
Sub form id : SF0000002
Sub form name : ส่วนที่ 2 
New 3 sf :  = 
Sub form id : SF0000003
Sub form name : ส่วนที่ 3 
', N'Info', CAST(N'2024-11-06T15:17:35.4700000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1324, N'Save Success : Save Data - Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-06 15:17:46
Host: 10.99.100.105
Save Success : Save Data - Check List 
New Check list id :  =  
New Check list name :  = ให้เช็คเครื่องจักรอย่างน้อย 1 ครั้ง ใน 2 ชั่วโมง 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-06T15:17:46.9270000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1325, N'Save Success : Save Data - Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-06 15:17:53
Host: 10.99.100.105
Save Success : Save Data - Check List 
New Check list id :  =  
New Check list name :  = รายการช่อง 1 ให้ระบุ "ปน" หรือ "ไม่ปน"  ถ้าระบุ "ปน" ให้แจ้งหัวหน้างานทำการแก้ไข 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-06T15:17:53.0230000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1326, N'Save Success : Save Data - Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-06 15:17:58
Host: 10.99.100.105
Save Success : Save Data - Check List 
New Check list id :  =  
New Check list name :  = รายการช่อง 3 ให้ระบุ "ปกติ" หรือ "ไม่ปกติ" ถ้าระบุ "ไม่ปกติ" ให้แจ้งหัวหน้างานทำการแก้ไข 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-06T15:17:58.8000000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1327, N'Save Success : Save Data - Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-06 15:18:07
Host: 10.99.100.105
Save Success : Save Data - Check List 
New Check list id :  =  
New Check list name :  = รายการช่อง 4 ให้ระบุ "ปกติ" หรือ "ผิดปกติ" ถ้าระบุ "ผิดปกติ" ให้แจ้งหัวหน้างานหรือช่างทำการแก้ไข 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-06T15:18:07.6800000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1328, N'Save Success : Save Data - Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-06 15:18:12
Host: 10.99.100.105
Save Success : Save Data - Check List 
New Check list id :  =  
New Check list name :  = ผู้มีหน้าที่ทำ  CHECK  LIST  คือ  พนักงาน  MILLHAND  ขึ้นไป   
New IsActive :  = true 
', N'Info', CAST(N'2024-11-06T15:18:12.8070000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1329, N'Save Success : Save Data - Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-06 15:18:33
Host: 10.99.100.105
Save Success : Save Data - Check List 
New Check list id :  =  
New Check list name :  = ระบบเครื่องจักรมีปัญหาให้แจ้งหัวหน้างาน 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-06T15:18:33.9300000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1330, N'Save Success : Save Data - Match Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Match Check List 
User: Rattana Chomwihok
Date: 2024-11-06 15:21:26
Host: 10.99.100.105
Save Success : Save Data - Match Check List 

Before =  
Form id :  = F00000001 
Form name :  = SCOURER - ASPIRATOR  ชั้น 2 
Description :  = ตารางการตรวจเช็คเครื่องจักร   SCOURER - ASPIRATOR  ชั้น 2 
All Sub Form Change =  
1 sf :  = 
Sub form id : SF0000001
Sub form name : ส่วนที่ 1 
2 sf :  = 
Sub form id : SF0000002
Sub form name : ส่วนที่ 2 
3 sf :  = 
Sub form id : SF0000003
Sub form name : ส่วนที่ 3 
Update =  
Update form old =  
New Form id :  = F00000001 
New Form name :  = SCOURER - ASPIRATOR  ชั้น 2 
New Description :  = ตารางการตรวจเช็คเครื่องจักร   SCOURER - ASPIRATOR  ชั้น 2 
All Sub Form New =  
New 1 sf :  = 
Sub form id : SF0000004
Sub form name : ส่วนที่ 1 
New 2 sf :  = 
Sub form id : SF0000005
Sub form name : ส่วนที่ 2 
New 3 sf :  = 
Sub form id : SF0000006
Sub form name : ส่วนที่ 3 
New 4 sf :  = 
Sub form id : SF0000007
Sub form name : หมายเหตุ 
', N'Info', CAST(N'2024-11-06T15:21:26.4870000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1331, N'Save Success : Save Data - Match Form Machine ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Match Form Machine 
User: Rattana Chomwihok
Date: 2024-11-06 15:22:14
Host: 10.99.100.105
Save Success : Save Data - Match Form Machine 
New Machine id :  = M00000001 
New Machine name :  = SCOURER - ASPIRATOR 
New Form id :  = F00000001 
', N'Info', CAST(N'2024-11-06T15:22:14.3200000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1332, N'Save Success : Save Data - Expected Result ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Expected Result 
User: Rattana Chomwihok
Date: 2024-11-06 15:25:24
Host: 10.99.100.105
Save Success : Save Data - Expected Result List of result =  
1 = 
Form id : F00000001
Machine id : M00000001
Table id : ER0000001
Machine check list id : 636
Expected result : APW 
2 = 
Form id : F00000001
Machine id : M00000001
Table id : ER0000001
Machine check list id : 637
Expected result : CLO000002 
4 = 
Form id : F00000001
Machine id : M00000001
Table id : ER0000001
Machine check list id : 638
Expected result : CLO000003 
6 = 
Form id : F00000001
Machine id : M00000001
Table id : ER0000001
Machine check list id : 639
Expected result : CLO000005 
8 = 
Form id : F00000001
Machine id : M00000001
Table id : ER0000001
Machine check list id : 640
Expected result : CLO000005 
10 = 
Form id : F00000001
Machine id : M00000001
Table id : ER0000001
Machine check list id : 641
Expected result :  
11 = 
Form id : F00000001
Machine id : M00000001
Table id : ER0000001
Machine check list id : 642
Expected result : ขวัญชัย 
12 = 
Form id : F00000001
Machine id : M00000001
Table id : ER0000001
Machine check list id : 643
Expected result : กันตนา 
13 = 
Form id : F00000001
Machine id : M00000001
Table id : ER0000001
Machine check list id : 644
Expected result :  
14 = 
Form id : F00000001
Machine id : M00000001
Table id : ER0000001
Machine check list id : 645
Expected result :  
15 = 
Form id : F00000001
Machine id : M00000001
Table id : ER0000001
Machine check list id : 646
Expected result :  
16 = 
Form id : F00000001
Machine id : M00000001
Table id : ER0000001
Machine check list id : 647
Expected result :  
17 = 
Form id : F00000001
Machine id : M00000001
Table id : ER0000001
Machine check list id : 648
Expected result :  
18 = 
Form id : F00000001
Machine id : M00000001
Table id : ER0000001
Machine check list id : 649
Expected result :  
19 = 
Form id : F00000001
Machine id : M00000001
Table id : ER0000001
Machine check list id : 650
Expected result :  
', N'Info', CAST(N'2024-11-06T15:25:24.6130000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1333, N'Save Success : Save Data - App Config ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - App Config 
User: Rattana Chomwihok
Date: 2024-11-06 15:42:40
Host: 10.99.100.105
Save Success : Save Data - App Config 

Before =  
App name :  = PMChecklist 
GroupMachine :  = GMmm 
Machine :  = M 
CheckList :  = CL 
GroupCheckList :  = GCL 
CheckListOption :  = CLO 
MatchCheckListOption :  = MCLO 
MatchFormMachine :  = MCLO 
Form :  = F 
SubForm :  = SF 
ExpectedResult :  = ER 
UsersPermission :  = U 
Update =  

New App Config = 
 
New App name :  = PMChecklist2 
New GroupMachine :  = GMmm 
New Machine :  = M 
New CheckList :  = CL 
New GroupCheckList :  = GCL 
New CheckListOption :  = CLO 
New MatchCheckListOption :  = MCLO 
New MatchFormMachine :  = MCLO 
New Form :  = F 
New SubForm :  = SF 
New ExpectedResult :  = ER 
New UsersPermission :  = U 
', N'Info', CAST(N'2024-11-06T15:42:40.0130000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1334, N'Save Success : Save Data - App Config ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - App Config 
User: Rattana Chomwihok
Date: 2024-11-06 15:43:04
Host: 10.99.100.105
Save Success : Save Data - App Config 

Before =  
App name :  = PMChecklist2 
GroupMachine :  = GMmm 
Machine :  = M 
CheckList :  = CL 
GroupCheckList :  = GCL 
CheckListOption :  = CLO 
MatchCheckListOption :  = MCLO 
MatchFormMachine :  = MCLO 
Form :  = F 
SubForm :  = SF 
ExpectedResult :  = ER 
UsersPermission :  = U 
Update =  

New App Config = 
 
New App name :  = PMChecklist2 
New GroupMachine :  = GMmm 
New Machine :  = MLG 
New CheckList :  = CL 
New GroupCheckList :  = GCL 
New CheckListOption :  = CLO 
New MatchCheckListOption :  = MCLO 
New MatchFormMachine :  = MCLO 
New Form :  = F 
New SubForm :  = SF 
New ExpectedResult :  = ER 
New UsersPermission :  = U 
', N'Info', CAST(N'2024-11-06T15:43:04.8800000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1335, N'Change Success : Change Status Data - Group Machine ', N'Rattana Chomwihok', N'
Title: Change Success : Change Status Data - Group Machine 
User: Rattana Chomwihok
Date: 2024-11-06 15:43:40
Host: 10.99.100.105
Change Success : Change Status Data - Group Machine 
Grpup machine id :  = GMmm00003 
Group machine name :  = Packing 
IsActive :  = True 
NewIsActive :  = False 
', N'Info', CAST(N'2024-11-06T15:43:40.2470000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1336, N'Change Success : Change Status Data - Group Machine ', N'Rattana Chomwihok', N'
Title: Change Success : Change Status Data - Group Machine 
User: Rattana Chomwihok
Date: 2024-11-06 15:43:45
Host: 10.99.100.105
Change Success : Change Status Data - Group Machine 
Grpup machine id :  = GMmm00003 
Group machine name :  = Packing 
IsActive :  = False 
NewIsActive :  = True 
', N'Info', CAST(N'2024-11-06T15:43:45.7630000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1337, N'Save Success : Save Data - Group Check List Option ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Group Check List Option 
User: Rattana Chomwihok
Date: 2024-11-06 15:48:30
Host: 10.99.100.105
Save Success : Save Data - Group Check List Option 
New Group check list option id :  =  
New Group check list option name :  = ลักษณะ  STOCK 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-06T15:48:30.2530000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1338, N'Save Success : Save Data - Check List Option ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List Option 
User: Rattana Chomwihok
Date: 2024-11-06 15:48:43
Host: 10.99.100.105
Save Success : Save Data - Check List Option 
New Check list option id :  =  
New Check list option name :  = ละเอียด 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-06T15:48:43.0300000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1339, N'Save Success : Save Data - Check List Option ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List Option 
User: Rattana Chomwihok
Date: 2024-11-06 15:48:48
Host: 10.99.100.105
Save Success : Save Data - Check List Option 
New Check list option id :  =  
New Check list option name :  = หยาบ 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-06T15:48:48.9430000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1340, N'Save Success : Save Data - Match Check List Option ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Match Check List Option 
User: Rattana Chomwihok
Date: 2024-11-06 15:49:03
Host: 10.99.100.105
Save Success : Save Data - Match Check List Option 
New Match check list option id :  =  
New Group check list option id :  = GCL000005 
New Group check list option name :  =  
1 -  = 
New Check list option id : = CLO000009
New IsActive : = true 
2 -  = 
New Check list option id : = CLO000008
New IsActive : = true 
', N'Info', CAST(N'2024-11-06T15:49:03.0730000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1341, N'Save Success : Save Data - Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-06 15:49:25
Host: 10.99.100.105
Save Success : Save Data - Check List 
New Check list id :  =  
New Check list name :  = ลักษณะ  STOCK 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-06T15:49:25.8400000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1342, N'Save Not Success : Match Check List ', N'Rattana Chomwihok', N'
Title: Save Not Success : Match Check List 
User: Rattana Chomwihok
Date: 2024-11-06 15:50:33
Host: 10.99.100.105
Save Not Success : Match Check List 
 form name field is duplicate: SCOURER - ASPIRATOR  ชั้น 2.
 description field is duplicate: ตารางการตรวจเช็คเครื่องจักร   SCOURER - ASPIRATOR  ชั้น 2.', N'Error', CAST(N'2024-11-06T15:50:33.7200000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1343, N'Save Success : Save Data - Match Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Match Check List 
User: Rattana Chomwihok
Date: 2024-11-06 15:51:08
Host: 10.99.100.105
Save Success : Save Data - Match Check List All Machines Change =  
1 m :  = 
Machine id : M00000001
Machine name : SCOURER - ASPIRATOR
IsActive : True 


Before =  
Form id :  = F00000001 
Form name :  = SCOURER - ASPIRATOR  ชั้น 2 
Description :  = ตารางการตรวจเช็คเครื่องจักร   SCOURER - ASPIRATOR  ชั้น 2 
All Sub Form Change =  
1 sf :  = 
Sub form id : SF0000004
Sub form name : ส่วนที่ 1 
2 sf :  = 
Sub form id : SF0000005
Sub form name : ส่วนที่ 2 
3 sf :  = 
Sub form id : SF0000006
Sub form name : ส่วนที่ 3 
4 sf :  = 
Sub form id : SF0000007
Sub form name : หมายเหตุ 
Update =  
Generate new form and change all old id in form id in machine =  
New Form id :  = F00000002 
New Form name :  = D_SCOURER - ASPIRATOR  ชั้น 2 
New Description :  = D_ตารางการตรวจเช็คเครื่องจักร   SCOURER - ASPIRATOR  ชั้น 2 
All Sub Form New =  
New 1 sf :  = 
Sub form id : SF0000008
Sub form name : ส่วนที่ 1 
New 2 sf :  = 
Sub form id : SF0000009
Sub form name : ส่วนที่ 2 
New 3 sf :  = 
Sub form id : SF0000010
Sub form name : ส่วนที่ 3 
New 4 sf :  = 
Sub form id : SF0000011
Sub form name : หมายเหตุ 
', N'Info', CAST(N'2024-11-06T15:51:08.3870000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1344, N'Change Success : Change Status Data - Forms ', N'Rattana Chomwihok', N'
Title: Change Success : Change Status Data - Forms 
User: Rattana Chomwihok
Date: 2024-11-06 15:51:41
Host: 10.99.100.105
Change Success : Change Status Data - Forms 
Form id :  = F00000001 
Form name :  = SCOURER - ASPIRATOR  ชั้น 2 
IsActive :  = False 
NewIsActive :  = True 
', N'Info', CAST(N'2024-11-06T15:51:41.9130000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1345, N'Save Success : Save Data - Match Form Machine ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Match Form Machine 
User: Rattana Chomwihok
Date: 2024-11-06 15:51:49
Host: 10.99.100.105
Save Success : Save Data - Match Form Machine 

Before =  
Machine id :  = M00000001 
Machine name :  = SCOURER - ASPIRATOR 
Form id :  = F00000002 

Update =  

New Machine id :  = M00000001 
New Machine name :  = SCOURER - ASPIRATOR 
New Form id :  = F00000001 
', N'Info', CAST(N'2024-11-06T15:51:49.0570000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1346, N'Save Success : Save Data - Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-06 15:53:02
Host: 10.99.100.105
Save Success : Save Data - Check List 
New Check list id :  =  
New Check list name :  = ปัญหาที่พบ 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-06T15:53:02.6530000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1347, N'Save Success : Save Data - Match Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Match Check List 
User: Rattana Chomwihok
Date: 2024-11-06 16:01:50
Host: 10.99.100.105
Save Success : Save Data - Match Check List 

Generate new form =  
New Form id :  = F00000003 
New Form name :  = HAMMERMILL 
New Description :  = ตารางการตรวจเช็คเครื่องจักร   HAMMERMILL 
All Sub Form New =  
New 1 sf :  = 
Sub form id : SF0000012
Sub form name : ส่วนที่ 1 
New 2 sf :  = 
Sub form id : SF0000013
Sub form name : ส่วนที่2 
New 3 sf :  = 
Sub form id : SF0000014
Sub form name : ส่วนที่ 3 
', N'Info', CAST(N'2024-11-06T16:01:50.0970000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1348, N'Save Success : Save Data - Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-06 16:03:00
Host: 10.99.100.105
Save Success : Save Data - Check List 
New Check list id :  =  
New Check list name :  = ช่อง  "ละเอียด"  ให้ระบุ  "ละเอียด" 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-06T16:03:00.6730000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1349, N'Save Success : Save Data - Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-06 16:03:13
Host: 10.99.100.105
Save Success : Save Data - Check List 
New Check list id :  =  
New Check list name :  = ช่อง  "หยาบ"  ให้ระบุ  "หยาบ" 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-06T16:03:13.4400000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1350, N'Save Success : Save Data - Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-06 16:03:36
Host: 10.99.100.105
Save Success : Save Data - Check List 
New Check list id :  =  
New Check list name :  = ถ้า  STOCK  ละเอียด   คือ  STOCK   ดี 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-06T16:03:36.0300000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1351, N'Save Success : Save Data - Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-06 16:03:50
Host: 10.99.100.105
Save Success : Save Data - Check List 
New Check list id :  =  
New Check list name :  = ถ้า  STOCK   หยาบ  คือ   STOCK  ไม่ดี  ให้แจ้งหัวหน้างานทำการแก้ไข 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-06T16:03:50.5670000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1352, N'Save Success : Save Data - Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-06 16:03:56
Host: 10.99.100.105
Save Success : Save Data - Check List 
New Check list id :  =  
New Check list name :  = ผู้มีหน้าที่  CHECK  LIST  คือ  พนักงาน  MILLHAND   ขึ้นไป 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-06T16:03:56.5770000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1353, N'Save Success : Save Data - Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-06 16:04:04
Host: 10.99.100.105
Save Success : Save Data - Check List 
New Check list id :  =  
New Check list name :  = ระบบเครื่องจักรมีปํญหาให้แจ้งหัวหน้างาน 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-06T16:04:04.0270000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1354, N'Save Success : Save Data - Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-06 16:04:19
Host: 10.99.100.105
Save Success : Save Data - Check List 
New Check list id :  =  
New Check list name :  = ให้เช็คเครื่องจักรอย่างน้อย  1  ครั้ง  ใน  2   ชั่วโมง 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-06T16:04:19.8270000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1355, N'Delete Success : Delete Data - Check List ', N'Rattana Chomwihok', N'
Title: Delete Success : Delete Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-06 16:06:20
Host: 10.99.100.105
Delete Success : Delete Data - Check List 
Check list id :  = CL0000025 
Check list name :  = ให้เช็คเครื่องจักรอย่างน้อย  1  ครั้ง  ใน  2   ชั่วโมง 
', N'Info', CAST(N'2024-11-06T16:06:20.2900000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1356, N'Save Success : Save Data - Match Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Match Check List 
User: Rattana Chomwihok
Date: 2024-11-06 16:08:19
Host: 10.99.100.105
Save Success : Save Data - Match Check List 

Before =  
Form id :  = F00000003 
Form name :  = HAMMERMILL 
Description :  = ตารางการตรวจเช็คเครื่องจักร   HAMMERMILL 
All Sub Form Change =  
1 sf :  = 
Sub form id : SF0000012
Sub form name : ส่วนที่ 1 
2 sf :  = 
Sub form id : SF0000013
Sub form name : ส่วนที่2 
3 sf :  = 
Sub form id : SF0000014
Sub form name : ส่วนที่ 3 
Update =  
Update form old =  
New Form id :  = F00000003 
New Form name :  = HAMMERMILL 
New Description :  = ตารางการตรวจเช็คเครื่องจักร   HAMMERMILL 
All Sub Form New =  
New 1 sf :  = 
Sub form id : SF0000015
Sub form name : ส่วนที่ 1 
New 2 sf :  = 
Sub form id : SF0000016
Sub form name : ส่วนที่2 
New 3 sf :  = 
Sub form id : SF0000017
Sub form name : ส่วนที่ 3 
New 4 sf :  = 
Sub form id : SF0000018
Sub form name : หมายเหตุ 
', N'Info', CAST(N'2024-11-06T16:08:19.7930000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1357, N'Save Success : Save Data - Match Form Machine ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Match Form Machine 
User: Rattana Chomwihok
Date: 2024-11-06 16:08:49
Host: 10.99.100.105
Save Success : Save Data - Match Form Machine 
New Machine id :  = M00000004 
New Machine name :  = SEPARATOR-ASPRATOR 
New Form id :  = F00000003 
', N'Info', CAST(N'2024-11-06T16:08:49.4530000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1358, N'Save Success : Save Data - Match Form Machine ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Match Form Machine 
User: Rattana Chomwihok
Date: 2024-11-06 16:08:57
Host: 10.99.100.105
Save Success : Save Data - Match Form Machine 
New Machine id :  = M00000002 
New Machine name :  = HAMMERMILL 
New Form id :  = F00000001 
', N'Info', CAST(N'2024-11-06T16:08:57.7530000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1359, N'Save Not Success : Match Form Machine ', N'Rattana Chomwihok', N'
Title: Save Not Success : Match Form Machine 
User: Rattana Chomwihok
Date: 2024-11-06 16:09:10
Host: 10.99.100.105
Save Not Success : Match Form Machine 
 The machine is matct.', N'Error', CAST(N'2024-11-06T16:09:10.1300000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1360, N'Delete Success : Delete Data - Match Form Machine ', N'Rattana Chomwihok', N'
Title: Delete Success : Delete Data - Match Form Machine 
User: Rattana Chomwihok
Date: 2024-11-06 16:09:49
Host: 10.99.100.105
Delete Success : Delete Data - Match Form Machine 
Machine id :  = M00000002 
Machine name :  = HAMMERMILL 
Form id :  = F00000001 
New Form id :  = NULL 
', N'Info', CAST(N'2024-11-06T16:09:49.1100000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1361, N'Delete Success : Delete Data - Match Form Machine ', N'Rattana Chomwihok', N'
Title: Delete Success : Delete Data - Match Form Machine 
User: Rattana Chomwihok
Date: 2024-11-06 16:09:50
Host: 10.99.100.105
Delete Success : Delete Data - Match Form Machine 
Machine id :  = M00000004 
Machine name :  = SEPARATOR-ASPRATOR 
Form id :  = F00000003 
New Form id :  = NULL 
', N'Info', CAST(N'2024-11-06T16:09:50.3700000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1362, N'Save Success : Save Data - Match Form Machine ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Match Form Machine 
User: Rattana Chomwihok
Date: 2024-11-06 16:09:56
Host: 10.99.100.105
Save Success : Save Data - Match Form Machine 
New Machine id :  = M00000002 
New Machine name :  = HAMMERMILL 
New Form id :  = F00000003 
', N'Info', CAST(N'2024-11-06T16:09:56.7670000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1363, N'Save Success : Save Data - Match Form Machine ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Match Form Machine 
User: Rattana Chomwihok
Date: 2024-11-06 16:10:01
Host: 10.99.100.105
Save Success : Save Data - Match Form Machine 

Before =  
Machine id :  = M00000002 
Machine name :  = HAMMERMILL 
Form id :  = F00000003 

Update =  

New Machine id :  = M00000002 
New Machine name :  = HAMMERMILL 
New Form id :  = F00000001 
', N'Info', CAST(N'2024-11-06T16:10:01.4530000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1364, N'Save Success : Save Data - Match Form Machine ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Match Form Machine 
User: Rattana Chomwihok
Date: 2024-11-06 16:10:07
Host: 10.99.100.105
Save Success : Save Data - Match Form Machine 

Before =  
Machine id :  = M00000002 
Machine name :  = HAMMERMILL 
Form id :  = F00000001 

Update =  

New Machine id :  = M00000002 
New Machine name :  = HAMMERMILL 
New Form id :  = F00000003 
', N'Info', CAST(N'2024-11-06T16:10:07.0000000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1365, N'Save Success : Save Data - Match Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Match Check List 
User: Rattana Chomwihok
Date: 2024-11-07 07:43:37
Host: 10.99.100.105
Save Success : Save Data - Match Check List 

Generate new form =  
New Form id :  = F00000004 
New Form name :  = D_TestComponent 
New Description :  = D_TestComponent 
All Sub Form New =  
New 1 sf :  = 
Sub form id : SF0000019
Sub form name : t1 
New 2 sf :  = 
Sub form id : SF0000020
Sub form name : t2 
New 3 sf :  = 
Sub form id : SF0000021
Sub form name : t3 
New 4 sf :  = 
Sub form id : SF0000022
Sub form name : t4 
New 5 sf :  = 
Sub form id : SF0000023
Sub form name : t5 
New 6 sf :  = 
Sub form id : SF0000024
Sub form name : t6 
New 7 sf :  = 
Sub form id : SF0000025
Sub form name : t7 
New 8 sf :  = 
Sub form id : SF0000026
Sub form name : t8 
New 9 sf :  = 
Sub form id : SF0000027
Sub form name : t9 
New 10 sf :  = 
Sub form id : SF0000028
Sub form name : t10 
New 11 sf :  = 
Sub form id : SF0000029
Sub form name : t11 
', N'Info', CAST(N'2024-11-07T07:43:37.1500000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1366, N'Save Not Success : Group Machine ', N'Rattana Chomwihok', N'
Title: Save Not Success : Group Machine 
User: Rattana Chomwihok
Date: 2024-11-07 11:11:02
Host: 10.99.100.105
Save Not Success : Group Machine 
 The group machine name field is duplicate: Cleanning.
 The description field is duplicate: Cleanning.', N'Error', CAST(N'2024-11-07T11:11:02.0570000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1367, N'Save Not Success : Machine ', N'Rattana Chomwihok', N'
Title: Save Not Success : Machine 
User: Rattana Chomwihok
Date: 2024-11-07 11:13:52
Host: 10.99.100.105
Save Not Success : Machine 
 The machine name field is duplicate: DE STONER.
 The description field is duplicate: ตารางการตรวจเช็คเครื่องจักร   DE STONER (จุด OPRP).', N'Error', CAST(N'2024-11-07T11:13:52.8530000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1368, N'Save Not Success : Machine ', N'Rattana Chomwihok', N'
Title: Save Not Success : Machine 
User: Rattana Chomwihok
Date: 2024-11-07 11:17:32
Host: 10.99.100.105
Save Not Success : Machine 
 The machine name field is duplicate: SEPARATOR-ASPRATOR.
 The description field is duplicate: ตารางการตรวจเช็คเครื่องจักร   SEPARATOR-ASPRATOR.', N'Error', CAST(N'2024-11-07T11:17:32.3270000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1369, N'Save Not Success : Machine ', N'Rattana Chomwihok', N'
Title: Save Not Success : Machine 
User: Rattana Chomwihok
Date: 2024-11-07 11:18:42
Host: 10.99.100.105
Save Not Success : Machine 
 The machine name field is duplicate: SEPARATOR-ASPRATOR.', N'Error', CAST(N'2024-11-07T11:18:42.3070000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1370, N'Save Success : Save Data - Machine ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Machine 
User: Rattana Chomwihok
Date: 2024-11-07 11:18:56
Host: 10.99.100.105
Save Success : Save Data - Machine 
New Machine id :  =  
New Group machine id :  = GMmm00001 
New Machine name :  = SEPARATOR 
New Description :  = ตารางการตรวจเช็คเครื่องจักร   SEPARATOR ชั้น 7 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T11:18:56.6500000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1371, N'Save Success : Save Data - Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-07 11:20:58
Host: 10.99.100.105
Save Success : Save Data - Check List 
New Check list id :  =  
New Check list name :  = รายการตรวจเช็ค 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T11:20:58.4570000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1372, N'Delete Success : Delete Data - Check List ', N'Rattana Chomwihok', N'
Title: Delete Success : Delete Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-07 11:22:49
Host: 10.99.100.105
Delete Success : Delete Data - Check List 
Check list id :  = CL0000025 
Check list name :  = รายการตรวจเช็ค 
', N'Info', CAST(N'2024-11-07T11:22:49.7930000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1373, N'Save Success : Save Data - Group Check List Option ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Group Check List Option 
User: Rattana Chomwihok
Date: 2024-11-07 11:24:34
Host: 10.99.100.105
Save Success : Save Data - Group Check List Option 
New Group check list option id :  =  
New Group check list option name :  = ช่องระบาย Aข้าวดีปนหรือไมj 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T11:24:34.5630000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1374, N'Save Success : Save Data - Group Check List Option ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Group Check List Option 
User: Rattana Chomwihok
Date: 2024-11-07 11:24:44
Host: 10.99.100.105
Save Success : Save Data - Group Check List Option 

Before =  
Group check list option id :  = GCL000006 
Group check list option name :  = ช่องระบาย Aข้าวดีปนหรือไมj 
IsActive :  = True 
Update =  

New Group check list option id :  = GCL000006 
New Group check list option name :  = ช่องระบาย Aข้าวดีปนหรือไม่ 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T11:24:44.4400000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1375, N'Save Success : Save Data - Group Check List Option ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Group Check List Option 
User: Rattana Chomwihok
Date: 2024-11-07 11:25:14
Host: 10.99.100.105
Save Success : Save Data - Group Check List Option 
New Group check list option id :  =  
New Group check list option name :  = ช่องระบาย Bข้าวดีปนหรือไม่ 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T11:25:14.0230000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1376, N'Save Success : Save Data - Group Check List Option ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Group Check List Option 
User: Rattana Chomwihok
Date: 2024-11-07 11:25:50
Host: 10.99.100.105
Save Success : Save Data - Group Check List Option 
New Group check list option id :  =  
New Group check list option name :  = สภาพตะแกรงก่อนSTARTเครื่อง 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T11:25:50.7670000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1377, N'Save Not Success : Group Check List Option ', N'Rattana Chomwihok', N'
Title: Save Not Success : Group Check List Option 
User: Rattana Chomwihok
Date: 2024-11-07 11:27:13
Host: 10.99.100.105
Save Not Success : Group Check List Option 
 The group machine name field is duplicate: ช่องระบาย Aข้าวดีปนหรือไม่.', N'Error', CAST(N'2024-11-07T11:27:13.3730000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1378, N'Save Success : Save Data - Match Check List Option ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Match Check List Option 
User: Rattana Chomwihok
Date: 2024-11-07 11:29:59
Host: 10.99.100.105
Save Success : Save Data - Match Check List Option 
New Match check list option id :  =  
New Group check list option id :  = GCL000006 
New Group check list option name :  =  
1 -  = 
New Check list option id : = CLO000001
New IsActive : = true 
2 -  = 
New Check list option id : = CLO000002
New IsActive : = true 
', N'Info', CAST(N'2024-11-07T11:29:59.5900000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1379, N'Save Success : Save Data - Match Check List Option ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Match Check List Option 
User: Rattana Chomwihok
Date: 2024-11-07 11:30:14
Host: 10.99.100.105
Save Success : Save Data - Match Check List Option 
New Match check list option id :  =  
New Group check list option id :  = GCL000007 
New Group check list option name :  =  
1 -  = 
New Check list option id : = CLO000001
New IsActive : = true 
2 -  = 
New Check list option id : = CLO000002
New IsActive : = true 
', N'Info', CAST(N'2024-11-07T11:30:15.0070000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1380, N'Save Not Success : Match Check List Option ', N'Rattana Chomwihok', N'
Title: Save Not Success : Match Check List Option 
User: Rattana Chomwihok
Date: 2024-11-07 11:30:26
Host: 10.99.100.105
Save Not Success : Match Check List Option 
 Change ststus not successful.', N'Error', CAST(N'2024-11-07T11:30:26.4000000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1381, N'Save Not Success : Match Check List Option ', N'Rattana Chomwihok', N'
Title: Save Not Success : Match Check List Option 
User: Rattana Chomwihok
Date: 2024-11-07 11:30:39
Host: 10.99.100.105
Save Not Success : Match Check List Option 
 Change ststus not successful.', N'Error', CAST(N'2024-11-07T11:30:39.3830000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1382, N'Save Success : Save Data - Match Check List Option ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Match Check List Option 
User: Rattana Chomwihok
Date: 2024-11-07 11:30:47
Host: 10.99.100.105
Save Success : Save Data - Match Check List Option 
New Match check list option id :  =  
New Group check list option id :  = GCL000008 
New Group check list option name :  =  
1 -  = 
New Check list option id : = CLO000006
New IsActive : = true 
2 -  = 
New Check list option id : = CLO000007
New IsActive : = true 
', N'Info', CAST(N'2024-11-07T11:30:47.3570000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1383, N'Save Not Success : Match Check List ', N'Rattana Chomwihok', N'
Title: Save Not Success : Match Check List 
User: Rattana Chomwihok
Date: 2024-11-07 11:31:34
Host: 10.99.100.105
Save Not Success : Match Check List 
 The sub form field is required.', N'Error', CAST(N'2024-11-07T11:31:34.0030000' AS DateTime2))
GO
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1384, N'Save Success : Save Data - Match Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Match Check List 
User: Rattana Chomwihok
Date: 2024-11-07 11:32:36
Host: 10.99.100.105
Save Success : Save Data - Match Check List 

Generate new form =  
New Form id :  = F00000005 
New Form name :  = SEPARATOR ชั้น 7 
New Description :  = ตารางการตรวจเช็คเครื่องจักร  SEPARATOR ชั้น 7 
All Sub Form New =  
New 1 sf :  = 
Sub form id : SF0000030
Sub form name : ส่วนที่ 1 
New 2 sf :  = 
Sub form id : SF0000031
Sub form name : ส่วนที่ 2 
New 3 sf :  = 
Sub form id : SF0000032
Sub form name : ส่วนที่ 3 
New 4 sf :  = 
Sub form id : SF0000033
Sub form name : ส่วนที่ 4  
', N'Info', CAST(N'2024-11-07T11:32:36.0170000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1385, N'Save Success : Save Data - Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-07 11:35:44
Host: 10.99.100.105
Save Success : Save Data - Check List 
New Check list id :  =  
New Check list name :  = ช่องระบาย Aข้าวดีปนหรือไม่ 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T11:35:44.0100000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1386, N'Save Success : Save Data - Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-07 11:36:01
Host: 10.99.100.105
Save Success : Save Data - Check List 
New Check list id :  =  
New Check list name :  = ช่องระบาย Bข้าวดีปนหรือไม่ 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T11:36:01.6900000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1387, N'Save Success : Save Data - Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-07 11:36:25
Host: 10.99.100.105
Save Success : Save Data - Check List 
New Check list id :  =  
New Check list name :  = สภาพตะแกรงก่อนSTARTเครื่อง 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T11:36:25.3200000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1388, N'Save Success : Save Data - Match Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Match Check List 
User: Rattana Chomwihok
Date: 2024-11-07 11:44:40
Host: 10.99.100.105
Save Success : Save Data - Match Check List 

Before =  
Form id :  = F00000005 
Form name :  = SEPARATOR ชั้น 7 
Description :  = ตารางการตรวจเช็คเครื่องจักร  SEPARATOR ชั้น 7 
All Sub Form Change =  
1 sf :  = 
Sub form id : SF0000030
Sub form name : ส่วนที่ 1 
2 sf :  = 
Sub form id : SF0000031
Sub form name : ส่วนที่ 2 
3 sf :  = 
Sub form id : SF0000032
Sub form name : ส่วนที่ 3 
4 sf :  = 
Sub form id : SF0000033
Sub form name : ส่วนที่ 4 
Update =  
Update form old =  
New Form id :  = F00000005 
New Form name :  = SEPARATOR ชั้น 7 
New Description :  = ตารางการตรวจเช็คเครื่องจักร  SEPARATOR ชั้น 7 
All Sub Form New =  
New 1 sf :  = 
Sub form id : SF0000034
Sub form name : ส่วนที่ 1 
New 2 sf :  = 
Sub form id : SF0000035
Sub form name : ส่วนที่ 2 
New 3 sf :  = 
Sub form id : SF0000036
Sub form name : ส่วนที่ 3 
New 4 sf :  = 
Sub form id : SF0000037
Sub form name : ส่วนที่ 4 
New 5 sf :  = 
Sub form id : SF0000038
Sub form name : หมายเหตุ 
', N'Info', CAST(N'2024-11-07T11:44:40.2770000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1389, N'Save Success : Save Data - Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-07 11:45:51
Host: 10.99.100.105
Save Success : Save Data - Check List 
New Check list id :  =  
New Check list name :  = รายการช่อง 2  ให้ระบุ "ปน"  หรือ "ไม่ปน"  ถ้าระบุ  "ปน "ให้แจ้งหัวหน้างานทำการแก้ไข 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T11:45:51.8900000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1390, N'Save Success : Save Data - Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-07 11:46:37
Host: 10.99.100.105
Save Success : Save Data - Check List 
New Check list id :  =  
New Check list name :  = รายการช่อง 3 ให้ระบุ "ลมดูด"หรือ "ลมไม่ดูด" ถ้าระบุ "ลมไม่ดูด" ให้แจ้งหัวหน้างานทำการแก้ไข 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T11:46:37.1300000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1391, N'Save Success : Save Data - Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-07 11:47:06
Host: 10.99.100.105
Save Success : Save Data - Check List 
New Check list id :  =  
New Check list name :  = รายการช่อง 5 ให้ระบุสภาพตะแกรงปกติ หรือไม่ปกติ ถ้าระบุว่าไม่ปกติ ให้แจ้งหัวหน้ากะทำการแก้ไข ให้ปฏิบัติก่อนการเดินเครื่องจักรทุกครั้ง  
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T11:47:06.5400000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1392, N'Save Not Success : Check List ', N'Rattana Chomwihok', N'
Title: Save Not Success : Check List 
User: Rattana Chomwihok
Date: 2024-11-07 11:47:28
Host: 10.99.100.105
Save Not Success : Check List 
 The check list name field is duplicate: ระบบเครื่องจักรมีปัญหาให้แจ้งหัวหน้างาน.', N'Error', CAST(N'2024-11-07T11:47:28.5900000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1393, N'Save Success : Save Data - Match Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Match Check List 
User: Rattana Chomwihok
Date: 2024-11-07 11:50:04
Host: 10.99.100.105
Save Success : Save Data - Match Check List 

Before =  
Form id :  = F00000005 
Form name :  = SEPARATOR ชั้น 7 
Description :  = ตารางการตรวจเช็คเครื่องจักร  SEPARATOR ชั้น 7 
All Sub Form Change =  
1 sf :  = 
Sub form id : SF0000034
Sub form name : ส่วนที่ 1 
2 sf :  = 
Sub form id : SF0000035
Sub form name : ส่วนที่ 2 
3 sf :  = 
Sub form id : SF0000036
Sub form name : ส่วนที่ 3 
4 sf :  = 
Sub form id : SF0000037
Sub form name : ส่วนที่ 4 
5 sf :  = 
Sub form id : SF0000038
Sub form name : หมายเหตุ 
Update =  
Update form old =  
New Form id :  = F00000005 
New Form name :  = SEPARATOR ชั้น 7 
New Description :  = ตารางการตรวจเช็คเครื่องจักร  SEPARATOR ชั้น 7 
All Sub Form New =  
New 1 sf :  = 
Sub form id : SF0000039
Sub form name : ส่วนที่ 1 
New 2 sf :  = 
Sub form id : SF0000040
Sub form name : ส่วนที่ 2 
New 3 sf :  = 
Sub form id : SF0000041
Sub form name : ส่วนที่ 3 
New 4 sf :  = 
Sub form id : SF0000042
Sub form name : ส่วนที่ 4 
New 5 sf :  = 
Sub form id : SF0000043
Sub form name : หมายเหตุ 
', N'Info', CAST(N'2024-11-07T11:50:04.2430000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1394, N'Save Success : Save Data - Match Form Machine ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Match Form Machine 
User: Rattana Chomwihok
Date: 2024-11-07 11:50:57
Host: 10.99.100.105
Save Success : Save Data - Match Form Machine 
New Machine id :  = MLG000001 
New Machine name :  = SEPARATOR 
New Form id :  = F00000005 
', N'Info', CAST(N'2024-11-07T11:50:57.8300000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1395, N'Save Not Success : Group Machine ', N'Rattana Chomwihok', N'
Title: Save Not Success : Group Machine 
User: Rattana Chomwihok
Date: 2024-11-07 12:06:05
Host: 10.99.100.105
Save Not Success : Group Machine 
 The group machine name field is duplicate: Cleanning.
 The description field is duplicate: Cleanning.', N'Error', CAST(N'2024-11-07T12:06:05.2700000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1396, N'Save Not Success : Machine ', N'Rattana Chomwihok', N'
Title: Save Not Success : Machine 
User: Rattana Chomwihok
Date: 2024-11-07 12:06:39
Host: 10.99.100.105
Save Not Success : Machine 
 The machine name field is duplicate: SEPARATOR-ASPRATOR.', N'Error', CAST(N'2024-11-07T12:06:39.4700000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1397, N'Save Success : Save Data - Machine ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Machine 
User: Rattana Chomwihok
Date: 2024-11-07 13:41:13
Host: 10.99.100.105
Save Success : Save Data - Machine 
New Machine id :  =  
New Group machine id :  = GMmm00001 
New Machine name :  = FILTER FC1120, FC1382 
New Description :  = ตารางการตรวจเช็คถัง FILTER FC 1120, FC1382 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T13:41:13.8230000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1398, N'Save Success : Save Data - Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-07 13:41:39
Host: 10.99.100.105
Save Success : Save Data - Check List 
New Check list id :  =  
New Check list name :  = ระบบ JET 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T13:41:39.9670000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1399, N'Save Success : Save Data - Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-07 13:41:52
Host: 10.99.100.105
Save Success : Save Data - Check List 
New Check list id :  =  
New Check list name :  = ฝุ่นตันในถัง 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T13:41:52.9170000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1400, N'Save Success : Save Data - Group Check List Option ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Group Check List Option 
User: Rattana Chomwihok
Date: 2024-11-07 13:42:12
Host: 10.99.100.105
Save Success : Save Data - Group Check List Option 
New Group check list option id :  =  
New Group check list option name :  = ระบบ JET 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T13:42:12.1100000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1401, N'Save Success : Save Data - Group Check List Option ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Group Check List Option 
User: Rattana Chomwihok
Date: 2024-11-07 13:42:36
Host: 10.99.100.105
Save Success : Save Data - Group Check List Option 
New Group check list option id :  =  
New Group check list option name :  = ฝุ่นตันในถัง 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T13:42:36.7230000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1402, N'Save Success : Save Data - Check List Option ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List Option 
User: Rattana Chomwihok
Date: 2024-11-07 13:43:23
Host: 10.99.100.105
Save Success : Save Data - Check List Option 
New Check list option id :  =  
New Check list option name :  = ตัน 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T13:43:23.2100000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1403, N'Save Success : Save Data - Check List Option ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List Option 
User: Rattana Chomwihok
Date: 2024-11-07 13:43:30
Host: 10.99.100.105
Save Success : Save Data - Check List Option 
New Check list option id :  =  
New Check list option name :  = ไม่ตัน 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T13:43:30.2570000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1404, N'Save Success : Save Data - Match Check List Option ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Match Check List Option 
User: Rattana Chomwihok
Date: 2024-11-07 13:43:42
Host: 10.99.100.105
Save Success : Save Data - Match Check List Option 
New Match check list option id :  =  
New Group check list option id :  = GCL000010 
New Group check list option name :  =  
1 -  = 
New Check list option id : = CLO000010
New IsActive : = true 
2 -  = 
New Check list option id : = CLO000011
New IsActive : = true 
', N'Info', CAST(N'2024-11-07T13:43:42.5770000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1405, N'Save Success : Save Data - Match Check List Option ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Match Check List Option 
User: Rattana Chomwihok
Date: 2024-11-07 13:44:22
Host: 10.99.100.105
Save Success : Save Data - Match Check List Option 
New Match check list option id :  =  
New Group check list option id :  = GCL000009 
New Group check list option name :  =  
1 -  = 
New Check list option id : = CLO000005
New IsActive : = true 
2 -  = 
New Check list option id : = CLO000006
New IsActive : = true 
', N'Info', CAST(N'2024-11-07T13:44:22.3730000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1406, N'Save Success : Save Data - Match Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Match Check List 
User: Rattana Chomwihok
Date: 2024-11-07 13:48:43
Host: 10.99.100.105
Save Success : Save Data - Match Check List 

Generate new form =  
New Form id :  = F00000006 
New Form name :  = FILTER FC 1120, FC1382 
New Description :  = ตารางการตรวจเช็คถัง FILTER FC 1120, FC1382 
All Sub Form New =  
New 1 sf :  = 
Sub form id : SF0000044
Sub form name : ส่วนที่ 1 
New 2 sf :  = 
Sub form id : SF0000045
Sub form name : ส่วนที่ 2 
New 3 sf :  = 
Sub form id : SF0000046
Sub form name : หมายเหตุ 
', N'Info', CAST(N'2024-11-07T13:48:43.9100000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1407, N'Save Success : Save Data - Match Check List Option ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Match Check List Option 
User: Rattana Chomwihok
Date: 2024-11-07 13:50:54
Host: 10.99.100.105
Save Success : Save Data - Match Check List Option 
New Match check list option id :  =  
New Group check list option id :  = GCL000010 
New Group check list option name :  =  
1 -  = 
New Check list option id : = CLO000010
New IsActive : = true 
2 -  = 
New Check list option id : = CLO000011
New IsActive : = true 
', N'Info', CAST(N'2024-11-07T13:50:54.1000000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1408, N'Save Success : Save Data - Match Check List Option ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Match Check List Option 
User: Rattana Chomwihok
Date: 2024-11-07 13:51:18
Host: 10.99.100.105
Save Success : Save Data - Match Check List Option 
New Match check list option id :  =  
New Group check list option id :  = GCL000009 
New Group check list option name :  =  
1 -  = 
New Check list option id : = CLO000005
New IsActive : = true 
2 -  = 
New Check list option id : = CLO000006
New IsActive : = true 
', N'Info', CAST(N'2024-11-07T13:51:18.6430000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1409, N'Save Success : Save Data - Match Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Match Check List 
User: Rattana Chomwihok
Date: 2024-11-07 13:53:23
Host: 10.99.100.105
Save Success : Save Data - Match Check List 

Before =  
Form id :  = F00000006 
Form name :  = FILTER FC 1120, FC1382 
Description :  = ตารางการตรวจเช็คถัง FILTER FC 1120, FC1382 
All Sub Form Change =  
1 sf :  = 
Sub form id : SF0000044
Sub form name : ส่วนที่ 1 
2 sf :  = 
Sub form id : SF0000045
Sub form name : ส่วนที่ 2 
3 sf :  = 
Sub form id : SF0000046
Sub form name : หมายเหตุ 
Update =  
Update form old =  
New Form id :  = F00000006 
New Form name :  = FILTER FC 1120, FC1382 
New Description :  = ตารางการตรวจเช็คถัง FILTER FC 1120, FC1382 
All Sub Form New =  
New 1 sf :  = 
Sub form id : SF0000047
Sub form name : ส่วนที่ 1 
New 2 sf :  = 
Sub form id : SF0000048
Sub form name : ส่วนที่ 2 
New 3 sf :  = 
Sub form id : SF0000049
Sub form name : หมายเหตุ 
', N'Info', CAST(N'2024-11-07T13:53:23.2870000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1410, N'Save Success : Save Data - Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-07 13:54:48
Host: 10.99.100.105
Save Success : Save Data - Check List 
New Check list id :  =  
New Check list name :  = ให้เช็คอย่างน้อย 1  ครั้ง  ใน  2  ชั่วโมง 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T13:54:48.2630000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1411, N'Save Success : Save Data - Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-07 13:55:11
Host: 10.99.100.105
Save Success : Save Data - Check List 
New Check list id :  =  
New Check list name :  = ระบบ JET ถ้าปกติให้ใส่เครื่องหมายในช่องปกติ ถ้าไม่ปกติให้ใส่เครื่องหมายในช่องไม่ปกติ  
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T13:55:11.2430000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1412, N'Save Success : Save Data - Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-07 13:55:41
Host: 10.99.100.105
Save Success : Save Data - Check List 
New Check list id :  =  
New Check list name :  = ฝุ่นตันในถัง ถ้าไม่ตันให้ใส่เครื่องหมายในช่องไม่ตัน ถ้าตันให้ใส่เครื่องหมายในช่องตัน  
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T13:55:41.3870000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1413, N'Save Success : Save Data - Match Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Match Check List 
User: Rattana Chomwihok
Date: 2024-11-07 13:57:12
Host: 10.99.100.105
Save Success : Save Data - Match Check List 

Before =  
Form id :  = F00000006 
Form name :  = FILTER FC 1120, FC1382 
Description :  = ตารางการตรวจเช็คถัง FILTER FC 1120, FC1382 
All Sub Form Change =  
1 sf :  = 
Sub form id : SF0000047
Sub form name : ส่วนที่ 1 
2 sf :  = 
Sub form id : SF0000048
Sub form name : ส่วนที่ 2 
3 sf :  = 
Sub form id : SF0000049
Sub form name : หมายเหตุ 
Update =  
Update form old =  
New Form id :  = F00000006 
New Form name :  = FILTER FC 1120, FC1382 
New Description :  = ตารางการตรวจเช็คถัง FILTER FC 1120, FC1382 
All Sub Form New =  
New 1 sf :  = 
Sub form id : SF0000050
Sub form name : ส่วนที่ 1 
New 2 sf :  = 
Sub form id : SF0000051
Sub form name : ส่วนที่ 2 
New 3 sf :  = 
Sub form id : SF0000052
Sub form name : หมายเหตุ 
', N'Info', CAST(N'2024-11-07T13:57:12.4900000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1414, N'Save Success : Save Data - Match Form Machine ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Match Form Machine 
User: Rattana Chomwihok
Date: 2024-11-07 13:57:47
Host: 10.99.100.105
Save Success : Save Data - Match Form Machine 
New Machine id :  = MLG000002 
New Machine name :  = FILTER FC1120, FC1382 
New Form id :  = F00000006 
', N'Info', CAST(N'2024-11-07T13:57:47.0070000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1415, N'Scan Not Success : Forms ', N'Rattana Chomwihok', N'
Title: Scan Not Success : Forms 
User: Rattana Chomwihok
Date: 2024-11-07 14:02:32
Host: 10.99.100.105
Scan Not Success : Forms 
 The machine id field does not exist in database.', N'Error', CAST(N'2024-11-07T14:02:32.2430000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1416, N'Scan Not Success : Forms ', N'Rattana Chomwihok', N'
Title: Scan Not Success : Forms 
User: Rattana Chomwihok
Date: 2024-11-07 14:02:32
Host: 10.99.100.105
Scan Not Success : Forms 
 The machine id field does not exist in database.', N'Error', CAST(N'2024-11-07T14:02:32.2430000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1417, N'Save Success : Save Data - Machine ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Machine 
User: Rattana Chomwihok
Date: 2024-11-07 14:08:28
Host: 10.99.100.105
Save Success : Save Data - Machine 
New Machine id :  =  
New Group machine id :  = GMmm00001 
New Machine name :  = SEPARATOR-ASPRATOR_6 
New Description :  = ตารางการตรวจเช็คเครื่องจักร   SEPARATOR-ASPRATOR ชั้น 6 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T14:08:28.6730000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1418, N'Save Success : Save Data - Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-07 14:08:57
Host: 10.99.100.105
Save Success : Save Data - Check List 
New Check list id :  =  
New Check list name :  = รายการตรวจเช็ค 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T14:08:57.7100000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1419, N'Save Success : Save Data - Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-07 14:09:29
Host: 10.99.100.105
Save Success : Save Data - Check List 
New Check list id :  =  
New Check list name :  = ช่องเศษฟางมีข้าวดีปนหรือไม่ 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T14:09:29.6830000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1420, N'Save Success : Save Data - Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-07 14:09:46
Host: 10.99.100.105
Save Success : Save Data - Check List 
New Check list id :  =  
New Check list name :  = ช่องฝุ่นมีข้าวดีปนหรือไม่ 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T14:09:46.4000000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1421, N'Save Success : Save Data - Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-07 14:10:12
Host: 10.99.100.105
Save Success : Save Data - Check List 
New Check list id :  =  
New Check list name :  = ชนิดของวัสดุ 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T14:10:12.5730000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1422, N'Save Success : Save Data - Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-07 14:10:22
Host: 10.99.100.105
Save Success : Save Data - Check List 
New Check list id :  =  
New Check list name :  = อื่นๆ 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T14:10:22.5230000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1423, N'Save Success : Save Data - Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-07 14:10:55
Host: 10.99.100.105
Save Success : Save Data - Check List 
New Check list id :  =  
New Check list name :  = วัสดุที่พบในแม่เหล็ก 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T14:10:55.4700000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1424, N'Save Success : Save Data - Group Check List Option ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Group Check List Option 
User: Rattana Chomwihok
Date: 2024-11-07 14:12:18
Host: 10.99.100.105
Save Success : Save Data - Group Check List Option 
New Group check list option id :  =  
New Group check list option name :  = ช่องเศษฟางมีข้าวดีปนหรือไม่ 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T14:12:18.4130000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1425, N'Save Success : Save Data - Group Check List Option ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Group Check List Option 
User: Rattana Chomwihok
Date: 2024-11-07 14:12:36
Host: 10.99.100.105
Save Success : Save Data - Group Check List Option 
New Group check list option id :  =  
New Group check list option name :  = ช่องฝุ่นมีข้าวดีปนหรือไม่ 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T14:12:36.9800000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1426, N'Save Success : Save Data - Group Check List Option ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Group Check List Option 
User: Rattana Chomwihok
Date: 2024-11-07 14:12:47
Host: 10.99.100.105
Save Success : Save Data - Group Check List Option 
New Group check list option id :  =  
New Group check list option name :  = ชนิดของวัสดุ 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T14:12:47.8630000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1427, N'Save Success : Save Data - Group Check List Option ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Group Check List Option 
User: Rattana Chomwihok
Date: 2024-11-07 14:12:53
Host: 10.99.100.105
Save Success : Save Data - Group Check List Option 
New Group check list option id :  =  
New Group check list option name :  = อื่นๆ 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T14:12:53.0330000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1428, N'Save Success : Save Data - Match Check List Option ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Match Check List Option 
User: Rattana Chomwihok
Date: 2024-11-07 14:13:37
Host: 10.99.100.105
Save Success : Save Data - Match Check List Option 
New Match check list option id :  =  
New Group check list option id :  = GCL000011 
New Group check list option name :  =  
1 -  = 
New Check list option id : = CLO000001
New IsActive : = true 
2 -  = 
New Check list option id : = CLO000002
New IsActive : = true 
', N'Info', CAST(N'2024-11-07T14:13:37.2670000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1429, N'Save Success : Save Data - Match Check List Option ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Match Check List Option 
User: Rattana Chomwihok
Date: 2024-11-07 14:13:53
Host: 10.99.100.105
Save Success : Save Data - Match Check List Option 
New Match check list option id :  =  
New Group check list option id :  = GCL000012 
New Group check list option name :  =  
1 -  = 
New Check list option id : = CLO000001
New IsActive : = true 
2 -  = 
New Check list option id : = CLO000002
New IsActive : = true 
', N'Info', CAST(N'2024-11-07T14:13:53.7730000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1430, N'Save Success : Save Data - Group Check List Option ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Group Check List Option 
User: Rattana Chomwihok
Date: 2024-11-07 14:14:30
Host: 10.99.100.105
Save Success : Save Data - Group Check List Option 
New Group check list option id :  =  
New Group check list option name :  = วัสดุที่พบในแม่เหล็ก 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T14:14:30.3870000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1431, N'Save Success : Save Data - Check List Option ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List Option 
User: Rattana Chomwihok
Date: 2024-11-07 14:14:56
Host: 10.99.100.105
Save Success : Save Data - Check List Option 
New Check list option id :  =  
New Check list option name :  = ชนิดของวัสดุ 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T14:14:56.9130000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1432, N'Save Success : Save Data - Check List Option ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List Option 
User: Rattana Chomwihok
Date: 2024-11-07 14:15:01
Host: 10.99.100.105
Save Success : Save Data - Check List Option 
New Check list option id :  =  
New Check list option name :  = อื่นๆ 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T14:15:01.7470000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1433, N'Save Success : Save Data - Match Check List Option ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Match Check List Option 
User: Rattana Chomwihok
Date: 2024-11-07 14:15:10
Host: 10.99.100.105
Save Success : Save Data - Match Check List Option 
New Match check list option id :  =  
New Group check list option id :  = GCL000015 
New Group check list option name :  =  
1 -  = 
New Check list option id : = CLO000012
New IsActive : = true 
2 -  = 
New Check list option id : = CLO000013
New IsActive : = true 
', N'Info', CAST(N'2024-11-07T14:15:10.9030000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1434, N'Save Success : Save Data - Match Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Match Check List 
User: Rattana Chomwihok
Date: 2024-11-07 14:19:20
Host: 10.99.100.105
Save Success : Save Data - Match Check List 

Generate new form =  
New Form id :  = F00000007 
New Form name :  = SEPARATOR-ASPIRATOR ชั้น 6 
New Description :  = ตารางการตรวจเช็คเครื่องจักร  SEPARATOR-ASPIRATOR 
All Sub Form New =  
New 1 sf :  = 
Sub form id : SF0000053
Sub form name : ส่วนที่ 1 
New 2 sf :  = 
Sub form id : SF0000054
Sub form name : ส่วนที่ 2  
New 3 sf :  = 
Sub form id : SF0000055
Sub form name : ส่วนที่ 3 
New 4 sf :  = 
Sub form id : SF0000056
Sub form name : หมายเหตุ 
New 5 sf :  = 
Sub form id : SF0000057
Sub form name : วิธีการตรวจแม่เหล็ก 
', N'Info', CAST(N'2024-11-07T14:19:20.6200000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1435, N'Save Success : Save Data - Match Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Match Check List 
User: Rattana Chomwihok
Date: 2024-11-07 14:24:17
Host: 10.99.100.105
Save Success : Save Data - Match Check List 

Before =  
Form id :  = F00000007 
Form name :  = SEPARATOR-ASPIRATOR ชั้น 6 
Description :  = ตารางการตรวจเช็คเครื่องจักร  SEPARATOR-ASPIRATOR 
All Sub Form Change =  
1 sf :  = 
Sub form id : SF0000053
Sub form name : ส่วนที่ 1 
2 sf :  = 
Sub form id : SF0000054
Sub form name : ส่วนที่ 2 
3 sf :  = 
Sub form id : SF0000055
Sub form name : ส่วนที่ 3 
4 sf :  = 
Sub form id : SF0000056
Sub form name : หมายเหตุ 
5 sf :  = 
Sub form id : SF0000057
Sub form name : วิธีการตรวจแม่เหล็ก 
Update =  
Update form old =  
New Form id :  = F00000007 
New Form name :  = SEPARATOR-ASPIRATOR ชั้น 6 
New Description :  = ตารางการตรวจเช็คเครื่องจักร  SEPARATOR-ASPIRATOR ชั้น 6 
All Sub Form New =  
New 1 sf :  = 
Sub form id : SF0000058
Sub form name : ส่วนที่ 1 
New 2 sf :  = 
Sub form id : SF0000059
Sub form name : ส่วนที่ 2 
New 3 sf :  = 
Sub form id : SF0000060
Sub form name : ส่วนที่ 3 
New 4 sf :  = 
Sub form id : SF0000061
Sub form name : หมายเหตุ 
New 5 sf :  = 
Sub form id : SF0000062
Sub form name : วิธีการตรวจแม่เหล็ก 
', N'Info', CAST(N'2024-11-07T14:24:17.1000000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1436, N'Save Success : Save Data - Match Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Match Check List 
User: Rattana Chomwihok
Date: 2024-11-07 14:32:15
Host: 10.99.100.105
Save Success : Save Data - Match Check List 

Before =  
Form id :  = F00000007 
Form name :  = SEPARATOR-ASPIRATOR ชั้น 6 
Description :  = ตารางการตรวจเช็คเครื่องจักร  SEPARATOR-ASPIRATOR ชั้น 6 
All Sub Form Change =  
1 sf :  = 
Sub form id : SF0000058
Sub form name : ส่วนที่ 1 
2 sf :  = 
Sub form id : SF0000059
Sub form name : ส่วนที่ 2 
3 sf :  = 
Sub form id : SF0000060
Sub form name : ส่วนที่ 3 
4 sf :  = 
Sub form id : SF0000061
Sub form name : หมายเหตุ 
5 sf :  = 
Sub form id : SF0000062
Sub form name : วิธีการตรวจแม่เหล็ก 
Update =  
Update form old =  
New Form id :  = F00000007 
New Form name :  = SEPARATOR-ASPIRATOR ชั้น 6 
New Description :  = ตารางการตรวจเช็คเครื่องจักร  SEPARATOR-ASPIRATOR ชั้น 6 
All Sub Form New =  
New 1 sf :  = 
Sub form id : SF0000063
Sub form name : ส่วนที่ 1 
New 2 sf :  = 
Sub form id : SF0000064
Sub form name : ส่วนที่ 2 
New 3 sf :  = 
Sub form id : SF0000065
Sub form name : ส่วนที่ 3 
New 4 sf :  = 
Sub form id : SF0000066
Sub form name : หมายเหตุ 
New 5 sf :  = 
Sub form id : SF0000067
Sub form name : วิธีการตรวจแม่เหล็ก 
', N'Info', CAST(N'2024-11-07T14:32:15.5900000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1437, N'Save Success : Save Data - Group Check List Option ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Group Check List Option 
User: Rattana Chomwihok
Date: 2024-11-07 14:32:38
Host: 10.99.100.105
Save Success : Save Data - Group Check List Option 
New Group check list option id :  =  
New Group check list option name :  = ให้ทำการตรวจแม่เหล็กอย่างน้อย 1 ครั้งใน 4 ชั่วโมง (2 ครั้ง ต่อ 1 กะ) 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T14:32:38.8330000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1438, N'Save Success : Save Data - Group Check List Option ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Group Check List Option 
User: Rattana Chomwihok
Date: 2024-11-07 14:32:56
Host: 10.99.100.105
Save Success : Save Data - Group Check List Option 
New Group check list option id :  =  
New Group check list option name :  = หากไม่พบวัสดุในแม่เหล็กให้ระบุ "ไม่พบ"  หาก "พบ"  ให้ระบุชนิดที่พบ 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T14:32:56.7300000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1439, N'Save Success : Save Data - Group Check List Option ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Group Check List Option 
User: Rattana Chomwihok
Date: 2024-11-07 14:33:17
Host: 10.99.100.105
Save Success : Save Data - Group Check List Option 
New Group check list option id :  =  
New Group check list option name :  = ถ้าพบวัสดุให้ระบุชนิดของวัสดุนั้น ๆ แล้วสวมถุงมือผ้าเก็บวัสดุออก 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T14:33:17.4430000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1440, N'Save Success : Save Data - Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-07 14:34:31
Host: 10.99.100.105
Save Success : Save Data - Check List 
New Check list id :  =  
New Check list name :  = ให้ทำการตรวจแม่เหล็กอย่างน้อย 1 ครั้งใน 4 ชั่วโมง (2 ครั้ง ต่อ 1 กะ) 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T14:34:31.1030000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1441, N'Save Success : Save Data - Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-07 14:34:43
Host: 10.99.100.105
Save Success : Save Data - Check List 
New Check list id :  =  
New Check list name :  = หากไม่พบวัสดุในแม่เหล็กให้ระบุ "ไม่พบ"  หาก "พบ"  ให้ระบุชนิดที่พบ 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T14:34:43.3970000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1442, N'Save Success : Save Data - Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-07 14:35:05
Host: 10.99.100.105
Save Success : Save Data - Check List 
New Check list id :  =  
New Check list name :  = ถ้าพบวัสดุให้ระบุชนิดของวัสดุนั้น ๆ แล้วสวมถุงมือผ้าเก็บวัสดุออก 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T14:35:05.0270000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1443, N'Save Success : Save Data - Match Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Match Check List 
User: Rattana Chomwihok
Date: 2024-11-07 14:36:43
Host: 10.99.100.105
Save Success : Save Data - Match Check List 

Before =  
Form id :  = F00000007 
Form name :  = SEPARATOR-ASPIRATOR ชั้น 6 
Description :  = ตารางการตรวจเช็คเครื่องจักร  SEPARATOR-ASPIRATOR ชั้น 6 
All Sub Form Change =  
1 sf :  = 
Sub form id : SF0000063
Sub form name : ส่วนที่ 1 
2 sf :  = 
Sub form id : SF0000064
Sub form name : ส่วนที่ 2 
3 sf :  = 
Sub form id : SF0000065
Sub form name : ส่วนที่ 3 
4 sf :  = 
Sub form id : SF0000066
Sub form name : หมายเหตุ 
5 sf :  = 
Sub form id : SF0000067
Sub form name : วิธีการตรวจแม่เหล็ก 
Update =  
Update form old =  
New Form id :  = F00000007 
New Form name :  = SEPARATOR-ASPIRATOR ชั้น 6 
New Description :  = ตารางการตรวจเช็คเครื่องจักร  SEPARATOR-ASPIRATOR ชั้น 6 
All Sub Form New =  
New 1 sf :  = 
Sub form id : SF0000068
Sub form name : ส่วนที่ 1 
New 2 sf :  = 
Sub form id : SF0000069
Sub form name : ส่วนที่ 2 
New 3 sf :  = 
Sub form id : SF0000070
Sub form name : ส่วนที่ 3 
New 4 sf :  = 
Sub form id : SF0000071
Sub form name : หมายเหตุ 
New 5 sf :  = 
Sub form id : SF0000072
Sub form name : วิธีการตรวจแม่เหล็ก 
', N'Info', CAST(N'2024-11-07T14:36:43.5700000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1444, N'Save Success : Save Data - Match Form Machine ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Match Form Machine 
User: Rattana Chomwihok
Date: 2024-11-07 14:36:54
Host: 10.99.100.105
Save Success : Save Data - Match Form Machine 
New Machine id :  = MLG000003 
New Machine name :  = SEPARATOR-ASPRATOR_6 
New Form id :  = F00000007 
', N'Info', CAST(N'2024-11-07T14:36:54.8000000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1445, N'Save Success : Save Data - Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-07 14:40:06
Host: 10.99.100.105
Save Success : Save Data - Check List 
New Check list id :  =  
New Check list name :  = ช่องหินออกปกติ หรือไม่ปกติ 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T14:40:06.0130000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1446, N'Save Success : Save Data - Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-07 14:41:07
Host: 10.99.100.105
Save Success : Save Data - Check List 
New Check list id :  =  
New Check list name :  = ระบบลมดูด 0-15 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T14:41:07.7600000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1447, N'Save Success : Save Data - Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-07 14:41:18
Host: 10.99.100.105
Save Success : Save Data - Check List 
New Check list id :  =  
New Check list name :  = ค่าความสั่นของเครื่อง MIN - MIX 4 - 5  
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T14:41:18.8100000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1448, N'Save Success : Save Data - Group Check List Option ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Group Check List Option 
User: Rattana Chomwihok
Date: 2024-11-07 14:42:32
Host: 10.99.100.105
Save Success : Save Data - Group Check List Option 
New Group check list option id :  =  
New Group check list option name :  = ช่องหินออกปกติ หรือไม่ปกติ 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T14:42:32.6470000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1449, N'Save Success : Save Data - Group Check List Option ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Group Check List Option 
User: Rattana Chomwihok
Date: 2024-11-07 14:42:47
Host: 10.99.100.105
Save Success : Save Data - Group Check List Option 
New Group check list option id :  =  
New Group check list option name :  = ระบบลมดูด 0-15  
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T14:42:47.4100000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1450, N'Save Success : Save Data - Group Check List Option ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Group Check List Option 
User: Rattana Chomwihok
Date: 2024-11-07 14:42:54
Host: 10.99.100.105
Save Success : Save Data - Group Check List Option 
New Group check list option id :  =  
New Group check list option name :  = ค่าความสั่นของเครื่อง MIN - MIX 4 - 5  
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T14:42:54.4170000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1451, N'Save Not Success : Check List ', N'Rattana Chomwihok', N'
Title: Save Not Success : Check List 
User: Rattana Chomwihok
Date: 2024-11-07 14:44:45
Host: 10.99.100.105
Save Not Success : Check List 
 The check list name field is duplicate: รายการตรวจเช็ค.', N'Error', CAST(N'2024-11-07T14:44:45.0900000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1452, N'Save Success : Save Data - Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-07 14:44:50
Host: 10.99.100.105
Save Success : Save Data - Check List 
New Check list id :  =  
New Check list name :  = รายการตรวจเช็คระบบ 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T14:44:50.0000000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1453, N'Save Success : Save Data - Group Check List Option ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Group Check List Option 
User: Rattana Chomwihok
Date: 2024-11-07 14:47:00
Host: 10.99.100.105
Save Success : Save Data - Group Check List Option 
New Group check list option id :  =  
New Group check list option name :  = รายการตรวจเช็คระบบ 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T14:47:00.1070000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1454, N'Save Success : Save Data - Match Check List Option ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Match Check List Option 
User: Rattana Chomwihok
Date: 2024-11-07 14:47:29
Host: 10.99.100.105
Save Success : Save Data - Match Check List Option 
New Match check list option id :  =  
New Group check list option id :  = GCL000019 
New Group check list option name :  =  
1 -  = 
New Check list option id : = CLO000005
New IsActive : = true 
2 -  = 
New Check list option id : = CLO000006
New IsActive : = true 
', N'Info', CAST(N'2024-11-07T14:47:29.7830000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1455, N'Save Success : Save Data - Match Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Match Check List 
User: Rattana Chomwihok
Date: 2024-11-07 14:53:20
Host: 10.99.100.105
Save Success : Save Data - Match Check List 

Generate new form =  
New Form id :  = F00000008 
New Form name :  = DE STONER (OPRP) 
New Description :  = ตารางการตรวจเช็คเครื่องจักร  DE STONER  (จุด OPRP) 
All Sub Form New =  
New 1 sf :  = 
Sub form id : SF0000073
Sub form name : ส่วนที่ 1 
New 2 sf :  = 
Sub form id : SF0000074
Sub form name : ส่วนที่ 2 
New 3 sf :  = 
Sub form id : SF0000075
Sub form name : ส่วนที่ 3 
New 4 sf :  = 
Sub form id : SF0000076
Sub form name : หมายเหตุ 
New 5 sf :  = 
Sub form id : SF0000077
Sub form name : วิธีการแก้ไช 
', N'Info', CAST(N'2024-11-07T14:53:20.4400000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1456, N'Save Success : Save Data - Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-07 14:53:51
Host: 10.99.100.105
Save Success : Save Data - Check List 
New Check list id :  =  
New Check list name :  = รายการช่อง 1  ให้ระบุ  "ปกติ"  หรือ "ไม่ปกติ"  ถ้าระบุ  "ไม่ปกติ "  ให้ปฏิบัติตามวิธีการแก้ไข 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T14:53:51.3230000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1457, N'Save Success : Save Data - Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-07 14:54:11
Host: 10.99.100.105
Save Success : Save Data - Check List 
New Check list id :  =  
New Check list name :  = รายการช่อง 2 ให้ระบุ "ตัวเลขค่าของลมดูด" ตามค่าที่กำหนดถ้าสูงกว่าให้ปฏิบัติตามวิธีการแก้ไข 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T14:54:11.6930000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1458, N'Save Success : Save Data - Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-07 14:54:31
Host: 10.99.100.105
Save Success : Save Data - Check List 
New Check list id :  =  
New Check list name :  = รายการช่อง 3  ให้ระบุความสั่นของเครื่อง ถ้าความสั่น ต่ำ หรือ สูง กว่ากำหนด  ให้แจ้งหัวหน้ากะ ทันที หัวหน้ากะแจ้งช่างประจำกะ ให้ทำการตรวจสอบทันที 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T14:54:31.8700000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1459, N'Save Success : Save Data - Match Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Match Check List 
User: Rattana Chomwihok
Date: 2024-11-07 14:56:22
Host: 10.99.100.105
Save Success : Save Data - Match Check List 

Before =  
Form id :  = F00000008 
Form name :  = DE STONER (OPRP) 
Description :  = ตารางการตรวจเช็คเครื่องจักร  DE STONER  (จุด OPRP) 
All Sub Form Change =  
1 sf :  = 
Sub form id : SF0000073
Sub form name : ส่วนที่ 1 
2 sf :  = 
Sub form id : SF0000074
Sub form name : ส่วนที่ 2 
3 sf :  = 
Sub form id : SF0000075
Sub form name : ส่วนที่ 3 
4 sf :  = 
Sub form id : SF0000076
Sub form name : หมายเหตุ 
5 sf :  = 
Sub form id : SF0000077
Sub form name : วิธีการแก้ไช 
Update =  
Update form old =  
New Form id :  = F00000008 
New Form name :  = DE STONER (OPRP) 
New Description :  = ตารางการตรวจเช็คเครื่องจักร  DE STONER  (จุด OPRP) 
All Sub Form New =  
New 1 sf :  = 
Sub form id : SF0000078
Sub form name : ส่วนที่ 1 
New 2 sf :  = 
Sub form id : SF0000079
Sub form name : ส่วนที่ 2 
New 3 sf :  = 
Sub form id : SF0000080
Sub form name : ส่วนที่ 3 
New 4 sf :  = 
Sub form id : SF0000081
Sub form name : หมายเหตุ 
New 5 sf :  = 
Sub form id : SF0000082
Sub form name : วิธีการแก้ไช 
', N'Info', CAST(N'2024-11-07T14:56:22.5770000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1460, N'Save Success : Save Data - Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-07 14:56:42
Host: 10.99.100.105
Save Success : Save Data - Check List 
New Check list id :  =  
New Check list name :  = พนักงาน  Millhand  แจ้งให้  Miller  ทราบ 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T14:56:42.3400000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1461, N'Save Success : Save Data - Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-07 14:57:00
Host: 10.99.100.105
Save Success : Save Data - Check List 
New Check list id :  =  
New Check list name :  = Miller แจ้งหัวหน้าแผนกผลิต และแจ้งช่างซ่อมประจำกะให้ทำการตรวจสอบและแก้ไขทันที 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T14:57:00.5200000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1462, N'Save Success : Save Data - Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-07 14:57:29
Host: 10.99.100.105
Save Success : Save Data - Check List 
New Check list id :  =  
New Check list name :  = Miller ทำการปรับลดกำลังการล้างข้าวสาลีลง เพื่อให้การแยกหิน - ทราย  ออกในขั้นตอนการล้างข้าวต่อไป 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T14:57:29.2870000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1463, N'Save Success : Save Data - Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-07 14:57:42
Host: 10.99.100.105
Save Success : Save Data - Check List 
New Check list id :  =  
New Check list name :  = ถ้าพบว่าในช่องหินไม่มีข้าวปนเลย  รวมทั้งระบบลมดูด และค่าความสั่นของเครื่องไม่อยู่ในเกณฑ์ให้ดำเนินการดังนี้ 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T14:57:42.1170000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1464, N'Save Success : Save Data - Match Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Match Check List 
User: Rattana Chomwihok
Date: 2024-11-07 14:59:06
Host: 10.99.100.105
Save Success : Save Data - Match Check List 

Before =  
Form id :  = F00000008 
Form name :  = DE STONER (OPRP) 
Description :  = ตารางการตรวจเช็คเครื่องจักร  DE STONER  (จุด OPRP) 
All Sub Form Change =  
1 sf :  = 
Sub form id : SF0000078
Sub form name : ส่วนที่ 1 
2 sf :  = 
Sub form id : SF0000079
Sub form name : ส่วนที่ 2 
3 sf :  = 
Sub form id : SF0000080
Sub form name : ส่วนที่ 3 
4 sf :  = 
Sub form id : SF0000081
Sub form name : หมายเหตุ 
5 sf :  = 
Sub form id : SF0000082
Sub form name : วิธีการแก้ไช 
Update =  
Update form old =  
New Form id :  = F00000008 
New Form name :  = DE STONER (OPRP) 
New Description :  = ตารางการตรวจเช็คเครื่องจักร  DE STONER  (จุด OPRP) 
All Sub Form New =  
New 1 sf :  = 
Sub form id : SF0000083
Sub form name : ส่วนที่ 1 
New 2 sf :  = 
Sub form id : SF0000084
Sub form name : ส่วนที่ 2 
New 3 sf :  = 
Sub form id : SF0000085
Sub form name : ส่วนที่ 3 
New 4 sf :  = 
Sub form id : SF0000086
Sub form name : หมายเหตุ 
New 5 sf :  = 
Sub form id : SF0000087
Sub form name : วิธีการแก้ไข 
', N'Info', CAST(N'2024-11-07T14:59:06.7570000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1465, N'Save Success : Save Data - Match Form Machine ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Match Form Machine 
User: Rattana Chomwihok
Date: 2024-11-07 14:59:18
Host: 10.99.100.105
Save Success : Save Data - Match Form Machine 
New Machine id :  = M00000003 
New Machine name :  = De STONER 
New Form id :  = F00000008 
', N'Info', CAST(N'2024-11-07T14:59:18.3970000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1466, N'Save Success : Save Data - Machine ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Machine 
User: Rattana Chomwihok
Date: 2024-11-07 15:08:08
Host: 10.99.100.105
Save Success : Save Data - Machine 
New Machine id :  =  
New Group machine id :  = GMmm00001 
New Machine name :  = Sortex 
New Description :  = ตารางการตรวจเช็คเครื่อง Sortex 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T15:08:08.1300000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1467, N'Save Success : Save Data - Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-07 15:08:41
Host: 10.99.100.105
Save Success : Save Data - Check List 
New Check list id :  =  
New Check list name :  = ระบุเลข Presser Dust 0 - 20 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T15:08:41.8170000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1468, N'Save Success : Save Data - Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-07 15:08:59
Host: 10.99.100.105
Save Success : Save Data - Check List 
New Check list id :  =  
New Check list name :  = ระบุตัวเลข แรงดันลม 4 - 5 Bar 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T15:08:59.0470000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1469, N'Save Success : Save Data - Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-07 15:09:12
Host: 10.99.100.105
Save Success : Save Data - Check List 
New Check list id :  =  
New Check list name :  = ระบุตัวเลข Feed Product 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T15:09:12.7000000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1470, N'Save Success : Save Data - Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-07 15:09:56
Host: 10.99.100.105
Save Success : Save Data - Check List 
New Check list id :  =  
New Check list name :  = เปอร์เซ็นต์(%)ของค่าการคัดแยก โปรดระบุเป็นตัวเลข						 						 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T15:09:56.3130000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1471, N'Save Success : Save Data - Group Check List Option ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Group Check List Option 
User: Rattana Chomwihok
Date: 2024-11-07 15:10:30
Host: 10.99.100.105
Save Success : Save Data - Group Check List Option 
New Group check list option id :  =  
New Group check list option name :  = ระบุเลข Presser Dust 0 - 20 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T15:10:30.2200000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1472, N'Save Success : Save Data - Group Check List Option ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Group Check List Option 
User: Rattana Chomwihok
Date: 2024-11-07 15:10:39
Host: 10.99.100.105
Save Success : Save Data - Group Check List Option 
New Group check list option id :  =  
New Group check list option name :  = ระบุตัวเลข แรงดันลม 4 - 5 Bar 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T15:10:39.7070000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1473, N'Save Success : Save Data - Group Check List Option ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Group Check List Option 
User: Rattana Chomwihok
Date: 2024-11-07 15:10:47
Host: 10.99.100.105
Save Success : Save Data - Group Check List Option 
New Group check list option id :  =  
New Group check list option name :  = ระบุตัวเลข Feed Product 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T15:10:47.8900000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1474, N'Save Not Success : Group Check List Option ', N'Rattana Chomwihok', N'
Title: Save Not Success : Group Check List Option 
User: Rattana Chomwihok
Date: 2024-11-07 15:11:06
Host: 10.99.100.105
Save Not Success : Group Check List Option 
 The group machine name field is duplicate: ระบุตัวเลข Feed Product.', N'Error', CAST(N'2024-11-07T15:11:06.7800000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1475, N'Save Success : Save Data - Group Check List Option ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Group Check List Option 
User: Rattana Chomwihok
Date: 2024-11-07 15:11:33
Host: 10.99.100.105
Save Success : Save Data - Group Check List Option 
New Group check list option id :  =  
New Group check list option name :  = เปอร์เซ็นต์ (%) ของค่าการคัดแยก โปรดระบุ						 						 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T15:11:33.9100000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1476, N'Save Not Success : Match Check List ', N'Rattana Chomwihok', N'
Title: Save Not Success : Match Check List 
User: Rattana Chomwihok
Date: 2024-11-07 15:12:56
Host: 10.99.100.105
Save Not Success : Match Check List 
 The sub form field is required.', N'Error', CAST(N'2024-11-07T15:12:56.1330000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1477, N'Save Success : Save Data - Match Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Match Check List 
User: Rattana Chomwihok
Date: 2024-11-07 15:14:01
Host: 10.99.100.105
Save Success : Save Data - Match Check List 

Generate new form =  
New Form id :  = F00000009 
New Form name :  = Sortex 
New Description :  = ตารางการตรวจเช็คเครื่อง Sortex 
All Sub Form New =  
New 1 sf :  = 
Sub form id : SF0000088
Sub form name : ส่วนที่ 1 
New 2 sf :  = 
Sub form id : SF0000089
Sub form name : ส่วนที่ 2  
New 3 sf :  = 
Sub form id : SF0000090
Sub form name : ส่วนที่ 3 
New 4 sf :  = 
Sub form id : SF0000091
Sub form name : วิธีการแก้ไข 
', N'Info', CAST(N'2024-11-07T15:14:01.2930000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1478, N'Save Success : Save Data - Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-07 15:15:02
Host: 10.99.100.105
Save Success : Save Data - Check List 
New Check list id :  =  
New Check list name :  = ถ้าพบ  Presser Dust สูงกว่าที่กำหนด ให้ทำการตรวจเช็คการทำงานของระบบ Dust และถ้าผิดปกติให้ทำการแจ้งช่างทันที 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T15:15:01.9970000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1479, N'Save Success : Save Data - Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-07 15:15:39
Host: 10.99.100.105
Save Success : Save Data - Check List 
New Check list id :  =  
New Check list name :  = ถ้าแรงดันลมต่ำให้ตรวจสอบ % การคัดแยก และปั๊มลม 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T15:15:39.4570000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1480, N'Save Success : Save Data - Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-07 15:18:04
Host: 10.99.100.105
Save Success : Save Data - Check List 
New Check list id :  =  
New Check list name :  = การทำงานของเครื่องจักรผิดปกติ ให้ทำการแจ้งหัวหน้างาน เพื่อทำการแจ้งซ่อม 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T15:18:04.0230000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1481, N'Save Success : Save Data - Match Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Match Check List 
User: Rattana Chomwihok
Date: 2024-11-07 15:29:15
Host: 10.99.100.105
Save Success : Save Data - Match Check List 

Before =  
Form id :  = F00000009 
Form name :  = Sortex 
Description :  = ตารางการตรวจเช็คเครื่อง Sortex 
All Sub Form Change =  
1 sf :  = 
Sub form id : SF0000088
Sub form name : ส่วนที่ 1 
2 sf :  = 
Sub form id : SF0000089
Sub form name : ส่วนที่ 2 
3 sf :  = 
Sub form id : SF0000090
Sub form name : ส่วนที่ 3 
4 sf :  = 
Sub form id : SF0000091
Sub form name : วิธีการแก้ไข 
Update =  
Update form old =  
New Form id :  = F00000009 
New Form name :  = Sortex 
New Description :  = ตารางการตรวจเช็คเครื่อง Sortex 
All Sub Form New =  
New 1 sf :  = 
Sub form id : SF0000092
Sub form name : ส่วนที่ 1 
New 2 sf :  = 
Sub form id : SF0000093
Sub form name : ส่วนที่ 2 
New 3 sf :  = 
Sub form id : SF0000094
Sub form name : ส่วนที่ 3 
New 4 sf :  = 
Sub form id : SF0000095
Sub form name : วิธีการแก้ไข 
', N'Info', CAST(N'2024-11-07T15:29:15.5100000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1482, N'Save Success : Save Data - Match Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Match Check List 
User: Rattana Chomwihok
Date: 2024-11-07 15:32:27
Host: 10.99.100.105
Save Success : Save Data - Match Check List 

Before =  
Form id :  = F00000009 
Form name :  = Sortex 
Description :  = ตารางการตรวจเช็คเครื่อง Sortex 
All Sub Form Change =  
1 sf :  = 
Sub form id : SF0000092
Sub form name : ส่วนที่ 1 
2 sf :  = 
Sub form id : SF0000093
Sub form name : ส่วนที่ 2 
3 sf :  = 
Sub form id : SF0000094
Sub form name : ส่วนที่ 3 
4 sf :  = 
Sub form id : SF0000095
Sub form name : วิธีการแก้ไข 
Update =  
Update form old =  
New Form id :  = F00000009 
New Form name :  = Sortex 
New Description :  = ตารางการตรวจเช็คเครื่อง Sortex 
All Sub Form New =  
New 1 sf :  = 
Sub form id : SF0000096
Sub form name : ส่วนที่ 1 
New 2 sf :  = 
Sub form id : SF0000097
Sub form name : ส่วนที่ 2 
New 3 sf :  = 
Sub form id : SF0000098
Sub form name : ส่วนที่ 3 
New 4 sf :  = 
Sub form id : SF0000099
Sub form name : วิธีการแก้ไข 
', N'Info', CAST(N'2024-11-07T15:32:27.4570000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1483, N'Save Success : Save Data - Match Form Machine ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Match Form Machine 
User: Rattana Chomwihok
Date: 2024-11-07 15:32:46
Host: 10.99.100.105
Save Success : Save Data - Match Form Machine 
New Machine id :  = MLG000004 
New Machine name :  = Sortex 
New Form id :  = F00000009 
', N'Info', CAST(N'2024-11-07T15:32:46.3200000' AS DateTime2))
GO
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1484, N'Save Success : Save Data - Machine ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Machine 
User: Rattana Chomwihok
Date: 2024-11-07 15:35:20
Host: 10.99.100.105
Save Success : Save Data - Machine 
New Machine id :  =  
New Group machine id :  = GMmm00001 
New Machine name :  = Magnet  E1  
New Description :  = การทำความสะอาดแม่เหล็ก E1 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T15:35:20.1770000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1485, N'Save Success : Save Data - Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-07 15:35:45
Host: 10.99.100.105
Save Success : Save Data - Check List 
New Check list id :  =  
New Check list name :  = เวลาทำความสะอาด 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T15:35:45.4000000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1486, N'Save Success : Save Data - Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-07 15:35:55
Host: 10.99.100.105
Save Success : Save Data - Check List 
New Check list id :  =  
New Check list name :  = รายการทำความสะอาด 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T15:35:55.0970000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1487, N'Save Success : Save Data - Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-07 15:36:06
Host: 10.99.100.105
Save Success : Save Data - Check List 
New Check list id :  =  
New Check list name :  = เวลาเริ่มเดินเครื่อง 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T15:36:06.4000000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1488, N'Save Success : Save Data - Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-07 15:36:17
Host: 10.99.100.105
Save Success : Save Data - Check List 
New Check list id :  =  
New Check list name :  = ผู้ปฎิบัติงาน 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T15:36:17.2870000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1489, N'Save Success : Save Data - Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-07 15:36:27
Host: 10.99.100.105
Save Success : Save Data - Check List 
New Check list id :  =  
New Check list name :  = ผู้ตรวจเช็ค 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T15:36:27.0330000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1490, N'Save Success : Save Data - Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-07 15:36:48
Host: 10.99.100.105
Save Success : Save Data - Check List 
New Check list id :  =  
New Check list name :  = ให้ทำความสะอาดแม่เหล็กก่อนเดินเครื่องจักรทุกครั้ง 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T15:36:48.9800000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1491, N'Save Not Success : Match Check List ', N'Rattana Chomwihok', N'
Title: Save Not Success : Match Check List 
User: Rattana Chomwihok
Date: 2024-11-07 15:39:37
Host: 10.99.100.105
Save Not Success : Match Check List 
 The sub form field is required.', N'Error', CAST(N'2024-11-07T15:39:37.8400000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1492, N'Save Not Success : Match Check List ', N'Rattana Chomwihok', N'
Title: Save Not Success : Match Check List 
User: Rattana Chomwihok
Date: 2024-11-07 15:39:44
Host: 10.99.100.105
Save Not Success : Match Check List 
 The sub form field is required.', N'Error', CAST(N'2024-11-07T15:39:44.0300000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1493, N'Save Success : Save Data - Match Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Match Check List 
User: Rattana Chomwihok
Date: 2024-11-07 15:43:57
Host: 10.99.100.105
Save Success : Save Data - Match Check List 

Generate new form =  
New Form id :  = F00000010 
New Form name :  = Magnet E1 
New Description :  = การทำความสะอาดแม่เหล็ก E1 
All Sub Form New =  
New 1 sf :  = 
Sub form id : SF0000100
Sub form name : ส่วนที่ 1 
New 2 sf :  = 
Sub form id : SF0000101
Sub form name : ส่วนที่ 2 
New 3 sf :  = 
Sub form id : SF0000102
Sub form name : หมายเหตุ 
', N'Info', CAST(N'2024-11-07T15:43:57.4100000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1494, N'Save Success : Save Data - Match Form Machine ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Match Form Machine 
User: Rattana Chomwihok
Date: 2024-11-07 15:44:12
Host: 10.99.100.105
Save Success : Save Data - Match Form Machine 
New Machine id :  = MLG000005 
New Machine name :  = Magnet  E1 
New Form id :  = F00000010 
', N'Info', CAST(N'2024-11-07T15:44:12.5170000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1495, N'Save Success : Save Data - Machine ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Machine 
User: Rattana Chomwihok
Date: 2024-11-07 15:46:51
Host: 10.99.100.105
Save Success : Save Data - Machine 
New Machine id :  =  
New Group machine id :  = GMmm00001 
New Machine name :  = SEPARATOR-ASPRATOR_7 
New Description :  = ตารางการตรวจเช็คเครื่องจักร   SCOURER - ASPIRATOR  ชั้น 7/รายการตรวจแม่เหล็ก   SCOURER - ASPIRATOR  (MILL WHEAT) ชั้น 7 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T15:46:51.4970000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1496, N'Save Not Success : Check List ', N'Rattana Chomwihok', N'
Title: Save Not Success : Check List 
User: Rattana Chomwihok
Date: 2024-11-07 15:47:16
Host: 10.99.100.105
Save Not Success : Check List 
 The check list name field is duplicate: กากข้าวมีข้าวดีปนหรือไม่.', N'Error', CAST(N'2024-11-07T15:47:16.8730000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1497, N'Save Success : Save Data - Match Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Match Check List 
User: Rattana Chomwihok
Date: 2024-11-07 15:57:26
Host: 10.99.100.105
Save Success : Save Data - Match Check List 

Generate new form =  
New Form id :  = F00000011 
New Form name :  = SCOURER - ASPIRATOR  ชั้น 7_A 
New Description :  = ตารางการตรวจเช็คเครื่องจักร   SCOURER - ASPIRATOR  ชั้น 7/รายการตรวจแม่เหล็ก   SCOURER - ASPIRATOR  (MILL WHEAT) ชั้น 7 
All Sub Form New =  
New 1 sf :  = 
Sub form id : SF0000103
Sub form name : ส่วนที่ 1 
New 2 sf :  = 
Sub form id : SF0000104
Sub form name : ส่วนที่ 2 
New 3 sf :  = 
Sub form id : SF0000105
Sub form name : ส่วนที่ 3 
New 4 sf :  = 
Sub form id : SF0000106
Sub form name : ส่วนที่ 4 
New 5 sf :  = 
Sub form id : SF0000107
Sub form name : หมายเหตุ 
New 6 sf :  = 
Sub form id : SF0000108
Sub form name : วิธีการตรวจแม่เหล็ก 
', N'Info', CAST(N'2024-11-07T15:57:26.6330000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1498, N'Save Success : Save Data - Match Form Machine ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Match Form Machine 
User: Rattana Chomwihok
Date: 2024-11-07 15:57:42
Host: 10.99.100.105
Save Success : Save Data - Match Form Machine 
New Machine id :  = MLG000006 
New Machine name :  = SEPARATOR-ASPRATOR_7 
New Form id :  = F00000011 
', N'Info', CAST(N'2024-11-07T15:57:42.3830000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1499, N'Save Success : Save Data - Machine ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Machine 
User: Rattana Chomwihok
Date: 2024-11-07 16:00:17
Host: 10.99.100.105
Save Success : Save Data - Machine 
New Machine id :  =  
New Group machine id :  = GMmm00001 
New Machine name :  = Clean HAMMERMILL 
New Description :  = การทำความสะอาดแม่เหล็ก HAMMERMILL 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T16:00:17.4930000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1500, N'Save Success : Save Data - Match Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Match Check List 
User: Rattana Chomwihok
Date: 2024-11-07 16:04:37
Host: 10.99.100.105
Save Success : Save Data - Match Check List 

Generate new form =  
New Form id :  = F00000012 
New Form name :  = Clean HAMMERMILL  
New Description :  = การทำความสะอาดแม่เหล็ก HAMMERMILL 
All Sub Form New =  
New 1 sf :  = 
Sub form id : SF0000109
Sub form name : ส่วนที่ 1 
New 2 sf :  = 
Sub form id : SF0000110
Sub form name : ส่วนที่ 2  
New 3 sf :  = 
Sub form id : SF0000111
Sub form name : หมายเหตุ 
', N'Info', CAST(N'2024-11-07T16:04:37.7370000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1501, N'Save Success : Save Data - Match Form Machine ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Match Form Machine 
User: Rattana Chomwihok
Date: 2024-11-07 16:04:50
Host: 10.99.100.105
Save Success : Save Data - Match Form Machine 
New Machine id :  = MLG000007 
New Machine name :  = Clean HAMMERMILL 
New Form id :  = F00000012 
', N'Info', CAST(N'2024-11-07T16:04:50.4730000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1502, N'Save Success : Save Data - Machine ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Machine 
User: Rattana Chomwihok
Date: 2024-11-07 16:44:05
Host: 10.99.100.105
Save Success : Save Data - Machine 
New Machine id :  =  
New Group machine id :  = GMmm00001 
New Machine name :  = แม่เหล็กตาชั้่ง B1 
New Description :  = รายการตรวจแม่เหล็กตาชั่ง B1 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T16:44:05.6800000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1503, N'Save Success : Save Data - Match Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Match Check List 
User: Rattana Chomwihok
Date: 2024-11-07 16:50:20
Host: 10.99.100.105
Save Success : Save Data - Match Check List 

Generate new form =  
New Form id :  = F00000013 
New Form name :  = แม่เหล็กตาชั่ง 1 
New Description :  = รายการตรวจแม่เหล็กตาชั่ง B1 
All Sub Form New =  
New 1 sf :  = 
Sub form id : SF0000112
Sub form name : ส่วนที่ 1 
New 2 sf :  = 
Sub form id : SF0000113
Sub form name : ส่วนที่ 2 
New 3 sf :  = 
Sub form id : SF0000114
Sub form name : หมายเหตุ 
', N'Info', CAST(N'2024-11-07T16:50:20.2370000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1504, N'Save Success : Save Data - Group Check List Option ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Group Check List Option 
User: Rattana Chomwihok
Date: 2024-11-07 16:51:22
Host: 10.99.100.105
Save Success : Save Data - Group Check List Option 
New Group check list option id :  =  
New Group check list option name :  = ผู้ทำหน้าที่ Check List คือพนักงานระดับ Assistant ขึ้นไป 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T16:51:22.7500000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1505, N'Save Success : Save Data - Match Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Match Check List 
User: Rattana Chomwihok
Date: 2024-11-07 16:51:58
Host: 10.99.100.105
Save Success : Save Data - Match Check List 

Before =  
Form id :  = F00000013 
Form name :  = แม่เหล็กตาชั่ง 1 
Description :  = รายการตรวจแม่เหล็กตาชั่ง B1 
All Sub Form Change =  
1 sf :  = 
Sub form id : SF0000112
Sub form name : ส่วนที่ 1 
2 sf :  = 
Sub form id : SF0000113
Sub form name : ส่วนที่ 2 
3 sf :  = 
Sub form id : SF0000114
Sub form name : หมายเหตุ 
Update =  
Update form old =  
New Form id :  = F00000013 
New Form name :  = แม่เหล็กตาชั่ง 1 
New Description :  = รายการตรวจแม่เหล็กตาชั่ง B1 
All Sub Form New =  
New 1 sf :  = 
Sub form id : SF0000115
Sub form name : ส่วนที่ 1 
New 2 sf :  = 
Sub form id : SF0000116
Sub form name : ส่วนที่ 2 
New 3 sf :  = 
Sub form id : SF0000117
Sub form name : หมายเหตุ 
', N'Info', CAST(N'2024-11-07T16:51:58.7270000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1506, N'Save Success : Save Data - Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Check List 
User: Rattana Chomwihok
Date: 2024-11-07 16:52:23
Host: 10.99.100.105
Save Success : Save Data - Check List 
New Check list id :  =  
New Check list name :  = ผู้ทำ  CHECK LIST   คือ  พนักงาน  ASSISTANT  ขึ้นไป 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-07T16:52:23.5400000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1507, N'Save Success : Save Data - Match Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Match Check List 
User: Rattana Chomwihok
Date: 2024-11-07 16:52:47
Host: 10.99.100.105
Save Success : Save Data - Match Check List 

Before =  
Form id :  = F00000013 
Form name :  = แม่เหล็กตาชั่ง 1 
Description :  = รายการตรวจแม่เหล็กตาชั่ง B1 
All Sub Form Change =  
1 sf :  = 
Sub form id : SF0000115
Sub form name : ส่วนที่ 1 
2 sf :  = 
Sub form id : SF0000116
Sub form name : ส่วนที่ 2 
3 sf :  = 
Sub form id : SF0000117
Sub form name : หมายเหตุ 
Update =  
Update form old =  
New Form id :  = F00000013 
New Form name :  = แม่เหล็กตาชั่ง 1 
New Description :  = รายการตรวจแม่เหล็กตาชั่ง B1 
All Sub Form New =  
New 1 sf :  = 
Sub form id : SF0000118
Sub form name : ส่วนที่ 1 
New 2 sf :  = 
Sub form id : SF0000119
Sub form name : ส่วนที่ 2 
New 3 sf :  = 
Sub form id : SF0000120
Sub form name : หมายเหตุ 
', N'Info', CAST(N'2024-11-07T16:52:47.6670000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1508, N'Save Success : Save Data - Match Form Machine ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Match Form Machine 
User: Rattana Chomwihok
Date: 2024-11-07 16:53:03
Host: 10.99.100.105
Save Success : Save Data - Match Form Machine 
New Machine id :  = MLG000008 
New Machine name :  = แม่เหล็กตาชั้่ง B1 
New Form id :  = F00000013 
', N'Info', CAST(N'2024-11-07T16:53:03.3500000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1509, N'Save Success : Save Data - Match Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Match Check List 
User: Rattana Chomwihok
Date: 2024-11-08 10:16:42
Host: 10.99.100.105
Save Success : Save Data - Match Check List 

Generate new form =  
New Form id :  = F00000014 
New Form name :  = B1 
New Description :  = B1 
All Sub Form New =  
New 1 sf :  = 
Sub form id : SF0000121
Sub form name : ส่วนที่ 1 
New 2 sf :  = 
Sub form id : SF0000122
Sub form name : ส่วนที่ 2 
New 3 sf :  = 
Sub form id : SF0000123
Sub form name : หมายเหตุ 
', N'Info', CAST(N'2024-11-08T10:16:42.4770000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1510, N'Save Success : Save Data - Expected Result ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Expected Result 
User: Rattana Chomwihok
Date: 2024-11-08 10:55:13
Host: 10.99.100.105
Save Success : Save Data - Expected Result List of result =  
1 = 
Form id : F00000013
Machine id : MLG000008
Table id : ER0000002
Machine check list id : 888
Expected result : CLO000012 
3 = 
Form id : F00000013
Machine id : MLG000008
Table id : ER0000002
Machine check list id : 889
Expected result : เเเ 
4 = 
Form id : F00000013
Machine id : MLG000008
Table id : ER0000002
Machine check list id : 890
Expected result : ข 
5 = 
Form id : F00000013
Machine id : MLG000008
Table id : ER0000002
Machine check list id : 891
Expected result : ก 
6 = 
Form id : F00000013
Machine id : MLG000008
Table id : ER0000002
Machine check list id : 892
Expected result :  
7 = 
Form id : F00000013
Machine id : MLG000008
Table id : ER0000002
Machine check list id : 893
Expected result :  
8 = 
Form id : F00000013
Machine id : MLG000008
Table id : ER0000002
Machine check list id : 894
Expected result :  
9 = 
Form id : F00000013
Machine id : MLG000008
Table id : ER0000002
Machine check list id : 895
Expected result :  
', N'Info', CAST(N'2024-11-08T10:55:13.3270000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1511, N'Save Success : Save Data - Machine ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Machine 
User: Rattana Chomwihok
Date: 2024-11-08 15:13:32
Host: 10.99.100.105
Save Success : Save Data - Machine 
New Machine id :  =  
New Group machine id :  = GMmm00001 
New Machine name :  = Magnet F1 
New Description :  = รายการตรวจแม่เหล็ก F1 (MILL A) 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-08T15:13:32.0200000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1512, N'Save Success : Save Data - Match Check List ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Match Check List 
User: Rattana Chomwihok
Date: 2024-11-08 15:19:57
Host: 10.99.100.105
Save Success : Save Data - Match Check List 

Generate new form =  
New Form id :  = F00000015 
New Form name :  = Magnet F1 
New Description :  = รายการตรวจแม่เหล็ก F1 (MILL A) 
All Sub Form New =  
New 1 sf :  = 
Sub form id : SF0000124
Sub form name : ส่วนที่ 1 
New 2 sf :  = 
Sub form id : SF0000125
Sub form name : ส่วนที่ 2 
New 3 sf :  = 
Sub form id : SF0000126
Sub form name : หมายเหตุ 
', N'Info', CAST(N'2024-11-08T15:19:57.3830000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1513, N'Save Success : Save Data - Match Form Machine ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Match Form Machine 
User: Rattana Chomwihok
Date: 2024-11-08 15:20:15
Host: 10.99.100.105
Save Success : Save Data - Match Form Machine 
New Machine id :  = MLG000009 
New Machine name :  = Magnet F1 
New Form id :  = F00000015 
', N'Info', CAST(N'2024-11-08T15:20:15.2230000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1514, N'Column ''ImportantID'' does not belong to table .', N'Rattana Chomwihok', N'
Title: Column ''ImportantID'' does not belong to table .
User: Rattana Chomwihok
Date: 2024-11-09 08:29:31
Host: 10.99.100.105
   at System.Data.DataRow.GetDataColumn(String columnName)
   at System.Data.DataRow.get_Item(String columnName)
   at m_checklist.FormClass.GetForm(String FormID) in C:\Users\rattana.c\source\repos\m_checklist\m_checklist\class\FormClass.vb:line 71', N'Error', CAST(N'2024-11-09T08:29:31.8730000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1515, N'Column ''ImportantID'' does not belong to table .', N'Rattana Chomwihok', N'
Title: Column ''ImportantID'' does not belong to table .
User: Rattana Chomwihok
Date: 2024-11-09 08:29:31
Host: 10.99.100.105
   at System.Data.DataRow.GetDataColumn(String columnName)
   at System.Data.DataRow.get_Item(String columnName)
   at m_checklist.FormClass.GetForm(String FormID) in C:\Users\rattana.c\source\repos\m_checklist\m_checklist\class\FormClass.vb:line 71', N'Error', CAST(N'2024-11-09T08:29:31.9530000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1516, N'Column ''ImportantID'' does not belong to table .', N'Rattana Chomwihok', N'
Title: Column ''ImportantID'' does not belong to table .
User: Rattana Chomwihok
Date: 2024-11-09 08:29:46
Host: 10.99.100.105
   at System.Data.DataRow.GetDataColumn(String columnName)
   at System.Data.DataRow.get_Item(String columnName)
   at m_checklist.FormClass.GetForm(String FormID) in C:\Users\rattana.c\source\repos\m_checklist\m_checklist\class\FormClass.vb:line 71', N'Error', CAST(N'2024-11-09T08:29:46.2830000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1517, N'Column ''ImportantID'' does not belong to table .', N'Rattana Chomwihok', N'
Title: Column ''ImportantID'' does not belong to table .
User: Rattana Chomwihok
Date: 2024-11-09 08:29:46
Host: 10.99.100.105
   at System.Data.DataRow.GetDataColumn(String columnName)
   at System.Data.DataRow.get_Item(String columnName)
   at m_checklist.FormClass.GetForm(String FormID) in C:\Users\rattana.c\source\repos\m_checklist\m_checklist\class\FormClass.vb:line 71', N'Error', CAST(N'2024-11-09T08:29:46.3630000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1518, N'Column ''ImportantID'' does not belong to table .', N'Rattana Chomwihok', N'
Title: Column ''ImportantID'' does not belong to table .
User: Rattana Chomwihok
Date: 2024-11-09 08:30:06
Host: 10.99.100.105
   at System.Data.DataRow.GetDataColumn(String columnName)
   at System.Data.DataRow.get_Item(String columnName)
   at m_checklist.FormClass.GetForm(String FormID) in C:\Users\rattana.c\source\repos\m_checklist\m_checklist\class\FormClass.vb:line 71', N'Error', CAST(N'2024-11-09T08:30:06.3770000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1519, N'Column ''ImportantID'' does not belong to table .', N'Rattana Chomwihok', N'
Title: Column ''ImportantID'' does not belong to table .
User: Rattana Chomwihok
Date: 2024-11-09 08:30:06
Host: 10.99.100.105
   at System.Data.DataRow.GetDataColumn(String columnName)
   at System.Data.DataRow.get_Item(String columnName)
   at m_checklist.FormClass.GetForm(String FormID) in C:\Users\rattana.c\source\repos\m_checklist\m_checklist\class\FormClass.vb:line 71', N'Error', CAST(N'2024-11-09T08:30:06.4400000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1520, N'Save Success : Save Data - Group Check List Option ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Group Check List Option 
User: Rattana Chomwihok
Date: 2024-11-09 11:18:01
Host: 10.99.100.105
Save Success : Save Data - Group Check List Option 
New Group check list option id :  =  
New Group check list option name :  = TestGroup 
New IsActive :  = true 
', N'Info', CAST(N'2024-11-09T11:18:01.6270000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1521, N'Save Success : Save Data - Match Check List Option ', N'Rattana Chomwihok', N'
Title: Save Success : Save Data - Match Check List Option 
User: Rattana Chomwihok
Date: 2024-11-09 11:18:17
Host: 10.99.100.105
Save Success : Save Data - Match Check List Option 
New Match check list option id :  =  
New Group check list option id :  = GCL000028 
New Group check list option name :  =  
1 -  = 
New Check list option id : = CLO000001
New IsActive : = true 
2 -  = 
New Check list option id : = CLO000002
New IsActive : = true 
3 -  = 
New Check list option id : = CLO000003
New IsActive : = true 
4 -  = 
New Check list option id : = CLO000004
New IsActive : = true 
5 -  = 
New Check list option id : = CLO000005
New IsActive : = true 
6 -  = 
New Check list option id : = CLO000006
New IsActive : = true 
7 -  = 
New Check list option id : = CLO000007
New IsActive : = true 
8 -  = 
New Check list option id : = CLO000008
New IsActive : = true 
9 -  = 
New Check list option id : = CLO000009
New IsActive : = true 
10 -  = 
New Check list option id : = CLO000010
New IsActive : = true 
11 -  = 
New Check list option id : = CLO000011
New IsActive : = true 
12 -  = 
New Check list option id : = CLO000012
New IsActive : = true 
13 -  = 
New Check list option id : = CLO000013
New IsActive : = true 
', N'Info', CAST(N'2024-11-09T11:18:17.4800000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1522, N'Incorrect syntax near the keyword ''AND''.', N'', N'
Title: Incorrect syntax near the keyword ''AND''.
User: 
Date: 2024-11-11 09:31:29
Host: localhost
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   at System.Data.Common.DbDataAdapter.FillInternal(DataSet dataset, DataTable[] datatables, Int32 startRecord, Int32 maxRecords, String srcTable, IDbCommand command, CommandBehavior behavior)
   at System.Data.Common.DbDataAdapter.Fill(DataTable[] dataTables, Int32 startRecord, Int32 maxRecords, IDbCommand command, CommandBehavior behavior)
   at System.Data.Common.DbDataAdapter.Fill(DataTable dataTable)
   at m_checklist.Connection.GetDataTable(String strConn, String strSQL) in C:\Users\rattana.c\source\repos\m_checklist\m_checklist\class\connect\Connection.vb:line 27
   at m_checklist.MenuClass.GetMenus(String GUserID) in C:\Users\rattana.c\source\repos\m_checklist\m_checklist\class\MenuClass.vb:line 28', N'Error', CAST(N'2024-11-11T09:31:29.5100000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1523, N'Incorrect syntax near the keyword ''AND''.', N'', N'
Title: Incorrect syntax near the keyword ''AND''.
User: 
Date: 2024-11-11 09:32:50
Host: localhost
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   at System.Data.Common.DbDataAdapter.FillInternal(DataSet dataset, DataTable[] datatables, Int32 startRecord, Int32 maxRecords, String srcTable, IDbCommand command, CommandBehavior behavior)
   at System.Data.Common.DbDataAdapter.Fill(DataTable[] dataTables, Int32 startRecord, Int32 maxRecords, IDbCommand command, CommandBehavior behavior)
   at System.Data.Common.DbDataAdapter.Fill(DataTable dataTable)
   at m_checklist.Connection.GetDataTable(String strConn, String strSQL) in C:\Users\rattana.c\source\repos\m_checklist\m_checklist\class\connect\Connection.vb:line 27
   at m_checklist.MenuClass.GetMenus(String GUserID) in C:\Users\rattana.c\source\repos\m_checklist\m_checklist\class\MenuClass.vb:line 28', N'Error', CAST(N'2024-11-11T09:32:50.1230000' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Title], [Author], [Messages], [Type], [Create_Date]) VALUES (1524, N'Incorrect syntax near the keyword ''AND''.', N'', N'
Title: Incorrect syntax near the keyword ''AND''.
User: 
Date: 2024-11-11 09:34:57
Host: localhost
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   at System.Data.Common.DbDataAdapter.FillInternal(DataSet dataset, DataTable[] datatables, Int32 startRecord, Int32 maxRecords, String srcTable, IDbCommand command, CommandBehavior behavior)
   at System.Data.Common.DbDataAdapter.Fill(DataTable[] dataTables, Int32 startRecord, Int32 maxRecords, IDbCommand command, CommandBehavior behavior)
   at System.Data.Common.DbDataAdapter.Fill(DataTable dataTable)
   at m_checklist.Connection.GetDataTable(String strConn, String strSQL) in C:\Users\rattana.c\source\repos\m_checklist\m_checklist\class\connect\Connection.vb:line 27
   at m_checklist.MenuClass.GetMenus(String GUserID) in C:\Users\rattana.c\source\repos\m_checklist\m_checklist\class\MenuClass.vb:line 28', N'Error', CAST(N'2024-11-11T09:34:57.9670000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Logs] OFF
GO
INSERT [dbo].[Machines] ([MachineID], [FormID], [GMachineID], [MachineCode], [MachineName], [Building], [Floor], [Area], [Description], [IsActive]) VALUES (N'M00000001', N'F00000001', N'GMmm00001', N'FM-PRO-04-02', N'SCOURER - ASPIRATOR', N'A', N'2', N'MILL A', N'ตารางการตรวจเช็คเครื่องจักร   SCOURER - ASPIRATOR  ชั้น 2', 1)
INSERT [dbo].[Machines] ([MachineID], [FormID], [GMachineID], [MachineCode], [MachineName], [Building], [Floor], [Area], [Description], [IsActive]) VALUES (N'M00000002', N'F00000003', N'GMmm00001', N'FM-PRO-04-06', N'HAMMERMILL', N'A', N'1', N'MILL A', N'ตารางการตรวจเช็คเครื่องจักร   HAMMERMILL', 1)
INSERT [dbo].[Machines] ([MachineID], [FormID], [GMachineID], [MachineCode], [MachineName], [Building], [Floor], [Area], [Description], [IsActive]) VALUES (N'M00000003', N'F00000008', N'GMmm00001', N'FM-PRO-04-07', N'De STONER ', N'A', N'5', N'MILL A', N'ตารางการตรวจเช็คเครื่องจักร   DE STONER (จุด OPRP)', 1)
INSERT [dbo].[Machines] ([MachineID], [FormID], [GMachineID], [MachineCode], [MachineName], [Building], [Floor], [Area], [Description], [IsActive]) VALUES (N'M00000004', NULL, N'GMmm00001', N'FM-PRO-04-08', N'SEPARATOR-ASPRATOR', N'A', N'6', N'MILL A', N'ตารางการตรวจเช็คเครื่องจักร   SEPARATOR-ASPRATOR', 1)
INSERT [dbo].[Machines] ([MachineID], [FormID], [GMachineID], [MachineCode], [MachineName], [Building], [Floor], [Area], [Description], [IsActive]) VALUES (N'MLG000001', N'F00000005', N'GMmm00001', N'FM-PRO-04-09', N'SEPARATOR', N'A', N'7', N'MILL', N'ตารางการตรวจเช็คเครื่องจักร   SEPARATOR ชั้น 7', 1)
INSERT [dbo].[Machines] ([MachineID], [FormID], [GMachineID], [MachineCode], [MachineName], [Building], [Floor], [Area], [Description], [IsActive]) VALUES (N'MLG000002', N'F00000006', N'GMmm00001', N'FM-PRO-04-28', N'FILTER FC1120, FC1382', N'A', N'6', N'MILL', N'ตารางการตรวจเช็คถัง FILTER FC 1120, FC1382', 1)
INSERT [dbo].[Machines] ([MachineID], [FormID], [GMachineID], [MachineCode], [MachineName], [Building], [Floor], [Area], [Description], [IsActive]) VALUES (N'MLG000003', N'F00000007', N'GMmm00001', N'FM-PRO-04-08', N'SEPARATOR-ASPRATOR_6', N'A', N'6', N'MILL', N'ตารางการตรวจเช็คเครื่องจักร   SEPARATOR-ASPRATOR ชั้น 6', 1)
INSERT [dbo].[Machines] ([MachineID], [FormID], [GMachineID], [MachineCode], [MachineName], [Building], [Floor], [Area], [Description], [IsActive]) VALUES (N'MLG000004', N'F00000009', N'GMmm00001', N'FM-PRO-04-23', N'Sortex', N'A', N'4', N'MILL', N'ตารางการตรวจเช็คเครื่อง Sortex', 1)
INSERT [dbo].[Machines] ([MachineID], [FormID], [GMachineID], [MachineCode], [MachineName], [Building], [Floor], [Area], [Description], [IsActive]) VALUES (N'MLG000005', N'F00000010', N'GMmm00001', N'FM-PRO-04-11', N'Magnet  E1 ', N'A', N'1', N'MILL', N'การทำความสะอาดแม่เหล็ก E1', 1)
INSERT [dbo].[Machines] ([MachineID], [FormID], [GMachineID], [MachineCode], [MachineName], [Building], [Floor], [Area], [Description], [IsActive]) VALUES (N'MLG000006', N'F00000011', N'GMmm00001', N'FM-PRO-04-10', N'SEPARATOR-ASPRATOR_7', N'A', N'7', N'MILL', N'ตารางการตรวจเช็คเครื่องจักร   SCOURER - ASPIRATOR  ชั้น 7/รายการตรวจแม่เหล็ก   SCOURER - ASPIRATOR  (MILL WHEAT) ชั้น 7', 1)
INSERT [dbo].[Machines] ([MachineID], [FormID], [GMachineID], [MachineCode], [MachineName], [Building], [Floor], [Area], [Description], [IsActive]) VALUES (N'MLG000007', N'F00000012', N'GMmm00001', N'FM-PRO-04-12', N'Clean HAMMERMILL', N'A', N'1', N'MILL', N'การทำความสะอาดแม่เหล็ก HAMMERMILL', 1)
INSERT [dbo].[Machines] ([MachineID], [FormID], [GMachineID], [MachineCode], [MachineName], [Building], [Floor], [Area], [Description], [IsActive]) VALUES (N'MLG000008', N'F00000013', N'GMmm00001', N'FM-PRO-04-16', N'แม่เหล็กตาชั้่ง B1', N'A', N'1', N'MILL', N'รายการตรวจแม่เหล็กตาชั่ง B1', 1)
INSERT [dbo].[Machines] ([MachineID], [FormID], [GMachineID], [MachineCode], [MachineName], [Building], [Floor], [Area], [Description], [IsActive]) VALUES (N'MLG000009', N'F00000015', N'GMmm00001', N'FM-PRO-04-17', N'Magnet F1', N'A', N'1', N'MILL', N'รายการตรวจแม่เหล็ก F1 (MILL A)', 1)
GO
SET IDENTITY_INSERT [dbo].[MatchCheckList] ON 

INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (636, N'CL0000002', NULL, N'CT01', N'DT01', NULL, N'SF0000004', NULL, NULL, 1, NULL, NULL, NULL, N'Empty content', N'Empty content', 0)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (637, N'CL0000003', N'GCL000001', N'CT03', N'DT01', NULL, N'SF0000005', NULL, NULL, 1, NULL, NULL, NULL, N'Empty content', N'Empty content', 0)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (638, N'CL0000004', N'GCL000002', N'CT03', N'DT01', NULL, N'SF0000005', NULL, NULL, 1, NULL, NULL, NULL, N'Empty content', N'Empty content', 1)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (639, N'CL0000005', N'GCL000003', N'CT03', N'DT01', NULL, N'SF0000005', NULL, NULL, 1, NULL, NULL, NULL, N'Empty content', N'Empty content', 2)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (640, N'CL0000006', N'GCL000004', N'CT03', N'DT01', NULL, N'SF0000005', NULL, NULL, 1, NULL, NULL, NULL, N'Empty content', N'Empty content', 3)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (641, N'CL0000007', NULL, N'CT01', N'DT01', NULL, N'SF0000006', NULL, NULL, 0, NULL, NULL, NULL, N'Empty content', N'Empty content', 0)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (642, N'CL0000008', NULL, N'CT01', N'DT01', NULL, N'SF0000006', NULL, NULL, 0, NULL, NULL, NULL, N'Empty content', N'Empty content', 1)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (643, N'CL0000009', NULL, N'CT01', N'DT01', NULL, N'SF0000006', NULL, NULL, 1, NULL, NULL, NULL, N'Empty content', N'Empty content', 2)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (644, N'CL0000010', NULL, N'CT01', N'DT01', NULL, N'SF0000006', NULL, NULL, 0, NULL, NULL, NULL, N'Empty content', N'Empty content', 3)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (645, N'CL0000011', NULL, N'CT06', N'DT01', NULL, N'SF0000007', NULL, NULL, 0, NULL, NULL, NULL, N'Empty content', N'Empty content', 0)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (646, N'CL0000013', NULL, N'CT06', N'DT01', NULL, N'SF0000007', NULL, NULL, 0, NULL, NULL, NULL, N'Empty content', N'Empty content', 1)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (647, N'CL0000012', NULL, N'CT06', N'DT01', NULL, N'SF0000007', NULL, NULL, 0, NULL, NULL, NULL, N'Empty content', N'Empty content', 2)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (648, N'CL0000014', NULL, N'CT06', N'DT01', NULL, N'SF0000007', NULL, NULL, 0, NULL, NULL, NULL, N'Empty content', N'Empty content', 3)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (649, N'CL0000015', NULL, N'CT06', N'DT01', NULL, N'SF0000007', NULL, NULL, 0, NULL, NULL, NULL, N'Empty content', N'Empty content', 4)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (650, N'CL0000016', NULL, N'CT06', N'DT01', NULL, N'SF0000007', NULL, NULL, 0, NULL, NULL, NULL, N'Empty content', N'Empty content', 5)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (651, N'CL0000002', NULL, N'CT01', N'DT01', NULL, N'SF0000008', NULL, NULL, 1, NULL, NULL, NULL, N'Empty content', N'Empty content', 0)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (652, N'CL0000003', N'GCL000001', N'CT03', N'DT01', NULL, N'SF0000009', NULL, NULL, 1, NULL, NULL, NULL, N'Empty content', N'Empty content', 0)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (653, N'CL0000004', N'GCL000002', N'CT03', N'DT01', NULL, N'SF0000009', NULL, NULL, 1, NULL, NULL, NULL, N'Empty content', N'Empty content', 1)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (654, N'CL0000005', N'GCL000003', N'CT03', N'DT01', NULL, N'SF0000009', NULL, NULL, 1, NULL, NULL, NULL, N'Empty content', N'Empty content', 2)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (655, N'CL0000006', N'GCL000004', N'CT03', N'DT01', NULL, N'SF0000009', NULL, NULL, 1, NULL, NULL, NULL, N'Empty content', N'Empty content', 3)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (656, N'CL0000017', N'GCL000005', N'CT03', N'DT01', NULL, N'SF0000009', NULL, NULL, 1, NULL, NULL, NULL, N'Empty content', N'Empty content', 5)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (657, N'CL0000007', NULL, N'CT01', N'DT01', NULL, N'SF0000010', NULL, NULL, 0, NULL, NULL, NULL, N'Empty content', N'Empty content', 0)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (658, N'CL0000008', NULL, N'CT01', N'DT01', NULL, N'SF0000010', NULL, NULL, 0, NULL, NULL, NULL, N'Empty content', N'Empty content', 1)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (659, N'CL0000009', NULL, N'CT01', N'DT01', NULL, N'SF0000010', NULL, NULL, 1, NULL, NULL, NULL, N'Empty content', N'Empty content', 2)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (660, N'CL0000010', NULL, N'CT01', N'DT01', NULL, N'SF0000010', NULL, NULL, 0, NULL, NULL, NULL, N'Empty content', N'Empty content', 3)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (661, N'CL0000011', NULL, N'CT06', N'DT01', NULL, N'SF0000011', NULL, NULL, 0, NULL, NULL, NULL, N'Empty content', N'Empty content', 0)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (662, N'CL0000013', NULL, N'CT06', N'DT01', NULL, N'SF0000011', NULL, NULL, 0, NULL, NULL, NULL, N'Empty content', N'Empty content', 1)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (663, N'CL0000012', NULL, N'CT06', N'DT01', NULL, N'SF0000011', NULL, NULL, 0, NULL, NULL, NULL, N'Empty content', N'Empty content', 2)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (664, N'CL0000014', NULL, N'CT06', N'DT01', NULL, N'SF0000011', NULL, NULL, 0, NULL, NULL, NULL, N'Empty content', N'Empty content', 3)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (665, N'CL0000015', NULL, N'CT06', N'DT01', NULL, N'SF0000011', NULL, NULL, 0, NULL, NULL, NULL, N'Empty content', N'Empty content', 4)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (666, N'CL0000016', NULL, N'CT06', N'DT01', NULL, N'SF0000011', NULL, NULL, 0, NULL, NULL, NULL, N'Empty content', N'Empty content', 5)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (673, N'CL0000018', N'GCL000005', N'CT03', N'DT01', NULL, N'SF0000015', NULL, NULL, 0, NULL, NULL, NULL, N'Empty content', N'Empty content', 0)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (674, N'CL0000018', NULL, N'CT01', N'DT01', NULL, N'SF0000016', NULL, NULL, 0, NULL, NULL, NULL, N'Empty content', N'Empty content', 0)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (675, N'CL0000007', NULL, N'CT01', N'DT01', NULL, N'SF0000016', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (676, N'CL0000008', NULL, N'CT01', N'DT01', NULL, N'SF0000016', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (677, N'CL0000009', NULL, N'CT01', N'DT01', NULL, N'SF0000017', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (678, N'CL0000010', NULL, N'CT01', N'DT01', NULL, N'SF0000017', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (679, N'CL0000011', NULL, N'CT06', N'DT01', NULL, N'SF0000018', NULL, NULL, 0, NULL, NULL, NULL, N'Empty content', N'Empty content', 1)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (680, N'CL0000019', NULL, N'CT06', N'DT01', NULL, N'SF0000018', NULL, NULL, 0, NULL, NULL, NULL, N'Empty content', N'Empty content', 2)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (681, N'CL0000020', NULL, N'CT06', N'DT01', NULL, N'SF0000018', NULL, NULL, 0, NULL, NULL, NULL, N'Empty content', N'Empty content', 3)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (682, N'CL0000021', NULL, N'CT06', N'DT01', NULL, N'SF0000018', NULL, NULL, 0, NULL, NULL, NULL, N'Empty content', N'Empty content', 4)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (683, N'CL0000022', NULL, N'CT06', N'DT01', NULL, N'SF0000018', NULL, NULL, 0, NULL, NULL, NULL, N'Empty content', N'Empty content', 5)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (684, N'CL0000023', NULL, N'CT06', N'DT01', NULL, N'SF0000018', NULL, NULL, 0, NULL, NULL, NULL, N'Empty content', N'Empty content', 6)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (685, N'CL0000024', NULL, N'CT06', N'DT01', NULL, N'SF0000018', NULL, NULL, 0, NULL, NULL, NULL, N'Empty content', N'Empty content', 7)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (699, N'CL0000002', NULL, N'CT01', N'DT01', NULL, N'SF0000039', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (700, N'CL0000025', N'GCL000006', N'CT03', N'DT01', NULL, N'SF0000040', NULL, NULL, 0, NULL, NULL, NULL, N'Empty content', N'Empty content', 0)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (701, N'CL0000026', N'GCL000007', N'CT03', N'DT01', NULL, N'SF0000040', NULL, NULL, 0, NULL, NULL, NULL, N'Empty content', N'Empty content', 1)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (702, N'CL0000004', N'GCL000002', N'CT03', N'DT01', NULL, N'SF0000040', NULL, NULL, 0, NULL, NULL, NULL, N'Empty content', N'Empty content', 2)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (703, N'CL0000006', N'GCL000004', N'CT03', N'DT01', NULL, N'SF0000040', NULL, NULL, 0, NULL, NULL, NULL, N'Empty content', N'Empty content', 3)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (704, N'CL0000027', N'GCL000008', N'CT03', N'DT01', NULL, N'SF0000040', NULL, NULL, 0, NULL, NULL, NULL, N'Empty content', N'Empty content', 4)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (705, N'CL0000018', NULL, N'CT01', N'DT01', NULL, N'SF0000041', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (706, N'CL0000007', NULL, N'CT01', N'DT01', NULL, N'SF0000041', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (707, N'CL0000008', NULL, N'CT01', N'DT01', NULL, N'SF0000042', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (708, N'CL0000009', NULL, N'CT01', N'DT01', NULL, N'SF0000042', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (709, N'CL0000010', NULL, N'CT01', N'DT01', NULL, N'SF0000042', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (710, N'CL0000011', NULL, N'CT06', NULL, NULL, N'SF0000043', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (711, N'CL0000012', NULL, N'CT06', NULL, NULL, N'SF0000043', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (712, N'CL0000028', NULL, N'CT06', NULL, NULL, N'SF0000043', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (713, N'CL0000029', NULL, N'CT06', NULL, NULL, N'SF0000043', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 3)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (714, N'CL0000014', NULL, N'CT06', NULL, NULL, N'SF0000043', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 4)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (715, N'CL0000030', NULL, N'CT06', NULL, NULL, N'SF0000043', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 5)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (716, N'CL0000023', NULL, N'CT06', NULL, NULL, N'SF0000043', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 6)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (717, N'CL0000024', NULL, N'CT06', NULL, NULL, N'SF0000043', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 7)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (725, N'CL0000031', N'GCL000009', N'CT03', N'DT01', NULL, N'SF0000050', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (726, N'CL0000032', N'GCL000010', N'CT03', N'DT01', NULL, N'SF0000050', NULL, NULL, 0, NULL, NULL, NULL, N'Empty content', N'Empty content', 1)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (727, N'CL0000008', NULL, N'CT01', N'DT01', NULL, N'SF0000051', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (728, N'CL0000009', NULL, N'CT01', N'DT01', NULL, N'SF0000051', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (729, N'CL0000010', NULL, N'CT01', N'DT01', NULL, N'SF0000051', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (730, N'CL0000033', NULL, N'CT06', NULL, NULL, N'SF0000052', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (731, N'CL0000034', NULL, N'CT06', NULL, NULL, N'SF0000052', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (732, N'CL0000035', NULL, N'CT06', NULL, NULL, N'SF0000052', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 3)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (733, N'CL0000024', NULL, N'CT06', NULL, NULL, N'SF0000052', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 4)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (734, N'CL0000023', NULL, N'CT06', NULL, NULL, N'SF0000052', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 5)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (755, N'CL0000037', N'GCL000011', N'CT03', N'DT01', NULL, N'SF0000068', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (756, N'CL0000038', N'GCL000012', N'CT03', N'DT01', NULL, N'SF0000068', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (757, N'CL0000004', N'GCL000002', N'CT03', N'DT01', NULL, N'SF0000068', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (758, N'CL0000006', N'GCL000004', N'CT03', N'DT01', NULL, N'SF0000068', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 3)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (759, N'CL0000041', N'GCL000015', N'CT03', N'DT01', NULL, N'SF0000069', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (760, N'CL0000018', NULL, N'CT01', N'DT01', NULL, N'SF0000069', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (761, N'CL0000007', NULL, N'CT01', N'DT01', NULL, N'SF0000070', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (762, N'CL0000008', NULL, N'CT01', N'DT01', NULL, N'SF0000070', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (763, N'CL0000009', NULL, N'CT01', N'DT01', NULL, N'SF0000070', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (764, N'CL0000010', NULL, N'CT01', N'DT01', NULL, N'SF0000070', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 3)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (765, N'CL0000033', NULL, N'CT06', NULL, NULL, N'SF0000071', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (766, N'CL0000012', NULL, N'CT06', NULL, NULL, N'SF0000071', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (767, N'CL0000028', NULL, N'CT06', NULL, NULL, N'SF0000071', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (768, N'CL0000029', NULL, N'CT06', NULL, NULL, N'SF0000071', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 3)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (769, N'CL0000014', NULL, N'CT06', NULL, NULL, N'SF0000071', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 4)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (770, N'CL0000024', NULL, N'CT06', NULL, NULL, N'SF0000071', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 5)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (771, N'CL0000042', NULL, N'CT06', NULL, NULL, N'SF0000072', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (772, N'CL0000043', NULL, N'CT06', NULL, NULL, N'SF0000072', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (773, N'CL0000044', NULL, N'CT06', NULL, NULL, N'SF0000072', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 3)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (774, N'CL0000023', NULL, N'CT06', NULL, NULL, N'SF0000072', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 4)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (798, N'CL0000002', NULL, N'CT01', N'DT01', NULL, N'SF0000083', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (799, N'CL0000045', N'GCL000019', N'CT03', N'DT01', NULL, N'SF0000084', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (800, N'CL0000046', NULL, N'CT01', N'DT01', NULL, N'SF0000084', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (801, N'CL0000047', NULL, N'CT01', N'DT01', NULL, N'SF0000084', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (802, N'CL0000007', NULL, N'CT01', N'DT01', NULL, N'SF0000085', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (803, N'CL0000008', NULL, N'CT01', N'DT01', NULL, N'SF0000085', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (804, N'CL0000009', NULL, N'CT01', N'DT01', NULL, N'SF0000085', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (805, N'CL0000010', NULL, N'CT01', N'DT01', NULL, N'SF0000085', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 3)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (806, N'CL0000033', NULL, N'CT06', NULL, NULL, N'SF0000086', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (807, N'CL0000049', NULL, N'CT06', NULL, NULL, N'SF0000086', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (808, N'CL0000050', NULL, N'CT06', NULL, NULL, N'SF0000086', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (809, N'CL0000051', NULL, N'CT06', NULL, NULL, N'SF0000086', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 3)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (810, N'CL0000023', NULL, N'CT06', NULL, NULL, N'SF0000086', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 4)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (811, N'CL0000024', NULL, N'CT06', NULL, NULL, N'SF0000086', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 5)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (812, N'CL0000055', NULL, N'CT06', NULL, NULL, N'SF0000087', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (813, N'CL0000052', NULL, N'CT06', NULL, NULL, N'SF0000087', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (814, N'CL0000053', NULL, N'CT06', NULL, NULL, N'SF0000087', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 3)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (815, N'CL0000054', NULL, N'CT06', NULL, NULL, N'SF0000087', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 4)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (827, N'CL0000002', NULL, N'CT01', N'DT01', NULL, N'SF0000096', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (828, N'CL0000056', NULL, N'CT01', N'DT01', NULL, N'SF0000097', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (829, N'CL0000057', NULL, N'CT01', N'DT01', NULL, N'SF0000097', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (830, N'CL0000058', NULL, N'CT01', N'DT01', NULL, N'SF0000097', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (831, N'CL0000059', NULL, N'CT01', N'DT01', NULL, N'SF0000097', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 3)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (832, N'CL0000018', NULL, N'CT01', N'DT01', NULL, N'SF0000098', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (833, N'CL0000007', NULL, N'CT01', N'DT01', NULL, N'SF0000098', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (834, N'CL0000008', NULL, N'CT01', N'DT01', NULL, N'SF0000098', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (835, N'CL0000009', NULL, N'CT01', N'DT01', NULL, N'SF0000098', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 3)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (836, N'CL0000060', NULL, N'CT06', NULL, NULL, N'SF0000099', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (837, N'CL0000061', NULL, N'CT06', NULL, NULL, N'SF0000099', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (838, N'CL0000062', NULL, N'CT06', NULL, NULL, N'SF0000099', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 3)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (839, N'CL0000033', NULL, N'CT06', NULL, NULL, N'SF0000099', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 4)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (840, N'CL0000063', NULL, N'CT01', N'DT01', NULL, N'SF0000100', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (841, N'CL0000065', NULL, N'CT01', N'DT01', NULL, N'SF0000100', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (842, N'CL0000064', NULL, N'CT01', N'DT01', NULL, N'SF0000101', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (843, N'CL0000010', NULL, N'CT01', N'DT01', NULL, N'SF0000101', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (844, N'CL0000066', NULL, N'CT01', N'DT01', NULL, N'SF0000101', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (845, N'CL0000067', NULL, N'CT01', N'DT01', NULL, N'SF0000101', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 3)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (846, N'CL0000068', NULL, N'CT06', NULL, NULL, N'SF0000102', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (847, N'CL0000023', NULL, N'CT06', NULL, NULL, N'SF0000102', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (848, N'CL0000002', NULL, N'CT01', N'DT01', NULL, N'SF0000103', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (849, N'CL0000003', N'GCL000001', N'CT03', N'DT01', NULL, N'SF0000104', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (850, N'CL0000004', N'GCL000002', N'CT03', N'DT01', NULL, N'SF0000104', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (851, N'CL0000005', N'GCL000003', N'CT03', N'DT01', NULL, N'SF0000104', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 3)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (852, N'CL0000006', N'GCL000004', N'CT03', N'DT01', NULL, N'SF0000104', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 4)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (853, N'CL0000041', N'GCL000015', N'CT03', N'DT01', NULL, N'SF0000105', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (854, N'CL0000007', NULL, N'CT01', N'DT01', NULL, N'SF0000105', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (855, N'CL0000067', NULL, N'CT01', N'DT01', NULL, N'SF0000106', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (856, N'CL0000009', NULL, N'CT01', N'DT01', NULL, N'SF0000106', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (857, N'CL0000033', NULL, N'CT06', NULL, NULL, N'SF0000107', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (858, N'CL0000049', NULL, N'CT06', NULL, NULL, N'SF0000107', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (859, N'CL0000050', NULL, N'CT06', NULL, NULL, N'SF0000107', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 3)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (860, N'CL0000029', NULL, N'CT06', NULL, NULL, N'SF0000107', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 4)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (861, N'CL0000014', NULL, N'CT06', NULL, NULL, N'SF0000107', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 5)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (862, N'CL0000023', NULL, N'CT06', NULL, NULL, N'SF0000107', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 6)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (863, N'CL0000024', NULL, N'CT06', NULL, NULL, N'SF0000107', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 7)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (864, N'CL0000042', NULL, N'CT06', NULL, NULL, N'SF0000108', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (865, N'CL0000043', NULL, N'CT06', NULL, NULL, N'SF0000108', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (866, N'CL0000063', NULL, N'CT01', N'DT01', NULL, N'SF0000109', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (867, N'CL0000065', NULL, N'CT01', N'DT01', NULL, N'SF0000109', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (868, N'CL0000064', NULL, N'CT01', N'DT01', NULL, N'SF0000110', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (869, N'CL0000010', NULL, N'CT01', N'DT01', NULL, N'SF0000110', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (870, N'CL0000066', NULL, N'CT01', N'DT01', NULL, N'SF0000110', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 3)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (871, N'CL0000067', NULL, N'CT01', N'DT01', NULL, N'SF0000110', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 4)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (872, N'CL0000068', NULL, N'CT06', NULL, NULL, N'SF0000111', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (873, N'CL0000023', NULL, N'CT06', NULL, NULL, N'SF0000111', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (888, N'CL0000041', N'GCL000015', N'CT03', N'DT01', NULL, N'SF0000118', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (889, N'CL0000007', NULL, N'CT01', N'DT01', NULL, N'SF0000118', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (890, N'CL0000066', NULL, N'CT01', N'DT01', NULL, N'SF0000119', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (891, N'CL0000067', NULL, N'CT01', N'DT01', NULL, N'SF0000119', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (892, N'CL0000042', NULL, N'CT06', NULL, NULL, N'SF0000120', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (893, N'CL0000043', NULL, N'CT06', NULL, NULL, N'SF0000120', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (894, N'CL0000044', NULL, N'CT06', NULL, NULL, N'SF0000120', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (895, N'CL0000069', NULL, N'CT06', NULL, NULL, N'SF0000120', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 4)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (896, N'CL0000041', N'GCL000015', N'CT03', N'DT01', NULL, N'SF0000121', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (897, N'CL0000007', NULL, N'CT01', N'DT01', NULL, N'SF0000121', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (898, N'CL0000066', NULL, N'CT01', N'DT01', NULL, N'SF0000122', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (899, N'CL0000067', NULL, N'CT01', N'DT01', NULL, N'SF0000122', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (900, N'CL0000042', NULL, N'CT06', NULL, NULL, N'SF0000123', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (901, N'CL0000043', NULL, N'CT06', NULL, NULL, N'SF0000123', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (902, N'CL0000044', NULL, N'CT06', NULL, NULL, N'SF0000123', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (903, N'CL0000069', NULL, N'CT06', NULL, NULL, N'SF0000123', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 3)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (904, N'CL0000041', N'GCL000015', N'CT03', N'DT01', NULL, N'SF0000124', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (905, N'CL0000007', NULL, N'CT01', N'DT01', NULL, N'SF0000125', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (906, N'CL0000066', NULL, N'CT01', N'DT01', NULL, N'SF0000125', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (907, N'CL0000067', NULL, N'CT01', N'DT01', NULL, N'SF0000125', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (908, N'CL0000042', NULL, N'CT06', NULL, NULL, N'SF0000126', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (909, N'CL0000043', NULL, N'CT06', NULL, NULL, N'SF0000126', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (910, N'CL0000044', NULL, N'CT06', NULL, NULL, N'SF0000126', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 3)
INSERT [dbo].[MatchCheckList] ([MCListID], [CListID], [GCLOptionID], [CTypeID], [DTypeID], [DTypeValue], [SFormID], [Important], [GImportantID], [Required], [MinLength], [MaxLength], [Description], [Placeholder], [Hint], [DisplayOrder]) VALUES (911, N'CL0000069', NULL, N'CT06', NULL, NULL, N'SF0000126', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 4)
SET IDENTITY_INSERT [dbo].[MatchCheckList] OFF
GO
INSERT [dbo].[MatchCheckListOption] ([MCLOptionID], [GCLOptionID], [CLOptionID], [IsActive]) VALUES (N'MCLO00001', N'GCL000001', N'CLO000001', 1)
INSERT [dbo].[MatchCheckListOption] ([MCLOptionID], [GCLOptionID], [CLOptionID], [IsActive]) VALUES (N'MCLO00002', N'GCL000001', N'CLO000002', 1)
INSERT [dbo].[MatchCheckListOption] ([MCLOptionID], [GCLOptionID], [CLOptionID], [IsActive]) VALUES (N'MCLO00003', N'GCL000002', N'CLO000003', 1)
INSERT [dbo].[MatchCheckListOption] ([MCLOptionID], [GCLOptionID], [CLOptionID], [IsActive]) VALUES (N'MCLO00004', N'GCL000002', N'CLO000004', 1)
INSERT [dbo].[MatchCheckListOption] ([MCLOptionID], [GCLOptionID], [CLOptionID], [IsActive]) VALUES (N'MCLO00005', N'GCL000003', N'CLO000006', 1)
INSERT [dbo].[MatchCheckListOption] ([MCLOptionID], [GCLOptionID], [CLOptionID], [IsActive]) VALUES (N'MCLO00006', N'GCL000003', N'CLO000005', 1)
INSERT [dbo].[MatchCheckListOption] ([MCLOptionID], [GCLOptionID], [CLOptionID], [IsActive]) VALUES (N'MCLO00007', N'GCL000004', N'CLO000005', 1)
INSERT [dbo].[MatchCheckListOption] ([MCLOptionID], [GCLOptionID], [CLOptionID], [IsActive]) VALUES (N'MCLO00008', N'GCL000004', N'CLO000007', 1)
INSERT [dbo].[MatchCheckListOption] ([MCLOptionID], [GCLOptionID], [CLOptionID], [IsActive]) VALUES (N'MCLO00009', N'GCL000005', N'CLO000009', 1)
INSERT [dbo].[MatchCheckListOption] ([MCLOptionID], [GCLOptionID], [CLOptionID], [IsActive]) VALUES (N'MCLO00010', N'GCL000005', N'CLO000008', 1)
INSERT [dbo].[MatchCheckListOption] ([MCLOptionID], [GCLOptionID], [CLOptionID], [IsActive]) VALUES (N'MCLO00011', N'GCL000006', N'CLO000001', 1)
INSERT [dbo].[MatchCheckListOption] ([MCLOptionID], [GCLOptionID], [CLOptionID], [IsActive]) VALUES (N'MCLO00012', N'GCL000006', N'CLO000002', 1)
INSERT [dbo].[MatchCheckListOption] ([MCLOptionID], [GCLOptionID], [CLOptionID], [IsActive]) VALUES (N'MCLO00013', N'GCL000007', N'CLO000001', 1)
INSERT [dbo].[MatchCheckListOption] ([MCLOptionID], [GCLOptionID], [CLOptionID], [IsActive]) VALUES (N'MCLO00014', N'GCL000007', N'CLO000002', 1)
INSERT [dbo].[MatchCheckListOption] ([MCLOptionID], [GCLOptionID], [CLOptionID], [IsActive]) VALUES (N'MCLO00015', N'GCL000008', N'CLO000006', 1)
INSERT [dbo].[MatchCheckListOption] ([MCLOptionID], [GCLOptionID], [CLOptionID], [IsActive]) VALUES (N'MCLO00016', N'GCL000008', N'CLO000007', 1)
INSERT [dbo].[MatchCheckListOption] ([MCLOptionID], [GCLOptionID], [CLOptionID], [IsActive]) VALUES (N'MCLO00017', N'GCL000010', N'CLO000010', 1)
INSERT [dbo].[MatchCheckListOption] ([MCLOptionID], [GCLOptionID], [CLOptionID], [IsActive]) VALUES (N'MCLO00018', N'GCL000010', N'CLO000011', 1)
INSERT [dbo].[MatchCheckListOption] ([MCLOptionID], [GCLOptionID], [CLOptionID], [IsActive]) VALUES (N'MCLO00019', N'GCL000009', N'CLO000005', 1)
INSERT [dbo].[MatchCheckListOption] ([MCLOptionID], [GCLOptionID], [CLOptionID], [IsActive]) VALUES (N'MCLO00020', N'GCL000009', N'CLO000006', 1)
INSERT [dbo].[MatchCheckListOption] ([MCLOptionID], [GCLOptionID], [CLOptionID], [IsActive]) VALUES (N'MCLO00021', N'GCL000011', N'CLO000001', 1)
INSERT [dbo].[MatchCheckListOption] ([MCLOptionID], [GCLOptionID], [CLOptionID], [IsActive]) VALUES (N'MCLO00022', N'GCL000011', N'CLO000002', 1)
INSERT [dbo].[MatchCheckListOption] ([MCLOptionID], [GCLOptionID], [CLOptionID], [IsActive]) VALUES (N'MCLO00023', N'GCL000012', N'CLO000001', 1)
INSERT [dbo].[MatchCheckListOption] ([MCLOptionID], [GCLOptionID], [CLOptionID], [IsActive]) VALUES (N'MCLO00024', N'GCL000012', N'CLO000002', 1)
INSERT [dbo].[MatchCheckListOption] ([MCLOptionID], [GCLOptionID], [CLOptionID], [IsActive]) VALUES (N'MCLO00025', N'GCL000015', N'CLO000012', 1)
INSERT [dbo].[MatchCheckListOption] ([MCLOptionID], [GCLOptionID], [CLOptionID], [IsActive]) VALUES (N'MCLO00026', N'GCL000015', N'CLO000013', 1)
INSERT [dbo].[MatchCheckListOption] ([MCLOptionID], [GCLOptionID], [CLOptionID], [IsActive]) VALUES (N'MCLO00027', N'GCL000019', N'CLO000005', 1)
INSERT [dbo].[MatchCheckListOption] ([MCLOptionID], [GCLOptionID], [CLOptionID], [IsActive]) VALUES (N'MCLO00028', N'GCL000019', N'CLO000006', 1)
INSERT [dbo].[MatchCheckListOption] ([MCLOptionID], [GCLOptionID], [CLOptionID], [IsActive]) VALUES (N'MCLO00029', N'GCL000028', N'CLO000001', 1)
INSERT [dbo].[MatchCheckListOption] ([MCLOptionID], [GCLOptionID], [CLOptionID], [IsActive]) VALUES (N'MCLO00030', N'GCL000028', N'CLO000002', 1)
INSERT [dbo].[MatchCheckListOption] ([MCLOptionID], [GCLOptionID], [CLOptionID], [IsActive]) VALUES (N'MCLO00031', N'GCL000028', N'CLO000003', 1)
INSERT [dbo].[MatchCheckListOption] ([MCLOptionID], [GCLOptionID], [CLOptionID], [IsActive]) VALUES (N'MCLO00032', N'GCL000028', N'CLO000004', 1)
INSERT [dbo].[MatchCheckListOption] ([MCLOptionID], [GCLOptionID], [CLOptionID], [IsActive]) VALUES (N'MCLO00033', N'GCL000028', N'CLO000005', 1)
INSERT [dbo].[MatchCheckListOption] ([MCLOptionID], [GCLOptionID], [CLOptionID], [IsActive]) VALUES (N'MCLO00034', N'GCL000028', N'CLO000006', 1)
INSERT [dbo].[MatchCheckListOption] ([MCLOptionID], [GCLOptionID], [CLOptionID], [IsActive]) VALUES (N'MCLO00035', N'GCL000028', N'CLO000007', 1)
INSERT [dbo].[MatchCheckListOption] ([MCLOptionID], [GCLOptionID], [CLOptionID], [IsActive]) VALUES (N'MCLO00036', N'GCL000028', N'CLO000008', 1)
INSERT [dbo].[MatchCheckListOption] ([MCLOptionID], [GCLOptionID], [CLOptionID], [IsActive]) VALUES (N'MCLO00037', N'GCL000028', N'CLO000009', 1)
INSERT [dbo].[MatchCheckListOption] ([MCLOptionID], [GCLOptionID], [CLOptionID], [IsActive]) VALUES (N'MCLO00038', N'GCL000028', N'CLO000010', 1)
INSERT [dbo].[MatchCheckListOption] ([MCLOptionID], [GCLOptionID], [CLOptionID], [IsActive]) VALUES (N'MCLO00039', N'GCL000028', N'CLO000011', 1)
INSERT [dbo].[MatchCheckListOption] ([MCLOptionID], [GCLOptionID], [CLOptionID], [IsActive]) VALUES (N'MCLO00040', N'GCL000028', N'CLO000012', 1)
INSERT [dbo].[MatchCheckListOption] ([MCLOptionID], [GCLOptionID], [CLOptionID], [IsActive]) VALUES (N'MCLO00041', N'GCL000028', N'CLO000013', 1)
GO
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([MenuID], [MenuPermission], [MenuLabel], [Description], [ParentMenuID], [PermissionID], [Path], [NavigationTo], [OrderNo], [IsActive]) VALUES (1, N'view_home', N'Home', N'Home Screen', NULL, 1, N'screens/layouts/HomeScreen', N'Home', 1, 1)
INSERT [dbo].[Menu] ([MenuID], [MenuPermission], [MenuLabel], [Description], [ParentMenuID], [PermissionID], [Path], [NavigationTo], [OrderNo], [IsActive]) VALUES (2, N'view_login', N'Login', N'Login Screen', NULL, 2, N'screens/layouts/LoginScreen', N'Login', NULL, 1)
INSERT [dbo].[Menu] ([MenuID], [MenuPermission], [MenuLabel], [Description], [ParentMenuID], [PermissionID], [Path], [NavigationTo], [OrderNo], [IsActive]) VALUES (3, N'view_list_machine', N'Machine', N'Group Machine Screen', NULL, 21, NULL, NULL, 3, 1)
INSERT [dbo].[Menu] ([MenuID], [MenuPermission], [MenuLabel], [Description], [ParentMenuID], [PermissionID], [Path], [NavigationTo], [OrderNo], [IsActive]) VALUES (4, N'view_machine_group', N'Group Machine', N'Group Machine Screen', 21, 3, N'screens/layouts/machines/machine_group/MachineGroupScreen', N'Machine_group', 1, 1)
INSERT [dbo].[Menu] ([MenuID], [MenuPermission], [MenuLabel], [Description], [ParentMenuID], [PermissionID], [Path], [NavigationTo], [OrderNo], [IsActive]) VALUES (5, N'view_machine', N'Machine', N'Machine', 21, 4, N'screens/layouts/machines/machine/MachineScreen', N'Machine', 2, 1)
INSERT [dbo].[Menu] ([MenuID], [MenuPermission], [MenuLabel], [Description], [ParentMenuID], [PermissionID], [Path], [NavigationTo], [OrderNo], [IsActive]) VALUES (6, N'view_list_check', N'Check List', N'Group Check List List Menu', NULL, 22, NULL, NULL, 4, 1)
INSERT [dbo].[Menu] ([MenuID], [MenuPermission], [MenuLabel], [Description], [ParentMenuID], [PermissionID], [Path], [NavigationTo], [OrderNo], [IsActive]) VALUES (7, N'view_checklist', N'Check List', N'Check List Screen', 22, 5, N'screens/layouts/checklists/checklist/CheckListScreen', N'Checklist', 1, 1)
INSERT [dbo].[Menu] ([MenuID], [MenuPermission], [MenuLabel], [Description], [ParentMenuID], [PermissionID], [Path], [NavigationTo], [OrderNo], [IsActive]) VALUES (8, N'view_checklist_group', N'Group Check List', N'Group Check List Screen', 22, 7, N'screens/layouts/checklists/checklist_option/CheckListOptionScreen', N'Checklist_group', 2, 1)
INSERT [dbo].[Menu] ([MenuID], [MenuPermission], [MenuLabel], [Description], [ParentMenuID], [PermissionID], [Path], [NavigationTo], [OrderNo], [IsActive]) VALUES (9, N'view_checklist_option', N'Check List Option', N'Check List Option Screen', 22, 6, N'screens/layouts/checklists/checklist_option/CheckListOptionScreen', N'Checklist_option', 3, 1)
INSERT [dbo].[Menu] ([MenuID], [MenuPermission], [MenuLabel], [Description], [ParentMenuID], [PermissionID], [Path], [NavigationTo], [OrderNo], [IsActive]) VALUES (10, N'view_match_checklist_option', N'Match Group & Option Check List', N'Match Group Check List & Option Check List', NULL, 8, N'screens/layouts/matchs/match_checklist_option/MatchCheckListOptionScreen', N'Match_checklist_option', 5, 1)
INSERT [dbo].[Menu] ([MenuID], [MenuPermission], [MenuLabel], [Description], [ParentMenuID], [PermissionID], [Path], [NavigationTo], [OrderNo], [IsActive]) VALUES (11, N'view_match_form_machine', N'Match Form & Machine', N'Match Form & Machine Screen', NULL, 9, N'screens/layouts/matchs/match_form_machine/MatchFormMachineScreen', N'Match_form_machine', 6, 1)
INSERT [dbo].[Menu] ([MenuID], [MenuPermission], [MenuLabel], [Description], [ParentMenuID], [PermissionID], [Path], [NavigationTo], [OrderNo], [IsActive]) VALUES (13, N'create_form', N'Create Form', N'Create Form Screen', NULL, 10, N'screens/layouts/forms/create/CreateFormScreen', N'Create_form', NULL, 1)
INSERT [dbo].[Menu] ([MenuID], [MenuPermission], [MenuLabel], [Description], [ParentMenuID], [PermissionID], [Path], [NavigationTo], [OrderNo], [IsActive]) VALUES (14, N'view_expected_result', N'Expected Result', N'Expected Result Screen', NULL, 11, N'screens/layouts/transitions/expected_result/ExpectedResultScreen', N'Expected_result', 7, 1)
INSERT [dbo].[Menu] ([MenuID], [MenuPermission], [MenuLabel], [Description], [ParentMenuID], [PermissionID], [Path], [NavigationTo], [OrderNo], [IsActive]) VALUES (15, N'view_apporved', N'Apporved', N'Apporved Screen', NULL, 20, N'screens/layouts/approveds/ApprovedScreen', N'Approve', 8, 1)
INSERT [dbo].[Menu] ([MenuID], [MenuPermission], [MenuLabel], [Description], [ParentMenuID], [PermissionID], [Path], [NavigationTo], [OrderNo], [IsActive]) VALUES (16, N'view_form', N'Form List', N'Form List Screen', NULL, 12, N'screens/layouts/forms/form/FormScreen', N'Form', 9, 1)
INSERT [dbo].[Menu] ([MenuID], [MenuPermission], [MenuLabel], [Description], [ParentMenuID], [PermissionID], [Path], [NavigationTo], [OrderNo], [IsActive]) VALUES (17, N'view_preview', N'Perview', N'Preview Screen', NULL, 13, N'screens/layouts/forms/view/Preview', N'Preview', NULL, 1)
INSERT [dbo].[Menu] ([MenuID], [MenuPermission], [MenuLabel], [Description], [ParentMenuID], [PermissionID], [Path], [NavigationTo], [OrderNo], [IsActive]) VALUES (18, N'view_scan_qr', N'Scan QR Code', N'Scan QR Code Screen', NULL, 14, N'screens/layouts/actions/camera/ScanQR', N'ScanQR', 10, 1)
INSERT [dbo].[Menu] ([MenuID], [MenuPermission], [MenuLabel], [Description], [ParentMenuID], [PermissionID], [Path], [NavigationTo], [OrderNo], [IsActive]) VALUES (19, N'generate_qr', N'Generate QR Code', N'Generate QR Code Screen', NULL, 15, N'screens/layouts/actions/action/GenerateQR', N'GenerateQR', 11, 1)
INSERT [dbo].[Menu] ([MenuID], [MenuPermission], [MenuLabel], [Description], [ParentMenuID], [PermissionID], [Path], [NavigationTo], [OrderNo], [IsActive]) VALUES (20, N'input_form_machine', N'Input Form Machine', N'Input Form Machine Screen', NULL, 16, N'screens/layouts/forms/scan/InputFormMachine', N'InputFormMachine', NULL, 1)
INSERT [dbo].[Menu] ([MenuID], [MenuPermission], [MenuLabel], [Description], [ParentMenuID], [PermissionID], [Path], [NavigationTo], [OrderNo], [IsActive]) VALUES (21, N'view_manage_settings', N'Setting', N'Setting Screen', NULL, 17, N'screens/layouts/SettingScreen', N'Setting', 12, 1)
INSERT [dbo].[Menu] ([MenuID], [MenuPermission], [MenuLabel], [Description], [ParentMenuID], [PermissionID], [Path], [NavigationTo], [OrderNo], [IsActive]) VALUES (22, N'view_manage_permissions', N'Manage Permission', N'Manage Permission Screen', NULL, 18, N'screen/SAdmin/Managepermissions', N'Managepermissions', 13, 1)
INSERT [dbo].[Menu] ([MenuID], [MenuPermission], [MenuLabel], [Description], [ParentMenuID], [PermissionID], [Path], [NavigationTo], [OrderNo], [IsActive]) VALUES (23, N'view_config', N'Configulation', N'Configulation Screen', NULL, 19, N'screens/layouts/Configulation', N'Config', 14, 1)
SET IDENTITY_INSERT [dbo].[Menu] OFF
GO
SET IDENTITY_INSERT [dbo].[Permissions] ON 

INSERT [dbo].[Permissions] ([PermissionID], [PermissionName], [Description], [IsActive]) VALUES (1, N'view_home', N'View Home Menu', 1)
INSERT [dbo].[Permissions] ([PermissionID], [PermissionName], [Description], [IsActive]) VALUES (2, N'view_login', N'View Login Menu', 1)
INSERT [dbo].[Permissions] ([PermissionID], [PermissionName], [Description], [IsActive]) VALUES (3, N'view_machine_group', N'View Machine Group Menu', 1)
INSERT [dbo].[Permissions] ([PermissionID], [PermissionName], [Description], [IsActive]) VALUES (4, N'view_machine', N'View Machine Menu', 1)
INSERT [dbo].[Permissions] ([PermissionID], [PermissionName], [Description], [IsActive]) VALUES (5, N'view_checklist', N'View Check List Menu', 1)
INSERT [dbo].[Permissions] ([PermissionID], [PermissionName], [Description], [IsActive]) VALUES (6, N'view_checklist_option', N'View Check List Option Menu', 1)
INSERT [dbo].[Permissions] ([PermissionID], [PermissionName], [Description], [IsActive]) VALUES (7, N'view_checklist_group', N'View Group Check List Option Menu', 1)
INSERT [dbo].[Permissions] ([PermissionID], [PermissionName], [Description], [IsActive]) VALUES (8, N'view_match_checklist_option', N'View Match Group & Option Menu', 1)
INSERT [dbo].[Permissions] ([PermissionID], [PermissionName], [Description], [IsActive]) VALUES (9, N'view_match_form_machine', N'View Match Form & Machine Menu', 1)
INSERT [dbo].[Permissions] ([PermissionID], [PermissionName], [Description], [IsActive]) VALUES (10, N'create_form', N'Can Create Form', 1)
INSERT [dbo].[Permissions] ([PermissionID], [PermissionName], [Description], [IsActive]) VALUES (11, N'view_expected_result', N'View Expected Result Menu', 1)
INSERT [dbo].[Permissions] ([PermissionID], [PermissionName], [Description], [IsActive]) VALUES (12, N'view_form', N'View List Form Menu', 1)
INSERT [dbo].[Permissions] ([PermissionID], [PermissionName], [Description], [IsActive]) VALUES (13, N'view_preview', N'View Preview Form', 1)
INSERT [dbo].[Permissions] ([PermissionID], [PermissionName], [Description], [IsActive]) VALUES (14, N'view_scan_qr', N'Can Scan QR Code', 1)
INSERT [dbo].[Permissions] ([PermissionID], [PermissionName], [Description], [IsActive]) VALUES (15, N'generate_qr', N'Can Generate QR Code', 1)
INSERT [dbo].[Permissions] ([PermissionID], [PermissionName], [Description], [IsActive]) VALUES (16, N'input_form_machine', N'Can Create Transaction Result', 1)
INSERT [dbo].[Permissions] ([PermissionID], [PermissionName], [Description], [IsActive]) VALUES (17, N'view_manage_settings', N'View Manage Setting Menu', 1)
INSERT [dbo].[Permissions] ([PermissionID], [PermissionName], [Description], [IsActive]) VALUES (18, N'view_manage_permissions', N'View Manage Permission Menu', 1)
INSERT [dbo].[Permissions] ([PermissionID], [PermissionName], [Description], [IsActive]) VALUES (19, N'view_config', N'View Configuration Menu', 1)
INSERT [dbo].[Permissions] ([PermissionID], [PermissionName], [Description], [IsActive]) VALUES (20, N'view_apporved', N'View Apporved Menu', 1)
INSERT [dbo].[Permissions] ([PermissionID], [PermissionName], [Description], [IsActive]) VALUES (21, N'view_list_machine', N'View Group Machine List', 1)
INSERT [dbo].[Permissions] ([PermissionID], [PermissionName], [Description], [IsActive]) VALUES (22, N'view_list_check', N'View Group Check List Menu', 1)
SET IDENTITY_INSERT [dbo].[Permissions] OFF
GO
INSERT [dbo].[SubForms] ([SFormID], [FormID], [SFormName], [Columns], [DisplayOrder]) VALUES (N'SF0000004', N'F00000001', N'ส่วนที่ 1', 2, 0)
INSERT [dbo].[SubForms] ([SFormID], [FormID], [SFormName], [Columns], [DisplayOrder]) VALUES (N'SF0000005', N'F00000001', N'ส่วนที่ 2', 2, 1)
INSERT [dbo].[SubForms] ([SFormID], [FormID], [SFormName], [Columns], [DisplayOrder]) VALUES (N'SF0000006', N'F00000001', N'ส่วนที่ 3', 1, 2)
INSERT [dbo].[SubForms] ([SFormID], [FormID], [SFormName], [Columns], [DisplayOrder]) VALUES (N'SF0000007', N'F00000001', N'หมายเหตุ', 2, 4)
INSERT [dbo].[SubForms] ([SFormID], [FormID], [SFormName], [Columns], [DisplayOrder]) VALUES (N'SF0000008', N'F00000002', N'ส่วนที่ 1', 2, 0)
INSERT [dbo].[SubForms] ([SFormID], [FormID], [SFormName], [Columns], [DisplayOrder]) VALUES (N'SF0000009', N'F00000002', N'ส่วนที่ 2', 2, 1)
INSERT [dbo].[SubForms] ([SFormID], [FormID], [SFormName], [Columns], [DisplayOrder]) VALUES (N'SF0000010', N'F00000002', N'ส่วนที่ 3', 1, 2)
INSERT [dbo].[SubForms] ([SFormID], [FormID], [SFormName], [Columns], [DisplayOrder]) VALUES (N'SF0000011', N'F00000002', N'หมายเหตุ', 2, 3)
INSERT [dbo].[SubForms] ([SFormID], [FormID], [SFormName], [Columns], [DisplayOrder]) VALUES (N'SF0000015', N'F00000003', N'ส่วนที่ 1', 1, 0)
INSERT [dbo].[SubForms] ([SFormID], [FormID], [SFormName], [Columns], [DisplayOrder]) VALUES (N'SF0000016', N'F00000003', N'ส่วนที่2', 3, 1)
INSERT [dbo].[SubForms] ([SFormID], [FormID], [SFormName], [Columns], [DisplayOrder]) VALUES (N'SF0000017', N'F00000003', N'ส่วนที่ 3', 2, 2)
INSERT [dbo].[SubForms] ([SFormID], [FormID], [SFormName], [Columns], [DisplayOrder]) VALUES (N'SF0000018', N'F00000003', N'หมายเหตุ', 1, 4)
INSERT [dbo].[SubForms] ([SFormID], [FormID], [SFormName], [Columns], [DisplayOrder]) VALUES (N'SF0000019', N'F00000004', N't1', 1, 1)
INSERT [dbo].[SubForms] ([SFormID], [FormID], [SFormName], [Columns], [DisplayOrder]) VALUES (N'SF0000020', N'F00000004', N't2', 2, 2)
INSERT [dbo].[SubForms] ([SFormID], [FormID], [SFormName], [Columns], [DisplayOrder]) VALUES (N'SF0000021', N'F00000004', N't3', 3, 3)
INSERT [dbo].[SubForms] ([SFormID], [FormID], [SFormName], [Columns], [DisplayOrder]) VALUES (N'SF0000022', N'F00000004', N't4', 4, 4)
INSERT [dbo].[SubForms] ([SFormID], [FormID], [SFormName], [Columns], [DisplayOrder]) VALUES (N'SF0000023', N'F00000004', N't5', 5, 5)
INSERT [dbo].[SubForms] ([SFormID], [FormID], [SFormName], [Columns], [DisplayOrder]) VALUES (N'SF0000024', N'F00000004', N't6', 6, 6)
INSERT [dbo].[SubForms] ([SFormID], [FormID], [SFormName], [Columns], [DisplayOrder]) VALUES (N'SF0000025', N'F00000004', N't7', 7, 7)
INSERT [dbo].[SubForms] ([SFormID], [FormID], [SFormName], [Columns], [DisplayOrder]) VALUES (N'SF0000026', N'F00000004', N't8', 8, 8)
INSERT [dbo].[SubForms] ([SFormID], [FormID], [SFormName], [Columns], [DisplayOrder]) VALUES (N'SF0000027', N'F00000004', N't9', 9, 9)
INSERT [dbo].[SubForms] ([SFormID], [FormID], [SFormName], [Columns], [DisplayOrder]) VALUES (N'SF0000028', N'F00000004', N't10', 10, 10)
INSERT [dbo].[SubForms] ([SFormID], [FormID], [SFormName], [Columns], [DisplayOrder]) VALUES (N'SF0000029', N'F00000004', N't11', 11, 11)
INSERT [dbo].[SubForms] ([SFormID], [FormID], [SFormName], [Columns], [DisplayOrder]) VALUES (N'SF0000039', N'F00000005', N'ส่วนที่ 1', 1, 0)
INSERT [dbo].[SubForms] ([SFormID], [FormID], [SFormName], [Columns], [DisplayOrder]) VALUES (N'SF0000040', N'F00000005', N'ส่วนที่ 2', 2, 1)
INSERT [dbo].[SubForms] ([SFormID], [FormID], [SFormName], [Columns], [DisplayOrder]) VALUES (N'SF0000041', N'F00000005', N'ส่วนที่ 3', 1, 2)
INSERT [dbo].[SubForms] ([SFormID], [FormID], [SFormName], [Columns], [DisplayOrder]) VALUES (N'SF0000042', N'F00000005', N'ส่วนที่ 4', 2, 3)
INSERT [dbo].[SubForms] ([SFormID], [FormID], [SFormName], [Columns], [DisplayOrder]) VALUES (N'SF0000043', N'F00000005', N'หมายเหตุ', 2, 4)
INSERT [dbo].[SubForms] ([SFormID], [FormID], [SFormName], [Columns], [DisplayOrder]) VALUES (N'SF0000050', N'F00000006', N'ส่วนที่ 1', 2, 0)
INSERT [dbo].[SubForms] ([SFormID], [FormID], [SFormName], [Columns], [DisplayOrder]) VALUES (N'SF0000051', N'F00000006', N'ส่วนที่ 2', 2, 1)
INSERT [dbo].[SubForms] ([SFormID], [FormID], [SFormName], [Columns], [DisplayOrder]) VALUES (N'SF0000052', N'F00000006', N'หมายเหตุ', 2, 2)
INSERT [dbo].[SubForms] ([SFormID], [FormID], [SFormName], [Columns], [DisplayOrder]) VALUES (N'SF0000068', N'F00000007', N'ส่วนที่ 1', 2, 0)
INSERT [dbo].[SubForms] ([SFormID], [FormID], [SFormName], [Columns], [DisplayOrder]) VALUES (N'SF0000069', N'F00000007', N'ส่วนที่ 2', 6, 1)
INSERT [dbo].[SubForms] ([SFormID], [FormID], [SFormName], [Columns], [DisplayOrder]) VALUES (N'SF0000070', N'F00000007', N'ส่วนที่ 3', 2, 2)
INSERT [dbo].[SubForms] ([SFormID], [FormID], [SFormName], [Columns], [DisplayOrder]) VALUES (N'SF0000071', N'F00000007', N'หมายเหตุ', 2, 3)
INSERT [dbo].[SubForms] ([SFormID], [FormID], [SFormName], [Columns], [DisplayOrder]) VALUES (N'SF0000072', N'F00000007', N'วิธีการตรวจแม่เหล็ก', 2, 4)
INSERT [dbo].[SubForms] ([SFormID], [FormID], [SFormName], [Columns], [DisplayOrder]) VALUES (N'SF0000083', N'F00000008', N'ส่วนที่ 1', 1, 0)
INSERT [dbo].[SubForms] ([SFormID], [FormID], [SFormName], [Columns], [DisplayOrder]) VALUES (N'SF0000084', N'F00000008', N'ส่วนที่ 2', 2, 1)
INSERT [dbo].[SubForms] ([SFormID], [FormID], [SFormName], [Columns], [DisplayOrder]) VALUES (N'SF0000085', N'F00000008', N'ส่วนที่ 3', 2, 2)
INSERT [dbo].[SubForms] ([SFormID], [FormID], [SFormName], [Columns], [DisplayOrder]) VALUES (N'SF0000086', N'F00000008', N'หมายเหตุ', 2, 3)
INSERT [dbo].[SubForms] ([SFormID], [FormID], [SFormName], [Columns], [DisplayOrder]) VALUES (N'SF0000087', N'F00000008', N'วิธีการแก้ไข', 2, 4)
INSERT [dbo].[SubForms] ([SFormID], [FormID], [SFormName], [Columns], [DisplayOrder]) VALUES (N'SF0000096', N'F00000009', N'ส่วนที่ 1', 1, 0)
INSERT [dbo].[SubForms] ([SFormID], [FormID], [SFormName], [Columns], [DisplayOrder]) VALUES (N'SF0000097', N'F00000009', N'ส่วนที่ 2', 2, 1)
INSERT [dbo].[SubForms] ([SFormID], [FormID], [SFormName], [Columns], [DisplayOrder]) VALUES (N'SF0000098', N'F00000009', N'ส่วนที่ 3', 2, 2)
INSERT [dbo].[SubForms] ([SFormID], [FormID], [SFormName], [Columns], [DisplayOrder]) VALUES (N'SF0000099', N'F00000009', N'วิธีการแก้ไข', 2, 3)
INSERT [dbo].[SubForms] ([SFormID], [FormID], [SFormName], [Columns], [DisplayOrder]) VALUES (N'SF0000100', N'F00000010', N'ส่วนที่ 1', 2, 1)
INSERT [dbo].[SubForms] ([SFormID], [FormID], [SFormName], [Columns], [DisplayOrder]) VALUES (N'SF0000101', N'F00000010', N'ส่วนที่ 2', 2, 2)
INSERT [dbo].[SubForms] ([SFormID], [FormID], [SFormName], [Columns], [DisplayOrder]) VALUES (N'SF0000102', N'F00000010', N'หมายเหตุ', 2, 4)
INSERT [dbo].[SubForms] ([SFormID], [FormID], [SFormName], [Columns], [DisplayOrder]) VALUES (N'SF0000103', N'F00000011', N'ส่วนที่ 1', 1, 1)
INSERT [dbo].[SubForms] ([SFormID], [FormID], [SFormName], [Columns], [DisplayOrder]) VALUES (N'SF0000104', N'F00000011', N'ส่วนที่ 2', 2, 2)
INSERT [dbo].[SubForms] ([SFormID], [FormID], [SFormName], [Columns], [DisplayOrder]) VALUES (N'SF0000105', N'F00000011', N'ส่วนที่ 3', 2, 3)
INSERT [dbo].[SubForms] ([SFormID], [FormID], [SFormName], [Columns], [DisplayOrder]) VALUES (N'SF0000106', N'F00000011', N'ส่วนที่ 4', 2, 4)
INSERT [dbo].[SubForms] ([SFormID], [FormID], [SFormName], [Columns], [DisplayOrder]) VALUES (N'SF0000107', N'F00000011', N'หมายเหตุ', 2, 5)
INSERT [dbo].[SubForms] ([SFormID], [FormID], [SFormName], [Columns], [DisplayOrder]) VALUES (N'SF0000108', N'F00000011', N'วิธีการตรวจแม่เหล็ก', 2, 6)
INSERT [dbo].[SubForms] ([SFormID], [FormID], [SFormName], [Columns], [DisplayOrder]) VALUES (N'SF0000109', N'F00000012', N'ส่วนที่ 1', 2, 0)
INSERT [dbo].[SubForms] ([SFormID], [FormID], [SFormName], [Columns], [DisplayOrder]) VALUES (N'SF0000110', N'F00000012', N'ส่วนที่ 2 ', 2, 1)
INSERT [dbo].[SubForms] ([SFormID], [FormID], [SFormName], [Columns], [DisplayOrder]) VALUES (N'SF0000111', N'F00000012', N'หมายเหตุ', 2, 2)
INSERT [dbo].[SubForms] ([SFormID], [FormID], [SFormName], [Columns], [DisplayOrder]) VALUES (N'SF0000118', N'F00000013', N'ส่วนที่ 1', 2, 0)
INSERT [dbo].[SubForms] ([SFormID], [FormID], [SFormName], [Columns], [DisplayOrder]) VALUES (N'SF0000119', N'F00000013', N'ส่วนที่ 2', 2, 1)
INSERT [dbo].[SubForms] ([SFormID], [FormID], [SFormName], [Columns], [DisplayOrder]) VALUES (N'SF0000120', N'F00000013', N'หมายเหตุ', 1, 2)
INSERT [dbo].[SubForms] ([SFormID], [FormID], [SFormName], [Columns], [DisplayOrder]) VALUES (N'SF0000121', N'F00000014', N'ส่วนที่ 1', 2, 0)
INSERT [dbo].[SubForms] ([SFormID], [FormID], [SFormName], [Columns], [DisplayOrder]) VALUES (N'SF0000122', N'F00000014', N'ส่วนที่ 2', 2, 1)
INSERT [dbo].[SubForms] ([SFormID], [FormID], [SFormName], [Columns], [DisplayOrder]) VALUES (N'SF0000123', N'F00000014', N'หมายเหตุ', 1, 2)
INSERT [dbo].[SubForms] ([SFormID], [FormID], [SFormName], [Columns], [DisplayOrder]) VALUES (N'SF0000124', N'F00000015', N'ส่วนที่ 1', 2, 1)
INSERT [dbo].[SubForms] ([SFormID], [FormID], [SFormName], [Columns], [DisplayOrder]) VALUES (N'SF0000125', N'F00000015', N'ส่วนที่ 2', 2, 2)
INSERT [dbo].[SubForms] ([SFormID], [FormID], [SFormName], [Columns], [DisplayOrder]) VALUES (N'SF0000126', N'F00000015', N'หมายเหตุ', 1, 3)
GO
INSERT [dbo].[Users] ([UserID], [UserName], [GUserID], [IsActive]) VALUES (N'U00000001', N'Rattana Chomwihok', N'GU01', 1)
INSERT [dbo].[Users] ([UserID], [UserName], [GUserID], [IsActive]) VALUES (N'U00000002', N'Administrator', N'GU02', 1)
INSERT [dbo].[Users] ([UserID], [UserName], [GUserID], [IsActive]) VALUES (N'U00000003', N'Guest', N'GU03', 1)
INSERT [dbo].[Users] ([UserID], [UserName], [GUserID], [IsActive]) VALUES (N'U00000004', N'ACC_04', N'GU04', 1)
GO
ALTER TABLE [dbo].[CheckListOptions] ADD  CONSTRAINT [DF_CheckListOptions_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[CheckLists] ADD  CONSTRAINT [DF_CheckLists_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[CheckListTypes] ADD  CONSTRAINT [DF_CheckListTypes_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[DataTypes] ADD  CONSTRAINT [DF_DataTypes_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Forms] ADD  CONSTRAINT [DF_Forms_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[GroupCheckListOptions] ADD  CONSTRAINT [DF_GroupCheckListOptions_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[GroupMachines] ADD  CONSTRAINT [DF_MachineGroups_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[GroupPermissions] ADD  CONSTRAINT [DF__GroupPerm__Creat__4850AF91]  DEFAULT (getdate()) FOR [Create_Date]
GO
ALTER TABLE [dbo].[Logs] ADD  CONSTRAINT [DF__Logs__Create_Dat__131DCD43]  DEFAULT (getdate()) FOR [Create_Date]
GO
ALTER TABLE [dbo].[Machines] ADD  CONSTRAINT [DF_Machines_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[MatchCheckList] ADD  CONSTRAINT [DF_MatchCheckList_Required]  DEFAULT ((0)) FOR [Required]
GO
ALTER TABLE [dbo].[MatchCheckListOption] ADD  CONSTRAINT [DF_MatchCheckListOption_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[ExpectedResults]  WITH CHECK ADD  CONSTRAINT [FK__ExpectedR__FormI__5DEAEAF5] FOREIGN KEY([FormID])
REFERENCES [dbo].[Forms] ([FormID])
GO
ALTER TABLE [dbo].[ExpectedResults] CHECK CONSTRAINT [FK__ExpectedR__FormI__5DEAEAF5]
GO
ALTER TABLE [dbo].[ExpectedResults]  WITH CHECK ADD  CONSTRAINT [FK__ExpectedR__Machi__5EDF0F2E] FOREIGN KEY([MachineID])
REFERENCES [dbo].[Machines] ([MachineID])
GO
ALTER TABLE [dbo].[ExpectedResults] CHECK CONSTRAINT [FK__ExpectedR__Machi__5EDF0F2E]
GO
ALTER TABLE [dbo].[ExpectedResults]  WITH CHECK ADD  CONSTRAINT [FK__ExpectedR__MList__5CF6C6BC] FOREIGN KEY([MCListID])
REFERENCES [dbo].[MatchCheckList] ([MCListID])
GO
ALTER TABLE [dbo].[ExpectedResults] CHECK CONSTRAINT [FK__ExpectedR__MList__5CF6C6BC]
GO
ALTER TABLE [dbo].[GroupPermissions]  WITH CHECK ADD  CONSTRAINT [FK__GroupPerm__Guser__4944D3CA] FOREIGN KEY([GuserID])
REFERENCES [dbo].[GroupUsers] ([GUserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GroupPermissions] CHECK CONSTRAINT [FK__GroupPerm__Guser__4944D3CA]
GO
ALTER TABLE [dbo].[GroupPermissions]  WITH CHECK ADD  CONSTRAINT [FK__GroupPerm__Permi__4A38F803] FOREIGN KEY([PermissionID])
REFERENCES [dbo].[Permissions] ([PermissionID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GroupPermissions] CHECK CONSTRAINT [FK__GroupPerm__Permi__4A38F803]
GO
ALTER TABLE [dbo].[Importants]  WITH CHECK ADD  CONSTRAINT [FK_Importants_MatchCheckList] FOREIGN KEY([MCListID])
REFERENCES [dbo].[MatchCheckList] ([MCListID])
GO
ALTER TABLE [dbo].[Importants] CHECK CONSTRAINT [FK_Importants_MatchCheckList]
GO
ALTER TABLE [dbo].[Machines]  WITH CHECK ADD  CONSTRAINT [FK__Machines__FormID__4F9CCB9E] FOREIGN KEY([FormID])
REFERENCES [dbo].[Forms] ([FormID])
GO
ALTER TABLE [dbo].[Machines] CHECK CONSTRAINT [FK__Machines__FormID__4F9CCB9E]
GO
ALTER TABLE [dbo].[Machines]  WITH CHECK ADD  CONSTRAINT [FK__Machines__MGroup__5090EFD7] FOREIGN KEY([GMachineID])
REFERENCES [dbo].[GroupMachines] ([GMachineID])
GO
ALTER TABLE [dbo].[Machines] CHECK CONSTRAINT [FK__Machines__MGroup__5090EFD7]
GO
ALTER TABLE [dbo].[MatchCheckList]  WITH CHECK ADD  CONSTRAINT [FK__MatchChec__CList__5555A4F4] FOREIGN KEY([CListID])
REFERENCES [dbo].[CheckLists] ([CListID])
GO
ALTER TABLE [dbo].[MatchCheckList] CHECK CONSTRAINT [FK__MatchChec__CList__5555A4F4]
GO
ALTER TABLE [dbo].[MatchCheckList]  WITH CHECK ADD  CONSTRAINT [FK__MatchChec__CType__5649C92D] FOREIGN KEY([CTypeID])
REFERENCES [dbo].[CheckListTypes] ([CTypeID])
GO
ALTER TABLE [dbo].[MatchCheckList] CHECK CONSTRAINT [FK__MatchChec__CType__5649C92D]
GO
ALTER TABLE [dbo].[MatchCheckList]  WITH CHECK ADD  CONSTRAINT [FK__MatchChec__DType__573DED66] FOREIGN KEY([DTypeID])
REFERENCES [dbo].[DataTypes] ([DTypeID])
GO
ALTER TABLE [dbo].[MatchCheckList] CHECK CONSTRAINT [FK__MatchChec__DType__573DED66]
GO
ALTER TABLE [dbo].[MatchCheckList]  WITH CHECK ADD  CONSTRAINT [FK__MatchChec__SForm__5832119F] FOREIGN KEY([SFormID])
REFERENCES [dbo].[SubForms] ([SFormID])
GO
ALTER TABLE [dbo].[MatchCheckList] CHECK CONSTRAINT [FK__MatchChec__SForm__5832119F]
GO
ALTER TABLE [dbo].[MatchCheckList]  WITH CHECK ADD  CONSTRAINT [FK_MatchCheckList_GroupCheckListOptions] FOREIGN KEY([GCLOptionID])
REFERENCES [dbo].[GroupCheckListOptions] ([GCLOptionID])
GO
ALTER TABLE [dbo].[MatchCheckList] CHECK CONSTRAINT [FK_MatchCheckList_GroupCheckListOptions]
GO
ALTER TABLE [dbo].[MatchCheckListOption]  WITH CHECK ADD  CONSTRAINT [FK_MatchCheckListOption_CheckListOptions] FOREIGN KEY([GCLOptionID])
REFERENCES [dbo].[GroupCheckListOptions] ([GCLOptionID])
GO
ALTER TABLE [dbo].[MatchCheckListOption] CHECK CONSTRAINT [FK_MatchCheckListOption_CheckListOptions]
GO
ALTER TABLE [dbo].[MatchCheckListOption]  WITH CHECK ADD  CONSTRAINT [FK_MatchCheckListOption_CheckListOptions1] FOREIGN KEY([CLOptionID])
REFERENCES [dbo].[CheckListOptions] ([CLOptionID])
GO
ALTER TABLE [dbo].[MatchCheckListOption] CHECK CONSTRAINT [FK_MatchCheckListOption_CheckListOptions1]
GO
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD  CONSTRAINT [FK_Menu_Permissions] FOREIGN KEY([PermissionID])
REFERENCES [dbo].[Permissions] ([PermissionID])
GO
ALTER TABLE [dbo].[Menu] CHECK CONSTRAINT [FK_Menu_Permissions]
GO
ALTER TABLE [dbo].[SubForms]  WITH CHECK ADD  CONSTRAINT [FK__SubForms__FormID__4707859D] FOREIGN KEY([FormID])
REFERENCES [dbo].[Forms] ([FormID])
GO
ALTER TABLE [dbo].[SubForms] CHECK CONSTRAINT [FK__SubForms__FormID__4707859D]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_GroupUsers] FOREIGN KEY([GUserID])
REFERENCES [dbo].[GroupUsers] ([GUserID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_GroupUsers]
GO
