USE [Thesis]
GO

/****** Object:  Table [TRG].[dataset01_ml]    Script Date: 9/5/2024 5:09:24 μμ ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [TRG].[dataset01_ml](
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
	[protocol_TCP] [bit] NOT NULL,
	[protocol_UDP] [bit] NOT NULL,
	[protocol_ICMP] [bit] NOT NULL,
	[packet_type_Control] [bit] NOT NULL,
	[packet_type_Data] [bit] NOT NULL,
	[service_FTP] [bit] NOT NULL,
	[service_HTTP] [bit] NOT NULL,
	[service_DNS] [bit] NOT NULL,
	[ioc_status_IoC_Detected] [bit] NOT NULL,
	[ioc_status_Alert_Triggered] [bit] NOT NULL,
	[alert_status_Ignored] [bit] NOT NULL,
	[alert_status_Logged] [bit] NOT NULL,
	[threat_type_Intrusion] [bit] NOT NULL,
	[threat_type_Malware] [bit] NOT NULL,
	[threat_type_DDoS] [bit] NOT NULL,
	[action_taken_Ignored] [bit] NOT NULL,
	[action_taken_Blocked] [bit] NOT NULL,
	[action_taken_Logged] [bit] NOT NULL,
	[severity_Low] [bit] NOT NULL,
	[severity_Medium] [bit] NOT NULL,
	[severity_High] [bit] NOT NULL,
	[segment_Segment_A] [bit] NOT NULL,
	[segment_Segment_B] [bit] NOT NULL,
	[segment_Segment_C] [bit] NOT NULL,
	[device_type_Firewall] [bit] NOT NULL,
	[device_type_Server] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[key_column] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
