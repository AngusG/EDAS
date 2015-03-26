% savemovie.m

% now have movieMatrix which contains 
% 120 features with 54 terms representing 4.5 mins of data.

%% Save to file %%

if(strcmp(type,'i'))
  Yi = 0;  %label interictal as 0
  
elseif(strcmp(type,'p'))
  Yi = 1;  %label preictal as 1
else
printf("Must specify either i or p\n");
end


x = 0:.1:1;
A = [x; exp(x)];

fid = fopen('svmdata/test.txt','wt');
%fprintf(fileID,'%6s %12s\n','x','exp(x)');
%fprintf(fileID,'%6.2f %12.8f\n',A);

%fprintf(fileID,'%.6e \n', movieMatrix(1,:) );

%fid = fopen('myfile.txt', 'wt'); % Open for writing

movieMatrixT = movieMatrix.';

for i=1:size(movieMatrixT,1)	%will run for 120x
   %fprintf(fid, '%d %.4f ', Yi, movieMatrixT(i,:));
   
   fprintf(fid, '%d,', Yi);   
  % fprintf(fid, '%d:%.4e ', 2*i, movieMatrixT(i,:));
   
   fprintf(fid, '%.4e,', movieMatrixT(i,:));
   fprintf(fid, '\n');
end
fclose(fid);

fclose(fileID);