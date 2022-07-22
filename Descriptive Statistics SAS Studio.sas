ods graphics / reset width=9in height=6in imagemap;

title bold h=1.8 'Sales and Profit by Customer Type';
proc sgplot data=MIS543.CUSTOMER;
	vbar Customer_Type / response=Total_Revenue datalabel stat=mean dataskin=pressed fillattrs=(color=LIGB) legendlabel="Average Sales";
	vbar Customer_Type / response=Profit datalabel stat=mean dataskin=pressed legendlabel="Average Profit";
	yaxis grid max=200 display=(nolabel) labelattrs=(size=12pt);
	xaxis label="Customer Type" labelattrs=(size=12pt weight=bold);
	format Total_Revenue Profit DOLLAR6.2;
run;
title;

ods graphics / reset width=6.4in height=4.8in;

title bold h=1.8 'Where Customers Are Buying';
proc sgplot data=MIS543.CUSTOMER;
	vbar Continent /categoryorder=respdesc dataskin=pressed fillattrs=(color=LIGB);
	yaxis label="Number of Orders" grid max=800000 valuesformat=COMMA10. labelattrs=(size=12pt weight=bold);
	xaxis label="Continent" labelattrs=(size=12pt weight=bold);
run;
title;

title bold h=1.8 'How Customer Are Buying';
proc sgplot data=MIS543.CUSTOMER;
	vbar OrderTypeLabel /categoryorder=respdesc dataskin=pressed fillattrs=(color=LIGB);
	yaxis label="Number of Orders" grid max=800000 valuesformat=COMMA10. labelattrs=(size=12pt weight=bold);
	xaxis label="Order Source" labelattrs=(size=12pt weight=bold);
run;
title;

title bold h=1.8 'Sales and Profit by Order Source';
proc sgplot data=MIS543.CUSTOMER;
	vbar OrderTypeLabel / response=Total_Revenue datalabel stat=mean categoryorder= respdesc dataskin=pressed fillattrs=(color=LIGB) legendlabel="Average Sales";
	vbar OrderTypeLabel / response=Profit datalabel stat=mean dataskin=pressed legendlabel="Average Profit";
	format Total_Revenue Profit DOLLAR6.2;
	yaxis grid max=200 display=(nolabel);
	xaxis label="Order Source" labelattrs=(size=12pt weight=bold);
run;
title;

ods graphics / reset;