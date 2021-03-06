USE [Data]
GO
/****** Object:  Table [dbo].[group_inbox]    Script Date: 1/14/2019 11:58:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[group_inbox](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](250) NULL,
	[active] [bit] NULL,
 CONSTRAINT [PK_group_inbox] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[inbox]    Script Date: 1/14/2019 11:58:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inbox](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](550) NULL,
	[email] [nvarchar](550) NULL,
	[phone] [nvarchar](550) NULL,
	[message] [ntext] NULL,
	[active] [bit] NULL,
	[groupid] [int] NULL,
	[subject] [nvarchar](550) NULL,
	[address] [nvarchar](550) NULL,
	[note] [ntext] NULL,
 CONSTRAINT [PK_inbox] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[menu]    Script Date: 1/14/2019 11:58:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[menu](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](550) NULL,
	[url] [nvarchar](550) NULL,
	[active] [bit] NULL,
	[images] [nvarchar](550) NULL,
	[sort] [int] NULL,
	[group_menu] [int] NULL,
	[style] [int] NULL,
	[code] [nvarchar](550) NULL,
	[note] [nvarchar](550) NULL,
	[parent] [int] NULL,
	[lang] [nvarchar](50) NULL,
 CONSTRAINT [PK_menu] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[menu_group]    Script Date: 1/14/2019 11:58:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[menu_group](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](550) NULL,
	[note] [nvarchar](550) NULL,
	[active] [nvarchar](50) NULL,
	[images] [nvarchar](550) NULL,
	[lang] [nvarchar](50) NULL,
 CONSTRAINT [PK_menu_group] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[news]    Script Date: 1/14/2019 11:58:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[news](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](550) NULL,
	[desciption] [ntext] NULL,
	[content1] [ntext] NULL,
	[content2] [ntext] NULL,
	[content3] [ntext] NULL,
	[content4] [ntext] NULL,
	[content5] [ntext] NULL,
	[meta_title] [nvarchar](550) NULL,
	[meta_description] [ntext] NULL,
	[meta_keywords] [nvarchar](550) NULL,
	[images] [nvarchar](550) NULL,
	[datecreate] [nvarchar](50) NULL,
	[dateend] [nvarchar](50) NULL,
	[dateedit] [nvarchar](50) NULL,
	[usercreate] [int] NULL,
	[useredit] [int] NULL,
	[actived] [bit] NULL,
	[deleted] [bit] NULL,
	[parent] [int] NULL,
	[tags] [nvarchar](550) NULL,
	[views] [int] NULL,
	[rating] [int] NULL,
	[code] [nvarchar](50) NULL,
	[url] [nvarchar](550) NULL,
	[price] [nvarchar](50) NULL,
	[quantity] [int] NULL,
	[lang] [nvarchar](50) NULL,
 CONSTRAINT [PK_news] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[news_category]    Script Date: 1/14/2019 11:58:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[news_category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](550) NULL,
	[desciption] [ntext] NULL,
	[content1] [ntext] NULL,
	[content2] [ntext] NULL,
	[content3] [ntext] NULL,
	[content4] [ntext] NULL,
	[content5] [ntext] NULL,
	[meta_title] [nvarchar](550) NULL,
	[meta_description] [ntext] NULL,
	[meta_keywords] [nvarchar](550) NULL,
	[images] [nvarchar](50) NULL,
	[datecreate] [nvarchar](50) NULL,
	[dateedit] [nvarchar](50) NULL,
	[usercreate] [int] NULL,
	[useredit] [int] NULL,
	[actived] [bit] NULL,
	[deleted] [bit] NULL,
	[parent] [int] NULL,
	[tags] [nvarchar](550) NULL,
	[views] [int] NULL,
	[rating] [int] NULL,
	[code] [nvarchar](50) NULL,
	[url] [nvarchar](550) NULL,
	[price] [nvarchar](50) NULL,
	[quantity] [int] NULL,
	[lang] [nvarchar](50) NULL,
 CONSTRAINT [PK_news_category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[order]    Script Date: 1/14/2019 11:58:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](550) NULL,
	[name] [nvarchar](550) NULL,
	[phone] [nvarchar](550) NULL,
	[email] [nvarchar](550) NULL,
	[address] [nvarchar](550) NULL,
	[datecreate] [nvarchar](50) NULL,
	[status] [int] NULL,
	[total] [decimal](18, 0) NULL,
	[active] [bit] NULL,
	[promo_code] [nvarchar](50) NULL,
	[promo_price] [decimal](18, 0) NULL,
 CONSTRAINT [PK_order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[order_detail]    Script Date: 1/14/2019 11:58:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_detail](
	[id] [int] NOT NULL,
	[idOrder] [int] NULL,
	[idProduct] [int] NULL,
	[name] [nvarchar](550) NULL,
	[quantity] [int] NULL,
	[price] [decimal](18, 0) NULL,
 CONSTRAINT [PK_order_detail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[page]    Script Date: 1/14/2019 11:58:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[page](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](550) NULL,
	[desciption] [ntext] NULL,
	[content1] [ntext] NULL,
	[content2] [ntext] NULL,
	[content3] [ntext] NULL,
	[content4] [ntext] NULL,
	[content5] [ntext] NULL,
	[meta_title] [nvarchar](550) NULL,
	[meta_description] [ntext] NULL,
	[meta_keywords] [nvarchar](550) NULL,
	[images] [nvarchar](50) NULL,
	[datecreate] [nvarchar](50) NULL,
	[dateend] [nvarchar](50) NULL,
	[dateedit] [nvarchar](50) NULL,
	[usercreate] [int] NULL,
	[useredit] [int] NULL,
	[actived] [bit] NULL,
	[deleted] [bit] NULL,
	[parent] [int] NULL,
	[tags] [nvarchar](550) NULL,
	[views] [int] NULL,
	[rating] [int] NULL,
	[code] [nvarchar](50) NULL,
	[url] [nvarchar](550) NULL,
	[price] [nvarchar](50) NULL,
	[quantity] [int] NULL,
	[lang] [nvarchar](50) NULL,
 CONSTRAINT [PK_pages] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[picture]    Script Date: 1/14/2019 11:58:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[picture](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](550) NULL,
	[filename] [nvarchar](550) NULL,
	[group_picture] [int] NULL,
	[active] [bit] NULL,
	[note] [nvarchar](550) NULL,
 CONSTRAINT [PK_picture] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[picture_group]    Script Date: 1/14/2019 11:58:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[picture_group](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](550) NULL,
	[active] [bit] NULL,
	[note] [nvarchar](550) NULL,
	[lang] [nvarchar](50) NULL,
 CONSTRAINT [PK_picture_group] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[product]    Script Date: 1/14/2019 11:58:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](550) NULL,
	[desciption] [ntext] NULL,
	[content1] [ntext] NULL,
	[content2] [ntext] NULL,
	[content3] [ntext] NULL,
	[content4] [ntext] NULL,
	[content5] [ntext] NULL,
	[meta_title] [nvarchar](550) NULL,
	[meta_description] [ntext] NULL,
	[meta_keywords] [nvarchar](550) NULL,
	[images] [nvarchar](550) NULL,
	[datecreate] [nvarchar](50) NULL,
	[dateedit] [nvarchar](50) NULL,
	[usercreate] [int] NULL,
	[dateend] [nvarchar](50) NULL,
	[useredit] [int] NULL,
	[actived] [bit] NULL,
	[deleted] [bit] NULL,
	[parent] [int] NULL,
	[tags] [nvarchar](550) NULL,
	[views] [int] NULL,
	[rating] [int] NULL,
	[code] [nvarchar](50) NULL,
	[url] [nvarchar](550) NULL,
	[price] [nvarchar](50) NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[product_category]    Script Date: 1/14/2019 11:58:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](550) NULL,
	[desciption] [ntext] NULL,
	[content1] [ntext] NULL,
	[content2] [ntext] NULL,
	[content3] [ntext] NULL,
	[content4] [ntext] NULL,
	[content5] [ntext] NULL,
	[meta_title] [nvarchar](550) NULL,
	[meta_description] [ntext] NULL,
	[meta_keywords] [nvarchar](550) NULL,
	[images] [nvarchar](50) NULL,
	[datecreate] [nvarchar](50) NULL,
	[dateedit] [nvarchar](50) NULL,
	[usercreate] [int] NULL,
	[useredit] [int] NULL,
	[actived] [bit] NULL,
	[deleted] [bit] NULL,
	[parent] [int] NULL,
	[tags] [nvarchar](550) NULL,
	[views] [int] NULL,
	[rating] [int] NULL,
	[code] [nvarchar](50) NULL,
	[url] [nvarchar](550) NULL,
	[price] [nvarchar](50) NULL,
	[quantity] [int] NULL,
	[lang] [nvarchar](50) NULL,
 CONSTRAINT [PK_product_cat] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[product_picture]    Script Date: 1/14/2019 11:58:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_picture](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_product] [int] NULL,
	[filename] [nvarchar](550) NULL,
	[title] [ntext] NULL,
	[active] [bit] NULL,
	[lang] [nvarchar](50) NULL,
 CONSTRAINT [PK_product_picture] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[router_config]    Script Date: 1/14/2019 11:58:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[router_config](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[url] [nvarchar](500) NULL,
	[controller] [nvarchar](500) NULL,
	[action] [nvarchar](500) NULL,
	[itemId] [nvarchar](500) NULL,
	[actived] [bit] NULL,
 CONSTRAINT [PK_router_config] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[user_group]    Script Date: 1/14/2019 11:58:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_group](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](250) NULL,
	[active] [bit] NULL,
	[permission] [ntext] NULL,
 CONSTRAINT [PK_user_group] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[user_member]    Script Date: 1/14/2019 11:58:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_member](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](550) NOT NULL,
	[password_user] [nvarchar](550) NULL,
	[fullname] [nvarchar](550) NULL,
	[email] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
	[address] [nvarchar](550) NULL,
	[birthday] [nvarchar](50) NULL,
	[active] [bit] NULL,
	[group_user] [int] NULL,
	[datecreate] [nvarchar](50) NULL,
 CONSTRAINT [PK_user_member] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[group_inbox] ON 

INSERT [dbo].[group_inbox] ([id], [name], [active]) VALUES (1, N'Hợp tác nhà cung cấp', NULL)
INSERT [dbo].[group_inbox] ([id], [name], [active]) VALUES (2, N'Hợp tác nhà phân phối', NULL)
INSERT [dbo].[group_inbox] ([id], [name], [active]) VALUES (3, N'Hợp tác gia công', NULL)
INSERT [dbo].[group_inbox] ([id], [name], [active]) VALUES (4, N'Thông tin sản phẩm', NULL)
INSERT [dbo].[group_inbox] ([id], [name], [active]) VALUES (5, N'Hướng dẫn sử dụng', NULL)
INSERT [dbo].[group_inbox] ([id], [name], [active]) VALUES (6, N'Khuyến mãi', NULL)
INSERT [dbo].[group_inbox] ([id], [name], [active]) VALUES (7, N'Khiếu nại', NULL)
INSERT [dbo].[group_inbox] ([id], [name], [active]) VALUES (8, N'Khác', NULL)
SET IDENTITY_INSERT [dbo].[group_inbox] OFF
SET IDENTITY_INSERT [dbo].[inbox] ON 

INSERT [dbo].[inbox] ([id], [name], [email], [phone], [message], [active], [groupid], [subject], [address], [note]) VALUES (1, N'Test Bài Viết', N'lychanhdaric@gmail.com', N'0964900534', N'bh', NULL, 1, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[inbox] OFF
SET IDENTITY_INSERT [dbo].[menu] ON 

INSERT [dbo].[menu] ([id], [name], [url], [active], [images], [sort], [group_menu], [style], [code], [note], [parent], [lang]) VALUES (1, N'Trang chủ', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[menu] ([id], [name], [url], [active], [images], [sort], [group_menu], [style], [code], [note], [parent], [lang]) VALUES (2, N'Giới Thiệu', NULL, NULL, NULL, 2, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[menu] ([id], [name], [url], [active], [images], [sort], [group_menu], [style], [code], [note], [parent], [lang]) VALUES (3, N'Sản phẩm', NULL, 1, NULL, 3, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[menu] ([id], [name], [url], [active], [images], [sort], [group_menu], [style], [code], [note], [parent], [lang]) VALUES (4, N'Hợp Tác', N'hop-tac', 1, NULL, 6, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[menu] ([id], [name], [url], [active], [images], [sort], [group_menu], [style], [code], [note], [parent], [lang]) VALUES (5, N'Cẩm Nang Nhà Nông', N'cam-nang-nha-nong', 1, NULL, 4, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[menu] ([id], [name], [url], [active], [images], [sort], [group_menu], [style], [code], [note], [parent], [lang]) VALUES (6, N'Truyền Thông', N'tin-tuc', NULL, NULL, 5, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[menu] ([id], [name], [url], [active], [images], [sort], [group_menu], [style], [code], [note], [parent], [lang]) VALUES (7, N'Tuyển Dụng', N'tuyen-dung', NULL, NULL, 7, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[menu] ([id], [name], [url], [active], [images], [sort], [group_menu], [style], [code], [note], [parent], [lang]) VALUES (8, N'Liên hệ', N'contact', NULL, NULL, 8, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[menu] ([id], [name], [url], [active], [images], [sort], [group_menu], [style], [code], [note], [parent], [lang]) VALUES (9, N'Về công ty', N've-cong-ty', 1, NULL, NULL, 1, NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[menu] ([id], [name], [url], [active], [images], [sort], [group_menu], [style], [code], [note], [parent], [lang]) VALUES (10, N'Phân bón chuyên dùng', N'phan-bon-chuyen-dung', 1, NULL, 1, 1, NULL, NULL, NULL, 3, NULL)
INSERT [dbo].[menu] ([id], [name], [url], [active], [images], [sort], [group_menu], [style], [code], [note], [parent], [lang]) VALUES (11, N'Phân bón NPK', N'phan-bon-npk', NULL, NULL, 2, 1, NULL, NULL, NULL, 3, NULL)
INSERT [dbo].[menu] ([id], [name], [url], [active], [images], [sort], [group_menu], [style], [code], [note], [parent], [lang]) VALUES (12, N'Các loại phân bón khác', N'cac-loai-phan-bon-khac', 1, NULL, NULL, 1, NULL, NULL, NULL, 3, NULL)
SET IDENTITY_INSERT [dbo].[menu] OFF
SET IDENTITY_INSERT [dbo].[menu_group] ON 

INSERT [dbo].[menu_group] ([id], [name], [note], [active], [images], [lang]) VALUES (1, N'Menu Chính', NULL, N'1', NULL, NULL)
SET IDENTITY_INSERT [dbo].[menu_group] OFF
SET IDENTITY_INSERT [dbo].[news] ON 

INSERT [dbo].[news] ([id], [name], [desciption], [content1], [content2], [content3], [content4], [content5], [meta_title], [meta_description], [meta_keywords], [images], [datecreate], [dateend], [dateedit], [usercreate], [useredit], [actived], [deleted], [parent], [tags], [views], [rating], [code], [url], [price], [quantity], [lang]) VALUES (3, N'Về công ty', N'Được thành lập từ năm 2011, Công ty Cổ Phần Phân Bón Quốc Tế đã không ngừng nghiên cứu, cải tiến công nghệ, thiết bị, phát triển sản phẩm, mở rộng thị trường đồng thời cũng xây dựng một đội ngũ Khoa học và Kĩ thuật quy tụ các Giáo sư, Tiến sĩ đầu nghành về nông nghiệp, nhằm mục đích sản xuất đưa ra thị trường những sản phẩm phân bón chất lượng với mong muốn mang đến cho người nông dân những sản phầm tốt nhất, giúp bà con nông dân làm giàu trên ruộng vườn của mình. Bằng những nỗ lực phục vụ người nông dân và nghành nông nghiệp đến nay Cổ Phần Phân Bón Quốc Tế đã khẳng định được thương hiệu của mình tại thị trường trong nước và trên thị trường quốc tế.', N'<div class="dam info_detail_news" style="-webkit-text-stroke-width:0px; margin-bottom:20px; margin-right:8px; margin-top:5px; text-indent:0px"><span style="font-size:12pt"><span style="background-color:white"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="background-color:white"><span style="font-family:Roboto"><span style="color:black">Ch&uacute;ng t&ocirc;i tự h&agrave;o l&agrave; một trong những doanh nghiệp ti&ecirc;n phong h&agrave;ng đầu sở hữu nh&agrave; m&aacute;y sản xuất ph&acirc;n b&oacute;n bằng c&ocirc;ng nghệ ure h&oacute;a lỏng hiện đại nhất Việt Nam hiện nay. Nh&agrave; m&aacute;y tọa lạc tại KCN Th&aacute;i H&ograve;a 3 thuộc tỉnh Long An với diện t&iacute;ch </span></span></span><span style="font-size:14.0pt"><span style="background-color:white"><span style="font-family:Roboto"><span style="color:#212121">2 h&eacute;c ta</span></span></span></span><span style="background-color:white"><span style="font-family:Roboto"><span style="color:black">, quy m&ocirc; sản xuất tr&ecirc;n 100.000 tấn/năm</span></span></span><span style="background-color:#f6f7f7"><span style="font-family:Roboto"><span style="color:black">&nbsp;nhằm đ&aacute;p ứng nhu cầu ng&agrave;y c&agrave;ng lớn của thị trường ph&acirc;n b&oacute;n hiện nay. Hệ thống </span></span></span><span style="background-color:white"><span style="font-family:Roboto"><span style="color:black">sản phẩm của ph&acirc;n b&oacute;n quốc tế đều được sản xuất dựa tr&ecirc;n hệ thống quản l&yacute; chất lượng ISO 9001:2008, tất cả c&aacute;c nguy&ecirc;n liệu trước khi đưa v&agrave;o sản xuất đều phải qua hệ thống kiểm tra nghi&ecirc;m ngặt nhằm đảm bảo chất lượng đầu v&agrave;o</span></span></span> <span style="background-color:white"><span style="font-family:Roboto"><span style="color:black">cho đến từng c&ocirc;ng đoạn trong qu&aacute; tr&igrave;nh sản xuất cũng được quản l&yacute; chất lượng một c&aacute;ch chặt chẽ, ch&iacute;nh v&igrave; vậy sản phẩm của ch&uacute;ng t&ocirc;i được đưa ra thị trường đều đạt ti&ecirc;u chuẩn Việt Nam v&agrave; ti&ecirc;u chuẩn quốc tế.</span></span></span></span></span></span></div>

<div class="dam info_detail_news" style="-webkit-text-stroke-width:0px; margin-bottom:20px; margin-right:8px; margin-top:5px; text-align:justify; text-indent:0px">
<p>&nbsp;</p>

<p><span style="font-size:12pt"><span style="background-color:white"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="background-color:white"><span style="font-family:Roboto"><span style="color:black">Ch&uacute;ng t&ocirc;i cho rằng, ch&iacute;nh chất lượng tạo n&ecirc;n gi&aacute; trị sản phẩm v&agrave; sự ph&aacute;t triển bền vững cho doanh nghiệp. Đ&oacute; l&agrave; niềm tin, l&agrave; tinh thần l&agrave;m việc v&agrave; văn h&oacute;a kinh doanh của ph&acirc;n b&oacute;n quốc tế.</span></span></span></span></span></span></p>

<p><span style="font-size:12pt"><span style="background-color:white"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="background-color:white"><span style="font-family:Roboto"><span style="color:black">Lựa chọn ph&acirc;n b&oacute;n quốc tế nh&agrave; n&ocirc;ng sẽ được an t&acirc;m về chất lượng, sử dụng ph&acirc;n b&oacute;n quốc tế sẽ mang lại năng suất cao nhất cho c&acirc;y trồng.</span></span></span></span></span></span></p>
</div>
', NULL, NULL, NULL, NULL, N'Công Ty Cổ Phần Phân Bón Quốc Tế ', N'Công Ty Cổ Phần Phân Bón Quốc Tế là một trong những công ty hàng đầu trong lĩnh vực phân bón hiện nay tại Việt Nam, với đội ngũ chuyên gia và công nhân lành nghề bên cạnh đội ngũ kinh doanh năng động. Sản phẩm của công ty hiện được tiêu thụ khắp các vùng miền đông Nam Bộ và cao nguyên Miền Trung.', NULL, N'logo.png', N'1/11/2019', N'1/11/2019', N'1/14/2019', NULL, NULL, 1, NULL, 2, NULL, NULL, NULL, NULL, N've-cong-ty', NULL, NULL, NULL)
INSERT [dbo].[news] ([id], [name], [desciption], [content1], [content2], [content3], [content4], [content5], [meta_title], [meta_description], [meta_keywords], [images], [datecreate], [dateend], [dateedit], [usercreate], [useredit], [actived], [deleted], [parent], [tags], [views], [rating], [code], [url], [price], [quantity], [lang]) VALUES (4, N'Trồng cà rốt củ to đều tăm tắp, nhà nông Cẩm Giàng thu tiền tỷ', N'Trước đây, bà con nông dân xã Đức Chính (Cẩm Giàng, Hải Dương) chuyên trồng lạc, ngô nhưng do hiệu quả kinh tế kém nên đã mạnh dạn chuyển đổi sang trồng cà rốt.', N'<p>Dự &aacute;n trồng c&agrave; rốt an to&agrave;n được người d&acirc;n triển khai từ năm 2007. Đến nay, Đức Ch&iacute;nh đ&atilde; trở th&agrave;nh một trong những vựa c&agrave; rốt sạch lớn nhất miền Bắc, sản phẩm kh&ocirc;ng chỉ ti&ecirc;u thụ nhiều trong nước m&agrave; c&ograve;n xuất khẩu ra nước ngo&agrave;i. Nhờ c&acirc;y c&agrave; rốt, nhiều hộ đ&atilde; trở th&agrave;nh tỷ ph&uacute;.</p>

<p>Để c&oacute; được những củ c&agrave; rốt to đẹp, chất lượng thơm ngon, người d&acirc;n Đức Ch&iacute;nh đ&atilde; ph&aacute;t triển c&aacute;c v&ugrave;ng trồng chuy&ecirc;n canh tập trung, &aacute;p dụng quy tr&igrave;nh chăm s&oacute;c, b&oacute;n ph&acirc;n cẩn thận. B&aacute;o NTNN xin giới thiệu với b&agrave; con một số kỹ thuật trồng c&agrave; rốt của n&ocirc;ng d&acirc;n x&atilde; Đức Ch&iacute;nh.</p>

<p>&nbsp;<img alt="trong ca rot cu to deu tam tap, nha nong cam giang thu tien ty hinh anh 1" src="http://tinnongnghiep.com/upload_images/images/19/01/10/dai-Nghia-doc-suc-nang-tam-tieu-chi-ca-rot-2-1546942752-width500height344.jpg" title="Trồng cà rốt củ to đều tăm tắp, nhà nông Cẩm Giàng thu tiền tỷ hình ảnh 1" /></p>

<p>&nbsp;&nbsp; N&ocirc;ng d&acirc;n x&atilde; Đức Ch&iacute;nh, huyện Cẩm Gi&agrave;ng thu hoạch c&agrave; rốt vụ đ&ocirc;ng.&nbsp; Anh Nguy&ecirc;n</p>

<p><strong>1. Thời vụ gieo trồng:</strong></p>

<p>C&agrave; rốt được gieo trồng từ th&aacute;ng 8 đến đầu th&aacute;ng 2 năm sau; thu hoạch từ th&aacute;ng 11 đến th&aacute;ng 5 năm sau; v&agrave; c&oacute; thể ph&acirc;n ra th&agrave;nh 3 tr&agrave;:</p>

<p>- Tr&agrave; sớm gieo hạt từ: Đầu th&aacute;ng 8-15.10, cho thu hoạch từ th&aacute;ng 11.</p>

<p>- Tr&agrave; ch&iacute;nh vụ gieo hạt từ: 16.10 -15.12, thu hoạch xung quanh tết &acirc;m lịch.</p>

<p>- Tr&agrave; muộn gieo hạt từ: 16.12 đến 30.1 năm sau, thu hoạch đến th&aacute;ng 5.</p>

<p><strong>2. Chọn giống:</strong></p>

<p>C&oacute; rất nhiều giống, tuy nhi&ecirc;n hiện nay n&ocirc;ng d&acirc;n tại 2 x&atilde; Cẩm Văn v&agrave; Đức Ch&iacute;nh (huyện Cẩm Gi&agrave;ng) v&agrave; c&aacute;c v&ugrave;ng phụ cận trồng chủ yếu 2 giống c&agrave; rốt lai l&agrave;: Super VL-444 F1 v&agrave; Ti-103 (Nhật Bản). Giống n&agrave;y c&oacute; thời gian sinh trưởng từ 100-130 ng&agrave;y. Năng suất trung b&igrave;nh đạt 1,5 tấn/s&agrave;o, cao hơn c&oacute; thể đạt 3 tấn/s&agrave;o.</p>

<p><strong>3. Kỹ thuật l&agrave;m đất:</strong></p>

<p>&ndash; N&ecirc;n chọn đất b&atilde;i bồi ven s&ocirc;ng l&agrave; đất thịt nhẹ, đất c&aacute;t pha hoặc đất ph&ugrave; sa để trồng c&agrave; rốt l&agrave; tốt nhất. Đất phải được dọn sạch cỏ dại, sau đ&oacute; c&agrave;y bừa kỹ, phay nhỏ, san phẳng rồi l&ecirc;n luống. Chiều rộng của luống từ: 85-90cm (tr&agrave; sớm) v&agrave; 80-85cm (tr&agrave; ch&iacute;nh vụ v&agrave; tr&agrave; muộn); độ cao từ: 20-25cm; r&atilde;nh rộng từ: 25-30cm.</p>

<p>&ndash; Sau khi san phẳng mặt luống, kẻ 3 h&agrave;ng tr&ecirc;n mặt luống theo chiều dọc v&agrave; s&acirc;u khoảng 5cm, h&agrave;ng c&aacute;ch h&agrave;ng từ 13-15cm. (Nếu gieo bằng m&aacute;y th&igrave; m&aacute;y tự kẻ h&agrave;ng).</p>

<p><strong>4. Ph&acirc;n b&oacute;n:</strong></p>

<p>* Lượng ph&acirc;n b&oacute;n: (xem bảng)</p>

<p>* C&aacute;ch b&oacute;n:</p>

<p>C&acirc;y c&agrave; rốt l&agrave; c&acirc;y lấy củ n&ecirc;n cần b&oacute;n ph&acirc;n sớm, b&oacute;n tập trung v&agrave; b&oacute;n c&acirc;n đối; hạn chế b&oacute;n đạm, nhất l&agrave; b&oacute;n đạm muộn; kh&ocirc;ng n&ecirc;n phun c&aacute;c chất k&iacute;ch th&iacute;ch sinh trưởng. Cụ thể c&aacute;ch b&oacute;n v&agrave; liều lượng b&oacute;n như sau:</p>

<p>- Trộn to&agrave;n bộ ph&acirc;n chuồng ủ mục hoặc ph&acirc;n vi sinh với ph&acirc;n l&acirc;n supe L&acirc;m Thao rồi đem b&oacute;n l&oacute;t bằng c&aacute;ch rắc đều tr&ecirc;n mặt luống, nếu lượng ph&acirc;n &iacute;t c&oacute; thể chỉ rắc theo 3 đường kẻ tr&ecirc;n mặt luống</p>

<p>- B&oacute;n th&uacute;c lần 1 khi c&acirc;y c&oacute; l&aacute; thật (xoay l&aacute;); b&oacute;n th&uacute;c lần 2 sau khi tỉa c&acirc;y sơ bộ (khi c&acirc;y c&oacute; 3-4 l&aacute; thật); b&oacute;n th&uacute;c lần 3 sau khi tỉa định c&acirc;y lần cuối (rễ đ&atilde; ph&aacute;t triển to bằng que đan). B&oacute;n th&uacute;c lần 4 sau khi củ đ&atilde; h&igrave;nh th&agrave;nh (b&oacute;n kali từ: 3-4kg/s&agrave;o), hoặc chỉ b&oacute;n (tưới) dặm những chỗ c&acirc;y c&oacute; biểu hiện thiếu đạm.</p>

<p><strong>5. Chăm s&oacute;c v&agrave; ph&ograve;ng trừ s&acirc;u bệnh:</strong></p>

<p>* Phủ rơm, rạ:</p>

<p>Phủ một lớp rơm, rạ mỏng tr&ecirc;n mặt luống nhằm hạn chế đất bị đ&oacute;ng v&aacute;ng (bề mặt bị lỳ do mưa, tưới); ảnh hưởng đến tỷ lệ nảy mầm đồng thời phủ rơm c&ograve;n c&oacute;&nbsp;t&aacute;c dụng&nbsp;giữ ẩm, hạn chế cỏ dại v&agrave; giữ cho c&acirc;y kh&ocirc;ng bị đổ khi c&ograve;n nhỏ.</p>

<p>* Tưới nước:</p>

<p>- Sau khi phủ rơm, rạ xong n&ecirc;n tưới nhẹ bằng v&ograve;i sen, tưới phun mưa hoặc th&ugrave;ng doa; đảm bảo cho độ ẩm của đất từ 84-90% để cho c&acirc;y mọc đều v&agrave; ph&aacute;t triển tốt. Nếu ruộng c&oacute; tỷ lệ c&aacute;t cao, kết hợp với thời tiết hanh kh&ocirc; th&igrave; phải tưới h&agrave;ng ng&agrave;y. Khi thời tiết c&oacute; mưa nhỏ, mưa ph&ugrave;n th&igrave; kh&ocirc;ng phải tưới.</p>

<p>&ndash; Giai đoạn c&acirc;y con từ 3 l&aacute; đến tỉa định c&acirc;y lần cuối: &Aacute;p dụng phương ph&aacute;p tưới r&atilde;nh (hạn chế tưới ẩm qu&aacute; bề mặt -&gt; củ ngắn).</p>

<p>&ndash; Giai đoạn ph&aacute;t triển củ cho đến trước khi thu hoạch: Duy tr&igrave; độ ẩm đất khoảng từ: 60-75%. Kh&ocirc;ng được tưới r&atilde;nh, kh&ocirc;ng được tưới qu&aacute; ẩm, khi c&oacute; mưa ruộng phải tho&aacute;t nước v&agrave; cũng kh&ocirc;ng được để ruộng qu&aacute; kh&ocirc; (v&igrave; để qu&aacute; kh&ocirc; khi gặp mưa lớn, nước nhiều, ẩm độ cao sẽ g&acirc;y nứt củ).</p>

<p>* Thuốc trừ cỏ:</p>

<p>Sau khi gieo hạt, phủ rơm - rạ, tưới nước từ 1 - 3 ng&agrave;y cho bề mặt đất ổn định mới phun thuốc trừ cỏ. Sử dụng thuốc với liều lượng theo đ&uacute;ng hướng dẫn tr&ecirc;n bao b&igrave; sản phẩm. Đặc biệt lưu &yacute;, khi hạt c&agrave; rốt đ&atilde; mọc th&igrave; kh&ocirc;ng được sử dụng thuốc trừ cỏ nữa.</p>

<p>* Nhổ, tỉa cố định c&acirc;y:</p>

<p>&ndash; Khi c&acirc;y mọc cao 4-5cm cần nhổ tỉa bỏ c&aacute;c c&acirc;y mọc d&agrave;y, kh&ocirc;ng để 2 c&acirc;y c&ugrave;ng 1 hốc, c&acirc;y c&aacute;ch c&acirc;y từ 7-8cm;</p>

<p>&ndash; Khi c&acirc;y cao 7-10 cm, rễ đ&atilde; to bằng que đan... ta tỉa định c&acirc;y lần cuối.</p>

<p>&ndash; Khi tỉa nhổ c&acirc;y kết hợp dọn, nhổ bỏ cỏ dại.</p>

<p>* Ph&ograve;ng trừ s&acirc;u, bệnh</p>

<p>C&acirc;y c&agrave; rốt c&oacute; rất nhiều đối tượng s&acirc;u, bệnh (dịch hại) g&acirc;y hại:</p>

<p>&ndash; Ở giai đoạn đầu, giai đoạn c&acirc;y con, cần ch&uacute; &yacute;: S&acirc;u hại rễ, bệnh lở cổ rễ v&agrave; chuột hại. Ở giai đoạn ph&aacute;t triển th&acirc;n l&aacute;: Thường xuất hiện gi&ograve;i hại l&aacute;, s&acirc;u khoang, s&acirc;u đo xanh, bệnh phấn trắng, bệnh nấm hạch, bệnh sương mai&hellip; Ở giai đoạn ph&aacute;t triển củ cho đến trước khi thu hoạch: Cũng vẫn xuất hiện c&aacute;c đối tượng dịch hại như thời kỳ ph&aacute;t triển th&acirc;n l&aacute; v&agrave; bệnh thối đen, thối kh&ocirc;, thối nhũn. Ở giai đoạn n&agrave;y cần ch&uacute; &yacute; c&aacute;c bệnh về thối củ&hellip;</p>

<p>- Để ph&ograve;ng trừ c&aacute;c đối tượng dịch hại tr&ecirc;n, n&ocirc;ng d&acirc;n n&ecirc;n sử dụng những loại thuốc đặc hiệu, &iacute;t độc, th&acirc;n thiện với m&ocirc;i trường:</p>

<p>+ Đối với gi&ograve;i hại l&aacute; n&ecirc;n sử dụng c&aacute;c loại thuốc c&oacute; hoạt chất l&agrave; Abamectin v&agrave; Cyromazine.</p>

<p>+ Đối với s&acirc;u ăn l&aacute; c&oacute; thể lựa chọn được rất nhiều loại thuốc c&oacute; hoạt chất c&oacute; t&iacute;nh đặc hiệu, &iacute;t độc như c&aacute;c d&ograve;ng thuốc: Sinh học, thảo mộc, vi sinh, ức chế điều h&ograve;a sinh trưởng, dầu kho&aacute;ng&hellip;</p>

<p>+ Đối với nấm bệnh, cần ch&uacute; trọng c&aacute;c biện ph&aacute;p canh t&aacute;c như: Thời vụ, ph&acirc;n b&oacute;n (đạm) v&agrave; độ ẩm. Thuốc n&ecirc;n chọn thuốc c&oacute; độ độc thấp, mang t&iacute;nh đặc hiệu như Valydamycin; Carbenzadim; Difenoconazole&hellip;</p>

<p><strong>6. Thu hoạch:</strong></p>

<p>C&acirc;y c&agrave; rốt c&oacute; thời gian sinh trưởng từ 100-130 ng&agrave;y. Căn cứ v&agrave;o thời vụ v&agrave; nhu cầu ti&ecirc;u thụ tr&ecirc;n thị trường, b&agrave; con tiến h&agrave;nh thu hoạch khi c&agrave; rốt đạt k&iacute;ch cỡ củ trung b&igrave;nh d&agrave;i 18-22cm, đường k&iacute;nh 3-4cm. Sau khi nhổ củ, cắt bỏ dọc, chọn lọc củ kh&ocirc;ng mấu, tật, nứt, thối, thu gom đ&oacute;ng bao v&agrave; ti&ecirc;u thụ. Nếu thời tiết hanh kh&ocirc; c&oacute; thể tưới ẩm trước khi nhổ từ 10-12 tiếng; để đất ẩm rễ nhổ (thu hoạch).</p>

<p>C&acirc;y c&agrave; rốt l&agrave; c&acirc;y trồng kh&ocirc;ng thể thay thế được tại x&atilde; Đức Ch&iacute;nh v&agrave; Cẩm Văn, huyện Cẩm Gi&agrave;ng<a href="http://tinnongnghiep.com/" title="http://tinnongnghiep.com/">.</a>&nbsp;Do đất đai tại địa phương c&oacute; hạn cho n&ecirc;n nhiều gia đ&igrave;nh tại đ&acirc;y phải đi thu&ecirc; đất trồng c&agrave; rốt ở c&aacute;c v&ugrave;ng đất b&atilde;i ven s&ocirc;ng Th&aacute;i B&igrave;nh, Kinh Thầy&hellip; Để tăng hiệu quả kinh tế, giảm chi ph&iacute; n&ecirc;n việc gieo trồng c&agrave; rốt đ&atilde; kh&ocirc;ng ngừng được cải tiến v&agrave; &aacute;p dụng cơ giới h&oacute;a ở tất cả c&aacute;c kh&acirc;u như: L&agrave;m đất, l&ecirc;n luống, gieo hạt, tưới nước&hellip;</p>
', NULL, NULL, NULL, NULL, N'Trồng cà rốt củ to đều tăm tắp, nhà nông Cẩm Giàng thu tiền tỷ', N'Trước đây, bà con nông dân xã Đức Chính (Cẩm Giàng, Hải Dương) chuyên trồng lạc, ngô nhưng do hiệu quả kinh tế kém nên đã mạnh dạn chuyển đổi sang trồng cà rốt.', NULL, N'hinh-anh-1233223.jpg', N'1/12/2019', N'1/12/2019', N'1/12/2019', NULL, NULL, 1, NULL, 5, NULL, NULL, NULL, NULL, N'trong-ca-rot-cu-to-deu-tam-tap-nha-nong-cam-giang-thu-tien-ty', NULL, NULL, NULL)
INSERT [dbo].[news] ([id], [name], [desciption], [content1], [content2], [content3], [content4], [content5], [meta_title], [meta_description], [meta_keywords], [images], [datecreate], [dateend], [dateedit], [usercreate], [useredit], [actived], [deleted], [parent], [tags], [views], [rating], [code], [url], [price], [quantity], [lang]) VALUES (5, N'Xôn xao: Đưa vườn dâu tây 3000m², chín đỏ mọng về ngay giữa Thủ đô', N'Vườn dâu tây có quy mô 3.000m2 tại Nhật Tân (Hà Nội) đang là điểm đến mới mẻ đối với nhiều người dân Thủ đô. Dự kiến vườn dâu này sẽ mở cửa tự do cho khách tham quan trước dịp Tết Nguyên Đán 2019.', N'<p>Những tưởng d&acirc;u t&acirc;y chỉ được trồng ở những địa danh nổi tiếng với kh&iacute; hậu &ocirc;n h&ograve;a như Mộc Ch&acirc;u, Đ&agrave; Lạt... nhưng giờ đ&acirc;y người d&acirc;n Thủ đ&ocirc; cũng c&oacute; thể tham quan v&agrave; mua d&acirc;u tươi ngay tại H&agrave; Nội.</p>

<p>Đến với l&agrave;ng hoa Nhật T&acirc;n, quận T&acirc;y Hồ những ng&agrave;y cận kề Tết Nguy&ecirc;n Đ&aacute;n, nhiều người tỏ ra bất ngờ với một vườn d&acirc;u t&acirc;y&nbsp;quy m&ocirc;, được trồng theo c&ocirc;ng nghệ cao&nbsp;với sum su&ecirc; quả ngọt.</p>

<p>&nbsp;<img alt="xon xao: dua vuon dau tay 3000m², chin do mong ve ngay giua thu do hinh anh 1" src="http://tinnongnghiep.com/upload_images/images/19/01/11/Bat-ngo-voi-vuon-dau-tay-chin-mong-ngay-giua-long-Thu-do-dau-tay14-1547120875-width600height364.jpg" title="Xôn xao: Đưa vườn dâu tây 3000m², chín đỏ mọng về ngay giữa Thủ đô hình ảnh 1" /></p>

<p>Vườn d&acirc;u t&acirc;y c&oacute; diện t&iacute;ch 3000m2 thuộc khu vực&nbsp;b&atilde;i đ&aacute; s&ocirc;ng Hồng (H&agrave; Nội). Ảnh: Nguyễn Quỳnh</p>

<p>Anh Phạm Văn Thiệp, nh&acirc;n vi&ecirc;n chăm s&oacute;c ở vườn d&acirc;u t&acirc;y b&atilde;i đ&aacute; s&ocirc;ng Hồng cho bi&ecirc;́t: &ldquo;Vườn d&acirc;u t&acirc;y rộng 3.000m2&nbsp;trong đ&oacute; c&oacute; khoảng 1.000m2&nbsp;l&agrave; nh&agrave; k&iacute;nh để thử nghiệm chất lượng. D&acirc;u được trồng từ cuối th&aacute;ng 10.2018, sau hơn 2 th&aacute;ng đ&atilde; bắt đầu ch&iacute;n đỏ v&agrave; đang cho thu hoạch lứa đầu&quot;.</p>

<p>Theo anh Thiệp, to&agrave;n bộ d&acirc;u t&acirc;y được trồng ở đ&acirc;y l&agrave; giống d&acirc;u t&acirc;y Nhật Bản, được vận chuyển từ ph&ograve;ng nu&ocirc;i cấy tr&ecirc;n M&ocirc;̣c Ch&acirc;u (Sơn La) về. D&acirc;u th&iacute;ch ứng tốt với m&ugrave;a đ&ocirc;ng H&agrave; Nội, chất lượng quả kh&aacute; đồng đều cả ở trong nh&agrave; k&iacute;nh lẫn ngo&agrave;i trời. Tuy nhi&ecirc;n, những c&acirc;y d&acirc;u t&acirc;y được trồng trong nh&agrave; k&iacute;nh th&igrave; vượt trội hơn về k&iacute;ch thước&nbsp;v&agrave; c&oacute; khả năng kh&aacute;ng bệnh cao hơn.</p>

<p>Anh Vũ Văn Lực - chủ trang trại d&acirc;u t&acirc;y cho biết: &quot;Trước khi đầu tư l&agrave;m vườn d&acirc;u ở H&agrave; Nội ch&uacute;ng t&ocirc;i đ&atilde; c&oacute;&nbsp;2 vườn d&acirc;u t&acirc;y&nbsp;được trồng theo ti&ecirc;u chuẩn VietGAP tại Mộc Ch&acirc;u&nbsp;thu h&uacute;t đ&ocirc;ng đảo kh&aacute;ch du lịch. Ch&iacute;nh v&igrave; vậy, vườn d&acirc;u thứ 3 tại H&agrave; Nội&nbsp;mặc d&ugrave; chưa ho&agrave;n thiện&nbsp;nhưng đ&atilde; rất nhiều người biết v&agrave; t&igrave;m&nbsp;đến&quot;.</p>

<p>&nbsp;<img alt="xon xao: dua vuon dau tay 3000m², chin do mong ve ngay giua thu do hinh anh 2" src="http://tinnongnghiep.com/upload_images/images/19/01/11/Bat-ngo-voi-vuon-dau-tay-chin-mong-ngay-giua-long-Thu-do-dau-tay-1547133447-width600height400.jpg" title="Xôn xao: Đưa vườn dâu tây 3000m², chín đỏ mọng về ngay giữa Thủ đô hình ảnh 2" /></p>

<p>Theo anh Vũ Văn Lực, vườn d&acirc;u t&acirc;y của anh&nbsp;l&agrave; vườn&nbsp;d&acirc;u VietGAP c&oacute; quy m&ocirc; lớn nhất Mộc Ch&acirc;u v&agrave; khu vực ph&iacute;a Bắc ở thời điểm hiện tại&nbsp;. Ảnh: NVCC</p>

<p>Theo anh Lực, d&acirc;u t&acirc;y th&iacute;ch hợp với kh&iacute; hậu &ocirc;n đới n&ecirc;n ho&agrave;n to&agrave;n c&oacute; thể th&iacute;ch ứng với m&ugrave;a đ&ocirc;ng H&agrave; Nội. Bắt đầu từ th&aacute;ng 10, khi tiết thu m&aacute;t mẻ l&agrave; c&oacute; thể tiến h&agrave;nh trồng.</p>

<p>D&acirc;u sẽ được trồng&quot;gối&quot; nhau&nbsp;li&ecirc;n tục, mỗi đợt c&aacute;ch nhau khoảng 2 tuần đến 1 th&aacute;ng&nbsp;để đảm bảo lu&ocirc;n c&oacute; quả ch&iacute;n phục vụ nhu cầu tham quan, chụp ảnh của mọi người.</p>

<p>Ngo&agrave;i việc giới thiệu với người d&acirc;n Thủ đ&ocirc; về loại quả &ocirc;n đới thơm ngon, trang trại c&ograve;n cung cấp th&ecirc;m c&acirc;y giống v&agrave; chuyển giao c&ocirc;ng nghệ trồng d&acirc;u t&acirc;y cho du kh&aacute;ch c&oacute; nhu cầu trồng tại nh&agrave;. Những c&acirc;y d&acirc;u t&acirc;y&nbsp;trưởng th&agrave;nh được b&aacute;n tại vườn với gi&aacute; 40.000 đồng, kh&aacute;ch h&agrave;ng sẽ được hỗ trợ kiến thức kỹ thuật&nbsp;để c&oacute; thể&nbsp;chăm s&oacute;c c&acirc;y&nbsp;tốt nhất.</p>

<p>Trước mắt, trang trại d&acirc;u t&acirc;y tại Nhật T&acirc;n mới dừng lại ở diện t&iacute;ch 3.000m2. Thời gian&nbsp;tới, trang trại sẽ mở rộng diện t&iacute;ch th&ecirc;m 1ha, đồng thời đưa đ&agrave;n b&ograve; sữa Mộc Ch&acirc;u về nu&ocirc;i tại đ&acirc;y v&agrave;o giữa năm 2019.</p>

<p>&quot;Mong muốn của ch&uacute;ng t&ocirc;i l&agrave; h&igrave;nh&nbsp;th&agrave;nh n&ecirc;n một hệ sinh th&aacute;i, nơi m&agrave; mọi người&nbsp;c&oacute; thể&nbsp;tham quan v&agrave; mua n&ocirc;ng sản sạch ngay tại H&agrave; Nội&rdquo;, anh Lực cho hay.</p>

<p>&nbsp;<img alt="xon xao: dua vuon dau tay 3000m², chin do mong ve ngay giua thu do hinh anh 3" src="http://tinnongnghiep.com/upload_images/images/19/01/11/Bat-ngo-voi-vuon-dau-tay-chin-mong-ngay-giua-long-Thu-do-dau-tay2-1547120875-width600height403.jpg" title="Xôn xao: Đưa vườn dâu tây 3000m², chín đỏ mọng về ngay giữa Thủ đô hình ảnh 3" /></p>

<p>Khu vực d&acirc;u t&acirc;y trồng trong nh&agrave; k&iacute;nh&nbsp;c&oacute; diện t&iacute;ch khoảng 1000m2. Ảnh: Nguyễn Quỳnh</p>

<p>&nbsp;<img alt="xon xao: dua vuon dau tay 3000m², chin do mong ve ngay giua thu do hinh anh 4" src="http://tinnongnghiep.com/upload_images/images/19/01/11/Bat-ngo-voi-vuon-dau-tay-chin-mong-ngay-giua-long-Thu-do-dau-tay13-1547120875-width600height378.jpg" title="Xôn xao: Đưa vườn dâu tây 3000m², chín đỏ mọng về ngay giữa Thủ đô hình ảnh 4" /></p>

<p>Vườn d&acirc;u t&acirc;y&nbsp;ngo&agrave;i trời được phủ bạt dưới gốc nhằm ngăn c&aacute;c loại nấm, vi khuẩn g&acirc;y hại cho quả v&agrave; cỏ dại.&nbsp;Ảnh: Nguyễn Quỳnh</p>

<p>&nbsp;<img alt="xon xao: dua vuon dau tay 3000m², chin do mong ve ngay giua thu do hinh anh 5" src="http://tinnongnghiep.com/upload_images/images/19/01/11/Bat-ngo-voi-vuon-dau-tay-chin-mong-ngay-giua-long-Thu-do-dau-tay1-1547120875-width600height403.jpg" title="Xôn xao: Đưa vườn dâu tây 3000m², chín đỏ mọng về ngay giữa Thủ đô hình ảnh 5" /></p>

<p>To&agrave;n bộ d&acirc;u t&acirc;y của trang trại l&agrave; giống d&acirc;u Nhật Bản, c&oacute; vị ngọt thanh v&agrave; chua nhẹ.&nbsp;Ảnh: Nguyễn Quỳnh&nbsp;</p>

<p>Ngo&agrave;i diện t&iacute;ch d&acirc;u đang ch&iacute;n, ở một khu vực kh&aacute;c c&acirc;y mới đang ra hoa. Theo nh&acirc;n vi&ecirc;n chăm s&oacute;c, d&acirc;u t&acirc;y của trang trại được trồng c&aacute;ch nhau khoảng 1 th&aacute;ng&nbsp;đ&ecirc;̉ phục vụ nhu c&acirc;̀u tham quan, chụp ảnh của du kh&aacute;ch.&nbsp;Ảnh: Nguyễn Quỳnh&nbsp;</p>

<p>D&acirc;u t&acirc;y ra quả quanh năm&nbsp;nhưng từ th&aacute;ng 10&nbsp;đến th&aacute;ng 4&nbsp;h&agrave;ng năm sẽ cho năng suất cao nhất. Ảnh: Nguyễn Quỳnh</p>

<p>&nbsp;<img alt="xon xao: dua vuon dau tay 3000m², chin do mong ve ngay giua thu do hinh anh 8" src="http://tinnongnghiep.com/upload_images/images/19/01/11/Bat-ngo-voi-vuon-dau-tay-chin-mong-ngay-giua-long-Thu-do-dau-tay4-1547120875-width600height403.jpg" title="Xôn xao: Đưa vườn dâu tây 3000m², chín đỏ mọng về ngay giữa Thủ đô hình ảnh 8" /></p>

<p>D&ugrave; chưa mở cửa đ&oacute;n ch&iacute;nh thức nhưng đ&atilde; c&oacute; nhiều kh&aacute;ch biết đến, gh&eacute; qua mua&nbsp;c&acirc;y d&acirc;u t&acirc;y về trồng.&nbsp;Ảnh: Nguyễn Quỳnh</p>

<p>&nbsp;<img alt="xon xao: dua vuon dau tay 3000m², chin do mong ve ngay giua thu do hinh anh 9" src="http://tinnongnghiep.com/upload_images/images/19/01/11/Bat-ngo-voi-vuon-dau-tay-chin-mong-ngay-giua-long-Thu-do-dau-tay10-1547120875-width600height403.jpg" title="Xôn xao: Đưa vườn dâu tây 3000m², chín đỏ mọng về ngay giữa Thủ đô hình ảnh 9" /></p>

<p>Bạn Trần Tr&acirc;m Anh (Cầu Giấy) cho biết: M&igrave;nh đ&atilde; từng gh&eacute; thăm trang trại d&acirc;u t&acirc;y n&agrave;y đợt đi du lịch Mộc Ch&acirc;u, giờ nghe n&oacute;i ngay tại H&agrave; Nội cũng c&oacute; n&ecirc;n kh&ocirc;ng chần chừ &quot;phi&quot; ngay qua đ&acirc;y check in v&agrave; mua quả về thưởng thức. Ảnh: Nguyễn Quỳnh&nbsp;</p>

<p>&nbsp;<img alt="xon xao: dua vuon dau tay 3000m², chin do mong ve ngay giua thu do hinh anh 11" src="http://tinnongnghiep.com/upload_images/images/19/01/11/Bat-ngo-voi-vuon-dau-tay-chin-mong-ngay-giua-long-Thu-do-dau-tay9-1547120875-width600height403.jpg" title="Xôn xao: Đưa vườn dâu tây 3000m², chín đỏ mọng về ngay giữa Thủ đô hình ảnh 11" /></p>

<p>Hai bạn trẻ B&ugrave;i Thị&nbsp;Hằng v&agrave; Trần Tr&acirc;m Anh th&iacute;ch th&uacute; chụp ảnh trong vườn d&acirc;u t&acirc;y.&nbsp;Ảnh: Nguyễn Quỳnh</p>

<p>&nbsp;</p>

<p>&nbsp;<img alt="xon xao: dua vuon dau tay 3000m², chin do mong ve ngay giua thu do hinh anh 13" src="http://tinnongnghiep.com/upload_images/images/19/01/11/Bat-ngo-voi-vuon-dau-tay-chin-mong-ngay-giua-long-Thu-do-dau-tay6-1547120875-width600height403.jpg" title="Xôn xao: Đưa vườn dâu tây 3000m², chín đỏ mọng về ngay giữa Thủ đô hình ảnh 13" /></p>

<p>Kh&ocirc;ng chỉ tham quan chụp ảnh, du kh&aacute;ch c&ograve;n được h&aacute;i d&acirc;u mang về với gi&aacute; từ&nbsp;300.000 - 350.000 đồng/kg. Ảnh: Nguyễn Quỳnh</p>

<p>Anh Vũ Văn Lực cho biết, hiện vườn d&acirc;u t&acirc;y đang gấp r&uacute;t ho&agrave;n thiện v&agrave; sẽ mở cửa tự do đ&oacute;n kh&aacute;ch trước Tết &Acirc;m lịch 2019.&nbsp;Ảnh: Nguyễn Quỳnh</p>
', NULL, NULL, NULL, NULL, N'Xôn xao: Đưa vườn dâu tây 3000m², chín đỏ mọng về ngay giữa Thủ đô', N'Vườn dâu tây có quy mô 3.000m2 tại Nhật Tân (Hà Nội) đang là điểm đến mới mẻ đối với nhiều người dân Thủ đô. Dự kiến vườn dâu này sẽ mở cửa tự do cho khách tham quan trước dịp Tết Nguyên Đán 2019.', NULL, N'xon-xao-12313.jpg', N'1/12/2019', N'1/12/2019', N'1/12/2019', NULL, NULL, 1, NULL, 5, NULL, NULL, NULL, NULL, N'xon-xao-dua-vuon-dau-tay-3000m²-chin-do-mong-ve-ngay-giua-thu-do', NULL, NULL, NULL)
INSERT [dbo].[news] ([id], [name], [desciption], [content1], [content2], [content3], [content4], [content5], [meta_title], [meta_description], [meta_keywords], [images], [datecreate], [dateend], [dateedit], [usercreate], [useredit], [actived], [deleted], [parent], [tags], [views], [rating], [code], [url], [price], [quantity], [lang]) VALUES (6, N'Kỹ thuật trồng cây cam xoàn năng suất thu hoạch cao', N'Cam xoàn là giống cam có hiệu quả kinh tế cao được trồng nhiều ở Cần Thơ, các tỉnh ĐBSCL. Nếu áp dụng đúng kỹ thuật trồng cam xoàn dưới đây, cây sẽ phát triển mạnh và có khả năng thích nghi rất tốt với điều kiện đất, khí hậu vùng cao.', N'<h2><strong>Đặc t&iacute;nh v&agrave; thời vụ trồng c&acirc;y cam xo&agrave;n</strong></h2>

<p>Cam xo&agrave;n l&agrave; giống&nbsp;<strong>c&acirc;y ăn quả</strong>&nbsp;c&oacute; chiều cao l&ecirc;n tới 5m nhưng để thuận tiện cho qu&aacute; tr&igrave;nh chăm s&oacute;c v&agrave; sau n&agrave;y thu hoạch th&igrave; b&agrave; con cũng c&oacute; thể khống chế chiều cao của ch&uacute;ng xuống khoảng dưới 3m với t&aacute;n rộng. Cam xo&agrave;n c&oacute; vỏ m&agrave;u xanh khi ch&iacute;n m&agrave;u v&agrave;ng chanh, t&eacute;p m&agrave;u v&agrave;ng nhạt, vị ngọt đậm đ&agrave; c&ugrave;ng m&ugrave;i thơm hấp dẫn. Một quả cam xo&agrave;n b&igrave;nh qu&acirc;n nặng khoảng 300g.</p>

<p>Thời vụ trồng cam xo&agrave;n th&iacute;ch hợp nhất l&agrave; v&agrave;o đầu xu&acirc;n hoặc đầu thu. Nếu l&agrave;m đ&uacute;ng kỹ thuật trồng, c&acirc;y cam xo&agrave;n c&oacute; thể cho thu hoạch sau khoảng 30 th&aacute;ng kể từ khi trồng. Dưới đ&acirc;y l&agrave; những kỹ thuật trồng cam xo&agrave;n để b&agrave; con tham khảo.</p>

<h2><strong>Kỹ thuật trồng cam xo&agrave;n</strong></h2>

<h3><strong>1. Chuẩn bị giống cam xo&agrave;n</strong></h3>

<p>Kh&acirc;u chọn giống l&agrave; hết sức quan trọng, b&agrave; con n&ecirc;n lựa chọn loại giống cam xo&agrave;n khỏe mạnh tr&aacute;nh bị bệnh v&agrave;ng l&aacute; hay bệnh Tristeza. Hiện nay, cam xo&agrave;n thường được nh&acirc;n giống bằng phương ph&aacute;p chiết hoặc gh&eacute;p nhưng phương ph&aacute;p tối ưu nhất l&agrave; c&acirc;y gh&eacute;p tr&ecirc;n gốc Voka hoặc gốc cam mật để c&oacute; khả năng sinh trưởng nhanh, tuổi thọ d&agrave;i nhất.</p>

<p><img alt="kỹ thuật trồng cây cam xoàn" src="http://tinnongnghiep.com/upload_images/images/2018/06/ky-thuat-trong-cam-xoan-3.jpg" /></p>

<h3><strong>2. Chuẩn bị đất trồng cam xo&agrave;n</strong></h3>

<p>Trước ti&ecirc;n cần lựa chọn mật độ trồng cam xo&agrave;n hợp l&yacute; l&agrave; cự ly 3x3.5m/c&acirc;y. Theo&nbsp;<strong>kỹ thuật trồng cam xo&agrave;n</strong>, b&agrave; con n&ecirc;n kh&ocirc;ng chế chiều cao để c&acirc;y kh&ocirc;ng vượt qu&aacute; tầm nhằm dễ d&agrave;ng chăm s&oacute;c v&agrave; thu hoạch.</p>

<p>Đối với địa phương c&oacute; v&ugrave;ng đất trũng, đất b&atilde;i bồi ven s&ocirc;ng cần l&ecirc;n liếp cao chống ngập &uacute;ng. B&agrave; con l&agrave;m đ&ecirc; bao, chủ động nguồn nước. Mỗi m&ocirc; b&oacute;n l&oacute;t 0.5 đến 1kg v&ocirc;i bột, 0.5kg l&acirc;n v&agrave; 10kg ph&acirc;n&nbsp;<strong>chăn nu&ocirc;i</strong>&nbsp;hữu cơ hoai mục. Đối với địa phương c&oacute; v&ugrave;ng đất cao r&aacute;o c&oacute; thể l&agrave;m hốc trồng rộng 50cm.</p>

<h3><strong>3. C&aacute;ch trồng cam xo&agrave;n</strong></h3>

<p>B&agrave; con đ&agrave;o sẵn 1 hốc nhỏ giữa m&ocirc;, đặt bầu rễ c&acirc;y giống (rạch bỏ t&uacute;i nilon bao nếu c&oacute;) v&agrave;o vị tr&iacute; trung t&acirc;m. Giữ thẳng c&acirc;y giống v&agrave; lấp đất l&egrave;n chặt sau đ&oacute; d&ugrave;ng cọc tre để giữ cố định th&acirc;n c&acirc;y.</p>

<p><img alt="cách trồng cam xoàn" src="http://tinnongnghiep.com/upload_images/images/2018/06/ky-thuat-trong-cam-xoan-1.jpg" /></p>

<h2><strong>Những lưu &yacute; khi chăm s&oacute;c c&acirc;y cam xo&agrave;n</strong></h2>

<p>Ngo&agrave;i những kỹ thuật trồng c&acirc;y cam xo&agrave;n, trong qu&aacute; tr&igrave;nh chăm s&oacute;c b&agrave; con cũng cần lưu &yacute; một số vấn đề sau:</p>

<p>- Để giảm cường độ &aacute;nh s&aacute;ng khi mới trồng, n&ecirc;n trồng xen c&acirc;y họ đậu vừa gi&uacute;p hạn chế gi&oacute; mạnh vừa tạo b&oacute;ng r&acirc;m cho vườn cam xo&agrave;n.</p>

<p>- V&agrave;o m&ugrave;a kh&ocirc; cần phải tủ gốc giữ ẩm cho đất, người ta thường trồng cỏ cao từ 30 đến 40cm để hạn chế &aacute;nh nắng gắt v&agrave;o m&ugrave;a kh&ocirc; giảm tho&aacute;t nước giữ được t&igrave;nh trạng đất ẩm.</p>

<p>- Tỉa bớt c&agrave;nh vượt, c&agrave;nh s&acirc;u bệnh để c&acirc;y th&ocirc;ng tho&aacute;ng, t&aacute;n đẹp ra sai quả hơn.</p>

<p>- V&agrave;o thời kỳ b&oacute;n th&uacute;c ph&acirc;n b&oacute;n cần kết hợp bồi th&ecirc;m b&ugrave;n, đất d&agrave;y 2-3cm quanh gốc c&acirc;y<a href="http://tinnongnghiep.com/" title="http://tinnongnghiep.com/">.</a></p>
', NULL, NULL, NULL, NULL, N'Kỹ thuật trồng cây cam xoàn năng suất thu hoạch cao', N'Cam xoàn là giống cam có hiệu quả kinh tế cao được trồng nhiều ở Cần Thơ, các tỉnh ĐBSCL. Nếu áp dụng đúng kỹ thuật trồng cam xoàn dưới đây, cây sẽ phát triển mạnh và có khả năng thích nghi rất tốt với điều kiện đất, khí hậu vùng cao.', NULL, N'ky-thuat-trong-cam-xoan-2.jpg', N'1/12/2019', N'1/12/2019', N'1/12/2019', NULL, NULL, 1, NULL, 8, NULL, NULL, NULL, NULL, N'ky-thuat-trong-cay-cam-xoan-nang-suat-thu-hoach-cao', NULL, NULL, NULL)
INSERT [dbo].[news] ([id], [name], [desciption], [content1], [content2], [content3], [content4], [content5], [meta_title], [meta_description], [meta_keywords], [images], [datecreate], [dateend], [dateedit], [usercreate], [useredit], [actived], [deleted], [parent], [tags], [views], [rating], [code], [url], [price], [quantity], [lang]) VALUES (7, N'Kỹ thuật trồng cà phê xanh lùn năng suất cao ở Tây Nguyên', N'Cà phê xanh lùn là một loại giống cà phê năng suất cao vượt trột so với tất cả các loại giống hiện có trên thị trường. Tìm hiểu kỹ thuật trồng cà phê xanh lùn cùng Tin Nông Nghiệp nhé.', N'<p>Tr&ecirc;n thị trường c&oacute; rất nhiều loại c&agrave; ph&ecirc; quen thuộc với người&nbsp;ti&ecirc;u d&ugrave;ng: c&agrave; ph&ecirc; vối TR4, c&agrave; ph&ecirc; Thiện Trường, c&agrave; ph&ecirc; xo&agrave;i... Tuy nhi&ecirc;n, c&agrave; ph&ecirc; xanh l&ugrave;n l&agrave; giống c&agrave; ph&ecirc; mặc d&ugrave; chưa phổ biến nhất nhưng lại đang l&agrave; giống c&agrave; ph&ecirc; năng suất cao nhất hiện nay.</p>

<p>C&agrave; ph&ecirc; xanh l&ugrave;n c&ograve;n được gọi với c&aacute;i t&ecirc;n l&agrave; c&agrave; ph&ecirc; Trường Sơn TS5. Nếu &aacute;p dụng đ&uacute;ng&nbsp;<strong>kỹ thuật trồng c&agrave; ph&ecirc; xanh l&ugrave;n</strong>&nbsp;c&oacute; thể cho mức năng suất đạt 10 tấn/ha gấp đ&ocirc;i so với năng suất trồng c&aacute;c loại giống c&agrave; ph&ecirc; kh&aacute;c.</p>

<h2><strong>Kỹ thuật trồng c&agrave; ph&ecirc; xanh l&ugrave;n</strong></h2>

<p>Tương tự kỹ thuật trồng c&agrave; ph&ecirc; ở T&acirc;y Nguy&ecirc;n,&nbsp;<strong>c&aacute;ch trồng c&agrave; ph&ecirc; xanh l&ugrave;n</strong>&nbsp;cũng bao gồm c&aacute;c kỹ thuật: chọn đất, chuẩn bị đất trồng, thiết kế vườn c&acirc;y, đ&agrave;o hố, trộn ph&acirc;n, trồng c&acirc;y đ&uacute;ng khoảng c&aacute;ch mật đột v&agrave; quy tr&igrave;nh chăm s&oacute;c c&agrave; ph&ecirc; xanh l&ugrave;n...</p>

<h3><strong>1. Đất trồng c&agrave; ph&ecirc; xanh l&ugrave;n</strong></h3>

<p>Loại đất th&iacute;ch hợp nhất để trồng c&agrave; ph&ecirc; xanh l&ugrave;n l&agrave; loại đất tơi xốp, tầng đất d&agrave;y, gi&agrave;u dinh dưỡng v&agrave; dễ tho&aacute;t nước. Trong trường hợp trước đ&oacute; l&agrave; 1 kỳ trồng c&agrave; ph&ecirc; xanh l&ugrave;n rồi th&igrave; b&agrave; con cần cải tạo kỹ lưỡng, cung cấp chất đất sạch, mới để sử dụng. Đặc biệt lưu &yacute; b&agrave; con kh&ocirc;ng n&ecirc;n trồng c&agrave; ph&ecirc; xanh l&ugrave;n ngay sau 1 kỳ trồng c&agrave; ph&ecirc; trước nếu kỳ trước c&acirc;y bị thối rễ, thay v&agrave;o đ&oacute; h&atilde;y lu&acirc;n canh một vụ với c&acirc;y trồng kh&aacute;c rồi mới đưa c&agrave; ph&ecirc; xanh l&ugrave;n mới v&agrave;o trồng.</p>

<p><img alt="kỹ thuật trồng cà phê" src="http://tinnongnghiep.com/upload_images/images/2018/05/ky-thuat-trong-ca-phe-xanh-lun-4.jpg" /></p>

<p>Sau khi đ&atilde; chọn được đất trồng c&agrave; ph&ecirc; xanh l&ugrave;n tốt, b&agrave; con tiến h&agrave;nh đ&agrave;o hố rộng 40cm, s&acirc;u 50cm. Trộn đều đất vừa đ&agrave;o với 10kg ph&acirc;n hữu cơ&nbsp;<strong>chăn nu&ocirc;i</strong>&nbsp;hoai mục v&agrave; 0.5kg l&acirc;n rồi lấp xuống hố. Tưới nước ẩm h&agrave;ng ng&agrave;y để đất sau khoảng 1 &ndash; 2 th&aacute;ng mới tiến h&agrave;nh trồng c&agrave; ph&ecirc; xanh l&ugrave;n.</p>

<h3><strong>2. Kỹ thuật thiết kế vườn c&agrave; ph&ecirc; xanh l&ugrave;n</strong></h3>

<p>Trong c&aacute;c kỹ thuật trồng c&agrave; ph&ecirc; năng suất cao th&igrave; vườn c&acirc;y được thiết kế như thế n&agrave;o cũng đ&oacute;ng vai tr&ograve; hết sức quan trọng.&nbsp;<strong>Kỹ thuật trồng c&agrave; ph&ecirc; xanh l&ugrave;n</strong>&nbsp;cũng cần đảm bảo một số y&ecirc;u cầu về thiết kế vườn c&acirc;y như sau:</p>

<ul>
	<li>Đảm bảo chống x&oacute;i m&ograve;n v&agrave;o m&ugrave;a mưa b&atilde;o.</li>
	<li>Đủ trang thiết bị bảo vệ c&acirc;y c&agrave; ph&ecirc; chống lại c&aacute;c yếu tố g&acirc;y bất lợi từ m&ocirc;i trường, kh&iacute; hậu, thời tiết.</li>
	<li>C&aacute;c hoạt động chăm s&oacute;c v&agrave; vận chuyển cần được cơ giới h&oacute;a.</li>
	<li>Thiết kế vườn th&agrave;nh từng l&ocirc; lớn, mỗi l&ocirc; lớn dưới 20ha trong đ&oacute; cạnh d&agrave;i của những l&ocirc; lớn song song với đường đồng mức. Trong mỗi l&ocirc; lớn lại chia th&agrave;nh những l&ocirc; nhỏ (1ha) để tiện chăm s&oacute;c v&agrave; quản l&yacute;.</li>
	<li>Xung quanh c&aacute;c l&ocirc; lớn l&agrave; đai rừng v&agrave; v&agrave; đường vận chuyển ch&iacute;nh rộng từ 7 &ndash; 8m, đường phụ giữa c&aacute;c l&ocirc; rộng khoảng 5m.</li>
	<li>Trong trường hợp c&agrave; ph&ecirc; xanh l&ugrave;n trồng tr&ecirc;n vườn diện t&iacute;ch nhỏ th&igrave; b&agrave; con kh&ocirc;ng cần thiết phải ph&acirc;n l&ocirc; cũng được nhưng vẫn phải trồng theo đường đồng mức.</li>
</ul>

<h3><strong>3. C&aacute;ch trồng c&agrave; ph&ecirc; xanh l&ugrave;n</strong></h3>

<p>C&agrave; ph&ecirc; xanh l&ugrave;n th&iacute;ch hợp trồng nhất v&agrave;o đầu m&ugrave;a mưa để đảm bảo đủ lượng nước cần thiết m&agrave; kh&ocirc;ng tốn c&ocirc;ng đưa nước v&agrave;o vườn. Mật độ trồng th&iacute;ch hợp nhất l&agrave; khoảng 1.330 c&acirc;y/ha, mỗi c&acirc;y trồng 1 hố.</p>

<p><img alt="trồng cà phê xanh lùn" src="http://tinnongnghiep.com/upload_images/images/2018/05/ky-thuat-trong-ca-phe-xanh-lun-3.jpg" /></p>

<p>D&ugrave;ng cuốc mổ lỗ giữa hố trồng rộng 15cm, s&acirc;u 25cm. X&eacute; nilon ở bầu c&acirc;y giống rồi đặt nhẹ nh&agrave;ng v&agrave;o giữa, giữ vị tr&iacute; thẳng đứng lấp đất ngang mặt bầu v&agrave; n&egrave;n chặt bằng tay. Trồng xong đ&aacute;nh bồn xung quanh hố trồng, ủ rơm rạ quanh gốc d&agrave;y 20cm, c&aacute;ch gốc 20cm rồi phủ lớp đất mềm l&ecirc;n tr&ecirc;n. Phun thuốc trừ s&acirc;u chống mối loại Confidor 100SL.</p>

<p>V&agrave;o m&ugrave;a mưa c&oacute; thể kh&ocirc;ng cần che t&uacute;p nhưng v&agrave;o m&ugrave;a nắng phải tiến h&agrave;nh che t&uacute;p xung quanh chống gi&oacute;, chống r&eacute;t.</p>

<h3><strong>4. Chăm s&oacute;c c&agrave; ph&ecirc; xanh l&ugrave;n</strong></h3>

<p>Chăm s&oacute;c đ&uacute;ng c&aacute;ch cũng l&agrave; yếu tố quan trọng trong&nbsp;<strong>kỹ thuật trồng c&agrave; ph&ecirc; xanh l&ugrave;n</strong>. Th&ocirc;ng thường sau khoảng nửa th&aacute;ng c&acirc;y c&agrave; ph&ecirc; c&oacute; thể bị chột hoặc chết mất một số c&acirc;y n&ecirc;n b&agrave; con ch&uacute; &yacute; để trồng dặm bổ sung kịp thời. Kỹ thuật trồng dặm cũng tương tự c&aacute;ch trồng c&agrave; ph&ecirc; xanh l&ugrave;n mới nhưng qu&aacute; tr&igrave;nh trồng dặm phải kết th&uacute;c trước khi hết m&ugrave;a mưa 1.5 đến 2 th&aacute;ng nếu kh&ocirc;ng sau đ&oacute; chăm s&oacute;c sẽ rất vất vả.</p>

<p>Thường xuy&ecirc;n loại bỏ cỏ dại để c&acirc;y kh&ocirc;ng bị cỏ ăn hết dinh dưỡng, c&oacute; thể sử dụng thuốc h&oacute;a học để diệt một số loại cỏ kh&oacute; l&agrave;m thủ c&ocirc;ng như cỏ gấu, cỏ tranh... Ngo&agrave;i ra, b&agrave; con cũng ch&uacute; &yacute; tủ gốc thường xuy&ecirc;n vừa giảm c&ocirc;ng l&agrave;m cỏ lại vừa giữ được nước, điều h&ograve;a độ ẩm, độ tơi xốp cho đất.</p>

<p><img alt="cách trồng cà phê xanh lùn" src="http://tinnongnghiep.com/upload_images/images/2018/05/ky-thuat-trong-ca-phe-xanh-lun-2.jpg" /></p>

<h3><strong>5. Chế độ b&oacute;n ph&acirc;n cho c&agrave; ph&ecirc; xanh l&ugrave;n</strong></h3>

<p>Để đảm bảo đ&uacute;ng&nbsp;<strong>kỹ thuật trồng c&agrave; ph&ecirc; xanh l&ugrave;n</strong>, mỗi năm b&agrave; con b&oacute;n ph&acirc;n hữu cơ 1 lần ngay sau vụ thu hoạch. &Aacute;p dụng lượng b&oacute;n khoảng 5 đến 10kg cho mỗi gốc, kết hợp với 0.5kg ph&acirc;n l&acirc;n.</p>

<p>Lưu &yacute; kh&ocirc;ng b&oacute;n trực tiếp v&agrave;o gốc c&acirc;y m&agrave; b&oacute;n c&aacute;ch gốc khoảng 30cm. Đ&agrave;o r&atilde;nh rộng 20cm, s&acirc;u 20cm xung quanh gốc c&acirc;y rồi b&oacute;n ph&acirc;n v&agrave;o, lấp đất che phủ. Trước mỗi lần b&oacute;n ph&acirc;n cần l&agrave;m cỏ sạch sẽ để dinh dưỡng kh&ocirc;ng bị cỏ hấp thụ hết.</p>

<p>Tr&ecirc;n đ&acirc;y l&agrave; những&nbsp;<strong><em>Kỹ thuật trồng c&agrave; ph&ecirc; xanh l&ugrave;n năng suất cao ở T&acirc;y Nguy&ecirc;n&nbsp;</em></strong>b&agrave; con c&oacute; thể &aacute;p dụng v&agrave;o m&ocirc; h&igrave;nh vườn c&acirc;y tại trang trại. Ch&uacute;c c&aacute;c&nbsp;<strong>nh&agrave; n&ocirc;ng l&agrave;m gi&agrave;u</strong>&nbsp;th&agrave;nh c&ocirc;ng.</p>
', NULL, NULL, NULL, NULL, N'Kỹ thuật trồng cà phê xanh lùn năng suất cao ở Tây Nguyên', N'Cà phê xanh lùn là một loại giống cà phê năng suất cao vượt trột so với tất cả các loại giống hiện có trên thị trường. Tìm hiểu kỹ thuật trồng cà phê xanh lùn cùng Tin Nông Nghiệp nhé.', NULL, N'ky-thuat-trong-ca-phe-xanh-lun-1.jpg', N'1/12/2019', N'1/12/2019', N'1/12/2019', NULL, NULL, 1, NULL, 8, NULL, NULL, NULL, NULL, N'ky-thuat-trong-ca-phe-xanh-lun-nang-suat-cao-o-tay-nguyen', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[news] OFF
SET IDENTITY_INSERT [dbo].[news_category] ON 

INSERT [dbo].[news_category] ([id], [name], [desciption], [content1], [content2], [content3], [content4], [content5], [meta_title], [meta_description], [meta_keywords], [images], [datecreate], [dateedit], [usercreate], [useredit], [actived], [deleted], [parent], [tags], [views], [rating], [code], [url], [price], [quantity], [lang]) VALUES (2, N'Giới Thiệu', N'<p style="text-align:justify"><span style="font-size:12pt"><span style="background-color:white"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="background-color:white"><span style="font-family:Roboto"><span style="color:black">Được th&agrave;nh lập từ năm 2011, </span></span></span><span style="background-color:white"><span style="font-family:Roboto"><span style="color:black">C&ocirc;ng ty cổ phần ph&acirc;n b&oacute;n quốc tế đ&atilde; kh&ocirc;ng ngừng nghi&ecirc;n cứu, cải tiến c&ocirc;ng nghệ, thiết bị, ph&aacute;t triển sản phẩm, mở rộng thị trường đồng thời cũng x&acirc;y dựng một đội ngũ </span></span></span><span style="background-color:white"><span style="font-family:Roboto"><span style="color:black">Khoa học v&agrave; Kĩ thuật quy tụ c&aacute;c Gi&aacute;o sư, Tiến sĩ đầu ngh&agrave;nh về n&ocirc;ng nghiệp, </span></span></span><span style="background-color:white"><span style="font-family:Roboto"><span style="color:black">nhằm mục đ&iacute;ch sản xuất đưa ra thị trường những sản phẩm ph&acirc;n b&oacute;n chất lượng với mong muốn mang đến cho người n&ocirc;ng d&acirc;n những sản phầm tốt nhất, gi&uacute;p b&agrave; con n&ocirc;ng d&acirc;n l&agrave;m gi&agrave;u tr&ecirc;n ruộng vườn của m&igrave;nh</span></span></span><span style="background-color:white"><span style="font-family:Roboto"><span style="color:black">. Bằng những nỗ lực phục vụ người n&ocirc;ng d&acirc;n v&agrave; ngh&agrave;nh n&ocirc;ng nghiệp đến nay ph&acirc;n b&oacute;n quốc tế đ&atilde; khẳng định được thương hiệu của m&igrave;nh tại thị trường trong nước v&agrave; tr&ecirc;n thị trường quốc tế.</span></span></span></span></span></span></p>
', NULL, NULL, NULL, NULL, NULL, N'Giới thiệu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 2, NULL, NULL, NULL, NULL, N'gioi-thieu', NULL, NULL, NULL)
INSERT [dbo].[news_category] ([id], [name], [desciption], [content1], [content2], [content3], [content4], [content5], [meta_title], [meta_description], [meta_keywords], [images], [datecreate], [dateedit], [usercreate], [useredit], [actived], [deleted], [parent], [tags], [views], [rating], [code], [url], [price], [quantity], [lang]) VALUES (3, N'Hợp Tác', NULL, NULL, NULL, NULL, NULL, NULL, N'Hợp tác', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'hop-tac', NULL, NULL, NULL)
INSERT [dbo].[news_category] ([id], [name], [desciption], [content1], [content2], [content3], [content4], [content5], [meta_title], [meta_description], [meta_keywords], [images], [datecreate], [dateedit], [usercreate], [useredit], [actived], [deleted], [parent], [tags], [views], [rating], [code], [url], [price], [quantity], [lang]) VALUES (5, N'Tin tức', NULL, NULL, NULL, NULL, NULL, NULL, N'Tin tức', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'tin-tuc', NULL, NULL, NULL)
INSERT [dbo].[news_category] ([id], [name], [desciption], [content1], [content2], [content3], [content4], [content5], [meta_title], [meta_description], [meta_keywords], [images], [datecreate], [dateedit], [usercreate], [useredit], [actived], [deleted], [parent], [tags], [views], [rating], [code], [url], [price], [quantity], [lang]) VALUES (6, N'Tuyển Dụng', NULL, NULL, NULL, NULL, NULL, NULL, N'Tuyển Dụng', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'tuyen-dung', NULL, NULL, NULL)
INSERT [dbo].[news_category] ([id], [name], [desciption], [content1], [content2], [content3], [content4], [content5], [meta_title], [meta_description], [meta_keywords], [images], [datecreate], [dateedit], [usercreate], [useredit], [actived], [deleted], [parent], [tags], [views], [rating], [code], [url], [price], [quantity], [lang]) VALUES (7, N'Hỏi Đáp', NULL, NULL, NULL, NULL, NULL, NULL, N'Hỏi đáp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'hoi-dap', NULL, NULL, NULL)
INSERT [dbo].[news_category] ([id], [name], [desciption], [content1], [content2], [content3], [content4], [content5], [meta_title], [meta_description], [meta_keywords], [images], [datecreate], [dateedit], [usercreate], [useredit], [actived], [deleted], [parent], [tags], [views], [rating], [code], [url], [price], [quantity], [lang]) VALUES (8, N'Cẩm Nang Nhà Nông', NULL, NULL, NULL, NULL, NULL, NULL, N'Cẩm nang nhà nông', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'cam-nang-nha-nong', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[news_category] OFF
SET IDENTITY_INSERT [dbo].[page] ON 

INSERT [dbo].[page] ([id], [name], [desciption], [content1], [content2], [content3], [content4], [content5], [meta_title], [meta_description], [meta_keywords], [images], [datecreate], [dateend], [dateedit], [usercreate], [useredit], [actived], [deleted], [parent], [tags], [views], [rating], [code], [url], [price], [quantity], [lang]) VALUES (1, N'Công Ty Cổ Phần Phân Bón Quốc Tế ', N'Công Ty Cổ Phần Phân Bón Quốc Tế là một trong những công ty hàng đầu trong lĩnh vực phân bón hiện nay tại Việt Nam, với đội ngũ chuyên gia và công nhân lành nghề bên cạnh đội ngũ kinh doanh năng động. Sản phẩm của công ty hiện được tiêu thụ khắp các vùng miền đông Nam Bộ và cao nguyên Miền Trung.', N'<p>

Công Ty Cổ Phần Phân Bón Quốc Tế là một trong những công ty hàng đầu trong lĩnh vực phân bón hiện nay tại Việt Nam, với đội ngũ chuyên gia và công nhân lành nghề bên cạnh đội ngũ kinh doanh năng động. Sản phẩm của công ty hiện được tiêu thụ khắp các vùng miền đông Nam Bộ và cao nguyên Miền Trung.

</p>
<p style="margin-top: 15px;">

Hiện nay chúng tôi đã nghiên cứu và cho ra các dòng sản phẩm chuyên dùng phù hợp với từng loại cây trồng, loại đất, khí hậu, thổ nhưỡng khác nhau. Phân Hữu Cơ, phân Trung Lượng, phân Vi Lượng đậm đặc, phân Lân Vôi, phân NPK chuyên dùng bón các loại cây trồng như: Cà Phê, Hồ Tiêu, Cao Su, cây ăn trái, cây công nghiệp ngắn ngày, Lúa, cây rau màu và một số loại cây trồng khác. Sản phẩm hiện có bán tại các Đại Lý trên toàn quốc, bà con nông dân vui lòng liên hệ Đại Lý gần nhất để được mua đúng sản phẩm của Công Ty chúng tôi nhằm nâng cao năng suất cây trồng.

</p>', N'<ul>
<li><div class="box-icon"><a href="../ve-chung-toi" title="Về chúng tôi"><i class="fas fa-star"></i></a></div><div class="box-title-content"><div class="box-title"><a href="../ve-chung-toi" title="Về chúng tôi"><h5>Về chúng tôi</h5></a></div><div class="box-content">
<p>

Công ty Cổ phần Phân bón Quốc Tế được thành lập với sứ mệnh mang đến cho bà con nông dân những sản phẩm chất lượng, tạo niềm tin tuyệt đối cho bà con. Nhà máy hiện đại ứng dụng công nghệ Urea hóa lỏng, đây là dây chuyền sản xuất với năng suất đạt đến 100,000 tấn/năm

</p></div></div></li>
<li>
<div class="box-icon">
<a href="../ve-chung-toi" title="Chất lượng"><i class="fas fa-thumbs-up"></i></a></div><div class="box-title-content"><div class="box-title"><a href="../ve-chung-toi" title="Chất lượng">
<h5>Chất lượng</h5></a></div>
<div class="box-content"><p>

Phòng thí nghiệm với các trang thiết bị hiện đại và đội ngũ cán bộ nhân viên lành nghề luôn đảm bảo chất lượng nguyên liệu đầu vào và sản phẩm sản xuất đúng chất lượng với những tiêu chuẩn nghiêm ngặt trước khi tung ra thị trường.

</p></div></div></li>
<li><div class="box-icon"><a href="../ve-chung-toi" title="Sản phẩm đa dạng"><i class="fas fa-chart-pie"></i></a></div><div class="box-title-content"><div class="box-title"><a href="../ve-chung-toi" title="Sản phẩm đa dạng">
<h5>Sản phẩm đa dạng</h5></a></div><div class="box-content"><p>

Hiện nay công ty đã đưa ra thi trường hơn 100 sản phẩm phân bón đa dạng hóa các chủng loại sản phẩm, ngoài các nhóm NPK thông thường như 16-16-8; 20-20-15,… Chúng tôi còn tập trung sản xuất các dòng sản phẩm đặc chủng riêng biệt như: AMAZON, BIG ONE, WINDMILL, SEVEN và HUMAX.

</p></div></div></li>
<li><div class="box-icon"><a href="../ve-chung-toi" title="Dịch vụ"><i class="fas fa-server"></i></a></div><div class="box-title-content"><div class="box-title"><a href="../ve-chung-toi" title="Dịch vụ"><h5>Dịch vụ</h5></a></div><div class="box-content"><p>

Chúng tôi không ngừng nâng cao chất lượng dịch vụ, lấy khách hàng là trọng tâm và cây trồng là trọng điểm để ngày càng chuyên nghiệp hóa và tự động hóa trong sản xuất.

</p></div></div></li>
 <li>
<div class="box-icon">
<a href="../ve-chung-toi" title="Chứng nhận về chất lượng"><i class="fas fa-trophy"></i></a></div><div class="box-title-content"><div class="box-title"><a href="../ve-chung-toi" title="Chứng nhận về chất lượng">
<h5>Chứng nhận về chất lượng</h5></a></div><div class="box-content">
<p>

- Top 100 thương hiệu nổi tiếng - Thương hiệu hàng đầu top brand 2015 - Doanh nghiệp vì nhà nông

</p></div></div></li>
</ul>', N'<iframe frameborder="0" height="580" src="https://www.youtube.com/embed/m_ZaIGhwfaQ" width="100%"></iframe>
', NULL, NULL, N'Công Ty Cổ Phần Phân Bón Quốc Tế ', N'Công Ty Cổ Phần Phân Bón Quốc Tế là một trong những công ty hàng đầu trong lĩnh vực phân bón hiện nay tại Việt Nam, với đội ngũ chuyên gia và công nhân lành nghề bên cạnh đội ngũ kinh doanh năng động. Sản phẩm của công ty hiện được tiêu thụ khắp các vùng miền đông Nam Bộ và cao nguyên Miền Trung.', NULL, NULL, NULL, NULL, N'1/14/2019', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'cong-ty-co-phan-phan-bon-quoc-te-', NULL, NULL, NULL)
INSERT [dbo].[page] ([id], [name], [desciption], [content1], [content2], [content3], [content4], [content5], [meta_title], [meta_description], [meta_keywords], [images], [datecreate], [dateend], [dateedit], [usercreate], [useredit], [actived], [deleted], [parent], [tags], [views], [rating], [code], [url], [price], [quantity], [lang]) VALUES (2, N'Liên hệ với chúng tôi', NULL, NULL, NULL, NULL, NULL, NULL, N'Liên hệ với chúng tôi', N'Công ty Phân Bón Quốc Tế chuyên các dòng phân bón NPK, Phân bón hữu cơ, Phân bón chuyên dùng. Phân Bón Quốc Tế cung cấp cho thị trường và bà con nông dân những chuẩn loại phân bón phong phú, đáp ứng hầu hết nhu cầu của cây trồng cũng như tiêu thụ.', NULL, NULL, N'1/9/2019', N'1/9/2019', N'1/14/2019', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, N'lien-he-voi-chung-toi', NULL, NULL, NULL)
INSERT [dbo].[page] ([id], [name], [desciption], [content1], [content2], [content3], [content4], [content5], [meta_title], [meta_description], [meta_keywords], [images], [datecreate], [dateend], [dateedit], [usercreate], [useredit], [actived], [deleted], [parent], [tags], [views], [rating], [code], [url], [price], [quantity], [lang]) VALUES (3, N'Kết quả tìm kiếm: @key', N'Kết quả tìm kiếm: @key', NULL, NULL, NULL, NULL, NULL, N'Kết quả tìm kiếm: @key', N'Kết quả tìm kiếm: @key', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[page] OFF
SET IDENTITY_INSERT [dbo].[picture] ON 

INSERT [dbo].[picture] ([id], [name], [filename], [group_picture], [active], [note]) VALUES (2, N'Banner trang chủ 1', N'banner chinh-01-01.png', 1, 1, NULL)
INSERT [dbo].[picture] ([id], [name], [filename], [group_picture], [active], [note]) VALUES (3, N'Banner chính 2', N'banner chinh 2-01-1-01.png', 1, 1, N'#')
INSERT [dbo].[picture] ([id], [name], [filename], [group_picture], [active], [note]) VALUES (4, N'Liên hệ', N'banner phu lien he_Artboard 5 copy 2.png', 4, 1, NULL)
INSERT [dbo].[picture] ([id], [name], [filename], [group_picture], [active], [note]) VALUES (5, N'Banner tin tuc 1', N'banner phu1_Artboard 12.png', 3, 1, NULL)
INSERT [dbo].[picture] ([id], [name], [filename], [group_picture], [active], [note]) VALUES (6, N'Banner tin tuc 2', N'banner phu lien he_Artboard 5 copy 2.png', 3, 1, NULL)
INSERT [dbo].[picture] ([id], [name], [filename], [group_picture], [active], [note]) VALUES (7, N'banner san pham 1', N'banner phu1_Artboard 12.png', 2, 1, NULL)
INSERT [dbo].[picture] ([id], [name], [filename], [group_picture], [active], [note]) VALUES (8, N'Banner san pham 2', N'banner-sp-mm.png', 2, 1, NULL)
INSERT [dbo].[picture] ([id], [name], [filename], [group_picture], [active], [note]) VALUES (9, N'Banner duoi trang chu 1', N'hinh duoi chan 4.png', 5, 1, NULL)
INSERT [dbo].[picture] ([id], [name], [filename], [group_picture], [active], [note]) VALUES (10, N'Banner duoi trang chu 2', N'hinh duoi chan 2.png', 5, 1, NULL)
INSERT [dbo].[picture] ([id], [name], [filename], [group_picture], [active], [note]) VALUES (11, N'Banner duoi trang chu 3', N'hinh duoi chan 3.png', 5, 1, NULL)
INSERT [dbo].[picture] ([id], [name], [filename], [group_picture], [active], [note]) VALUES (12, N'Banner trang chủ 3', N'banner chinh 2-03-03.png', 1, 1, NULL)
INSERT [dbo].[picture] ([id], [name], [filename], [group_picture], [active], [note]) VALUES (14, N'Banner trang chủ 5', N'banner chinh 5_Artboard 5 copy.png', 1, 1, NULL)
INSERT [dbo].[picture] ([id], [name], [filename], [group_picture], [active], [note]) VALUES (15, N'Giới thiệu chung trang chủ', N'HINH CONG TY.png', 6, 1, NULL)
INSERT [dbo].[picture] ([id], [name], [filename], [group_picture], [active], [note]) VALUES (16, N'Banner trai nhom san pham Trang chu', N'1.png', 7, 1, NULL)
INSERT [dbo].[picture] ([id], [name], [filename], [group_picture], [active], [note]) VALUES (17, N'NHÓM PHÂN BÓN HUMAX RONG BIỂN', N'nhom_san_pham_600x450_w400_h300.jpg', 8, 1, NULL)
INSERT [dbo].[picture] ([id], [name], [filename], [group_picture], [active], [note]) VALUES (18, N'NHÓM PHÂN BÓN AMAZON', N'sp-amazon_w400_h300.jpg', 8, 1, NULL)
INSERT [dbo].[picture] ([id], [name], [filename], [group_picture], [active], [note]) VALUES (19, N'NHÓM PHÂN BÓN SEVEN', N'sp-seven_w400_h300.jpg', 8, 1, NULL)
SET IDENTITY_INSERT [dbo].[picture] OFF
SET IDENTITY_INSERT [dbo].[picture_group] ON 

INSERT [dbo].[picture_group] ([id], [name], [active], [note], [lang]) VALUES (1, N'Banner chính', 1, NULL, NULL)
INSERT [dbo].[picture_group] ([id], [name], [active], [note], [lang]) VALUES (2, N'Banner mục sản phẩm', 1, NULL, NULL)
INSERT [dbo].[picture_group] ([id], [name], [active], [note], [lang]) VALUES (3, N'Banner mục bài viết', 1, NULL, NULL)
INSERT [dbo].[picture_group] ([id], [name], [active], [note], [lang]) VALUES (4, N'Banner Liên hệ', 1, NULL, NULL)
INSERT [dbo].[picture_group] ([id], [name], [active], [note], [lang]) VALUES (5, N'Banner footer trang chu', 1, NULL, NULL)
INSERT [dbo].[picture_group] ([id], [name], [active], [note], [lang]) VALUES (6, N'Banner giới thiệu chung Trang chủ', 1, NULL, NULL)
INSERT [dbo].[picture_group] ([id], [name], [active], [note], [lang]) VALUES (7, N'Banner trái nhóm sản phẩm Trang chủ', 1, NULL, NULL)
INSERT [dbo].[picture_group] ([id], [name], [active], [note], [lang]) VALUES (8, N'Nhóm sản phẩm trang chủ', 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[picture_group] OFF
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([id], [name], [desciption], [content1], [content2], [content3], [content4], [content5], [meta_title], [meta_description], [meta_keywords], [images], [datecreate], [dateedit], [usercreate], [dateend], [useredit], [actived], [deleted], [parent], [tags], [views], [rating], [code], [url], [price], [quantity]) VALUES (1, N'Phân bón Siêu Tăng Trưởng mùa mưa', NULL, N'<ul>
	<li>Bao b&igrave;:&nbsp;&nbsp;</li>
	<li>Hạt ph&acirc;n:&nbsp;</li>
	<li>Phương thức b&oacute;n:&nbsp;&nbsp;</li>
	<li>M&ocirc; tả: Ph&acirc;n b&oacute;n l&agrave; sản phẩm ...</li>
	<li>Khối lượng tịnh:&nbsp;</li>
</ul>
', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'php-1470984716.jpg', N'1/11/2019', N'1/11/2019', NULL, N'1/11/2019', NULL, 1, NULL, 10, NULL, NULL, NULL, NULL, N'phan-bon-sieu-tang-truong-mua-mua', NULL, NULL)
INSERT [dbo].[product] ([id], [name], [desciption], [content1], [content2], [content3], [content4], [content5], [meta_title], [meta_description], [meta_keywords], [images], [datecreate], [dateedit], [usercreate], [dateend], [useredit], [actived], [deleted], [parent], [tags], [views], [rating], [code], [url], [price], [quantity]) VALUES (2, N'NPK Lớn Trái', NULL, N'<ul>
	<li>Bao b&igrave;:&nbsp;&nbsp;</li>
	<li>Hạt ph&acirc;n:&nbsp;</li>
	<li>Phương thức b&oacute;n:&nbsp;&nbsp;</li>
	<li>M&ocirc; tả: Ph&acirc;n b&oacute;n l&agrave; sản phẩm ...</li>
	<li>Khối lượng tịnh:&nbsp;</li>
</ul>
', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'php-1438134816.jpg', N'1/11/2019', N'1/11/2019', NULL, N'1/11/2019', NULL, 1, NULL, 10, NULL, NULL, NULL, NULL, N'npk-lon-trai', NULL, NULL)
INSERT [dbo].[product] ([id], [name], [desciption], [content1], [content2], [content3], [content4], [content5], [meta_title], [meta_description], [meta_keywords], [images], [datecreate], [dateedit], [usercreate], [dateend], [useredit], [actived], [deleted], [parent], [tags], [views], [rating], [code], [url], [price], [quantity]) VALUES (3, N'NPK Chắc Hạt', NULL, N'<ul>
	<li>Bao b&igrave;:&nbsp;&nbsp;</li>
	<li>Hạt ph&acirc;n:&nbsp;</li>
	<li>Phương thức b&oacute;n:&nbsp;&nbsp;</li>
	<li>M&ocirc; tả: Ph&acirc;n b&oacute;n l&agrave; sản phẩm ...</li>
	<li>Khối lượng tịnh:&nbsp;</li>
</ul>
', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'php-1470983904.jpg', N'1/11/2019', N'1/11/2019', NULL, N'1/11/2019', NULL, 1, NULL, 10, NULL, NULL, NULL, NULL, N'npk-chac-hat', NULL, NULL)
INSERT [dbo].[product] ([id], [name], [desciption], [content1], [content2], [content3], [content4], [content5], [meta_title], [meta_description], [meta_keywords], [images], [datecreate], [dateedit], [usercreate], [dateend], [useredit], [actived], [deleted], [parent], [tags], [views], [rating], [code], [url], [price], [quantity]) VALUES (4, N'Nutri Max dùng cho Cà phê & Hồ tiêu', NULL, N'<ul>
	<li>Bao b&igrave;:&nbsp;&nbsp;</li>
	<li>Hạt ph&acirc;n:&nbsp;</li>
	<li>Phương thức b&oacute;n:&nbsp;&nbsp;</li>
	<li>M&ocirc; tả: Ph&acirc;n b&oacute;n l&agrave; sản phẩm ...</li>
	<li>Khối lượng tịnh:&nbsp;</li>
</ul>
', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'php-1470984293.jpg', N'1/11/2019', N'1/11/2019', NULL, N'1/11/2019', NULL, 1, NULL, 10, NULL, NULL, NULL, NULL, N'nutri-max-dung-cho-ca-phe-ho-tieu', NULL, NULL)
INSERT [dbo].[product] ([id], [name], [desciption], [content1], [content2], [content3], [content4], [content5], [meta_title], [meta_description], [meta_keywords], [images], [datecreate], [dateedit], [usercreate], [dateend], [useredit], [actived], [deleted], [parent], [tags], [views], [rating], [code], [url], [price], [quantity]) VALUES (5, N'PHÂN BÓN CHUYÊN TIÊU', NULL, N'<ul>
	<li>Bao b&igrave;:&nbsp;&nbsp;</li>
	<li>Hạt ph&acirc;n:&nbsp;</li>
	<li>Phương thức b&oacute;n:&nbsp;&nbsp;</li>
	<li>M&ocirc; tả: Ph&acirc;n b&oacute;n l&agrave; sản phẩm ...</li>
	<li>Khối lượng tịnh:&nbsp;</li>
</ul>
', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'php-1444458961.jpg', N'1/11/2019', N'1/11/2019', NULL, N'1/11/2019', NULL, 1, NULL, 10, NULL, NULL, NULL, NULL, N'phan-bon-chuyen-tieu', NULL, NULL)
INSERT [dbo].[product] ([id], [name], [desciption], [content1], [content2], [content3], [content4], [content5], [meta_title], [meta_description], [meta_keywords], [images], [datecreate], [dateedit], [usercreate], [dateend], [useredit], [actived], [deleted], [parent], [tags], [views], [rating], [code], [url], [price], [quantity]) VALUES (6, N'CAO NGUYÊN XANH', NULL, N'<ul>
	<li>Bao b&igrave;:&nbsp;&nbsp;</li>
	<li>Hạt ph&acirc;n:&nbsp;</li>
	<li>Phương thức b&oacute;n:&nbsp;&nbsp;</li>
	<li>M&ocirc; tả: Ph&acirc;n b&oacute;n l&agrave; sản phẩm ...</li>
	<li>Khối lượng tịnh:&nbsp;</li>
</ul>
', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'php-1436001667.jpg', N'1/11/2019', N'1/11/2019', NULL, N'1/11/2019', NULL, 1, NULL, 10, NULL, NULL, NULL, NULL, N'cao-nguyen-xanh', NULL, NULL)
INSERT [dbo].[product] ([id], [name], [desciption], [content1], [content2], [content3], [content4], [content5], [meta_title], [meta_description], [meta_keywords], [images], [datecreate], [dateedit], [usercreate], [dateend], [useredit], [actived], [deleted], [parent], [tags], [views], [rating], [code], [url], [price], [quantity]) VALUES (7, N'Phân bón NPK+', NULL, N'<ul>
	<li>Bao b&igrave;:&nbsp;&nbsp;</li>
	<li>Hạt ph&acirc;n:&nbsp;</li>
	<li>Phương thức b&oacute;n:&nbsp;&nbsp;</li>
	<li>M&ocirc; tả: Ph&acirc;n b&oacute;n l&agrave; sản phẩm ...</li>
	<li>Khối lượng tịnh:&nbsp;</li>
</ul>
', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'php-1435197495.jpg', N'1/11/2019', N'1/11/2019', NULL, N'1/11/2019', NULL, 1, NULL, 10, NULL, NULL, NULL, NULL, N'phan-bon-npk-', NULL, NULL)
INSERT [dbo].[product] ([id], [name], [desciption], [content1], [content2], [content3], [content4], [content5], [meta_title], [meta_description], [meta_keywords], [images], [datecreate], [dateedit], [usercreate], [dateend], [useredit], [actived], [deleted], [parent], [tags], [views], [rating], [code], [url], [price], [quantity]) VALUES (8, N'Phân Vi Lượng bón rễ mùa mưa', NULL, N'<ul>
	<li>Bao b&igrave;:&nbsp;&nbsp;</li>
	<li>Hạt ph&acirc;n:&nbsp;</li>
	<li>Phương thức b&oacute;n:&nbsp;&nbsp;</li>
	<li>M&ocirc; tả: Ph&acirc;n b&oacute;n l&agrave; sản phẩm ...</li>
	<li>Khối lượng tịnh:&nbsp;</li>
</ul>
', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'php-1432173138.jpg', N'1/11/2019', N'1/11/2019', NULL, N'1/11/2019', NULL, 1, NULL, 10, NULL, NULL, NULL, NULL, N'phan-vi-luong-bon-re-mua-mua', NULL, NULL)
INSERT [dbo].[product] ([id], [name], [desciption], [content1], [content2], [content3], [content4], [content5], [meta_title], [meta_description], [meta_keywords], [images], [datecreate], [dateedit], [usercreate], [dateend], [useredit], [actived], [deleted], [parent], [tags], [views], [rating], [code], [url], [price], [quantity]) VALUES (9, N'U.S.A dùng cho Cà phê & hồ tiêu', NULL, N'<ul>
	<li>Bao b&igrave;:&nbsp;&nbsp;</li>
	<li>Hạt ph&acirc;n:&nbsp;</li>
	<li>Phương thức b&oacute;n:&nbsp;&nbsp;</li>
	<li>M&ocirc; tả: Ph&acirc;n b&oacute;n l&agrave; sản phẩm ...</li>
	<li>Khối lượng tịnh:&nbsp;</li>
</ul>
', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'php-1436002167.jpg', N'1/11/2019', N'1/11/2019', NULL, N'1/11/2019', NULL, 1, NULL, 10, NULL, NULL, NULL, NULL, N'u-s-a-dung-cho-ca-phe-ho-tieu', NULL, NULL)
INSERT [dbo].[product] ([id], [name], [desciption], [content1], [content2], [content3], [content4], [content5], [meta_title], [meta_description], [meta_keywords], [images], [datecreate], [dateedit], [usercreate], [dateend], [useredit], [actived], [deleted], [parent], [tags], [views], [rating], [code], [url], [price], [quantity]) VALUES (10, N'NUTRI ONE MÙA MƯA', NULL, N'<ul>
	<li>Bao b&igrave;:&nbsp;&nbsp;</li>
	<li>Hạt ph&acirc;n:&nbsp;</li>
	<li>Phương thức b&oacute;n:&nbsp;&nbsp;</li>
	<li>M&ocirc; tả: Ph&acirc;n b&oacute;n l&agrave; sản phẩm ...</li>
	<li>Khối lượng tịnh:&nbsp;</li>
</ul>
', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'php-1436002035.jpg', N'1/11/2019', N'1/11/2019', NULL, N'1/11/2019', NULL, 1, NULL, 10, NULL, NULL, NULL, NULL, N'nutri-one-mua-mua', NULL, NULL)
INSERT [dbo].[product] ([id], [name], [desciption], [content1], [content2], [content3], [content4], [content5], [meta_title], [meta_description], [meta_keywords], [images], [datecreate], [dateedit], [usercreate], [dateend], [useredit], [actived], [deleted], [parent], [tags], [views], [rating], [code], [url], [price], [quantity]) VALUES (11, N'Nutri Max dùng cho cao su', NULL, N'<ul>
	<li>Bao b&igrave;:&nbsp;&nbsp;</li>
	<li>Hạt ph&acirc;n:&nbsp;</li>
	<li>Phương thức b&oacute;n:&nbsp;&nbsp;</li>
	<li>M&ocirc; tả: Ph&acirc;n b&oacute;n l&agrave; sản phẩm ...</li>
	<li>Khối lượng tịnh:&nbsp;</li>
</ul>
', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'php-1367766313.png', N'1/11/2019', N'1/11/2019', NULL, N'1/11/2019', NULL, 1, NULL, 10, NULL, NULL, NULL, NULL, N'nutri-max-dung-cho-cao-su', NULL, NULL)
INSERT [dbo].[product] ([id], [name], [desciption], [content1], [content2], [content3], [content4], [content5], [meta_title], [meta_description], [meta_keywords], [images], [datecreate], [dateedit], [usercreate], [dateend], [useredit], [actived], [deleted], [parent], [tags], [views], [rating], [code], [url], [price], [quantity]) VALUES (12, N'Phân bón Nutri Max', NULL, N'<ul>
	<li>Bao b&igrave;:&nbsp;&nbsp;</li>
	<li>Hạt ph&acirc;n:&nbsp;</li>
	<li>Phương thức b&oacute;n:&nbsp;&nbsp;</li>
	<li>M&ocirc; tả: Ph&acirc;n b&oacute;n l&agrave; sản phẩm ...</li>
	<li>Khối lượng tịnh:&nbsp;</li>
</ul>
', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'php-1436001741.jpg', N'1/11/2019', N'1/11/2019', NULL, N'1/11/2019', NULL, 1, NULL, 10, NULL, NULL, NULL, NULL, N'phan-bon-nutri-max', NULL, NULL)
INSERT [dbo].[product] ([id], [name], [desciption], [content1], [content2], [content3], [content4], [content5], [meta_title], [meta_description], [meta_keywords], [images], [datecreate], [dateedit], [usercreate], [dateend], [useredit], [actived], [deleted], [parent], [tags], [views], [rating], [code], [url], [price], [quantity]) VALUES (13, N'Best Sum dùng cho Cà phê & hồ tiêu', NULL, N'<ul>
	<li>Bao b&igrave;:&nbsp;&nbsp;</li>
	<li>Hạt ph&acirc;n:&nbsp;</li>
	<li>Phương thức b&oacute;n:&nbsp;&nbsp;</li>
	<li>M&ocirc; tả: Ph&acirc;n b&oacute;n l&agrave; sản phẩm ...</li>
	<li>Khối lượng tịnh:&nbsp;</li>
</ul>
', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'php-1435999901.jpg', N'1/11/2019', N'1/11/2019', NULL, N'1/11/2019', NULL, 1, NULL, 10, NULL, NULL, NULL, NULL, N'best-sum-dung-cho-ca-phe-ho-tieu', NULL, NULL)
INSERT [dbo].[product] ([id], [name], [desciption], [content1], [content2], [content3], [content4], [content5], [meta_title], [meta_description], [meta_keywords], [images], [datecreate], [dateedit], [usercreate], [dateend], [useredit], [actived], [deleted], [parent], [tags], [views], [rating], [code], [url], [price], [quantity]) VALUES (14, N'Phân bón Nutri Bank chuyên dùng cho cà phê - hồ tiêu', NULL, N'<ul>
	<li>Bao b&igrave;:&nbsp;&nbsp;</li>
	<li>Hạt ph&acirc;n:&nbsp;</li>
	<li>Phương thức b&oacute;n:&nbsp;&nbsp;</li>
	<li>M&ocirc; tả: Ph&acirc;n b&oacute;n l&agrave; sản phẩm ...</li>
	<li>Khối lượng tịnh:&nbsp;</li>
</ul>
', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'php-1435999700.jpg', N'1/11/2019', N'1/11/2019', NULL, N'1/11/2019', NULL, 1, NULL, 10, NULL, NULL, NULL, NULL, N'phan-bon-nutri-bank-chuyen-dung-cho-ca-phe-ho-tieu', NULL, NULL)
INSERT [dbo].[product] ([id], [name], [desciption], [content1], [content2], [content3], [content4], [content5], [meta_title], [meta_description], [meta_keywords], [images], [datecreate], [dateedit], [usercreate], [dateend], [useredit], [actived], [deleted], [parent], [tags], [views], [rating], [code], [url], [price], [quantity]) VALUES (15, N'Phân bón NUTI GOOD chuyên dùng cho cà phê - hồ tiêu', NULL, N'<ul>
	<li>Bao b&igrave;:&nbsp;&nbsp;</li>
	<li>Hạt ph&acirc;n:&nbsp;</li>
	<li>Phương thức b&oacute;n:&nbsp;&nbsp;</li>
	<li>M&ocirc; tả: Ph&acirc;n b&oacute;n l&agrave; sản phẩm ...</li>
	<li>Khối lượng tịnh:&nbsp;</li>
</ul>
', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'php-1435999643.jpg', N'1/11/2019', N'1/11/2019', NULL, N'1/11/2019', NULL, 1, NULL, 4, NULL, NULL, NULL, NULL, N'phan-bon-nuti-good-chuyen-dung-cho-ca-phe-ho-tieu', NULL, NULL)
INSERT [dbo].[product] ([id], [name], [desciption], [content1], [content2], [content3], [content4], [content5], [meta_title], [meta_description], [meta_keywords], [images], [datecreate], [dateedit], [usercreate], [dateend], [useredit], [actived], [deleted], [parent], [tags], [views], [rating], [code], [url], [price], [quantity]) VALUES (16, N'Phân bón USA chuyên dùng cho cà phê - hồ tiêu', NULL, N'<ul>
	<li>Bao b&igrave;:&nbsp;&nbsp;</li>
	<li>Hạt ph&acirc;n:&nbsp;</li>
	<li>Phương thức b&oacute;n:&nbsp;&nbsp;</li>
	<li>M&ocirc; tả: Ph&acirc;n b&oacute;n l&agrave; sản phẩm ...</li>
	<li>Khối lượng tịnh:&nbsp;</li>
</ul>
', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'php-1435999468.jpg', N'1/11/2019', N'1/11/2019', NULL, N'1/11/2019', NULL, 1, NULL, 10, NULL, NULL, NULL, NULL, N'phan-bon-usa-chuyen-dung-cho-ca-phe-ho-tieu', NULL, NULL)
INSERT [dbo].[product] ([id], [name], [desciption], [content1], [content2], [content3], [content4], [content5], [meta_title], [meta_description], [meta_keywords], [images], [datecreate], [dateedit], [usercreate], [dateend], [useredit], [actived], [deleted], [parent], [tags], [views], [rating], [code], [url], [price], [quantity]) VALUES (17, N'Phân Vi Lượng Bón Rễ mùa khô', NULL, N'<ul>
	<li>Bao b&igrave;:&nbsp;&nbsp;</li>
	<li>Hạt ph&acirc;n:&nbsp;</li>
	<li>Phương thức b&oacute;n:&nbsp;&nbsp;</li>
	<li>M&ocirc; tả: Ph&acirc;n b&oacute;n l&agrave; sản phẩm ...</li>
	<li>Khối lượng tịnh:&nbsp;</li>
</ul>
', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'php-1432173201.jpg', N'1/11/2019', N'1/11/2019', NULL, N'1/11/2019', NULL, 1, NULL, 10, NULL, NULL, NULL, NULL, N'phan-vi-luong-bon-re-mua-kho', NULL, NULL)
SET IDENTITY_INSERT [dbo].[product] OFF
SET IDENTITY_INSERT [dbo].[product_category] ON 

INSERT [dbo].[product_category] ([id], [name], [desciption], [content1], [content2], [content3], [content4], [content5], [meta_title], [meta_description], [meta_keywords], [images], [datecreate], [dateedit], [usercreate], [useredit], [actived], [deleted], [parent], [tags], [views], [rating], [code], [url], [price], [quantity], [lang]) VALUES (3, N'Nhóm NPK công thức', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'nhom-npk-cong-thuc', NULL, NULL, NULL)
INSERT [dbo].[product_category] ([id], [name], [desciption], [content1], [content2], [content3], [content4], [content5], [meta_title], [meta_description], [meta_keywords], [images], [datecreate], [dateedit], [usercreate], [useredit], [actived], [deleted], [parent], [tags], [views], [rating], [code], [url], [price], [quantity], [lang]) VALUES (4, N'Nhóm NPK chuyên dùng', NULL, NULL, NULL, NULL, NULL, NULL, N'Nhóm NPK chuyên dùng', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'nhom-npk-chuyen-dung', NULL, NULL, NULL)
INSERT [dbo].[product_category] ([id], [name], [desciption], [content1], [content2], [content3], [content4], [content5], [meta_title], [meta_description], [meta_keywords], [images], [datecreate], [dateedit], [usercreate], [useredit], [actived], [deleted], [parent], [tags], [views], [rating], [code], [url], [price], [quantity], [lang]) VALUES (5, N'Nhóm nhãn hàng riêng', NULL, NULL, NULL, NULL, NULL, NULL, N'Nhóm nhãn hàng riêng', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'nhom-nhan-hang-rieng', NULL, NULL, NULL)
INSERT [dbo].[product_category] ([id], [name], [desciption], [content1], [content2], [content3], [content4], [content5], [meta_title], [meta_description], [meta_keywords], [images], [datecreate], [dateedit], [usercreate], [useredit], [actived], [deleted], [parent], [tags], [views], [rating], [code], [url], [price], [quantity], [lang]) VALUES (7, N'Nhóm phân phức hợp', NULL, NULL, NULL, NULL, NULL, NULL, N'Nhóm phân phức hợp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'nhom-phan-phuc-hop', NULL, NULL, NULL)
INSERT [dbo].[product_category] ([id], [name], [desciption], [content1], [content2], [content3], [content4], [content5], [meta_title], [meta_description], [meta_keywords], [images], [datecreate], [dateedit], [usercreate], [useredit], [actived], [deleted], [parent], [tags], [views], [rating], [code], [url], [price], [quantity], [lang]) VALUES (9, N'Nhóm phân tưới gốc – phân bón lá', NULL, NULL, NULL, NULL, NULL, NULL, N'Nhóm phân tưới gốc – phân bón lá', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'nhom-phan-tuoi-goc-–-phan-bon-la', NULL, NULL, NULL)
INSERT [dbo].[product_category] ([id], [name], [desciption], [content1], [content2], [content3], [content4], [content5], [meta_title], [meta_description], [meta_keywords], [images], [datecreate], [dateedit], [usercreate], [useredit], [actived], [deleted], [parent], [tags], [views], [rating], [code], [url], [price], [quantity], [lang]) VALUES (10, N'Phân bón chuyên dùng', NULL, NULL, NULL, NULL, NULL, NULL, N'Phân bón chuyên dùng', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'phan-bon-chuyen-dung', NULL, NULL, NULL)
INSERT [dbo].[product_category] ([id], [name], [desciption], [content1], [content2], [content3], [content4], [content5], [meta_title], [meta_description], [meta_keywords], [images], [datecreate], [dateedit], [usercreate], [useredit], [actived], [deleted], [parent], [tags], [views], [rating], [code], [url], [price], [quantity], [lang]) VALUES (11, N'Phân bón NPK', NULL, NULL, NULL, NULL, NULL, NULL, N'Phân bón NPK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'phan-bon-npk', NULL, NULL, NULL)
INSERT [dbo].[product_category] ([id], [name], [desciption], [content1], [content2], [content3], [content4], [content5], [meta_title], [meta_description], [meta_keywords], [images], [datecreate], [dateedit], [usercreate], [useredit], [actived], [deleted], [parent], [tags], [views], [rating], [code], [url], [price], [quantity], [lang]) VALUES (12, N'Các loại phân bón khác', NULL, NULL, NULL, NULL, NULL, NULL, N'Các loại phân bón khác', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'cac-loai-phan-bon-khac', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[product_category] OFF
SET IDENTITY_INSERT [dbo].[router_config] ON 

INSERT [dbo].[router_config] ([id], [url], [controller], [action], [itemId], [actived]) VALUES (1, N'url-abc', N'news', N'detail', N'1', NULL)
INSERT [dbo].[router_config] ([id], [url], [controller], [action], [itemId], [actived]) VALUES (2, N'test-bai-2', N'news', N'detail', N'2', NULL)
INSERT [dbo].[router_config] ([id], [url], [controller], [action], [itemId], [actived]) VALUES (3, N'danh-muc-1', N'product', N'index', N'1', NULL)
INSERT [dbo].[router_config] ([id], [url], [controller], [action], [itemId], [actived]) VALUES (4, N'danh-muc-10', N'product', N'index', N'2', NULL)
INSERT [dbo].[router_config] ([id], [url], [controller], [action], [itemId], [actived]) VALUES (5, N'nhom-npk-cong-thuc', N'product', N'index', N'3', NULL)
INSERT [dbo].[router_config] ([id], [url], [controller], [action], [itemId], [actived]) VALUES (6, N'nhom-npk-chuyen-dung', N'product', N'index', N'4', NULL)
INSERT [dbo].[router_config] ([id], [url], [controller], [action], [itemId], [actived]) VALUES (7, N'nhom-nhan-hang-rieng', N'product', N'index', N'5', NULL)
INSERT [dbo].[router_config] ([id], [url], [controller], [action], [itemId], [actived]) VALUES (8, N'nhom-san-pham-huu-co', N'product', N'index', N'6', NULL)
INSERT [dbo].[router_config] ([id], [url], [controller], [action], [itemId], [actived]) VALUES (9, N'nhom-phan-phuc-hop', N'product', N'index', N'7', NULL)
INSERT [dbo].[router_config] ([id], [url], [controller], [action], [itemId], [actived]) VALUES (10, N'nhom-trung-vi-luong', N'product', N'index', N'8', NULL)
INSERT [dbo].[router_config] ([id], [url], [controller], [action], [itemId], [actived]) VALUES (11, N'nhom-phan-tuoi-goc-–-phan-bon-la', N'product', N'index', N'9', NULL)
INSERT [dbo].[router_config] ([id], [url], [controller], [action], [itemId], [actived]) VALUES (12, N'phan-bon-chuyen-dung', N'product', N'index', N'10', NULL)
INSERT [dbo].[router_config] ([id], [url], [controller], [action], [itemId], [actived]) VALUES (13, N'phan-bon-npk', N'product', N'index', N'11', NULL)
INSERT [dbo].[router_config] ([id], [url], [controller], [action], [itemId], [actived]) VALUES (14, N'cac-loai-phan-bon-khac', N'product', N'index', N'12', NULL)
INSERT [dbo].[router_config] ([id], [url], [controller], [action], [itemId], [actived]) VALUES (15, N'phan-bon-sieu-tang-truong-mua-mua', N'product', N'detail', N'1', NULL)
INSERT [dbo].[router_config] ([id], [url], [controller], [action], [itemId], [actived]) VALUES (16, N'npk-lon-trai', N'product', N'detail', N'2', NULL)
INSERT [dbo].[router_config] ([id], [url], [controller], [action], [itemId], [actived]) VALUES (17, N'npk-chac-hat', N'product', N'detail', N'3', NULL)
INSERT [dbo].[router_config] ([id], [url], [controller], [action], [itemId], [actived]) VALUES (18, N'nutri-max-dung-cho-ca-phe-ho-tieu', N'product', N'detail', N'4', NULL)
INSERT [dbo].[router_config] ([id], [url], [controller], [action], [itemId], [actived]) VALUES (19, N'phan-bon-chuyen-tieu', N'product', N'detail', N'5', NULL)
INSERT [dbo].[router_config] ([id], [url], [controller], [action], [itemId], [actived]) VALUES (20, N'cao-nguyen-xanh', N'product', N'detail', N'6', NULL)
INSERT [dbo].[router_config] ([id], [url], [controller], [action], [itemId], [actived]) VALUES (21, N'phan-bon-npk-', N'product', N'detail', N'7', NULL)
INSERT [dbo].[router_config] ([id], [url], [controller], [action], [itemId], [actived]) VALUES (22, N'phan-vi-luong-bon-re-mua-mua', N'product', N'detail', N'8', NULL)
INSERT [dbo].[router_config] ([id], [url], [controller], [action], [itemId], [actived]) VALUES (23, N'u-s-a-dung-cho-ca-phe-ho-tieu', N'product', N'detail', N'9', NULL)
INSERT [dbo].[router_config] ([id], [url], [controller], [action], [itemId], [actived]) VALUES (24, N'nutri-one-mua-mua', N'product', N'detail', N'10', NULL)
INSERT [dbo].[router_config] ([id], [url], [controller], [action], [itemId], [actived]) VALUES (25, N'nutri-max-dung-cho-cao-su', N'product', N'detail', N'11', NULL)
INSERT [dbo].[router_config] ([id], [url], [controller], [action], [itemId], [actived]) VALUES (26, N'phan-bon-nutri-max', N'product', N'detail', N'12', NULL)
INSERT [dbo].[router_config] ([id], [url], [controller], [action], [itemId], [actived]) VALUES (27, N'best-sum-dung-cho-ca-phe-ho-tieu', N'product', N'detail', N'13', NULL)
INSERT [dbo].[router_config] ([id], [url], [controller], [action], [itemId], [actived]) VALUES (28, N'phan-bon-nutri-bank-chuyen-dung-cho-ca-phe-ho-tieu', N'product', N'detail', N'14', NULL)
INSERT [dbo].[router_config] ([id], [url], [controller], [action], [itemId], [actived]) VALUES (29, N'phan-bon-nuti-good-chuyen-dung-cho-ca-phe-ho-tieu', N'product', N'detail', N'15', NULL)
INSERT [dbo].[router_config] ([id], [url], [controller], [action], [itemId], [actived]) VALUES (30, N'phan-bon-usa-chuyen-dung-cho-ca-phe-ho-tieu', N'product', N'detail', N'16', NULL)
INSERT [dbo].[router_config] ([id], [url], [controller], [action], [itemId], [actived]) VALUES (31, N'phan-vi-luong-bon-re-mua-kho', N'product', N'detail', N'17', NULL)
INSERT [dbo].[router_config] ([id], [url], [controller], [action], [itemId], [actived]) VALUES (32, N've-cong-ty', N'news', N'detail', N'3', NULL)
INSERT [dbo].[router_config] ([id], [url], [controller], [action], [itemId], [actived]) VALUES (33, N'trong-ca-rot-cu-to-deu-tam-tap-nha-nong-cam-giang-thu-tien-ty', N'news', N'detail', N'4', NULL)
INSERT [dbo].[router_config] ([id], [url], [controller], [action], [itemId], [actived]) VALUES (34, N'xon-xao-dua-vuon-dau-tay-3000m²-chin-do-mong-ve-ngay-giua-thu-do', N'news', N'detail', N'5', NULL)
INSERT [dbo].[router_config] ([id], [url], [controller], [action], [itemId], [actived]) VALUES (35, N'ky-thuat-trong-cay-cam-xoan-nang-suat-thu-hoach-cao', N'news', N'detail', N'6', NULL)
INSERT [dbo].[router_config] ([id], [url], [controller], [action], [itemId], [actived]) VALUES (36, N'ky-thuat-trong-ca-phe-xanh-lun-nang-suat-cao-o-tay-nguyen', N'news', N'detail', N'7', NULL)
INSERT [dbo].[router_config] ([id], [url], [controller], [action], [itemId], [actived]) VALUES (37, N'cam-nang-nha-nong', N'news', N'index', N'8', NULL)
INSERT [dbo].[router_config] ([id], [url], [controller], [action], [itemId], [actived]) VALUES (38, N'tin-tuc', N'news', N'index', N'5', NULL)
INSERT [dbo].[router_config] ([id], [url], [controller], [action], [itemId], [actived]) VALUES (39, N'gioi-thieu', N'news', N'index', N'2', NULL)
INSERT [dbo].[router_config] ([id], [url], [controller], [action], [itemId], [actived]) VALUES (40, N'hoi-dap', N'news', N'index', N'7', NULL)
INSERT [dbo].[router_config] ([id], [url], [controller], [action], [itemId], [actived]) VALUES (41, N'hop-tac', N'news', N'index', N'3', NULL)
INSERT [dbo].[router_config] ([id], [url], [controller], [action], [itemId], [actived]) VALUES (42, N'tuyen-dung', N'news', N'index', N'6', NULL)
SET IDENTITY_INSERT [dbo].[router_config] OFF
SET IDENTITY_INSERT [dbo].[user_group] ON 

INSERT [dbo].[user_group] ([id], [name], [active], [permission]) VALUES (1, N'Quản Trị', 1, NULL)
INSERT [dbo].[user_group] ([id], [name], [active], [permission]) VALUES (2, N'Người dùng', 1, NULL)
SET IDENTITY_INSERT [dbo].[user_group] OFF
SET IDENTITY_INSERT [dbo].[user_member] ON 

INSERT [dbo].[user_member] ([id], [username], [password_user], [fullname], [email], [phone], [address], [birthday], [active], [group_user], [datecreate]) VALUES (1, N'admin', N'40BD001563085FC35165329EA1FF5C5ECBDBBEEF', N'Admin', NULL, NULL, NULL, NULL, 1, 1, NULL)
SET IDENTITY_INSERT [dbo].[user_member] OFF
ALTER TABLE [dbo].[inbox]  WITH CHECK ADD  CONSTRAINT [FK_inbox_group_inbox] FOREIGN KEY([groupid])
REFERENCES [dbo].[group_inbox] ([id])
GO
ALTER TABLE [dbo].[inbox] CHECK CONSTRAINT [FK_inbox_group_inbox]
GO
ALTER TABLE [dbo].[menu]  WITH CHECK ADD  CONSTRAINT [FK_menu_menu_group] FOREIGN KEY([group_menu])
REFERENCES [dbo].[menu_group] ([id])
GO
ALTER TABLE [dbo].[menu] CHECK CONSTRAINT [FK_menu_menu_group]
GO
ALTER TABLE [dbo].[news]  WITH CHECK ADD  CONSTRAINT [FK_news_news_category] FOREIGN KEY([parent])
REFERENCES [dbo].[news_category] ([id])
GO
ALTER TABLE [dbo].[news] CHECK CONSTRAINT [FK_news_news_category]
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD  CONSTRAINT [FK_order_detail_order] FOREIGN KEY([idOrder])
REFERENCES [dbo].[order] ([id])
GO
ALTER TABLE [dbo].[order_detail] CHECK CONSTRAINT [FK_order_detail_order]
GO
ALTER TABLE [dbo].[picture]  WITH CHECK ADD  CONSTRAINT [FK_picture_picture_group] FOREIGN KEY([group_picture])
REFERENCES [dbo].[picture_group] ([id])
GO
ALTER TABLE [dbo].[picture] CHECK CONSTRAINT [FK_picture_picture_group]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_product_category] FOREIGN KEY([parent])
REFERENCES [dbo].[product_category] ([id])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_product_category]
GO
ALTER TABLE [dbo].[user_member]  WITH CHECK ADD  CONSTRAINT [FK_user_member_user_group] FOREIGN KEY([group_user])
REFERENCES [dbo].[user_group] ([id])
GO
ALTER TABLE [dbo].[user_member] CHECK CONSTRAINT [FK_user_member_user_group]
GO
