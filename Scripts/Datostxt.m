Time = num2str(out.u.Time); 
u = num2str(out.u.Data);
y = num2str(out.y.Data);

T = table(Time,u,y)
 
writetable(T,'myData.txt','Delimiter','\t')