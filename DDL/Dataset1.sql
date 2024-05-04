USE [Thesis]
GO

/****** Object:  Table [dbo].[LND.dataset01]    Script Date: 30/4/2024 10:16:14 �� ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[LND.dataset01](
	[Timestamp] [text] NULL,
	[Source_IP_Address] [text] NULL,
	[Destination_IP_Address] [text] NULL,
	[Source_Port] [text] NULL,
	[Destination_Port] [text] NULL,
	[Protocol] [text] NULL,
	[Packet_Length] [text] NULL,
	[Packet_Type] [text] NULL,
	[Traffic_Type] [text] NULL,
	[Payload_Data] [text] NULL,
	[Malware_Indicators] [text] NULL,
	[Anomaly_Scores] [text] NULL,
	[Alerts_Warnings] [text] NULL,
	[Attack_Type] [text] NULL,
	[Attack_Signature] [text] NULL,
	[Action_Taken] [text] NULL,
	[Severity_Level] [text] NULL,
	[User_Information] [text] NULL,
	[Device_Information] [text] NULL,
	[Network_Segment] [text] NULL,
	[Geo_location_Data] [text] NULL,
	[Proxy_Information] [text] NULL,
	[Firewall_Logs] [text] NULL,
	[IDS_IPS_Alerts] [text] NULL,
	[Log_Source] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


