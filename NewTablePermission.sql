USE [m_checklist]
GO
/****** Object:  Table [dbo].[GroupPermissions]    Script Date: 11/10/2024 6:21:20 PM ******/
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
/****** Object:  Table [dbo].[GroupUsers]    Script Date: 11/10/2024 6:21:20 PM ******/
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
/****** Object:  Table [dbo].[Permissions]    Script Date: 11/10/2024 6:21:20 PM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 11/10/2024 6:21:20 PM ******/
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
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_GroupUsers] FOREIGN KEY([GUserID])
REFERENCES [dbo].[GroupUsers] ([GUserID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_GroupUsers]
GO
