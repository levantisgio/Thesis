USE [Thesis]
GO

/****** Object:  Table [dbo].[LND.dataset02]    Script Date: 30/4/2024 10:16:48 μμ ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[LND.dataset02](
	[timestamp] [text] NULL,
	[processId] [text] NULL,
	[threadId] [text] NULL,
	[parentProcessId] [text] NULL,
	[userId] [text] NULL,
	[mountNamespace] [text] NULL,
	[processName] [text] NULL,
	[hostName] [text] NULL,
	[eventId] [text] NULL,
	[eventName] [text] NULL,
	[stackAddresses] [text] NULL,
	[argsNum] [text] NULL,
	[returnValue] [text] NULL,
	[args] [text] NULL,
	[sus] [text] NULL,
	[evil] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


