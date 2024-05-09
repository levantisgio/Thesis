USE [Thesis]
GO

/****** Object:  StoredProcedure [TRG].[STG_TO_TRG_ML]    Script Date: 9/5/2024 5:12:33 μμ ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [TRG].[STG_TO_TRG_ML]
AS
BEGIN
    SET NOCOUNT ON;

    WITH filter_new_data_cte AS (
        SELECT * 
        FROM [STG].[dataset01] 
        WHERE create_date > (
                SELECT COALESCE(MAX(create_date), '1900-01-01') AS cdate 
                FROM [TRG].[dataset01_ml]
            )
		/*OR create_date = '1900-01-01'*/ --uncomment for initial data
    )
    INSERT INTO [TRG].[dataset01_ml](
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
        [device_type],
		-- Encoded columns
		[protocol_TCP],
        [protocol_UDP],
        [protocol_ICMP],
        [packet_type_Control],
        [packet_type_Data],
        [service_FTP],
        [service_HTTP],
        [service_DNS],
        [ioc_status_IoC_Detected],
        [ioc_status_Alert_Triggered],
        [alert_status_Ignored],
        [alert_status_Logged],
        [threat_type_Intrusion],
        [threat_type_Malware],
        [threat_type_DDoS],
        [action_taken_Ignored],
        [action_taken_Blocked],
        [action_taken_Logged],
        [severity_Low],
        [severity_Medium],
        [severity_High],
        [segment_Segment_A],
        [segment_Segment_B],
        [segment_Segment_C],
        [device_type_Firewall],
        [device_type_Server]
    )
    SELECT
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
        [device_type],
        -- Encoded columns
        CASE WHEN [protocol] = 'TCP' THEN 1 ELSE 0 END,
        CASE WHEN [protocol] = 'UDP' THEN 1 ELSE 0 END,
        CASE WHEN [protocol] = 'ICMP' THEN 1 ELSE 0 END,
        CASE WHEN [packet_type] = 'Control' THEN 1 ELSE 0 END,
        CASE WHEN [packet_type] = 'Data' THEN 1 ELSE 0 END,
        CASE WHEN [service] = 'FTP' THEN 1 ELSE 0 END,
        CASE WHEN [service] = 'HTTP' THEN 1 ELSE 0 END,
        CASE WHEN [service] = 'DNS' THEN 1 ELSE 0 END,
        CASE WHEN [ioc_status] = 'IoC Detected' THEN 1 ELSE 0 END,
        CASE WHEN [ioc_status] = 'Alert Triggered' THEN 1 ELSE 0 END,
        CASE WHEN [alert_status] = 'Ignored' THEN 1 ELSE 0 END,
        CASE WHEN [alert_status] = 'Logged' THEN 1 ELSE 0 END,
        CASE WHEN [threat_type] = 'Intrusion' THEN 1 ELSE 0 END,
        CASE WHEN [threat_type] = 'Malware' THEN 1 ELSE 0 END,
        CASE WHEN [threat_type] = 'DDoS' THEN 1 ELSE 0 END,
        CASE WHEN [action_taken] = 'Ignored' THEN 1 ELSE 0 END,
        CASE WHEN [action_taken] = 'Blocked' THEN 1 ELSE 0 END,
        CASE WHEN [action_taken] = 'Logged' THEN 1 ELSE 0 END,
        CASE WHEN [severity] = 'Low' THEN 1 ELSE 0 END,
        CASE WHEN [severity] = 'Medium' THEN 1 ELSE 0 END,
        CASE WHEN [severity] = 'High' THEN 1 ELSE 0 END,
        CASE WHEN [segment] = 'Segment A' THEN 1 ELSE 0 END,
        CASE WHEN [segment] = 'Segment B' THEN 1 ELSE 0 END,
        CASE WHEN [segment] = 'Segment C' THEN 1 ELSE 0 END,
        CASE WHEN [device_type] = 'Firewall' THEN 1 ELSE 0 END,
        CASE WHEN [device_type] = 'Server' THEN 1 ELSE 0 END
    FROM
        filter_new_data_cte; 

END;
GO