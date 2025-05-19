dqParseTokenGet(dqParse(Customer_Name, 'NAME', 'ENUSA'), 'Given Name', 'Name') || " " || dqParseTokenGet(dqParse(Customer_Name, 'NAME', 'ENUSA'), 'Middle Name', 'Name');



dqParseTokenGet(dqParse(Customer_Name, 'NAME', 'ENUSA'), 'Family Name', 'Name');