/* SPRAWDZAMY CZY PLIKI SĄ PUSTE!!! */
v1=readvec(RSA_01_public_key);
lengV1 = length(v1);
v2 = readvec(RSA_02_private_key);
lengV2 = length(v2);
secretMessage = readvec(RSA_05_Secret_Message);
secretMessage = secretMessage[1];

if(lengV1 != 0 && lengV2 != 0,{PubK=v1[1]; NNN=v1[2]; PriK=v2[1]; print("Dane z plikow");});


D(x)=lift(Mod(x,NNN)^PriK) 		\\ Decodes using above data (odszyfrowane PRIVATE KEY)


DecryptINTmessage = D(secretMessage);

\\print("dlug.szyfr: ",length(Str(secretMessage)));


write(RSA_06_DecryptINTMessage, DecryptINTmessage);

system("rm RSA_05_Secret_Message");					\\ Zapobiega nawarstwianiu sie kolejnych wiadomości zakodowanych, po każdym wykoaniu skryptu
write(RSA_05_Secret_Message, secretMessage);


/* DEKRYPTARZ INT => STR*/
v6=readvec(RSA_06_DecryptINTMessage);
lengV6 = length(v6);								\\ ile jest zapisanych liczb!!!
print("LONG V6/:", lengV6);
v6Last = v6[lengV6];								\\ weźmy ostatni zapisany
lengv6Last = length(Str(v6Last));					\\ obliczmy jego długość (ilość znaków, a nie wielkość bitową)


lengV6Last_3 = lengv6Last/3;						\\ ponieważ ta długość została stworzona przez konkatenację 3znakowych liczb(kod ASCI +100), jest podzielna prz 3

print(lengv6Last, "/",lengV6Last_3);				\\ jest to ilość znaków w zaszyfrowanej wiadomośći

\\ obliczać to jako reszte z dzielenia przez kolejne potegi 1000^i i odcinać modulo... 
\\ Vecsmall i Strchr(%)


if(lengV6 != 0,DecryptedINTmessage = v6[1]);

pot =1000^(lengV6Last_3-1);
pot2 =1000^(lengV6Last_3-2);

t = lift(Mod(v6Last,pot));
t2 = lift(Mod(v6Last,pot2));

print(v6Last, " reszta z dziel przez: ",pot," wynik=",t)
print(v6Last, " reszta z dziel przez: ",pot2," wynik=",t2)

messageUncrypted = "";

for(i=1,lengV6Last_3,{
	pot =  (1000^(lengV6Last_3-i));
	temp = v6Last-lift(Mod(v6Last,pot));
	v6Last = lift(Mod(v6Last,pot));
	print(v6Last);
	temp = Vecsmall(Str(temp));
	temp = [temp[1],temp[2],temp[3]];
	temp = Strchr(temp);
	write(RSA_04_Temp, temp);
	temp = readvec(RSA_04_Temp);
	maxi=length(temp);
	temp = temp[maxi];
	temp = temp -100;
	letter = Strchr(temp);
	messageUncrypted = concat(messageUncrypted,letter);
	print(temp)
});

system("rm RSA_04_Temp");
system("rm RSA_06_DecryptINTMessage");
system("rm RSA_07_messageUncrypted");


print("messageUncrypted:",messageUncrypted);

write(RSA_07_messageUncrypted, "\"",messageUncrypted,"\"");

/* Powinno być odkomentowane w wersji docelowej skryptu*/
\\quit();
