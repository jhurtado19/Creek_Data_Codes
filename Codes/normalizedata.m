% normal plots 

nTEMP = normalize(temp);
nCDOM = normalize(cdom);

% nTRP = normalize(trp);
nWLVL = normalize(wlvl);


plot(t_wql,nTEMP,'r');
hold on
plot(t_wql,nTRP,'m');
plot(t_wql,nCDOM,'c');
plot(t_usgs,nWLVL,'b');
