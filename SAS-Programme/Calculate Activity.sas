data &_output1 (promote=yes);  
    length Customer_Activity $20;

    set &_input1;
	Customer_Activity = scan(Customer_Type, -2);
	if (Customer_Activity not in("low", "medium", "high")) then 
	    do; 
	      if (scan(Customer_Type, -1) = "inactive") then Customer_Activity="inactive";
	      else if (scan(Customer_Type, -1) = "Customers") then Customer_Activity="NoN";
	    end;  

run;
