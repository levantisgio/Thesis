USE [Thesis]
GO

/****** Object:  StoredProcedure [STG].[LND_TO_STG]    Script Date: 9/5/2024 5:10:53 μμ ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [STG].[LND_TO_STG]
AS
BEGIN

    SET NOCOUNT ON;

    WITH initial_cte AS (
        SELECT 
            *,
            CASE 
                WHEN CONVERT(date, CONVERT(datetime, CONVERT(varchar(19), [Timestamp]), 120)) = CONVERT(date, getdate()) THEN CONVERT(date, getdate())
                ELSE '1900-01-01'
            END AS create_date
        FROM  
            [LND].[dataset01]
    ),
    filter_new_data_cte AS (
        SELECT * 
        FROM initial_cte 
        WHERE create_date > (
                SELECT COALESCE(MAX(create_date), '1900-01-01') AS cdate 
                FROM [STG].[dataset01]
            )
		/*OR create_date = '1900-01-01'*/ --uncomment for initial data 
		)

    INSERT INTO [STG].[dataset01](
        [key_column],
        [timestamp],
        [create_date],
        [year],
        [month],
        [month_name],
        [day],
        [day_name],
        [source_ip],
        [destination_ip],
        [source_port],
        [destination_port],
        [protocol],
        [packet_size],
        [packet_type],
        [service],
        [message],
        [ioc_status],
        [ioc_score],
        [alert_status],
        [threat_type],
        [threat_pattern],
        [action_taken],
        [severity],
        [user_agent],
        [device_information],
        [browser],
        [os],
        [segment],
        [location],
        [server_ip],
        [log_data],
        [alert_data],
        [device_type]/*,
		[country],
		[continent]*/
    )
    
    SELECT 
        CONVERT(VARCHAR(32), HASHBYTES('md5', CONCAT_WS(':', CONVERT(datetime, CONVERT(varchar(30), [Timestamp]), 120), [Source_IP_Address], [Destination_IP_Address])), 2) AS [key_column],
        CONVERT(datetime, CONVERT(varchar(30), [Timestamp]), 120)                           AS [timestamp],
        CASE 
            WHEN create_date = CONVERT(date, getdate()) THEN create_date
            ELSE '1900-01-01'
        END                                                                                 AS [create_date],
        YEAR(CONVERT(date, CONVERT(varchar(30), [Timestamp]), 120))                         AS [year],
        MONTH(CONVERT(date, CONVERT(varchar(30), [Timestamp]), 120))                        AS [month],
        DATENAME(MONTH, CONVERT(date, CONVERT(varchar(30), [Timestamp]), 120))              AS [month_name],
        DAY(CONVERT(date, CONVERT(varchar(30), [Timestamp]), 120))                          AS [day],
        DATENAME(WEEKDAY, CONVERT(datetime, CONVERT(varchar(30), [Timestamp]), 120))        AS [day_name],
        CONVERT(VARCHAR(15),[Source_IP_Address])                                            AS [source_ip],
        CONVERT(VARCHAR(15),[Destination_IP_Address])                                       AS [destination_ip],
        CONVERT(INT, CONVERT(varchar(30), [Source_Port]))                                   AS [source_port],
        CONVERT(INT, CONVERT(varchar(30), [Destination_Port]))                              AS [destination_port],
        CONVERT(VARCHAR(5),[Protocol])                                                      AS [protocol],
        CONVERT(INT, CONVERT(varchar(30), [Packet_Length]))                                 AS [packet_size],
        CONVERT(VARCHAR(10),[Packet_Type])                                                  AS [packet_type],
        CONVERT(VARCHAR(10),[Traffic_Type])                                                 AS [service],
        CONVERT(VARCHAR(255),[Payload_Data])                                                AS [message],
        CONVERT(VARCHAR(20),[Malware_Indicators])                                           AS [ioc_status],
        CONVERT(DECIMAL(5, 2), CONVERT(varchar(30), [Anomaly_Scores]))                      AS [ioc_score],
        CONVERT(VARCHAR(20),[Alerts_Warnings])                                              AS [alert_status],
        CONVERT(VARCHAR(20),[Attack_Type])                                                  AS [threat_type],
        CONVERT(VARCHAR(20),[Attack_Signature])                                             AS [threat_pattern],
        CONVERT(VARCHAR(20),[Action_Taken])                                                 AS [action_taken],
        CONVERT(VARCHAR(10),[Severity_Level])                                               AS [severity],
        CONVERT(VARCHAR(50),[User_Information])                                             AS [user_agent],
        CONVERT(VARCHAR(255),[Device_Information])                                          AS [device_information],
        CASE 
            WHEN [Device_Information] LIKE '%Chrome%' THEN 'Chrome'
            WHEN [Device_Information] LIKE '%Firefox%' THEN 'Firefox'
            WHEN [Device_Information] LIKE '%Safari%' THEN 'Safari'
            WHEN [Device_Information] LIKE '%Opera%' THEN 'Opera'
            WHEN [Device_Information] LIKE '%MSIE%' THEN 'Internet Explorer'
            WHEN [Device_Information] LIKE '%Mozilla%' THEN 'Mozilla'
            ELSE 'Other'
        END                                                                                 AS [browser],
        CASE 
            WHEN [Device_Information] LIKE '%Windows%' THEN 'Windows'
            WHEN [Device_Information] LIKE '%Mac OS X%' THEN 'Mac OS X'
            WHEN [Device_Information] LIKE '%Linux%' THEN 'Linux'
            WHEN [Device_Information] LIKE '%iPhone%' THEN 'iPhone'
            WHEN [Device_Information] LIKE '%iPad%' THEN 'iPad'
            WHEN [Device_Information] LIKE '%Android%' THEN 'Android'
            ELSE 'Other'
        END                                                                                 AS [os],
        CONVERT(VARCHAR(10),[Network_Segment])                                              AS [segment],
        CONVERT(VARCHAR(50),[Geo_location_Data])                                            AS [location],
        CONVERT(VARCHAR(15),[Proxy_Information])                                            AS [server_ip],
        CONVERT(VARCHAR(255),[Firewall_Logs])                                               AS [log_data],
        CONVERT(VARCHAR(255),[IDS_IPS_Alerts])                                              AS [alert_data],
        CONVERT(VARCHAR(20),[Log_Source])                                                   AS [device_type]/*,
		countries.[country_name]                                                            AS [country],
	    continents.[continent_name]                                                         AS [continent]*/
	FROM 
	    filter_new_data_cte
	/*CROSS JOIN (
	    SELECT TOP 1 [country_name]
	    FROM [Thesis].[dbo].[GeoLite2_Country_Locations_en] 
        ORDER BY NEWID())                                                                   AS countries
	CROSS JOIN (
	    SELECT TOP 1 [continent_name]
	    FROM [Thesis].[dbo].[GeoLite2_Country_Locations_en]
	    ORDER BY NEWID()
	)                                                                                       AS continents*/;
END;
GO