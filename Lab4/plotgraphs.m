hA=plotyy(x1,y1,x2,y2);  % dummy plotyy just saving handles; use your variables
linkaxes(hA,'y')         % link the two y axes to stay together
ylim(hA(1),[3 4.4])      % set the range desired
set(hA,'yticklabel',num2str([get(hA(1),'ytick')].','%0.1f')) % format to one decimal
set(hA(2),'xdir','reverse','xaxislocation','top')

hold on
plot(p,p);
plot(p,pb1);
plot(p,pb2);
plot(p,pb3);
set(gca, 'XDir','reverse')
hold off