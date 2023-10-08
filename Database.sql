USE [ELearning]
GO
/****** Object:  FullTextCatalog [CourseSFT]    Script Date: 10/5/2023 11:02:51 PM ******/
CREATE FULLTEXT CATALOG [CourseSFT] WITH ACCENT_SENSITIVITY = ON
GO
/****** Object:  Table [dbo].[Category]    Script Date: 10/5/2023 11:02:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(0,1) NOT NULL,
	[CategoryName] [nvarchar](100) NOT NULL,
 CONSTRAINT [Category_PK] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Certificate]    Script Date: 10/5/2023 11:02:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Certificate](
	[CertificateID] [int] IDENTITY(0,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Satus] [nvarchar](100) NULL,
 CONSTRAINT [Certificate_PK] PRIMARY KEY CLUSTERED 
(
	[CertificateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Choice]    Script Date: 10/5/2023 11:02:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Choice](
	[ChoiceID] [int] NOT NULL,
	[QuizID] [int] NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[IsTrue] [bit] NOT NULL,
 CONSTRAINT [Choice_PK] PRIMARY KEY CLUSTERED 
(
	[ChoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Choices]    Script Date: 10/5/2023 11:02:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Choices](
	[ChoiceID] [int] IDENTITY(0,1) NOT NULL,
	[QuizID] [int] NOT NULL,
	[Description] [varchar](500) NOT NULL,
	[IsTrue] [bit] NOT NULL,
 CONSTRAINT [Choices_PK] PRIMARY KEY CLUSTERED 
(
	[ChoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 10/5/2023 11:02:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[CommentID] [int] IDENTITY(0,1) NOT NULL,
	[LessonID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[Content] [nvarchar](500) NOT NULL,
	[Like] [int] NOT NULL,
	[Dislike] [int] NOT NULL,
	[IsReply] [bit] NOT NULL,
	[Image] [nvarchar](100) NULL,
	[Status] [bit] NOT NULL,
	[CommentDate] [datetime] NULL,
 CONSTRAINT [Comment_PK] PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 10/5/2023 11:02:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[CourseID] [int] IDENTITY(0,1) NOT NULL,
	[UserID] [int] NULL,
	[CategoryID] [int] NOT NULL,
	[CourseImg] [nvarchar](500) NULL,
	[CourseName] [nvarchar](300) NOT NULL,
	[Publish] [date] NOT NULL,
	[Duration] [float] NULL,
	[Report] [nvarchar](500) NULL,
	[IsDiscontinued] [bit] NULL,
	[newVersionId] [int] NULL,
	[Description] [text] NOT NULL,
 CONSTRAINT [Course_PK] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enroll]    Script Date: 10/5/2023 11:02:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enroll](
	[UserID] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
	[Status] [bit] NOT NULL,
	[Progress] [int] NOT NULL,
	[DateEnroll] [date] NOT NULL,
 CONSTRAINT [Enroll_PK] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exam]    Script Date: 10/5/2023 11:02:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam](
	[ExamID] [int] NOT NULL,
	[ExamName] [nvarchar](300) NOT NULL,
	[CourseID] [int] NOT NULL,
	[Duration] [int] NOT NULL,
 CONSTRAINT [Exam_PK] PRIMARY KEY CLUSTERED 
(
	[ExamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExamDetail]    Script Date: 10/5/2023 11:02:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamDetail](
	[ExamDetailID] [int] IDENTITY(0,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[ExamID] [int] NOT NULL,
	[TimeStart] [datetime] NULL,
	[TimeEnd] [datetime] NOT NULL,
	[Status] [bit] NOT NULL,
	[Score] [float] NOT NULL,
 CONSTRAINT [ExamDetail_PK] PRIMARY KEY CLUSTERED 
(
	[ExamDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exams]    Script Date: 10/5/2023 11:02:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exams](
	[ExamID] [int] IDENTITY(0,1) NOT NULL,
	[ExamName] [varchar](100) NOT NULL,
	[CourseID] [int] NOT NULL,
	[Duration] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [Exams_PK] PRIMARY KEY CLUSTERED 
(
	[ExamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lessons]    Script Date: 10/5/2023 11:02:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lessons](
	[LessonID] [int] IDENTITY(0,1) NOT NULL,
	[LessonNumber] [int] NOT NULL,
	[LessonName] [nvarchar](300) NOT NULL,
	[MoocID] [int] NOT NULL,
	[LessonUrl] [nvarchar](300) NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
 CONSTRAINT [Lessons_PK] PRIMARY KEY CLUSTERED 
(
	[LessonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mooc]    Script Date: 10/5/2023 11:02:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mooc](
	[MoocID] [int] IDENTITY(0,1) NOT NULL,
	[MoocNumber] [int] NOT NULL,
	[MoocName] [nvarchar](400) NOT NULL,
	[CourseID] [int] NOT NULL,
 CONSTRAINT [Mooc_PK] PRIMARY KEY CLUSTERED 
(
	[MoocID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Progress]    Script Date: 10/5/2023 11:02:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Progress](
	[UserID] [int] NOT NULL,
	[LessonID] [int] NOT NULL,
	[MoocID] [int] NOT NULL,
	[State] [bit] NULL,
 CONSTRAINT [Progress_PK] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[LessonID] ASC,
	[MoocID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Progress2]    Script Date: 10/5/2023 11:02:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Progress2](
	[UserID] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
	[NumberLearned] [int] NOT NULL,
 CONSTRAINT [Progress2_PK] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quiz]    Script Date: 10/5/2023 11:02:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quiz](
	[QuizID] [int] IDENTITY(0,1) NOT NULL,
	[QuizContent] [nvarchar](1500) NOT NULL,
	[ExamID] [int] NOT NULL,
 CONSTRAINT [Quiz_PK] PRIMARY KEY CLUSTERED 
(
	[QuizID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reply]    Script Date: 10/5/2023 11:02:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reply](
	[ReplyID] [int] IDENTITY(0,1) NOT NULL,
	[CommentID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[Content] [nvarchar](500) NOT NULL,
	[DateReply] [datetime] NOT NULL,
	[Image] [nvarchar](100) NULL,
	[Status] [bit] NOT NULL,
	[Like] [varchar](100) NULL,
	[Dislike] [varchar](100) NULL,
 CONSTRAINT [Reply_PK] PRIMARY KEY CLUSTERED 
(
	[ReplyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 10/5/2023 11:02:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[ReviewID] [int] IDENTITY(0,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
	[Rating] [int] NULL,
	[Time] [datetime] NULL,
	[ReviewContent] [nvarchar](500) NULL,
	[isReport] [bit] NULL,
 CONSTRAINT [Review_PK] PRIMARY KEY CLUSTERED 
(
	[ReviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 10/5/2023 11:02:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(0,1) NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
 CONSTRAINT [Role_PK] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 10/5/2023 11:02:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(0,1) NOT NULL,
	[FullName] [nvarchar](200) NOT NULL,
	[DateOrBirth] [date] NULL,
	[Email] [nvarchar](200) NOT NULL,
	[Password] [nvarchar](500) NULL,
	[Phone] [varchar](100) NULL,
	[Address] [nvarchar](300) NULL,
	[Gender] [bit] NULL,
	[RoleID] [int] NOT NULL,
	[Reason] [nvarchar](500) NULL,
	[TimeBan] [date] NULL,
	[Avatar] [nvarchar](400) NULL,
	[isVerify] [bit] NOT NULL,
 CONSTRAINT [User_PK] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserChoice]    Script Date: 10/5/2023 11:02:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserChoice](
	[UserChoiceID] [int] NOT NULL,
	[ExamDetailID] [int] NOT NULL,
	[ChoiceID] [int] NOT NULL,
 CONSTRAINT [UserChoice_PK] PRIMARY KEY CLUSTERED 
(
	[UserChoiceID] ASC,
	[ChoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserReaction]    Script Date: 10/5/2023 11:02:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserReaction](
	[UserID] [int] NOT NULL,
	[CommentID] [int] NOT NULL,
	[isLike] [bit] NOT NULL,
	[isDisLike] [bit] NOT NULL,
 CONSTRAINT [UserReaction_PK] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (0, N'Programing')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (1, N'Cooking')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (2, N'Marketing')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (3, N'Economic')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (4, N'English')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Choices] ON 

INSERT [dbo].[Choices] ([ChoiceID], [QuizID], [Description], [IsTrue]) VALUES (1, 3, N'To understand why a user would want to use a product or service at all.', 1)
INSERT [dbo].[Choices] ([ChoiceID], [QuizID], [Description], [IsTrue]) VALUES (2, 3, N'To test whether one version of a product or service is better than another.', 0)
INSERT [dbo].[Choices] ([ChoiceID], [QuizID], [Description], [IsTrue]) VALUES (3, 3, N'To learn how users actually use a product or service.', 0)
INSERT [dbo].[Choices] ([ChoiceID], [QuizID], [Description], [IsTrue]) VALUES (4, 3, N'To see what problems users have when using a product or service.', 0)
INSERT [dbo].[Choices] ([ChoiceID], [QuizID], [Description], [IsTrue]) VALUES (5, 4, N'Conducting interviews about how people use Excel  spreadsheets', 1)
INSERT [dbo].[Choices] ([ChoiceID], [QuizID], [Description], [IsTrue]) VALUES (6, 4, N'Analyzing statistical data about visits to Amazon', 0)
INSERT [dbo].[Choices] ([ChoiceID], [QuizID], [Description], [IsTrue]) VALUES (7, 4, N'Writing software to classify user posts on Facebook', 0)
INSERT [dbo].[Choices] ([ChoiceID], [QuizID], [Description], [IsTrue]) VALUES (8, 4, N'Running an experimental trial to see if users like Google with banner ads', 0)
INSERT [dbo].[Choices] ([ChoiceID], [QuizID], [Description], [IsTrue]) VALUES (9, 5, N'Qualitative research generates hypotheses that can be verified with quantitative research. ', 1)
INSERT [dbo].[Choices] ([ChoiceID], [QuizID], [Description], [IsTrue]) VALUES (10, 5, N'Qualitative research offers potential explanations for outcomes from quantitative research. ', 0)
INSERT [dbo].[Choices] ([ChoiceID], [QuizID], [Description], [IsTrue]) VALUES (11, 5, N'Qualitative research tends to provide close-up, in-depth description while quantitative research tends to provide aggregate, large-scale description', 0)
INSERT [dbo].[Choices] ([ChoiceID], [QuizID], [Description], [IsTrue]) VALUES (12, 5, N'Running an experimental trial to see if users like Google with banne', 0)
INSERT [dbo].[Choices] ([ChoiceID], [QuizID], [Description], [IsTrue]) VALUES (13, 6, N'alk about what other participants have been saying', 1)
INSERT [dbo].[Choices] ([ChoiceID], [QuizID], [Description], [IsTrue]) VALUES (14, 6, N'Make small talk at first.', 0)
INSERT [dbo].[Choices] ([ChoiceID], [QuizID], [Description], [IsTrue]) VALUES (15, 6, N'Listen and observe how they respond.', 0)
INSERT [dbo].[Choices] ([ChoiceID], [QuizID], [Description], [IsTrue]) VALUES (16, 6, N'Adopt a learning mindset.', 0)
INSERT [dbo].[Choices] ([ChoiceID], [QuizID], [Description], [IsTrue]) VALUES (17, 7, N'Golf, because negative events can affect your performance.', 1)
INSERT [dbo].[Choices] ([ChoiceID], [QuizID], [Description], [IsTrue]) VALUES (18, 7, N'Driving, because you have to navigate adversarial situations.', 0)
INSERT [dbo].[Choices] ([ChoiceID], [QuizID], [Description], [IsTrue]) VALUES (19, 7, N'Playing jazz, because improvisation is required.', 0)
INSERT [dbo].[Choices] ([ChoiceID], [QuizID], [Description], [IsTrue]) VALUES (20, 7, N'Running a marathon, because it is exhausting.', 0)
SET IDENTITY_INSERT [dbo].[Choices] OFF
GO
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([CommentID], [LessonID], [UserID], [Content], [Like], [Dislike], [IsReply], [Image], [Status], [CommentDate]) VALUES (1, 0, 1, N'Co ai biet lam cach nao khac khong', 1, 3, 1, NULL, 0, CAST(N'2023-08-18T21:22:55.000' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [LessonID], [UserID], [Content], [Like], [Dislike], [IsReply], [Image], [Status], [CommentDate]) VALUES (42, 0, 1, N'Cau nay lam nhu vao vay cac ban', 23, 3, 0, N'', 0, CAST(N'2023-09-30T23:33:16.933' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [LessonID], [UserID], [Content], [Like], [Dislike], [IsReply], [Image], [Status], [CommentDate]) VALUES (44, 1, 1, N'test2', 0, 1, 0, N'', 0, CAST(N'2023-09-30T23:46:41.260' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [LessonID], [UserID], [Content], [Like], [Dislike], [IsReply], [Image], [Status], [CommentDate]) VALUES (51, 1, 1, N'chao mug den voi website', 1, 0, 1, N'', 0, CAST(N'2023-10-02T10:45:07.313' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [LessonID], [UserID], [Content], [Like], [Dislike], [IsReply], [Image], [Status], [CommentDate]) VALUES (54, 0, 2, N'chao mung moi nguoi den voi chung toi', 8, 5, 0, N'', 0, CAST(N'2023-10-02T11:10:03.327' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [LessonID], [UserID], [Content], [Like], [Dislike], [IsReply], [Image], [Status], [CommentDate]) VALUES (59, 0, 1, N'chuc mung nhe', 1, 4, 1, N'', 0, CAST(N'2023-10-02T20:27:28.837' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [LessonID], [UserID], [Content], [Like], [Dislike], [IsReply], [Image], [Status], [CommentDate]) VALUES (61, 0, 2, N'Doan nay co khi lam nhu nay khong biet co dung khong nhi', 20, 0, 0, N'', 0, CAST(N'2023-10-03T12:12:20.777' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [LessonID], [UserID], [Content], [Like], [Dislike], [IsReply], [Image], [Status], [CommentDate]) VALUES (62, 0, 2, N'Cau nay kho qua ai biet co cach giai nao khac khong ?', 1, 1, 0, N'', 0, CAST(N'2023-10-03T22:54:11.447' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [LessonID], [UserID], [Content], [Like], [Dislike], [IsReply], [Image], [Status], [CommentDate]) VALUES (65, 0, 0, N'Video dai qua xem khong biet den bao gio moi xong day', 0, 0, 1, N'', 0, CAST(N'2023-10-04T11:32:09.207' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [LessonID], [UserID], [Content], [Like], [Dislike], [IsReply], [Image], [Status], [CommentDate]) VALUES (66, 0, 0, N'Căn cứ vào các di tích khảo cổ thời Hùng Vương từ Phùng Nguyên đến Đông Sơn ta thấy không những về mặt không gian có sự mở rộng dần và tập trung ở những vùng đồng bằng ven các con sông lớn Bắc bộ, Bắc Trung bộ mà các khu cư trú thường rộng lớn từ hàng nghìn mét vuông cho đến một và', 1, 0, 1, N'', 0, CAST(N'2023-10-04T11:55:47.500' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [LessonID], [UserID], [Content], [Like], [Dislike], [IsReply], [Image], [Status], [CommentDate]) VALUES (67, 0, 0, N'Sau cuộc chiến Việt Nam (1955-1975) với phần thắng nghiêng về Quân đội Giải Phóng Việt Nam, Chính phủ Tổng thống Dương Văn Minh của Việt Nam Cộng Hòa đầu hàng, đất nước Việt Nam được thống nhất', 1, -1, 1, N'', 0, CAST(N'2023-10-04T12:03:24.090' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [LessonID], [UserID], [Content], [Like], [Dislike], [IsReply], [Image], [Status], [CommentDate]) VALUES (68, 0, 0, N'hi', 8, 1, 1, N'', 0, CAST(N'2023-10-04T13:03:30.200' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [LessonID], [UserID], [Content], [Like], [Dislike], [IsReply], [Image], [Status], [CommentDate]) VALUES (71, 0, 0, N'HI', 0, 0, 1, N'', 0, CAST(N'2023-10-05T20:36:40.037' AS DateTime))
SET IDENTITY_INSERT [dbo].[Comment] OFF
GO
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([CourseID], [UserID], [CategoryID], [CourseImg], [CourseName], [Publish], [Duration], [Report], [IsDiscontinued], [newVersionId], [Description]) VALUES (0, 0, 0, N'java.jpg', N'Head First Java by Kathy Sierra &', CAST(N'2023-09-01' AS Date), 2, NULL, NULL, NULL, N'Java is a widely-used programming language for coding web applications. It has been a popular choice among developers for over two decades, with millions of Java applications in use today. Java is a multi-platform, object-oriented, and network-centric language that can be used as a platform in itself.')
INSERT [dbo].[Course] ([CourseID], [UserID], [CategoryID], [CourseImg], [CourseName], [Publish], [Duration], [Report], [IsDiscontinued], [newVersionId], [Description]) VALUES (2, 1, 1, N'.net.jpg', N'Cooking begin', CAST(N'2023-01-16' AS Date), 3, NULL, NULL, NULL, N'Day la sach hoc nau an')
INSERT [dbo].[Course] ([CourseID], [UserID], [CategoryID], [CourseImg], [CourseName], [Publish], [Duration], [Report], [IsDiscontinued], [newVersionId], [Description]) VALUES (3, 2, 3, N'css.png', N'Kinh te hoc', CAST(N'2023-01-19' AS Date), 2, NULL, NULL, NULL, N'day la sach hoc ve kinh te')
INSERT [dbo].[Course] ([CourseID], [UserID], [CategoryID], [CourseImg], [CourseName], [Publish], [Duration], [Report], [IsDiscontinued], [newVersionId], [Description]) VALUES (4, 2, 2, N'c++.jpg', N'HTML AND CSS', CAST(N'2023-08-19' AS Date), 5, NULL, NULL, NULL, N'day la khoa hoc ve front end css html')
INSERT [dbo].[Course] ([CourseID], [UserID], [CategoryID], [CourseImg], [CourseName], [Publish], [Duration], [Report], [IsDiscontinued], [newVersionId], [Description]) VALUES (5, 1, 1, N'python.jpg', N'Cooking Master', CAST(N'2023-01-29' AS Date), 3, NULL, NULL, NULL, N'day la khoa hoc day nau an nang cao')
INSERT [dbo].[Course] ([CourseID], [UserID], [CategoryID], [CourseImg], [CourseName], [Publish], [Duration], [Report], [IsDiscontinued], [newVersionId], [Description]) VALUES (6, 6, 4, N'.net.jpg', N'EngLish For Begin', CAST(N'2023-02-22' AS Date), 7.8, NULL, NULL, NULL, N'Khoa hoc tieng anh gianh cho nguoi bat dau')
SET IDENTITY_INSERT [dbo].[Course] OFF
GO
INSERT [dbo].[Enroll] ([UserID], [CourseID], [Status], [Progress], [DateEnroll]) VALUES (0, 0, 0, 55, CAST(N'2023-02-01' AS Date))
INSERT [dbo].[Enroll] ([UserID], [CourseID], [Status], [Progress], [DateEnroll]) VALUES (0, 2, 0, 89, CAST(N'2023-05-27' AS Date))
INSERT [dbo].[Enroll] ([UserID], [CourseID], [Status], [Progress], [DateEnroll]) VALUES (0, 3, 0, 22, CAST(N'2022-05-19' AS Date))
INSERT [dbo].[Enroll] ([UserID], [CourseID], [Status], [Progress], [DateEnroll]) VALUES (1, 2, 0, 0, CAST(N'2023-02-16' AS Date))
INSERT [dbo].[Enroll] ([UserID], [CourseID], [Status], [Progress], [DateEnroll]) VALUES (1, 4, 0, 34, CAST(N'2023-08-18' AS Date))
INSERT [dbo].[Enroll] ([UserID], [CourseID], [Status], [Progress], [DateEnroll]) VALUES (1, 5, 0, 50, CAST(N'2023-11-20' AS Date))
INSERT [dbo].[Enroll] ([UserID], [CourseID], [Status], [Progress], [DateEnroll]) VALUES (2, 0, 0, 22, CAST(N'2022-12-31' AS Date))
INSERT [dbo].[Enroll] ([UserID], [CourseID], [Status], [Progress], [DateEnroll]) VALUES (2, 3, 0, 12, CAST(N'2022-12-13' AS Date))
GO
SET IDENTITY_INSERT [dbo].[ExamDetail] ON 

INSERT [dbo].[ExamDetail] ([ExamDetailID], [UserID], [ExamID], [TimeStart], [TimeEnd], [Status], [Score]) VALUES (3, 0, 0, CAST(N'2023-02-02T02:12:44.000' AS DateTime), CAST(N'2023-02-02T23:22:22.000' AS DateTime), 0, 75.52)
INSERT [dbo].[ExamDetail] ([ExamDetailID], [UserID], [ExamID], [TimeStart], [TimeEnd], [Status], [Score]) VALUES (7, 0, 0, CAST(N'2023-01-31T12:44:22.000' AS DateTime), CAST(N'2023-09-14T04:12:44.000' AS DateTime), 0, 20.3)
INSERT [dbo].[ExamDetail] ([ExamDetailID], [UserID], [ExamID], [TimeStart], [TimeEnd], [Status], [Score]) VALUES (8, 0, 0, CAST(N'2011-01-01T12:32:11.000' AS DateTime), CAST(N'2023-01-29T17:22:11.000' AS DateTime), 0, 45.62)
INSERT [dbo].[ExamDetail] ([ExamDetailID], [UserID], [ExamID], [TimeStart], [TimeEnd], [Status], [Score]) VALUES (10, 0, 0, CAST(N'2023-10-01T14:15:55.093' AS DateTime), CAST(N'2023-10-01T14:15:55.093' AS DateTime), 0, 34.11)
INSERT [dbo].[ExamDetail] ([ExamDetailID], [UserID], [ExamID], [TimeStart], [TimeEnd], [Status], [Score]) VALUES (11, 0, 0, CAST(N'2023-10-01T14:16:38.203' AS DateTime), CAST(N'2023-10-01T14:16:38.203' AS DateTime), 1, 90)
INSERT [dbo].[ExamDetail] ([ExamDetailID], [UserID], [ExamID], [TimeStart], [TimeEnd], [Status], [Score]) VALUES (13, 0, 0, CAST(N'2023-10-02T01:30:00.910' AS DateTime), CAST(N'2023-10-02T01:30:00.910' AS DateTime), 1, 80)
INSERT [dbo].[ExamDetail] ([ExamDetailID], [UserID], [ExamID], [TimeStart], [TimeEnd], [Status], [Score]) VALUES (14, 0, 0, CAST(N'2023-10-03T15:15:06.420' AS DateTime), CAST(N'2023-10-03T15:15:06.420' AS DateTime), 0, 60)
INSERT [dbo].[ExamDetail] ([ExamDetailID], [UserID], [ExamID], [TimeStart], [TimeEnd], [Status], [Score]) VALUES (15, 0, 0, CAST(N'2023-10-03T15:17:02.030' AS DateTime), CAST(N'2023-10-03T15:17:02.030' AS DateTime), 1, 100)
INSERT [dbo].[ExamDetail] ([ExamDetailID], [UserID], [ExamID], [TimeStart], [TimeEnd], [Status], [Score]) VALUES (16, 0, 0, CAST(N'2023-10-03T15:21:43.323' AS DateTime), CAST(N'2023-10-03T15:21:43.323' AS DateTime), 0, 20)
INSERT [dbo].[ExamDetail] ([ExamDetailID], [UserID], [ExamID], [TimeStart], [TimeEnd], [Status], [Score]) VALUES (17, 0, 0, CAST(N'2023-10-03T15:23:00.587' AS DateTime), CAST(N'2023-10-03T15:23:00.587' AS DateTime), 0, 0)
INSERT [dbo].[ExamDetail] ([ExamDetailID], [UserID], [ExamID], [TimeStart], [TimeEnd], [Status], [Score]) VALUES (18, 0, 0, CAST(N'2023-10-05T16:44:55.000' AS DateTime), CAST(N'2023-10-05T16:44:55.000' AS DateTime), 0, 60)
SET IDENTITY_INSERT [dbo].[ExamDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Exams] ON 

INSERT [dbo].[Exams] ([ExamID], [ExamName], [CourseID], [Duration], [Quantity]) VALUES (0, N'Java Core For Begin Student', 0, 19, 20)
INSERT [dbo].[Exams] ([ExamID], [ExamName], [CourseID], [Duration], [Quantity]) VALUES (1, N'Java OOP 2 For Begin Student', 0, 25, 15)
SET IDENTITY_INSERT [dbo].[Exams] OFF
GO
SET IDENTITY_INSERT [dbo].[Lessons] ON 

INSERT [dbo].[Lessons] ([LessonID], [LessonNumber], [LessonName], [MoocID], [LessonUrl], [Description]) VALUES (0, 1, N'How to install the environment', 0, N'PKkKCv7Lno0', N'cach de cai dat moi truong')
INSERT [dbo].[Lessons] ([LessonID], [LessonNumber], [LessonName], [MoocID], [LessonUrl], [Description]) VALUES (1, 2, N'How to install and run netbean environment', 0, N'LaQvccaXi-E', N'cach de chay netbean')
INSERT [dbo].[Lessons] ([LessonID], [LessonNumber], [LessonName], [MoocID], [LessonUrl], [Description]) VALUES (2, 3, N'how to install java 1.8', 1, N'VOww8yPUcJE', N'chay java')
INSERT [dbo].[Lessons] ([LessonID], [LessonNumber], [LessonName], [MoocID], [LessonUrl], [Description]) VALUES (3, 4, N'how to install java 1.20', 1, N'PWbsH2q8g3c', N'java 1.20')
INSERT [dbo].[Lessons] ([LessonID], [LessonNumber], [LessonName], [MoocID], [LessonUrl], [Description]) VALUES (4, 5, N'Int String Boolean', 2, N'YmXTeuw_-8o', N'var')
INSERT [dbo].[Lessons] ([LessonID], [LessonNumber], [LessonName], [MoocID], [LessonUrl], [Description]) VALUES (5, 7, N'Servlet', 3, N'R1e83SdO8nw', N'serlvet jsp')
INSERT [dbo].[Lessons] ([LessonID], [LessonNumber], [LessonName], [MoocID], [LessonUrl], [Description]) VALUES (6, 1, N'JAVAAA', 4, N'HQiharwG4kI', N'java')
INSERT [dbo].[Lessons] ([LessonID], [LessonNumber], [LessonName], [MoocID], [LessonUrl], [Description]) VALUES (7, 6, N'JSP JSLT', 2, N'PKkKCv7Lno0', N'jsp')
INSERT [dbo].[Lessons] ([LessonID], [LessonNumber], [LessonName], [MoocID], [LessonUrl], [Description]) VALUES (8, 2, N'python', 4, N'PKkKCv7Lno0', N'python')
SET IDENTITY_INSERT [dbo].[Lessons] OFF
GO
SET IDENTITY_INSERT [dbo].[Mooc] ON 

INSERT [dbo].[Mooc] ([MoocID], [MoocNumber], [MoocName], [CourseID]) VALUES (0, 1, N'Introduction to the Java programming', 0)
INSERT [dbo].[Mooc] ([MoocID], [MoocNumber], [MoocName], [CourseID]) VALUES (1, 2, N'Learn about variables in java', 0)
INSERT [dbo].[Mooc] ([MoocID], [MoocNumber], [MoocName], [CourseID]) VALUES (2, 3, N'Learn about Java OOP', 0)
INSERT [dbo].[Mooc] ([MoocID], [MoocNumber], [MoocName], [CourseID]) VALUES (3, 4, N'Introduction to Servlets and Jsp/Jstl', 0)
INSERT [dbo].[Mooc] ([MoocID], [MoocNumber], [MoocName], [CourseID]) VALUES (4, 1, N'Dotnet', 2)
SET IDENTITY_INSERT [dbo].[Mooc] OFF
GO
INSERT [dbo].[Progress] ([UserID], [LessonID], [MoocID], [State]) VALUES (0, 0, 0, 1)
INSERT [dbo].[Progress] ([UserID], [LessonID], [MoocID], [State]) VALUES (0, 1, 0, 0)
INSERT [dbo].[Progress] ([UserID], [LessonID], [MoocID], [State]) VALUES (1, 0, 0, 1)
INSERT [dbo].[Progress] ([UserID], [LessonID], [MoocID], [State]) VALUES (1, 6, 0, 0)
GO
INSERT [dbo].[Progress2] ([UserID], [CourseID], [NumberLearned]) VALUES (0, 0, 29)
GO
SET IDENTITY_INSERT [dbo].[Quiz] ON 

INSERT [dbo].[Quiz] ([QuizID], [QuizContent], [ExamID]) VALUES (3, N'Which of the following is NOT a reason to conduct a user needs assessment?', 0)
INSERT [dbo].[Quiz] ([QuizID], [QuizContent], [ExamID]) VALUES (4, N'At what point in a product or service''s life-cycle should one conduct a user needs assessment? ', 0)
INSERT [dbo].[Quiz] ([QuizID], [QuizContent], [ExamID]) VALUES (5, N'Which of the following steps will you be learning about in this user needs assessment course? ', 0)
INSERT [dbo].[Quiz] ([QuizID], [QuizContent], [ExamID]) VALUES (6, N'What of the following tasks is most representative of the kind of work involved in qualitative research?', 0)
INSERT [dbo].[Quiz] ([QuizID], [QuizContent], [ExamID]) VALUES (7, N'Who of the following describes potential relationships between qualitative and quantitative research? ', 0)
SET IDENTITY_INSERT [dbo].[Quiz] OFF
GO
SET IDENTITY_INSERT [dbo].[Reply] ON 

INSERT [dbo].[Reply] ([ReplyID], [CommentID], [UserID], [Content], [DateReply], [Image], [Status], [Like], [Dislike]) VALUES (0, 1, 5, N'Khong biet', CAST(N'2023-03-02T12:00:23.000' AS DateTime), NULL, 0, N'2', N'0')
INSERT [dbo].[Reply] ([ReplyID], [CommentID], [UserID], [Content], [DateReply], [Image], [Status], [Like], [Dislike]) VALUES (1, 1, 6, N'Toi biet do ', CAST(N'2023-09-12T22:22:22.000' AS DateTime), NULL, 0, N'1', N'1')
INSERT [dbo].[Reply] ([ReplyID], [CommentID], [UserID], [Content], [DateReply], [Image], [Status], [Like], [Dislike]) VALUES (2, 1, 2, N'1+1=2', CAST(N'2023-10-05T01:01:59.537' AS DateTime), N'', 0, N'0', N'0')
INSERT [dbo].[Reply] ([ReplyID], [CommentID], [UserID], [Content], [DateReply], [Image], [Status], [Like], [Dislike]) VALUES (3, 68, 1, N'test0', CAST(N'2023-10-05T01:55:26.053' AS DateTime), N'', 0, N'0', N'0')
INSERT [dbo].[Reply] ([ReplyID], [CommentID], [UserID], [Content], [DateReply], [Image], [Status], [Like], [Dislike]) VALUES (4, 67, 2, N'test1', CAST(N'2023-10-05T10:33:22.047' AS DateTime), N'', 0, N'0', N'0')
INSERT [dbo].[Reply] ([ReplyID], [CommentID], [UserID], [Content], [DateReply], [Image], [Status], [Like], [Dislike]) VALUES (5, 67, 0, N'test2', CAST(N'2023-10-05T10:34:13.927' AS DateTime), N'', 0, N'0', N'0')
INSERT [dbo].[Reply] ([ReplyID], [CommentID], [UserID], [Content], [DateReply], [Image], [Status], [Like], [Dislike]) VALUES (6, 67, 1, N'test3', CAST(N'2023-10-05T10:36:29.220' AS DateTime), N'', 0, N'0', N'0')
INSERT [dbo].[Reply] ([ReplyID], [CommentID], [UserID], [Content], [DateReply], [Image], [Status], [Like], [Dislike]) VALUES (7, 67, 2, N'test4', CAST(N'2023-10-05T10:42:47.913' AS DateTime), N'', 0, N'0', N'0')
INSERT [dbo].[Reply] ([ReplyID], [CommentID], [UserID], [Content], [DateReply], [Image], [Status], [Like], [Dislike]) VALUES (8, 67, 1, N'test5', CAST(N'2023-10-05T12:32:40.640' AS DateTime), N'', 0, N'0', N'0')
INSERT [dbo].[Reply] ([ReplyID], [CommentID], [UserID], [Content], [DateReply], [Image], [Status], [Like], [Dislike]) VALUES (9, 67, 0, N'test5', CAST(N'2023-10-05T12:33:38.943' AS DateTime), N'', 0, N'0', N'0')
INSERT [dbo].[Reply] ([ReplyID], [CommentID], [UserID], [Content], [DateReply], [Image], [Status], [Like], [Dislike]) VALUES (25, 68, 0, N'8', CAST(N'2023-10-05T14:20:07.253' AS DateTime), N'', 0, N'0', N'0')
INSERT [dbo].[Reply] ([ReplyID], [CommentID], [UserID], [Content], [DateReply], [Image], [Status], [Like], [Dislike]) VALUES (50, 68, 0, N'test1', CAST(N'2023-10-05T16:55:38.260' AS DateTime), N'', 0, N'0', N'0')
INSERT [dbo].[Reply] ([ReplyID], [CommentID], [UserID], [Content], [DateReply], [Image], [Status], [Like], [Dislike]) VALUES (51, 68, 0, N'test2', CAST(N'2023-10-05T17:10:13.500' AS DateTime), N'', 0, N'0', N'0')
INSERT [dbo].[Reply] ([ReplyID], [CommentID], [UserID], [Content], [DateReply], [Image], [Status], [Like], [Dislike]) VALUES (52, 68, 0, N'test2', CAST(N'2023-10-05T17:20:33.390' AS DateTime), N'', 0, N'0', N'0')
INSERT [dbo].[Reply] ([ReplyID], [CommentID], [UserID], [Content], [DateReply], [Image], [Status], [Like], [Dislike]) VALUES (53, 67, 0, N'1', CAST(N'2023-10-05T17:22:44.257' AS DateTime), N'', 0, N'0', N'0')
INSERT [dbo].[Reply] ([ReplyID], [CommentID], [UserID], [Content], [DateReply], [Image], [Status], [Like], [Dislike]) VALUES (54, 67, 0, N'duc', CAST(N'2023-10-05T17:35:48.430' AS DateTime), N'', 0, N'0', N'0')
INSERT [dbo].[Reply] ([ReplyID], [CommentID], [UserID], [Content], [DateReply], [Image], [Status], [Like], [Dislike]) VALUES (55, 66, 0, N'1', CAST(N'2023-10-05T17:37:39.157' AS DateTime), N'', 0, N'0', N'0')
INSERT [dbo].[Reply] ([ReplyID], [CommentID], [UserID], [Content], [DateReply], [Image], [Status], [Like], [Dislike]) VALUES (56, 65, 0, N'1', CAST(N'2023-10-05T17:43:24.303' AS DateTime), N'', 0, N'0', N'0')
INSERT [dbo].[Reply] ([ReplyID], [CommentID], [UserID], [Content], [DateReply], [Image], [Status], [Like], [Dislike]) VALUES (57, 59, 0, N'21', CAST(N'2023-10-05T17:55:33.597' AS DateTime), N'', 0, N'0', N'0')
INSERT [dbo].[Reply] ([ReplyID], [CommentID], [UserID], [Content], [DateReply], [Image], [Status], [Like], [Dislike]) VALUES (58, 71, 0, N'p', CAST(N'2023-10-05T20:49:24.677' AS DateTime), N'', 0, N'0', N'0')
SET IDENTITY_INSERT [dbo].[Reply] OFF
GO
SET IDENTITY_INSERT [dbo].[Review] ON 

INSERT [dbo].[Review] ([ReviewID], [UserID], [CourseID], [Rating], [Time], [ReviewContent], [isReport]) VALUES (0, 0, 0, 4, CAST(N'2022-02-02T00:00:00.000' AS DateTime), N'This is great course', 0)
INSERT [dbo].[Review] ([ReviewID], [UserID], [CourseID], [Rating], [Time], [ReviewContent], [isReport]) VALUES (1, 1, 0, 5, CAST(N'2023-05-12T00:00:00.000' AS DateTime), N'This is a good and very useful course. I recommend taking this course', 0)
INSERT [dbo].[Review] ([ReviewID], [UserID], [CourseID], [Rating], [Time], [ReviewContent], [isReport]) VALUES (2, 2, 0, 1, CAST(N'2023-01-20T00:00:00.000' AS DateTime), N'This is not a suitable course for me because the way the course is organized has many problems', 0)
SET IDENTITY_INSERT [dbo].[Review] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (0, N'User')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Teacher')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'Moderator')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (3, N'Admin')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [FullName], [DateOrBirth], [Email], [Password], [Phone], [Address], [Gender], [RoleID], [Reason], [TimeBan], [Avatar], [isVerify]) VALUES (0, N'Ngoc Duc Bui', CAST(N'2022-02-02' AS Date), N'duc@gmail.com', N'123', N'0123456789', N'Ha Noi', 1, 1, NULL, NULL, N'2.jpg', 1)
INSERT [dbo].[User] ([UserID], [FullName], [DateOrBirth], [Email], [Password], [Phone], [Address], [Gender], [RoleID], [Reason], [TimeBan], [Avatar], [isVerify]) VALUES (1, N'Nguyen Thị An', CAST(N'2012-09-14' AS Date), N'hi@gmail.com', N'123', N'1234567896', N'Ha Noi221', 1, 1, NULL, NULL, N'3.jpg', 0)
INSERT [dbo].[User] ([UserID], [FullName], [DateOrBirth], [Email], [Password], [Phone], [Address], [Gender], [RoleID], [Reason], [TimeBan], [Avatar], [isVerify]) VALUES (2, N'Tran Van Bo', CAST(N'2011-03-28' AS Date), N'ducbui0011@gmail.com', N'123456@', N'1234567891', N'Ha Noi', 0, 1, NULL, NULL, N'1.jpg', 1)
INSERT [dbo].[User] ([UserID], [FullName], [DateOrBirth], [Email], [Password], [Phone], [Address], [Gender], [RoleID], [Reason], [TimeBan], [Avatar], [isVerify]) VALUES (5, N'Ngoc Thi', NULL, N'duc2@gmail.com', NULL, NULL, NULL, 0, 0, NULL, NULL, N'1.jpg', 0)
INSERT [dbo].[User] ([UserID], [FullName], [DateOrBirth], [Email], [Password], [Phone], [Address], [Gender], [RoleID], [Reason], [TimeBan], [Avatar], [isVerify]) VALUES (6, N'Le Thi B', NULL, N'hoa@gmail.com', NULL, NULL, NULL, 0, 0, NULL, NULL, N'3.jpg', 1)
INSERT [dbo].[User] ([UserID], [FullName], [DateOrBirth], [Email], [Password], [Phone], [Address], [Gender], [RoleID], [Reason], [TimeBan], [Avatar], [isVerify]) VALUES (7, N'Bui Nguyen Ngoc Duc', NULL, N'52@fpt.edu.vn', NULL, NULL, NULL, 0, 0, NULL, NULL, N'ducbnnhe150352@fpt.edu.vn', 1)
INSERT [dbo].[User] ([UserID], [FullName], [DateOrBirth], [Email], [Password], [Phone], [Address], [Gender], [RoleID], [Reason], [TimeBan], [Avatar], [isVerify]) VALUES (8, N'Dex In', NULL, N'specialissndex01@gmail.com', NULL, NULL, NULL, 0, 0, NULL, NULL, N'specialindex01@gmail.com', 0)
INSERT [dbo].[User] ([UserID], [FullName], [DateOrBirth], [Email], [Password], [Phone], [Address], [Gender], [RoleID], [Reason], [TimeBan], [Avatar], [isVerify]) VALUES (9, N'Bui Nguyen Ngoc Duc', NULL, N'nnh22e150352@fpt.edu.vn', NULL, NULL, NULL, 1, 0, NULL, NULL, N'https://lh3.googleusercontent.com/a/ACg8ocJLXCjt-Ws0eljYjBnJj0yERxl97i_IJS0ksiKMuXmu=s96-c', 1)
INSERT [dbo].[User] ([UserID], [FullName], [DateOrBirth], [Email], [Password], [Phone], [Address], [Gender], [RoleID], [Reason], [TimeBan], [Avatar], [isVerify]) VALUES (10, N'Đức Bùi', NULL, N'180801@gmail.com', NULL, NULL, NULL, 0, 0, NULL, NULL, N'https://lh3.googleusercontent.com/a/ACg8ocK6dD3a9ZM9X9s7z0zatwjkpl53A_W-8DK-e1d1JQ_V6w=s96-c', 1)
INSERT [dbo].[User] ([UserID], [FullName], [DateOrBirth], [Email], [Password], [Phone], [Address], [Gender], [RoleID], [Reason], [TimeBan], [Avatar], [isVerify]) VALUES (11, N'Bui Nguyen Ngoc ', NULL, N'ducbnnhe1503ss352@fpt.edu', NULL, N'0123456789', N'', 1, 1, NULL, NULL, N'https://lh3.googleusercontent.com/a/ACg8ocJLXCjt-Ws0eljYjBnJj0yERxl97i_IJS0ksiKMuXmu=s96-c', 0)
INSERT [dbo].[User] ([UserID], [FullName], [DateOrBirth], [Email], [Password], [Phone], [Address], [Gender], [RoleID], [Reason], [TimeBan], [Avatar], [isVerify]) VALUES (12, N'Ngoc 0352218407', CAST(N'2023-09-14' AS Date), N'ducbui00121@gmail.com', N'123456', N'0352218407', N'Viet Nam', 1, 0, NULL, NULL, N'https://as2.ftcdn.net/v2/jpg/03/49/49/79/1000_F_349497933_Ly4im8BDmHLaLzgyKg2f2yZOvJjBtlw5.jpg', 0)
INSERT [dbo].[User] ([UserID], [FullName], [DateOrBirth], [Email], [Password], [Phone], [Address], [Gender], [RoleID], [Reason], [TimeBan], [Avatar], [isVerify]) VALUES (13, N'Ngoc 0352218407', CAST(N'2023-09-07' AS Date), N'specialin01@gmail.com', N'123456', N'0352218407', N'Viet Nam', 1, 0, NULL, NULL, N'https://as2.ftcdn.net/v2/jpg/03/49/49/79/1000_F_349497933_Ly4im8BDmHLaLzgyKg2f2yZOvJjBtlw5.jpg', 1)
INSERT [dbo].[User] ([UserID], [FullName], [DateOrBirth], [Email], [Password], [Phone], [Address], [Gender], [RoleID], [Reason], [TimeBan], [Avatar], [isVerify]) VALUES (14, N'Ngoc Duc', CAST(N'2023-09-08' AS Date), N'specialindex01@gmail.com', N'123456', N'0352218407', N'Viet Nam', 1, 0, NULL, NULL, N'https://as2.ftcdn.net/v2/jpg/03/49/49/79/1000_F_349497933_Ly4im8BDmHLaLzgyKg2f2yZOvJjBtlw5.jpg', 1)
INSERT [dbo].[User] ([UserID], [FullName], [DateOrBirth], [Email], [Password], [Phone], [Address], [Gender], [RoleID], [Reason], [TimeBan], [Avatar], [isVerify]) VALUES (22, N'Bui Nguyen Ngoc Duc', NULL, N'he150352@fpt.edu.vn', NULL, NULL, NULL, 0, 0, NULL, NULL, N'https://lh3.googleusercontent.com/a/ACg8ocJLXCjt-Ws0eljYjBnJj0yERxl97i_IJS0ksiKMuXmu=s96-c', 1)
INSERT [dbo].[User] ([UserID], [FullName], [DateOrBirth], [Email], [Password], [Phone], [Address], [Gender], [RoleID], [Reason], [TimeBan], [Avatar], [isVerify]) VALUES (23, N'Bui Nguyen Ngoc Duc', NULL, N'duc2bnnhe150352@fpt.edu.vn', NULL, NULL, NULL, 0, 0, NULL, NULL, N'https://lh3.googleusercontent.com/a/ACg8ocJLXCjt-Ws0eljYjBnJj0yERxl97i_IJS0ksiKMuXmu=s96-c', 1)
INSERT [dbo].[User] ([UserID], [FullName], [DateOrBirth], [Email], [Password], [Phone], [Address], [Gender], [RoleID], [Reason], [TimeBan], [Avatar], [isVerify]) VALUES (24, N'Bui Nguyen Ngoc Duc', NULL, N'ducbwwnnhe150352@fpt.edu.vn', NULL, NULL, NULL, 0, 0, NULL, NULL, N'https://lh3.googleusercontent.com/a/ACg8ocJLXCjt-Ws0eljYjBnJj0yERxl97i_IJS0ksiKMuXmu=s96-c', 1)
INSERT [dbo].[User] ([UserID], [FullName], [DateOrBirth], [Email], [Password], [Phone], [Address], [Gender], [RoleID], [Reason], [TimeBan], [Avatar], [isVerify]) VALUES (25, N'Bui Nguyen Ngoc Duc', NULL, N'ducbnnh1e150352@fpt.edu.vn', NULL, NULL, NULL, 0, 0, NULL, NULL, N'https://lh3.googleusercontent.com/a/ACg8ocJLXCjt-Ws0eljYjBnJj0yERxl97i_IJS0ksiKMuXmu=s96-c', 1)
INSERT [dbo].[User] ([UserID], [FullName], [DateOrBirth], [Email], [Password], [Phone], [Address], [Gender], [RoleID], [Reason], [TimeBan], [Avatar], [isVerify]) VALUES (26, N'Bui Nguyen Ngoc Duc', NULL, N'duc2bnnshe150352@fpt.edu.vn', NULL, NULL, NULL, 0, 0, NULL, NULL, N'https://lh3.googleusercontent.com/a/ACg8ocJLXCjt-Ws0eljYjBnJj0yERxl97i_IJS0ksiKMuXmu=s96-c', 1)
INSERT [dbo].[User] ([UserID], [FullName], [DateOrBirth], [Email], [Password], [Phone], [Address], [Gender], [RoleID], [Reason], [TimeBan], [Avatar], [isVerify]) VALUES (27, N'Bui Nguyen Ngoc Duc', NULL, N'ducbnn11he150352@fpt.edu.vn', NULL, NULL, NULL, 0, 0, NULL, NULL, N'https://lh3.googleusercontent.com/a/ACg8ocJLXCjt-Ws0eljYjBnJj0yERxl97i_IJS0ksiKMuXmu=s96-c', 1)
INSERT [dbo].[User] ([UserID], [FullName], [DateOrBirth], [Email], [Password], [Phone], [Address], [Gender], [RoleID], [Reason], [TimeBan], [Avatar], [isVerify]) VALUES (28, N'Bui Nguyen Ngoc Duc', NULL, N'du2222cbnnhe150352@fpt.edu.vn', NULL, NULL, NULL, 0, 0, NULL, NULL, N'https://lh3.googleusercontent.com/a/ACg8ocJLXCjt-Ws0eljYjBnJj0yERxl97i_IJS0ksiKMuXmu=s96-c', 1)
INSERT [dbo].[User] ([UserID], [FullName], [DateOrBirth], [Email], [Password], [Phone], [Address], [Gender], [RoleID], [Reason], [TimeBan], [Avatar], [isVerify]) VALUES (29, N'Bui Nguyen Ngoc Duc', NULL, N'ducbnnhe15022352@fpt.edu.vn', NULL, NULL, NULL, 0, 0, NULL, NULL, N'https://lh3.googleusercontent.com/a/ACg8ocJLXCjt-Ws0eljYjBnJj0yERxl97i_IJS0ksiKMuXmu=s96-c', 1)
INSERT [dbo].[User] ([UserID], [FullName], [DateOrBirth], [Email], [Password], [Phone], [Address], [Gender], [RoleID], [Reason], [TimeBan], [Avatar], [isVerify]) VALUES (30, N'Bui Nguyen Ngoc Duc', NULL, N'ducbnnh12312312e150352@fpt.edu.vn', NULL, NULL, NULL, 0, 0, NULL, NULL, N'https://lh3.googleusercontent.com/a/ACg8ocJLXCjt-Ws0eljYjBnJj0yERxl97i_IJS0ksiKMuXmu=s96-c', 1)
INSERT [dbo].[User] ([UserID], [FullName], [DateOrBirth], [Email], [Password], [Phone], [Address], [Gender], [RoleID], [Reason], [TimeBan], [Avatar], [isVerify]) VALUES (31, N'Bui Nguyen Ngoc Duc', NULL, N'112', NULL, NULL, NULL, 0, 0, NULL, NULL, N'https://lh3.googleusercontent.com/a/ACg8ocJLXCjt-Ws0eljYjBnJj0yERxl97i_IJS0ksiKMuXmu=s96-c', 1)
INSERT [dbo].[User] ([UserID], [FullName], [DateOrBirth], [Email], [Password], [Phone], [Address], [Gender], [RoleID], [Reason], [TimeBan], [Avatar], [isVerify]) VALUES (32, N'Bui Nguyen Ngoc Duc', NULL, N'ducbn11111nhe150352@fpt.edu.vn', NULL, NULL, NULL, 0, 0, NULL, NULL, N'https://lh3.googleusercontent.com/a/ACg8ocJLXCjt-Ws0eljYjBnJj0yERxl97i_IJS0ksiKMuXmu=s96-c', 1)
INSERT [dbo].[User] ([UserID], [FullName], [DateOrBirth], [Email], [Password], [Phone], [Address], [Gender], [RoleID], [Reason], [TimeBan], [Avatar], [isVerify]) VALUES (33, N'Bui Nguyen Ngoc Duc', NULL, N'ducb1212nnhe150352@fpt.edu.vn', NULL, NULL, NULL, 0, 0, NULL, NULL, N'https://lh3.googleusercontent.com/a/ACg8ocJLXCjt-Ws0eljYjBnJj0yERxl97i_IJS0ksiKMuXmu=s96-c', 1)
INSERT [dbo].[User] ([UserID], [FullName], [DateOrBirth], [Email], [Password], [Phone], [Address], [Gender], [RoleID], [Reason], [TimeBan], [Avatar], [isVerify]) VALUES (34, N'Bui Nguyen Ngoc Duc', NULL, N'ducbnnhe15w0352@fpt.edu.vn', NULL, NULL, NULL, 0, 0, NULL, NULL, N'https://lh3.googleusercontent.com/a/ACg8ocJLXCjt-Ws0eljYjBnJj0yERxl97i_IJS0ksiKMuXmu=s96-c', 1)
INSERT [dbo].[User] ([UserID], [FullName], [DateOrBirth], [Email], [Password], [Phone], [Address], [Gender], [RoleID], [Reason], [TimeBan], [Avatar], [isVerify]) VALUES (35, N'Bui Nguyen Ngoc Duc', NULL, N'ducbn56556nhe150352@fpt.edu.vn', NULL, NULL, NULL, 0, 0, NULL, NULL, N'https://lh3.googleusercontent.com/a/ACg8ocJLXCjt-Ws0eljYjBnJj0yERxl97i_IJS0ksiKMuXmu=s96-c', 1)
INSERT [dbo].[User] ([UserID], [FullName], [DateOrBirth], [Email], [Password], [Phone], [Address], [Gender], [RoleID], [Reason], [TimeBan], [Avatar], [isVerify]) VALUES (36, N'Bui Nguyen Ngoc Duc', NULL, N'ducbnnhe150352@fpt.edu.vn', NULL, NULL, NULL, 0, 0, NULL, NULL, N'https://lh3.googleusercontent.com/a/ACg8ocJLXCjt-Ws0eljYjBnJj0yERxl97i_IJS0ksiKMuXmu=s96-c', 1)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
INSERT [dbo].[UserReaction] ([UserID], [CommentID], [isLike], [isDisLike]) VALUES (0, 1, 1, 0)
INSERT [dbo].[UserReaction] ([UserID], [CommentID], [isLike], [isDisLike]) VALUES (0, 42, 1, 0)
INSERT [dbo].[UserReaction] ([UserID], [CommentID], [isLike], [isDisLike]) VALUES (0, 44, 0, 1)
INSERT [dbo].[UserReaction] ([UserID], [CommentID], [isLike], [isDisLike]) VALUES (0, 51, 1, 0)
INSERT [dbo].[UserReaction] ([UserID], [CommentID], [isLike], [isDisLike]) VALUES (0, 54, 1, 0)
INSERT [dbo].[UserReaction] ([UserID], [CommentID], [isLike], [isDisLike]) VALUES (0, 59, 1, 0)
INSERT [dbo].[UserReaction] ([UserID], [CommentID], [isLike], [isDisLike]) VALUES (0, 61, 1, 0)
INSERT [dbo].[UserReaction] ([UserID], [CommentID], [isLike], [isDisLike]) VALUES (0, 62, 1, 0)
INSERT [dbo].[UserReaction] ([UserID], [CommentID], [isLike], [isDisLike]) VALUES (0, 65, 0, 0)
INSERT [dbo].[UserReaction] ([UserID], [CommentID], [isLike], [isDisLike]) VALUES (0, 66, 1, 0)
INSERT [dbo].[UserReaction] ([UserID], [CommentID], [isLike], [isDisLike]) VALUES (0, 67, 1, 0)
INSERT [dbo].[UserReaction] ([UserID], [CommentID], [isLike], [isDisLike]) VALUES (0, 68, 1, 0)
INSERT [dbo].[UserReaction] ([UserID], [CommentID], [isLike], [isDisLike]) VALUES (1, 1, 1, 0)
INSERT [dbo].[UserReaction] ([UserID], [CommentID], [isLike], [isDisLike]) VALUES (1, 54, 0, 1)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [User_UN]    Script Date: 10/5/2023 11:02:51 PM ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [User_UN] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Comment] ADD  DEFAULT ((0)) FOR [Like]
GO
ALTER TABLE [dbo].[Comment] ADD  DEFAULT ((0)) FOR [Dislike]
GO
ALTER TABLE [dbo].[Reply] ADD  DEFAULT ((0)) FOR [Like]
GO
ALTER TABLE [dbo].[Reply] ADD  DEFAULT ((0)) FOR [Dislike]
GO
ALTER TABLE [dbo].[Certificate]  WITH CHECK ADD  CONSTRAINT [Certificate_FK] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[Certificate] CHECK CONSTRAINT [Certificate_FK]
GO
ALTER TABLE [dbo].[Certificate]  WITH CHECK ADD  CONSTRAINT [Certificate_FK_1] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Certificate] CHECK CONSTRAINT [Certificate_FK_1]
GO
ALTER TABLE [dbo].[Choice]  WITH CHECK ADD  CONSTRAINT [Choice_FK] FOREIGN KEY([QuizID])
REFERENCES [dbo].[Quiz] ([QuizID])
GO
ALTER TABLE [dbo].[Choice] CHECK CONSTRAINT [Choice_FK]
GO
ALTER TABLE [dbo].[Choices]  WITH CHECK ADD  CONSTRAINT [Choices_FK] FOREIGN KEY([QuizID])
REFERENCES [dbo].[Quiz] ([QuizID])
GO
ALTER TABLE [dbo].[Choices] CHECK CONSTRAINT [Choices_FK]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [Comment_FK] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [Comment_FK]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [Comment_FK_1] FOREIGN KEY([LessonID])
REFERENCES [dbo].[Lessons] ([LessonID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [Comment_FK_1]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [Course_FK] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [Course_FK]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [Course_FK_1] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [Course_FK_1]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [Course_FK_2] FOREIGN KEY([newVersionId])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [Course_FK_2]
GO
ALTER TABLE [dbo].[Enroll]  WITH CHECK ADD  CONSTRAINT [Enroll_FK] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Enroll] CHECK CONSTRAINT [Enroll_FK]
GO
ALTER TABLE [dbo].[Enroll]  WITH CHECK ADD  CONSTRAINT [Enroll_FK_1] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[Enroll] CHECK CONSTRAINT [Enroll_FK_1]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [Exam_FK] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [Exam_FK]
GO
ALTER TABLE [dbo].[ExamDetail]  WITH CHECK ADD  CONSTRAINT [ExamDetail_FK] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[ExamDetail] CHECK CONSTRAINT [ExamDetail_FK]
GO
ALTER TABLE [dbo].[ExamDetail]  WITH CHECK ADD  CONSTRAINT [ExamDetail_FK_1] FOREIGN KEY([ExamID])
REFERENCES [dbo].[Exams] ([ExamID])
GO
ALTER TABLE [dbo].[ExamDetail] CHECK CONSTRAINT [ExamDetail_FK_1]
GO
ALTER TABLE [dbo].[Exams]  WITH CHECK ADD  CONSTRAINT [Exams_FK] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[Exams] CHECK CONSTRAINT [Exams_FK]
GO
ALTER TABLE [dbo].[Lessons]  WITH CHECK ADD  CONSTRAINT [Lessons_FK] FOREIGN KEY([MoocID])
REFERENCES [dbo].[Mooc] ([MoocID])
GO
ALTER TABLE [dbo].[Lessons] CHECK CONSTRAINT [Lessons_FK]
GO
ALTER TABLE [dbo].[Mooc]  WITH CHECK ADD  CONSTRAINT [Mooc_FK] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[Mooc] CHECK CONSTRAINT [Mooc_FK]
GO
ALTER TABLE [dbo].[Progress]  WITH CHECK ADD  CONSTRAINT [Progress_FK] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Progress] CHECK CONSTRAINT [Progress_FK]
GO
ALTER TABLE [dbo].[Progress]  WITH CHECK ADD  CONSTRAINT [Progress_FK_1] FOREIGN KEY([MoocID])
REFERENCES [dbo].[Mooc] ([MoocID])
GO
ALTER TABLE [dbo].[Progress] CHECK CONSTRAINT [Progress_FK_1]
GO
ALTER TABLE [dbo].[Progress]  WITH CHECK ADD  CONSTRAINT [Progress_FK_2] FOREIGN KEY([LessonID])
REFERENCES [dbo].[Lessons] ([LessonID])
GO
ALTER TABLE [dbo].[Progress] CHECK CONSTRAINT [Progress_FK_2]
GO
ALTER TABLE [dbo].[Progress2]  WITH CHECK ADD  CONSTRAINT [Progress2_FK] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Progress2] CHECK CONSTRAINT [Progress2_FK]
GO
ALTER TABLE [dbo].[Progress2]  WITH CHECK ADD  CONSTRAINT [Progress2_FK_1] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[Progress2] CHECK CONSTRAINT [Progress2_FK_1]
GO
ALTER TABLE [dbo].[Quiz]  WITH CHECK ADD  CONSTRAINT [Quiz_FK] FOREIGN KEY([ExamID])
REFERENCES [dbo].[Exams] ([ExamID])
GO
ALTER TABLE [dbo].[Quiz] CHECK CONSTRAINT [Quiz_FK]
GO
ALTER TABLE [dbo].[Reply]  WITH CHECK ADD  CONSTRAINT [Reply_FK] FOREIGN KEY([CommentID])
REFERENCES [dbo].[Comment] ([CommentID])
GO
ALTER TABLE [dbo].[Reply] CHECK CONSTRAINT [Reply_FK]
GO
ALTER TABLE [dbo].[Reply]  WITH CHECK ADD  CONSTRAINT [Reply_FK_1] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Reply] CHECK CONSTRAINT [Reply_FK_1]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [Review_FK] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [Review_FK]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [Review_FK_1] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [Review_FK_1]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [User_FK] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [User_FK]
GO
ALTER TABLE [dbo].[UserChoice]  WITH CHECK ADD  CONSTRAINT [UserChoice_FK] FOREIGN KEY([ChoiceID])
REFERENCES [dbo].[Choices] ([ChoiceID])
GO
ALTER TABLE [dbo].[UserChoice] CHECK CONSTRAINT [UserChoice_FK]
GO
ALTER TABLE [dbo].[UserChoice]  WITH CHECK ADD  CONSTRAINT [UserChoice_FK_1] FOREIGN KEY([ExamDetailID])
REFERENCES [dbo].[ExamDetail] ([ExamDetailID])
GO
ALTER TABLE [dbo].[UserChoice] CHECK CONSTRAINT [UserChoice_FK_1]
GO
ALTER TABLE [dbo].[UserReaction]  WITH CHECK ADD  CONSTRAINT [UserReaction_FK] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[UserReaction] CHECK CONSTRAINT [UserReaction_FK]
GO
ALTER TABLE [dbo].[UserReaction]  WITH CHECK ADD  CONSTRAINT [UserReaction_FK_1] FOREIGN KEY([CommentID])
REFERENCES [dbo].[Comment] ([CommentID])
GO
ALTER TABLE [dbo].[UserReaction] CHECK CONSTRAINT [UserReaction_FK_1]
GO
