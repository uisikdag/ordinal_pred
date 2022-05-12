%for encoding nomimal variables use of MATLAB's dummyvar function is encouraged
r=readtable('sample_data.csv');
dt=r.my_ordinal_var;
mydummy=dummyvar(dt);
mydummy_notrap=mydummy(:,2:end);