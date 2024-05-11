USE [Thesis]
GO

/****** Object:  Table [TRG].[dataset01_pbi]    Script Date: 11/5/2024 4:00:00 πμ ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [TRG].[dataset01_pbi](
	[key_column] [varchar](40) NOT NULL,
	[timestamp] [datetime2](7) NOT NULL,
	[create_date] [date] NOT NULL,
	[year] [int] NOT NULL,
	[month] [int] NOT NULL,
	[month_name] [varchar](12) NOT NULL,
	[day] [int] NOT NULL,
	[day_name] [varchar](10) NOT NULL,
	[source_ip] [varchar](15) NULL,
	[destination_ip] [varchar](15) NULL,
	[source_port] [int] NULL,
	[destination_port] [int] NULL,
	[protocol] [varchar](5) NULL,
	[packet_size] [int] NULL,
	[packet_type] [varchar](10) NULL,
	[service] [varchar](10) NULL,
	[ioc_status] [varchar](20) NULL,
	[ioc_score] [decimal](5, 2) NULL,
	[alert_status] [varchar](20) NULL,
	[threat_type] [varchar](20) NULL,
	[threat_pattern] [varchar](20) NULL,
	[action_taken] [varchar](20) NULL,
	[severity] [varchar](10) NULL,
	[user_agent] [varchar](50) NULL,
	[browser] [varchar](100) NULL,
	[os] [varchar](100) NULL,
	[segment] [varchar](10) NULL,
	[from_location] [varchar](50) NULL,
	[from_country] [varchar](50) NULL,
	[from_continent] [varchar](50) NULL,
	[to_location] [varchar](50) NULL,
	[to_country] [varchar](50) NULL,
	[to_continent] [varchar](50) NULL,
	[server_ip] [varchar](15) NULL,
	[device_type] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[key_column] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO