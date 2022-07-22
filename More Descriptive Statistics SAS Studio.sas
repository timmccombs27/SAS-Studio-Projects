ods graphics / reset width=6.4in height=4.8in imagemap;

proc sgplot data=MIS543.PRODUCTS;
	vbar Continent / fillattrs=(color=darkgreen) categoryorder= respdesc;
	yaxis grid max=800000 labelattrs=(color=darkgreen size=12pt);
	xaxis labelattrs=(color=darkgreen size=12pt);
	title c=darkgreen bold h=1.8 "Orders per Continent";
run;
title;

ods graphics / width=10in;
ods graphics / height=6in;

proc sgplot data=MIS543.PRODUCTS;
	vbar CountryLabel / fillattrs=(color=darkgreen) categoryorder= respdesc;
	yaxis grid max=250000 labelattrs=(color= darkgreen size=12pt);
	xaxis labelattrs=(color= darkgreen size=12pt);
	title c=darkgreen bold h=1.8 "Orders per Country";
run;
title;


ods graphics / width=8.4in;
ods graphics / height=6in;

proc sgplot data=MIS543.PRODUCTS;
	vbar Product_Category / fillattrs=(color=STGB) categoryorder= respdesc;
	yaxis grid labelattrs=(color=STGB size=12pt);
	xaxis labelattrs=(color=STGB size=12pt);
	title c=darkblue bold h=1.8 "Orders per Product Category";
run;
title;

proc sgplot data=MIS543.PRODUCTS;
	vbar Product_Line / fillattrs=(color=STGB) categoryorder= respdesc;
	yaxis grid labelattrs=(color=STGB size=12pt);
	xaxis labelattrs=(color=STGB size=12pt);
	title c=darkblue bold h=1.8 "Orders Processed per Product Line";
run;
title;

ods graphics / reset width=11in height=4.8in imagemap;

proc sgplot data=MIS543.PRODUCTS;
	vbar Product_Group / fillattrs=(color=STGB) categoryorder= respdesc;
	yaxis grid labelattrs=(color=STGB size=12pt);
	xaxis labelattrs=(color=STGB size=12pt);
	title c=darkblue bold h=1.8 "Orders Processed per Product Group";
run;
title;

proc sgplot data=MIS543.PRODUCTS;
	vbar Continent / group=Product_Category groupdisplay=cluster categoryorder=respdesc;
	yaxis grid max=150000 labelattrs=(color=DERO size=12pt);
	xaxis labelattrs=(color=DERO size=12pt);
	title c=DERO bold h=1.8 "Product Categories Ordered per Continent";
run;
title;

ods graphics / width=8.4in;
ods graphics / height=6in;

proc sgplot data=MIS543.PRODUCTS;
	where CountryLabel= 'United States';
	vbar Product_Category / fillattrs=(color=DERO) categoryorder=respdesc;
	yaxis grid max=60000 labelattrs=(color=DERO size=12pt);
	xaxis labelattrs=(color=DERO size=12pt);
	title c=DERO bold h=1.8 "Product Categories Ordered in the United States";
run;
title;

proc freq data=MIS543.PRODUCTS order=freq;
	where CountryLabel= 'United States';
	tables Product_Category / nocum nopercent out=mis543.ustable;
run;

proc print data=mis543.ustable label noobs style(header obsheader)=[fontsize=5 color=DERO backgroundcolor=PAOY];
	var Product_Category / style(data)=[fontsize=4 fontweight=bold color=DERO]; 
	var count / style(data)=[fontsize=4 fontweight=bold color=DERO];
	format count comma.;
	label Product_Category= 'Product Category';
	title c=DERO bold h=6 "Product Categories Ordered in the United States";
run;
title;

ods graphics / reset;



	