USE [Thesis]
GO

/****** Object:  StoredProcedure [TRG].[STG_TO_TRG_ML]    Script Date: 11/5/2024 4:03:21 πμ ******/
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
        [from_location],
		[from_country],
		[from_continent],
		[to_location],
		[to_country],
		[to_continent],
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
        [from_location],
		CASE WHEN [from_location] IN (
            'Katni', 'New Delhi', 'Thane', 'Eluru', 'Miryalaguda', 'Bikaner', 'Chandrapur', 'Aizawl', 
			'Ajmer', 'Saharsa', 'Kollam', 'Bareilly', 'Bhilwara', 'Madurai', 'Raurkela Industrial Township', 
			'Malda', 'Bhatpara', 'Aurangabad', 'Thoothukudi', 'Akola', 'Hubliβ€“Dharwad', 'Varanasi', 'Bokaro', 
			'Parbhani', 'Ghaziabad', 'Karaikudi', 'Mumbai', 'Junagadh', 'Kamarhati', 'Vadodara', 'Hapur', 'Mehsana', 
			'Sangli-Miraj & Kupwad', 'Pallavaram', 'Rajahmundry', 'Jalgaon', 'Gurgaon', 'Ratlam', 'Dewas', 'Munger', 
			'Rajpur Sonarpur', 'Bongaigaon', 'Bidar', 'Ambattur', 'Buxar', 'Faridabad', 'Jamalpur', 'Gaya', 'Chennai', 
			'Alwar', 'Burhanpur', 'Vijayawada', 'Phusro', 'Raebareli', 'Proddatur', 'Gopalpur', 'Jaunpur', 'Sultan Pur Majra', 
			'Salem', 'Tumkur', 'Arrah', 'Moradabad', 'Bhiwandi', 'Rampur', 'Mysore', 'Karimnagar', 'Aligarh', 'Gangtok', 'Amravati', 
			'Rourkela', 'Patna', 'Bellary', 'Patiala', 'Maheshtala', 'Siwan', 'Hyderabad', 'Baranagar', 'Naihati', 
			'Ramagundam', 'Tirunelveli', 'Kottayam', 'Muzaffarpur', 'Ahmedabad', 'Tadipatri', 'Mirzapur', 'Chinsurah', 
			'Muzaffarnagar', 'Jammu', 'Nagpur', 'Gandhinagar', 'Kalyan-Dombivli', 'Bathinda', 'Raichur', 'Giridih', 
			'Udaipur', 'Ranchi', 'Jalna', 'Ambala', 'Karnal', 'Morbi', 'Ichalkaranji', 'Rewa', 'Narasaraopet', 'Bhavnagar', 
			'Saharanpur', 'Khora', 'Amritsar', 'Sikar', 'Coimbatore', 'Sambhal', 'Sonipat', 'Bhimavaram', 'Madhyamgram', 
			'Suryapet', 'Ahmednagar', 'Allahabad', 'Korba', 'Motihari', 'Imphal', 'Unnao', 'Sirsa', 'Alappuzha', 'Medininagar', 
			'Karawal Nagar', 'Gwalior', 'Thrissur', 'Danapur', 'Hajipur', 'Jamnagar', 'Ongole', 'Anantapuram', 'Kishanganj', 
			'Anantapur', 'Jodhpur', 'Tadepalligudem', 'Kurnool', 'Guwahati', 'Purnia', 'Erode', 'Tirupati', 'Surat', 'Shimoga', 
			'Madanapalle', 'Vellore', 'Khandwa', 'Haldia', 'Gudivada', 'Dibrugarh', 'Kakinada', 'Nagercoil', 'Panchkula', 
			'Belgaum', 'Bhusawal', 'Mau', 'Jorhat', 'Nanded', 'Darbhanga', 'Udupi', 'Ozhukarai', 'Avadi', 'Bardhaman', 
			'Bihar Sharif', 'Adoni', 'Amroha', 'Firozabad', 'Kharagpur', 'Kota', 'Raipur', 'Mango', 'Nagaon', 'Pali', 
			'Kolhapur', 'Ulhasnagar', 'Kozhikode', 'Ramgarh', 'Srikakulam', 'Bhalswa Jahangir Pur', 'Agartala', 'Thanjavur', 
			'Kadapa', 'Bulandshahr', 'Mahbubnagar', 'Sambalpur', 'Dharmavaram', 'Indore', 'Howrah', 'Vijayanagaram', 
			'Bhagalpur', 'Raiganj', 'Hazaribagh', 'Barasat', 'Hospet', 'Ludhiana', 'Secunderabad', 'Panvel', 'Kanpur', 
			'Nizamabad', 'Ballia', 'Satara', 'Dindigul', 'Chittoor', 'Cuttack', 'Bhiwani', 'Bangalore', 'Solapur', 
			'Tezpur', 'Nashik', 'Kulti', 'Bahraich', 'Bally', 'North Dumdum', 'Mangalore', 'Farrukhabad', 'Phagwara', 
			'Gulbarga', 'Kirari Suleman Nagar', 'Chandigarh', 'Gandhidham', 'Sri Ganganagar', 'Guntur', 'Dehradun', 
			'Ujjain', 'Tiruvottiyur', 'Asansol', 'Serampore', 'Kochi', 'Davanagere', 'Bhilai', 'Ambarnath', 'Bilaspur', 
			'Thiruvananthapuram', 'Dehri', 'Bijapur', 'Jabalpur', 'Fatehpur', 'Panipat', 'Nangloi Jat', 'Navi Mumbai', 
			'Noida', 'Tiruchirappalli', 'Pudukkottai', 'Jalandhar', 'Surendranagar Dudhrej', 'Guntakal', 'Singrauli', 
			'Bettiah', 'Dhanbad', 'Bidhannagar', 'Nadiad', 'Bhubaneswar', 'Meerut', 'Siliguri', 'Shivpuri', 'Guna', 
			'Bharatpur', 'Jhansi', 'Anand', 'Katihar', 'Tiruppur', 'Mira-Bhayandar', 'Berhampore', 'Warangal', 'Jamshedpur',
			'Jehanabad', 'Hosur', 'Vasai-Virar', 'Delhi', 'Begusarai', 'Latur', 'Etawah', 'Shahjahanpur', 'Jaipur', 'Deoghar', 
			'Orai', 'Panihati', 'Berhampur', 'Silchar', 'Visakhapatnam', 'Pondicherry','Chapra','Sagar','Uluberia','Hindupur',
			'Pune','Haridwar','Bhopal','Sasaram','Pimpri-Chinchwad','Rohtak','South Dumdum','Nellore','Shimla','Srinagar','Rajkot',
			'Durgapur','Yamunanagar','Dhule','Gorakhpur','Kumbakonam','Loni','Durg','Kolkata','Machilipatnam','Lucknow','Agra',
			'Satna','Morena','Mathura','Kavali','Bhind','Khammam','Tinsukia','Malegaon','Tenali','Nandyal','Amaravati',
			'Maharashtra','Telangana','Punjab','Rajasthan','Kerala','Arunachal Pradesh','Tripura','Nagaland','Sikkim','Uttarakhand',
			'Meghalaya','West Bengal','Haryana','Gujarat','Odisha','Tamil Nadu','Manipur','Jharkhand','Uttar Pradesh','Karnataka',
			'Chhattisgarh','Andhra Pradesh','Assam','Bihar','Mizoram','Himachal Pradesh','Goa','Madhya Pradesh')        THEN 'India'
        WHEN [from_location] = 'Paris'																					THEN 'France'
        WHEN [from_location] = 'London'																					THEN 'United Kingdom'
        WHEN [from_location] = 'Berlin'																					THEN 'Germany'
        WHEN [from_location] = 'Rome'																					THEN 'Italy'
        WHEN [from_location] = 'Madrid'																					THEN 'Spain'
        WHEN [from_location] = 'Amsterdam'																				THEN 'Netherlands'
        WHEN [from_location] = 'Brussels'																				THEN 'Belgium'
        WHEN [from_location] = 'Lisbon'																					THEN 'Portugal'
        WHEN [from_location] = 'Vienna'																					THEN 'Austria'
        WHEN [from_location] = 'Athens'																					THEN 'Greece'
        WHEN [from_location] IN ('New York City', 'Los Angeles', 'Chicago', 'Miami', 'Houston', 'Atlanta')				THEN 'USA'
        WHEN [from_location] IN ('Toronto', 'Vancouver', 'Montreal')													THEN 'Canada'
        WHEN [from_location] = 'Mexico City'																			THEN 'Mexico'
        WHEN [from_location] IN ('Beijing', 'Shanghai', 'Guangzhou', 'Shenzhen', 'Chengdu', 'Hangzhou', 
		'Nanjing', 'Wuhan', 'Chongqing')																				THEN 'China'
        WHEN [from_location] LIKE '%Xi%'																				THEN 'China'
        ELSE ''
    END,																												
	CASE WHEN [from_location] IN (
            'Katni', 'New Delhi', 'Thane', 'Eluru', 'Miryalaguda', 'Bikaner', 'Chandrapur', 'Aizawl', 
			'Ajmer', 'Saharsa', 'Kollam', 'Bareilly', 'Bhilwara', 'Madurai', 'Raurkela Industrial Township', 
			'Malda', 'Bhatpara', 'Aurangabad', 'Thoothukudi', 'Akola', 'Hubliβ€“Dharwad', 'Varanasi', 'Bokaro', 
			'Parbhani', 'Ghaziabad', 'Karaikudi', 'Mumbai', 'Junagadh', 'Kamarhati', 'Vadodara', 'Hapur', 'Mehsana', 
			'Sangli-Miraj & Kupwad', 'Pallavaram', 'Rajahmundry', 'Jalgaon', 'Gurgaon', 'Ratlam', 'Dewas', 'Munger', 
			'Rajpur Sonarpur', 'Bongaigaon', 'Bidar', 'Ambattur', 'Buxar', 'Faridabad', 'Jamalpur', 'Gaya', 'Chennai', 
			'Alwar', 'Burhanpur', 'Vijayawada', 'Phusro', 'Raebareli', 'Proddatur', 'Gopalpur', 'Jaunpur', 'Sultan Pur Majra', 
			'Salem', 'Tumkur', 'Arrah', 'Moradabad', 'Bhiwandi', 'Rampur', 'Mysore', 'Karimnagar', 'Aligarh', 'Gangtok', 'Amravati', 
			'Rourkela', 'Patna', 'Bellary', 'Patiala', 'Maheshtala', 'Siwan', 'Hyderabad', 'Baranagar', 'Naihati', 
			'Ramagundam', 'Tirunelveli', 'Kottayam', 'Muzaffarpur', 'Ahmedabad', 'Tadipatri', 'Mirzapur', 'Chinsurah', 
			'Muzaffarnagar', 'Jammu', 'Nagpur', 'Gandhinagar', 'Kalyan-Dombivli', 'Bathinda', 'Raichur', 'Giridih', 
			'Udaipur', 'Ranchi', 'Jalna', 'Ambala', 'Karnal', 'Morbi', 'Ichalkaranji', 'Rewa', 'Narasaraopet', 'Bhavnagar', 
			'Saharanpur', 'Khora', 'Amritsar', 'Sikar', 'Coimbatore', 'Sambhal', 'Sonipat', 'Bhimavaram', 'Madhyamgram', 
			'Suryapet', 'Ahmednagar', 'Allahabad', 'Korba', 'Motihari', 'Imphal', 'Unnao', 'Sirsa', 'Alappuzha', 'Medininagar', 
			'Karawal Nagar', 'Gwalior', 'Thrissur', 'Danapur', 'Hajipur', 'Jamnagar', 'Ongole', 'Anantapuram', 'Kishanganj', 
			'Anantapur', 'Jodhpur', 'Tadepalligudem', 'Kurnool', 'Guwahati', 'Purnia', 'Erode', 'Tirupati', 'Surat', 'Shimoga', 
			'Madanapalle', 'Vellore', 'Khandwa', 'Haldia', 'Gudivada', 'Dibrugarh', 'Kakinada', 'Nagercoil', 'Panchkula', 
			'Belgaum', 'Bhusawal', 'Mau', 'Jorhat', 'Nanded', 'Darbhanga', 'Udupi', 'Ozhukarai', 'Avadi', 'Bardhaman', 
			'Bihar Sharif', 'Adoni', 'Amroha', 'Firozabad', 'Kharagpur', 'Kota', 'Raipur', 'Mango', 'Nagaon', 'Pali', 
			'Kolhapur', 'Ulhasnagar', 'Kozhikode', 'Ramgarh', 'Srikakulam', 'Bhalswa Jahangir Pur', 'Agartala', 'Thanjavur', 
			'Kadapa', 'Bulandshahr', 'Mahbubnagar', 'Sambalpur', 'Dharmavaram', 'Indore', 'Howrah', 'Vijayanagaram', 
			'Bhagalpur', 'Raiganj', 'Hazaribagh', 'Barasat', 'Hospet', 'Ludhiana', 'Secunderabad', 'Panvel', 'Kanpur', 
			'Nizamabad', 'Ballia', 'Satara', 'Dindigul', 'Chittoor', 'Cuttack', 'Bhiwani', 'Bangalore', 'Solapur', 
			'Tezpur', 'Nashik', 'Kulti', 'Bahraich', 'Bally', 'North Dumdum', 'Mangalore', 'Farrukhabad', 'Phagwara', 
			'Gulbarga', 'Kirari Suleman Nagar', 'Chandigarh', 'Gandhidham', 'Sri Ganganagar', 'Guntur', 'Dehradun', 
			'Ujjain', 'Tiruvottiyur', 'Asansol', 'Serampore', 'Kochi', 'Davanagere', 'Bhilai', 'Ambarnath', 'Bilaspur', 
			'Thiruvananthapuram', 'Dehri', 'Bijapur', 'Jabalpur', 'Fatehpur', 'Panipat', 'Nangloi Jat', 'Navi Mumbai', 
			'Noida', 'Tiruchirappalli', 'Pudukkottai', 'Jalandhar', 'Surendranagar Dudhrej', 'Guntakal', 'Singrauli', 
			'Bettiah', 'Dhanbad', 'Bidhannagar', 'Nadiad', 'Bhubaneswar', 'Meerut', 'Siliguri', 'Shivpuri', 'Guna', 
			'Bharatpur', 'Jhansi', 'Anand', 'Katihar', 'Tiruppur', 'Mira-Bhayandar', 'Berhampore', 'Warangal', 'Jamshedpur',
			'Jehanabad', 'Hosur', 'Vasai-Virar', 'Delhi', 'Begusarai', 'Latur', 'Etawah', 'Shahjahanpur', 'Jaipur', 'Deoghar', 
			'Orai', 'Panihati', 'Berhampur', 'Silchar', 'Visakhapatnam', 'Pondicherry','Chapra','Sagar','Uluberia','Hindupur',
			'Pune','Haridwar','Bhopal','Sasaram','Pimpri-Chinchwad','Rohtak','South Dumdum','Nellore','Shimla','Srinagar','Rajkot',
			'Durgapur','Yamunanagar','Dhule','Gorakhpur','Kumbakonam','Loni','Durg','Kolkata','Machilipatnam','Lucknow','Agra',
			'Satna','Morena','Mathura','Kavali','Bhind','Khammam','Tinsukia','Malegaon','Tenali','Nandyal','Amaravati',
			'Maharashtra','Telangana','Punjab','Rajasthan','Kerala','Arunachal Pradesh','Tripura','Nagaland','Sikkim','Uttarakhand',
			'Meghalaya','West Bengal','Haryana','Gujarat','Odisha','Tamil Nadu','Manipur','Jharkhand','Uttar Pradesh','Karnataka',
			'Chhattisgarh','Andhra Pradesh','Assam','Bihar','Mizoram','Himachal Pradesh','Goa','Madhya Pradesh','Beijing', 
			'Shanghai', 'Guangzhou', 'Shenzhen', 'Chengdu', 'Hangzhou', 'Nanjing', 'Wuhan', 'Chongqing')                THEN 'Asia'
        WHEN [from_location] in ('Paris', 'London', 'Berlin','Rome','Madrid','Amsterdam', 
								 'Brussels','Lisbon','Vienna', 'Athens')												THEN 'Europe'
        WHEN [from_location] IN ('New York City', 'Los Angeles', 'Chicago', 'Miami', 'Houston', 'Atlanta',
								  'Toronto', 'Vancouver', 'Montreal','Mexico City')										THEN 'North America'
        WHEN [from_location] LIKE '%Xi%'																				THEN 'Asia'
        ELSE ''
    END,
	[to_location],
		CASE 
        WHEN [to_location] IN (
            'Katni', 'New Delhi', 'Thane', 'Eluru', 'Miryalaguda', 'Bikaner', 'Chandrapur', 'Aizawl', 
			'Ajmer', 'Saharsa', 'Kollam', 'Bareilly', 'Bhilwara', 'Madurai', 'Raurkela Industrial Township', 
			'Malda', 'Bhatpara', 'Aurangabad', 'Thoothukudi', 'Akola', 'Hubliβ€“Dharwad', 'Varanasi', 'Bokaro', 
			'Parbhani', 'Ghaziabad', 'Karaikudi', 'Mumbai', 'Junagadh', 'Kamarhati', 'Vadodara', 'Hapur', 'Mehsana', 
			'Sangli-Miraj & Kupwad', 'Pallavaram', 'Rajahmundry', 'Jalgaon', 'Gurgaon', 'Ratlam', 'Dewas', 'Munger', 
			'Rajpur Sonarpur', 'Bongaigaon', 'Bidar', 'Ambattur', 'Buxar', 'Faridabad', 'Jamalpur', 'Gaya', 'Chennai', 
			'Alwar', 'Burhanpur', 'Vijayawada', 'Phusro', 'Raebareli', 'Proddatur', 'Gopalpur', 'Jaunpur', 'Sultan Pur Majra', 
			'Salem', 'Tumkur', 'Arrah', 'Moradabad', 'Bhiwandi', 'Rampur', 'Mysore', 'Karimnagar', 'Aligarh', 'Gangtok', 'Amravati', 
			'Rourkela', 'Patna', 'Bellary', 'Patiala', 'Maheshtala', 'Siwan', 'Hyderabad', 'Baranagar', 'Naihati', 
			'Ramagundam', 'Tirunelveli', 'Kottayam', 'Muzaffarpur', 'Ahmedabad', 'Tadipatri', 'Mirzapur', 'Chinsurah', 
			'Muzaffarnagar', 'Jammu', 'Nagpur', 'Gandhinagar', 'Kalyan-Dombivli', 'Bathinda', 'Raichur', 'Giridih', 
			'Udaipur', 'Ranchi', 'Jalna', 'Ambala', 'Karnal', 'Morbi', 'Ichalkaranji', 'Rewa', 'Narasaraopet', 'Bhavnagar', 
			'Saharanpur', 'Khora', 'Amritsar', 'Sikar', 'Coimbatore', 'Sambhal', 'Sonipat', 'Bhimavaram', 'Madhyamgram', 
			'Suryapet', 'Ahmednagar', 'Allahabad', 'Korba', 'Motihari', 'Imphal', 'Unnao', 'Sirsa', 'Alappuzha', 'Medininagar', 
			'Karawal Nagar', 'Gwalior', 'Thrissur', 'Danapur', 'Hajipur', 'Jamnagar', 'Ongole', 'Anantapuram', 'Kishanganj', 
			'Anantapur', 'Jodhpur', 'Tadepalligudem', 'Kurnool', 'Guwahati', 'Purnia', 'Erode', 'Tirupati', 'Surat', 'Shimoga', 
			'Madanapalle', 'Vellore', 'Khandwa', 'Haldia', 'Gudivada', 'Dibrugarh', 'Kakinada', 'Nagercoil', 'Panchkula', 
			'Belgaum', 'Bhusawal', 'Mau', 'Jorhat', 'Nanded', 'Darbhanga', 'Udupi', 'Ozhukarai', 'Avadi', 'Bardhaman', 
			'Bihar Sharif', 'Adoni', 'Amroha', 'Firozabad', 'Kharagpur', 'Kota', 'Raipur', 'Mango', 'Nagaon', 'Pali', 
			'Kolhapur', 'Ulhasnagar', 'Kozhikode', 'Ramgarh', 'Srikakulam', 'Bhalswa Jahangir Pur', 'Agartala', 'Thanjavur', 
			'Kadapa', 'Bulandshahr', 'Mahbubnagar', 'Sambalpur', 'Dharmavaram', 'Indore', 'Howrah', 'Vijayanagaram', 
			'Bhagalpur', 'Raiganj', 'Hazaribagh', 'Barasat', 'Hospet', 'Ludhiana', 'Secunderabad', 'Panvel', 'Kanpur', 
			'Nizamabad', 'Ballia', 'Satara', 'Dindigul', 'Chittoor', 'Cuttack', 'Bhiwani', 'Bangalore', 'Solapur', 
			'Tezpur', 'Nashik', 'Kulti', 'Bahraich', 'Bally', 'North Dumdum', 'Mangalore', 'Farrukhabad', 'Phagwara', 
			'Gulbarga', 'Kirari Suleman Nagar', 'Chandigarh', 'Gandhidham', 'Sri Ganganagar', 'Guntur', 'Dehradun', 
			'Ujjain', 'Tiruvottiyur', 'Asansol', 'Serampore', 'Kochi', 'Davanagere', 'Bhilai', 'Ambarnath', 'Bilaspur', 
			'Thiruvananthapuram', 'Dehri', 'Bijapur', 'Jabalpur', 'Fatehpur', 'Panipat', 'Nangloi Jat', 'Navi Mumbai', 
			'Noida', 'Tiruchirappalli', 'Pudukkottai', 'Jalandhar', 'Surendranagar Dudhrej', 'Guntakal', 'Singrauli', 
			'Bettiah', 'Dhanbad', 'Bidhannagar', 'Nadiad', 'Bhubaneswar', 'Meerut', 'Siliguri', 'Shivpuri', 'Guna', 
			'Bharatpur', 'Jhansi', 'Anand', 'Katihar', 'Tiruppur', 'Mira-Bhayandar', 'Berhampore', 'Warangal', 'Jamshedpur',
			'Jehanabad', 'Hosur', 'Vasai-Virar', 'Delhi', 'Begusarai', 'Latur', 'Etawah', 'Shahjahanpur', 'Jaipur', 'Deoghar', 
			'Orai', 'Panihati', 'Berhampur', 'Silchar', 'Visakhapatnam', 'Pondicherry','Chapra','Sagar','Uluberia','Hindupur',
			'Pune','Haridwar','Bhopal','Sasaram','Pimpri-Chinchwad','Rohtak','South Dumdum','Nellore','Shimla','Srinagar','Rajkot',
			'Durgapur','Yamunanagar','Dhule','Gorakhpur','Kumbakonam','Loni','Durg','Kolkata','Machilipatnam','Lucknow','Agra',
			'Satna','Morena','Mathura','Kavali','Bhind','Khammam','Tinsukia','Malegaon','Tenali','Nandyal','Amaravati',
			'Maharashtra','Telangana','Punjab','Rajasthan','Kerala','Arunachal Pradesh','Tripura','Nagaland','Sikkim','Uttarakhand',
			'Meghalaya','West Bengal','Haryana','Gujarat','Odisha','Tamil Nadu','Manipur','Jharkhand','Uttar Pradesh','Karnataka',
			'Chhattisgarh','Andhra Pradesh','Assam','Bihar','Mizoram','Himachal Pradesh','Goa','Madhya Pradesh')        THEN 'India'
        WHEN [to_location] = 'Paris'																					THEN 'France'
        WHEN [to_location] = 'London'																					THEN 'United Kingdom'
        WHEN [to_location] = 'Berlin'																					THEN 'Germany'
        WHEN [to_location] = 'Rome'																						THEN 'Italy'
        WHEN [to_location] = 'Madrid'																					THEN 'Spain'
        WHEN [to_location] = 'Amsterdam'																				THEN 'Netherlands'
        WHEN [to_location] = 'Brussels'																					THEN 'Belgium'
        WHEN [to_location] = 'Lisbon'																					THEN 'Portugal'
        WHEN [to_location] = 'Vienna'																					THEN 'Austria'
        WHEN [to_location] = 'Athens'																					THEN 'Greece'
        WHEN [to_location] IN ('New York City', 'Los Angeles', 'Chicago', 'Miami', 'Houston', 'Atlanta')				THEN 'USA'
        WHEN [to_location] IN ('Toronto', 'Vancouver', 'Montreal')														THEN 'Canada'
        WHEN [to_location] = 'Mexico City'																				THEN 'Mexico'
        WHEN [to_location] IN ('Beijing', 'Shanghai', 'Guangzhou', 'Shenzhen', 'Chengdu', 'Hangzhou', 
		'Nanjing', 'Wuhan', 'Chongqing')																				THEN 'China'
        WHEN [to_location] LIKE '%Xi%'																					THEN 'China'
        ELSE '' END,

	CASE WHEN [to_location] IN (
            'Katni', 'New Delhi', 'Thane', 'Eluru', 'Miryalaguda', 'Bikaner', 'Chandrapur', 'Aizawl', 
			'Ajmer', 'Saharsa', 'Kollam', 'Bareilly', 'Bhilwara', 'Madurai', 'Raurkela Industrial Township', 
			'Malda', 'Bhatpara', 'Aurangabad', 'Thoothukudi', 'Akola', 'Hubliβ€“Dharwad', 'Varanasi', 'Bokaro', 
			'Parbhani', 'Ghaziabad', 'Karaikudi', 'Mumbai', 'Junagadh', 'Kamarhati', 'Vadodara', 'Hapur', 'Mehsana', 
			'Sangli-Miraj & Kupwad', 'Pallavaram', 'Rajahmundry', 'Jalgaon', 'Gurgaon', 'Ratlam', 'Dewas', 'Munger', 
			'Rajpur Sonarpur', 'Bongaigaon', 'Bidar', 'Ambattur', 'Buxar', 'Faridabad', 'Jamalpur', 'Gaya', 'Chennai', 
			'Alwar', 'Burhanpur', 'Vijayawada', 'Phusro', 'Raebareli', 'Proddatur', 'Gopalpur', 'Jaunpur', 'Sultan Pur Majra', 
			'Salem', 'Tumkur', 'Arrah', 'Moradabad', 'Bhiwandi', 'Rampur', 'Mysore', 'Karimnagar', 'Aligarh', 'Gangtok', 'Amravati', 
			'Rourkela', 'Patna', 'Bellary', 'Patiala', 'Maheshtala', 'Siwan', 'Hyderabad', 'Baranagar', 'Naihati', 
			'Ramagundam', 'Tirunelveli', 'Kottayam', 'Muzaffarpur', 'Ahmedabad', 'Tadipatri', 'Mirzapur', 'Chinsurah', 
			'Muzaffarnagar', 'Jammu', 'Nagpur', 'Gandhinagar', 'Kalyan-Dombivli', 'Bathinda', 'Raichur', 'Giridih', 
			'Udaipur', 'Ranchi', 'Jalna', 'Ambala', 'Karnal', 'Morbi', 'Ichalkaranji', 'Rewa', 'Narasaraopet', 'Bhavnagar', 
			'Saharanpur', 'Khora', 'Amritsar', 'Sikar', 'Coimbatore', 'Sambhal', 'Sonipat', 'Bhimavaram', 'Madhyamgram', 
			'Suryapet', 'Ahmednagar', 'Allahabad', 'Korba', 'Motihari', 'Imphal', 'Unnao', 'Sirsa', 'Alappuzha', 'Medininagar', 
			'Karawal Nagar', 'Gwalior', 'Thrissur', 'Danapur', 'Hajipur', 'Jamnagar', 'Ongole', 'Anantapuram', 'Kishanganj', 
			'Anantapur', 'Jodhpur', 'Tadepalligudem', 'Kurnool', 'Guwahati', 'Purnia', 'Erode', 'Tirupati', 'Surat', 'Shimoga', 
			'Madanapalle', 'Vellore', 'Khandwa', 'Haldia', 'Gudivada', 'Dibrugarh', 'Kakinada', 'Nagercoil', 'Panchkula', 
			'Belgaum', 'Bhusawal', 'Mau', 'Jorhat', 'Nanded', 'Darbhanga', 'Udupi', 'Ozhukarai', 'Avadi', 'Bardhaman', 
			'Bihar Sharif', 'Adoni', 'Amroha', 'Firozabad', 'Kharagpur', 'Kota', 'Raipur', 'Mango', 'Nagaon', 'Pali', 
			'Kolhapur', 'Ulhasnagar', 'Kozhikode', 'Ramgarh', 'Srikakulam', 'Bhalswa Jahangir Pur', 'Agartala', 'Thanjavur', 
			'Kadapa', 'Bulandshahr', 'Mahbubnagar', 'Sambalpur', 'Dharmavaram', 'Indore', 'Howrah', 'Vijayanagaram', 
			'Bhagalpur', 'Raiganj', 'Hazaribagh', 'Barasat', 'Hospet', 'Ludhiana', 'Secunderabad', 'Panvel', 'Kanpur', 
			'Nizamabad', 'Ballia', 'Satara', 'Dindigul', 'Chittoor', 'Cuttack', 'Bhiwani', 'Bangalore', 'Solapur', 
			'Tezpur', 'Nashik', 'Kulti', 'Bahraich', 'Bally', 'North Dumdum', 'Mangalore', 'Farrukhabad', 'Phagwara', 
			'Gulbarga', 'Kirari Suleman Nagar', 'Chandigarh', 'Gandhidham', 'Sri Ganganagar', 'Guntur', 'Dehradun', 
			'Ujjain', 'Tiruvottiyur', 'Asansol', 'Serampore', 'Kochi', 'Davanagere', 'Bhilai', 'Ambarnath', 'Bilaspur', 
			'Thiruvananthapuram', 'Dehri', 'Bijapur', 'Jabalpur', 'Fatehpur', 'Panipat', 'Nangloi Jat', 'Navi Mumbai', 
			'Noida', 'Tiruchirappalli', 'Pudukkottai', 'Jalandhar', 'Surendranagar Dudhrej', 'Guntakal', 'Singrauli', 
			'Bettiah', 'Dhanbad', 'Bidhannagar', 'Nadiad', 'Bhubaneswar', 'Meerut', 'Siliguri', 'Shivpuri', 'Guna', 
			'Bharatpur', 'Jhansi', 'Anand', 'Katihar', 'Tiruppur', 'Mira-Bhayandar', 'Berhampore', 'Warangal', 'Jamshedpur',
			'Jehanabad', 'Hosur', 'Vasai-Virar', 'Delhi', 'Begusarai', 'Latur', 'Etawah', 'Shahjahanpur', 'Jaipur', 'Deoghar', 
			'Orai', 'Panihati', 'Berhampur', 'Silchar', 'Visakhapatnam', 'Pondicherry','Chapra','Sagar','Uluberia','Hindupur',
			'Pune','Haridwar','Bhopal','Sasaram','Pimpri-Chinchwad','Rohtak','South Dumdum','Nellore','Shimla','Srinagar','Rajkot',
			'Durgapur','Yamunanagar','Dhule','Gorakhpur','Kumbakonam','Loni','Durg','Kolkata','Machilipatnam','Lucknow','Agra',
			'Satna','Morena','Mathura','Kavali','Bhind','Khammam','Tinsukia','Malegaon','Tenali','Nandyal','Amaravati',
			'Maharashtra','Telangana','Punjab','Rajasthan','Kerala','Arunachal Pradesh','Tripura','Nagaland','Sikkim','Uttarakhand',
			'Meghalaya','West Bengal','Haryana','Gujarat','Odisha','Tamil Nadu','Manipur','Jharkhand','Uttar Pradesh','Karnataka',
			'Chhattisgarh','Andhra Pradesh','Assam','Bihar','Mizoram','Himachal Pradesh','Goa','Madhya Pradesh','Beijing', 
			'Shanghai', 'Guangzhou', 'Shenzhen', 'Chengdu', 'Hangzhou', 'Nanjing', 'Wuhan', 'Chongqing')                THEN 'Asia'
        WHEN [to_location] in ('Paris', 'London', 'Berlin','Rome','Madrid','Amsterdam', 
								 'Brussels','Lisbon','Vienna', 'Athens')												THEN 'Europe'
        WHEN [to_location] IN ('New York City', 'Los Angeles', 'Chicago', 'Miami', 'Houston', 'Atlanta',
								  'Toronto', 'Vancouver', 'Montreal','Mexico City')										THEN 'North America'
        WHEN [to_location] LIKE '%Xi%'																				    THEN 'Asia'
        ELSE ''
    END,
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