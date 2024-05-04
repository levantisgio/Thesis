CREATE PROCEDURE STG.LND_STG
AS
BEGIN

    SET NOCOUNT ON;

    -- Delete existing data in STG.dataset01
    --TRUNCATE TABLE STG.dataset01;

    -- Insert data from dbo.LND.dataset01 to STG.dataset01 with transformations
    INSERT INTO [STG].[dataset01](
        [key_column],
        [timestamp],
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
        [device_type]
    )
    SELECT 
        CONVERT(VARCHAR(32),HASHBYTES('md5', CONCAT_WS(':',CONVERT(datetime,CONVERT(varchar(30),[Timestamp]), 120), [Source_IP_Address], [Destination_IP_Address])),2) AS [key_column],
        CONVERT(datetime,CONVERT(varchar(30),[Timestamp]), 120)     AS [timestamp], -- Timestamp conversion
        [Source_IP_Address]                                         AS [source_ip],
        [Destination_IP_Address]                                    AS [destination_ip],
        CONVERT(INT, CONVERT(varchar(30),[Source_Port]))            AS [source_port],
        CONVERT(INT, CONVERT(varchar(30),[Destination_Port]))       AS [destination_port],
        [Protocol]                                                   AS [protocol],
        CONVERT(INT, CONVERT(varchar(30),[Packet_Length]))          AS [packet_size],
        [Packet_Type]                                                AS [packet_type],
        [Traffic_Type]                                               AS [service],
        [Payload_Data]                                               AS [message],
        [Malware_Indicators]                                         AS [ioc_status],
        CONVERT(DECIMAL(5,2),CONVERT(varchar(30),[Anomaly_Scores])) AS [ioc_score],
        [Alerts_Warnings]                                            AS [alert_status],
        [Attack_Type]                                                AS [threat_type],
        [Attack_Signature]                                           AS [threat_pattern],
        [Action_Taken]                                               AS [action_taken],
        [Severity_Level]                                             AS [severity],
        [User_Information]                                           AS [user_agent],
        [Device_Information]                                         AS [device_information],
        CASE 
            WHEN [Device_Information] LIKE '%Chrome%' THEN 'Chrome'
            WHEN [Device_Information] LIKE '%Firefox%' THEN 'Firefox'
            WHEN [Device_Information] LIKE '%Safari%' THEN 'Safari'
            WHEN [Device_Information] LIKE '%Opera%' THEN 'Opera'
            WHEN [Device_Information] LIKE '%MSIE%' THEN 'Internet Explorer'
			WHEN [Device_Information] LIKE '%Mozilla%' THEN 'Mozilla'
            ELSE 'Other'
        END                                                          AS [browser],
        CASE 
            WHEN [Device_Information] LIKE '%Windows%' THEN 'Windows'
            WHEN [Device_Information] LIKE '%Mac OS X%' THEN 'Mac OS X'
            WHEN [Device_Information] LIKE '%Linux%' THEN 'Linux'
            WHEN [Device_Information] LIKE '%iPhone%' THEN 'iPhone'
            WHEN [Device_Information] LIKE '%iPad%' THEN 'iPad'
            WHEN [Device_Information] LIKE '%Android%' THEN 'Android'
            ELSE 'Other'
        END                                                          AS [os],
        [Network_Segment]                                            AS [segment],
        [Geo_location_Data]                                          AS [location],
        [Proxy_Information]                                          AS [server_ip],
        [Firewall_Logs]                                              AS [log_data],
        [IDS_IPS_Alerts]                                             AS [alert_data],
        [Log_Source]                                                 AS [device_type]
    FROM 
        [dbo].[LND.dataset01];

END;