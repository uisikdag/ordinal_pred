function esc=encodeStaircase(mytable,myordinalcol)
%%
%
%  Sample Use:
%  encodedTable=encodeStaircase('abc.csv','my_ordinal_var');
%
%
% Walter et al., 1987
% Staircase coding of ordinal predictor with several binary variables:
% 
% Walter, S. D., Feinstein, A. R., & Wells, C. K. (1987). 
% Coding ordinal independent variables in multiple regression analyses. American Journal of Epidemiology, 
% 125(2), 319-323. https://doi.org/10.1093/oxfordjournals.aje.a114532
%
% Please also see:
% http://www.regorz-statistik.de/en/regression_ordinal_predictor.html
%
%%
data=readtable(mytable);
mydata=data(:,myordinalcol);
mydata=table2array(mydata);
unq=unique(mydata);
lngunq=length(unq);
%matrix size  1 one less than datasize
row_num=lngunq;
col_num=row_num-1;
mtx=zeros(row_num);
%%

%first row will stay as 0 ;
mtx(1,1)=1;
for i=2:row_num
    %columns to be marked with 1
    one_cols=2:i;
    mtx(i,1)=i;
    mtx(i,one_cols)=1;
end
%%
hinput=height(mydata);

outmat=zeros(hinput,1+col_num);

outmat(:,1)=mydata;


for i=1:hinput
    for j=1:row_num
    if outmat(i,1)==mtx(j,1)
        outmat(i,2:14)=mtx(j,2:14);
    end
    end
end

td=array2table(outmat(:,2:end));%table of dummy variables
tf=[data td];   %output table

writetable(tf,'staircasedData.csv');
esc=tf;

end