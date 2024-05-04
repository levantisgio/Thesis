USE [Thesis]
GO

/****** Object:  Table [dbo].[LND.dataset03]    Script Date: 30/4/2024 10:17:02 μμ ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[LND.dataset03](
	[timestamp] [text] NULL,
	[processId] [text] NULL,
	[parentProcessId] [text] NULL,
	[userId] [text] NULL,
	[processName] [text] NULL,
	[hostName] [text] NULL,
	[eventId] [text] NULL,
	[eventName] [text] NULL,
	[argsNum] [text] NULL,
	[returnValue] [text] NULL,
	[args] [text] NULL,
	[sus] [text] NULL,
	[evil] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


