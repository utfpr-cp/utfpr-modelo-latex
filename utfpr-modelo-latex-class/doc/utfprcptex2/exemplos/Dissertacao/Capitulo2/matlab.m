Tsoll_H = komforttemp - 2; 
Tsoll_K = komforttemp + 2; 


% Heizgrenze = Tsoll_H-Rlf*qelb; 
% Kuehlgrenze= Tsoll_K-Rlf*qeub; 

if (T_Au_aktiv < Heizgrenze) && (T_Au_aktiv < Kuehlgrenze) 
   Betriebsart= 1; %Heizen 
elseif (T_Au_aktiv > Heizgrenze) && (T_Au_aktiv > Kuehlgrenze) 
   Betriebsart= 2; %Kuehlen 
elseif (T_Au_aktiv <= Heizgrenze) && (T_Au_aktiv >= Kuehlgrenze) 
   Betriebsart= 3; %Heizen oder Kuehlen 
else 
   Betriebsart= 0; %Aus 
end 