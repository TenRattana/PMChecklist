USE [m_checklist]
GO
/****** Object:  Table [dbo].[GroupPermissions]    Script Date: 11/10/2024 7:21:12 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupUsers]    Script Date: 11/10/2024 7:21:12 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 11/10/2024 7:21:12 PM ******/
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
	[OrderNo] [int] NOT NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK__Menu__C99ED2506608FE5D] PRIMARY KEY CLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permissions]    Script Date: 11/10/2024 7:21:12 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/10/2024 7:21:12 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
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
GO
INSERT [dbo].[GroupUsers] ([GUserID], [GUserName], [IsActive]) VALUES (N'GU01', N'SuperAdmin', 1)
INSERT [dbo].[GroupUsers] ([GUserID], [GUserName], [IsActive]) VALUES (N'GU02', N'Admin', 1)
INSERT [dbo].[GroupUsers] ([GUserID], [GUserName], [IsActive]) VALUES (N'GU03', N'GeneralUser', 1)
INSERT [dbo].[GroupUsers] ([GUserID], [GUserName], [IsActive]) VALUES (N'GU04', N'Head', 1)
GO
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([MenuID], [MenuPermission], [MenuLabel], [Description], [ParentMenuID], [PermissionID], [Path], [OrderNo], [IsActive]) VALUES (1, N'Home', N'Home', N'Home Screen', NULL, 1, N'screens/layouts/HomeScreen', 1, 1)
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
SET IDENTITY_INSERT [dbo].[Permissions] OFF
GO
INSERT [dbo].[Users] ([UserID], [UserName], [GUserID], [IsActive]) VALUES (N'U00000001', N'Rattana Chomwihok', N'GU01', 1)
INSERT [dbo].[Users] ([UserID], [UserName], [GUserID], [IsActive]) VALUES (N'U00000002', N'Administrator', N'GU02', 1)
INSERT [dbo].[Users] ([UserID], [UserName], [GUserID], [IsActive]) VALUES (N'U00000003', N'Guest', N'GU03', 1)
INSERT [dbo].[Users] ([UserID], [UserName], [GUserID], [IsActive]) VALUES (N'U00000004', N'ACC_04', N'GU04', 1)
GO
ALTER TABLE [dbo].[GroupPermissions] ADD  CONSTRAINT [DF__GroupPerm__Creat__4850AF91]  DEFAULT (getdate()) FOR [Create_Date]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_IsActive]  DEFAULT ((1)) FOR [IsActive]
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
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD  CONSTRAINT [FK_Menu_Permissions] FOREIGN KEY([PermissionID])
REFERENCES [dbo].[Permissions] ([PermissionID])
GO
ALTER TABLE [dbo].[Menu] CHECK CONSTRAINT [FK_Menu_Permissions]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_GroupUsers] FOREIGN KEY([GUserID])
REFERENCES [dbo].[GroupUsers] ([GUserID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_GroupUsers]
GO
