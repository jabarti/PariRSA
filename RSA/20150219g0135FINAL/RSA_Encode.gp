/* RSA_Encode.gp */

/* Tworzy niezbędne pliki, po pierwszym wykonaniu do zakomentowania!!!!!*/
/*
system("C:\xampp\htdocs\Pari-2-7-2 > RSA_03_Message.txt");
system("echo \"Ala ma kota\" > RSA_03_Message.txt");
/**/


/* SPRAWDZAMY CZY PLIKI SĄ PUSTE!!! */
v1=readvec(RSA_01_public_key);
lengV1 = length(v1);

v3=readvec("RSA_03_Message.txt");
lengV3 = length(v3);

print(lengV1,", v1[1]=",v1[1]);


if(lengV3 == 0, Sour_Message = "Zuzanna i Maciek", Sour_Message = v3[1]);	


if(lengV1 != 0,{PubK=v1[1]; NNN=v1[2]; print("Dane z plikow");});

print("PubK=",PubK,", NNN=",NNN);

E(x)=lift(Mod(x,NNN)^PubK) 							\\ Zakodowuje używając odczytanych danych (szyfrowane PUBLIC KEY)

print("Sour_Message: ",Sour_Message);
Sour_Message_VECTOR = Vecsmall(Sour_Message);

suma=0;
suma="";
i=0;
lenVEC = length(Sour_Message_VECTOR);

for(x = 1, lenVEC, {
		i = x-1;
		temp = Sour_Message_VECTOR[x];
		czesc = temp+100;
		suma = concat(Str(suma), Str(czesc));
		print("temp:",temp," czesc=",czesc,", suma=",suma);
		})
/**/

print("suma=",suma);

org_tex = Strchr(Sour_Message_VECTOR);

/* Forma zamiany stringa na liczbę ;( */
write(RSA_04_Temp,suma)
temp2 = readvec(RSA_04_Temp);
maxi=length(temp2);
liczba = temp2[maxi];

print(liczba)

secretMessage = E(liczba);

print("dlug.szyfr: ",length(Str(secretMessage)));

print ("Sour_Message_VECTOR:", Sour_Message_VECTOR);
print ("org_tex:", org_tex);

system("rm RSA_05_Secret_Message.txt");					\\ Zapobiega nawarstwianiu sie kolejnych wiadomości zakodowanych, po każdym wykoaniu skryptu
write("RSA_05_Secret_Message.txt", secretMessage);


/* Powinno być odkomentowane w wersji docelowej skryptu to co chcemy żeby sie wyświetlało jako wynik*/
system("start RSA_05_Secret_Message.txt");
\\system("start RSA_07_messageUncrypted.txt");
\\system("start RSA_01_public_key");
\\system("start RSA_02_private_key");				\\ raczej nie powinno być odkomentowane!, niech dostęp będzie trudny!

/* Powinno być odkomentowane w wersji docelowej skryptu*/
quit();
