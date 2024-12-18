USE [m_checklist3]
GO
/****** Object:  Table [dbo].[CheckListTypes]    Script Date: 12/8/2024 11:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CheckListTypes](
	[CTypeID] [nvarchar](9) NOT NULL,
	[GTypeID] [nvarchar](9) NULL,
	[CTypeName] [nvarchar](150) NOT NULL,
	[CTypeTitle] [nvarchar](150) NULL,
	[Icon] [nvarchar](150) NULL,
	[Displayorder] [tinyint] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK__CheckLis__E83DD3152D47B39A] PRIMARY KEY CLUSTERED 
(
	[CTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupTypeCheckLists]    Script Date: 12/8/2024 11:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupTypeCheckLists](
	[GTypeID] [nvarchar](9) NULL,
	[GTypeName] [nvarchar](50) NULL,
	[Icon] [nvarchar](150) NULL,
	[IsActive] [bit] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[CheckListTypes] ([CTypeID], [GTypeID], [CTypeName], [CTypeTitle], [Icon], [Displayorder], [IsActive]) VALUES (N'CT01', N'GT0000001', N'Textinput', N'String Answer', N'format-text', 1, 1)
INSERT [dbo].[CheckListTypes] ([CTypeID], [GTypeID], [CTypeName], [CTypeTitle], [Icon], [Displayorder], [IsActive]) VALUES (N'CT02', N'GT0000001', N'Textarea', N'Long Answer', N'text-long', 3, 1)
INSERT [dbo].[CheckListTypes] ([CTypeID], [GTypeID], [CTypeName], [CTypeTitle], [Icon], [Displayorder], [IsActive]) VALUES (N'CT03', N'GT0000002', N'Radio', N'Radio Buttom', N'order-bool-ascending', 1, 1)
INSERT [dbo].[CheckListTypes] ([CTypeID], [GTypeID], [CTypeName], [CTypeTitle], [Icon], [Displayorder], [IsActive]) VALUES (N'CT04', N'GT0000002', N'Checkbox', N'Checkbox', N'order-bool-ascending-variant', 2, 1)
INSERT [dbo].[CheckListTypes] ([CTypeID], [GTypeID], [CTypeName], [CTypeTitle], [Icon], [Displayorder], [IsActive]) VALUES (N'CT05', N'GT0000002', N'Dropdown', N'Dropdown List', N'format-list-group', 3, 1)
INSERT [dbo].[CheckListTypes] ([CTypeID], [GTypeID], [CTypeName], [CTypeTitle], [Icon], [Displayorder], [IsActive]) VALUES (N'CT06', N'GT0000001', N'Text', N'Label', N'format-color-text', 4, 1)
INSERT [dbo].[CheckListTypes] ([CTypeID], [GTypeID], [CTypeName], [CTypeTitle], [Icon], [Displayorder], [IsActive]) VALUES (N'CT07', N'GT0000001', N'Textinput', N'Number Answer', N'numeric', 2, 1)
INSERT [dbo].[CheckListTypes] ([CTypeID], [GTypeID], [CTypeName], [CTypeTitle], [Icon], [Displayorder], [IsActive]) VALUES (N'CT08', N'GT0000003', N'SubForm', N'Setion', N'card-plus-outline', 1, 1)
GO
INSERT [dbo].[GroupTypeCheckLists] ([GTypeID], [GTypeName], [Icon], [IsActive]) VALUES (N'GT0000001', N'Basic Field', NULL, 1)
INSERT [dbo].[GroupTypeCheckLists] ([GTypeID], [GTypeName], [Icon], [IsActive]) VALUES (N'GT0000002', N'Advanced Field', NULL, 1)
INSERT [dbo].[GroupTypeCheckLists] ([GTypeID], [GTypeName], [Icon], [IsActive]) VALUES (N'GT0000003', N'Section', NULL, 1)
GO
ALTER TABLE [dbo].[CheckListTypes] ADD  CONSTRAINT [DF_CheckListTypes_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
