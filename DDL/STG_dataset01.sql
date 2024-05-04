USE [Thesis]
GO

/****** Object:  Table [STG].[dataset01]    Script Date: 1/5/2024 3:23:23 рм ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [STG].[dataset01](
	[key_column] [varchar](40) NOT NULL,
	[timestamp] [datetime2](7) NOT NULL,
	[source_ip] [varchar](15) NULL,
	[destination_ip] [varchar](15) NULL,
	[source_port] [int] NULL,
	[destination_port] [int] NULL,
	[protocol] [varchar](5) NULL,
	[packet_size] [int] NULL,
	[packet_type] [varchar](10) NULL,
	[service] [varchar](10) NULL,
	[message] [varchar](255) NULL,
	[ioc_status] [varchar](20) NULL,
	[ioc_score] [decimal](5, 2) NULL,
	[alert_status] [varchar](20) NULL,
	[threat_type] [varchar](20) NULL,
	[threat_pattern] [varchar](20) NULL,
	[action_taken] [varchar](20) NULL,
	[severity] [varchar](10) NULL,
	[user_agent] [varchar](50) NULL,
	[device_information] [varchar](255) NULL,
	[browser] [varchar](100) NULL,
	[os] [varchar](100) NULL,
	[segment] [varchar](10) NULL,
	[location] [varchar](50) NULL,
	[server_ip] [varchar](15) NULL,
	[log_data] [varchar](255) NULL,
	[alert_data] [varchar](255) NULL,
	[device_type] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[key_column] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


