CREATE FUNCTION dbo.ParseUserAgent
(
    @device_information VARCHAR(255)
)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        CASE 
            WHEN @device_information LIKE '%Chrome%' THEN 'Chrome'
            WHEN @device_information LIKE '%Firefox%' THEN 'Firefox'
            WHEN @device_information LIKE '%Safari%' THEN 'Safari'
            WHEN @device_information LIKE '%Opera%' THEN 'Opera'
            WHEN @device_information LIKE '%MSIE%' THEN 'Internet Explorer'
			WHEN @device_information LIKE '%Mozilla%' THEN 'Mozilla'
            ELSE 'Other'
        END AS browser,
        CASE 
            WHEN @device_information LIKE '%MSIE%' THEN SUBSTRING(@device_information, CHARINDEX('MSIE', @device_information) + 5, CHARINDEX(';', @device_information, CHARINDEX('MSIE', @device_information)) - (CHARINDEX('MSIE', @device_information) + 5))
            WHEN @device_information LIKE '%Firefox%' THEN SUBSTRING(@device_information, CHARINDEX('Firefox', @device_information) + 8, CHARINDEX(' ', @device_information, CHARINDEX('Firefox', @device_information) + 8) - (CHARINDEX('Firefox', @device_information) + 8))
            WHEN @device_information LIKE '%Chrome%' THEN SUBSTRING(@device_information, CHARINDEX('Chrome', @device_information) + 7, CHARINDEX(' ', @device_information, CHARINDEX('Chrome', @device_information) + 7) - (CHARINDEX('Chrome', @device_information) + 7))
            WHEN @device_information LIKE '%Safari%' THEN SUBSTRING(@device_information, CHARINDEX('Version', @device_information) + 8, CHARINDEX(' ', @device_information, CHARINDEX('Version', @device_information) + 8) - (CHARINDEX('Version', @device_information) + 8))
            WHEN @device_information LIKE '%Opera%' THEN SUBSTRING(@device_information, CHARINDEX('Version', @device_information) + 8, CHARINDEX(' ', @device_information, CHARINDEX('Version', @device_information) + 8) - (CHARINDEX('Version', @device_information) + 8))
            ELSE ''
        END AS version,
        CASE 
            WHEN @device_information LIKE '%Windows%' THEN 'Windows'
            WHEN @device_information LIKE '%Mac OS X%' THEN 'Mac OS X'
            WHEN @device_information LIKE '%Linux%' THEN 'Linux'
            WHEN @device_information LIKE '%iPhone%' THEN 'iPhone'
            WHEN @device_information LIKE '%iPad%' THEN 'iPad'
            WHEN @device_information LIKE '%Android%' THEN 'Android'
            ELSE 'Other'
        END AS os
);
TRUNCATE TABLE [STG].[dataset01]
EXEC [STG].[LND_STG];
SELECT * FROM [STG].[dataset01]