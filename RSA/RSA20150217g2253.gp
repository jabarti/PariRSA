/* Tworzy niezbędne pliki, po pierwszym wykonaniu do zakomentowania!!!!!*/
/*write(public_key);
write(private_key);
write(Message,"\"","Ala ma kota","\"");
/**/


p = nextprime(2^500+random(2^500))
q = nextprime(2^550+random(2^500));
n = p * q;
e=random(n);					\\ PUBLIC KEY

temp1=(p-1)*(q-1);
while(gcd(e,temp1)!=1, e=e+1);

d=lift(Mod(e,temp1)^(-1));		\\ PRIVATE KEY

check = (e*d)%temp1;						\\ check - if = 1 OK;


/* SPRAWDZAMY CZY PLIKI SĄ PUSTE!!! */
v1=readvec(public_key);
lengV1 = length(v1);
v2 = readvec(private_key);
lengV2 = length(v2);
v3=readvec(Message);
lengV3 = length(v3);


if(lengV1 == 0, if(check, write(public_key, e"\n"n)), print("ZŁO!!!"));	
if(lengV2 == 0, if(check, write(private_key, d"\n"n)), print("ZŁO!!!"));

/* ZABEZPIECZENIE PRZED TWORZENIEM NOWYCH KLUCZY W TLE (wykorzystywanych do E(x) i D(x))*/
/* SPRAWDZAMY CZY PLIKI SĄ PUSTE!!! */
v1=readvec(public_key);
lengV1 = length(v1);
v2 = readvec(private_key);
lengV2 = length(v2);

if(lengV1 != 0 && lengV2 != 0,{PubK=v1[1]; NNN=v1[2]; PriK=v2[1]; print("HURRA!!!!!!!!!!!!!!!!!!");},{PubK=e; NNN=n; PriK=d; print("ZŁO!!!!!!!!!!!!!!!!!!!!");};);
/*print("e=",e,"\nv1[1]=",v1[1]);
print("n=",n,"\nv1[2]=",v1[2]);
print("d=",d,"\nv2[2]=",v1[1]);*/

E(x)=lift(Mod(x,NNN)^PubK) 		\\ Encodes using above data (szyfrowane PUBLIC KEY)

D(x)=lift(Mod(x,NNN)^PriK) 		\\ Decodes using above data (odszyfrowane PRIVATE KEY)


if(lengV3 == 0, Sour_Message = "Zuzanna i Maciek", Sour_Message = v3[1]);	

print("Sour_Message: ",Sour_Message);
Sour_Message_VECTOR = Vecsmall(Sour_Message);

suma=0;
suma="";
i=0;
lenVEC = length(Sour_Message_VECTOR);

for(x = 1, lenVEC, {
		i = x-1;
		temp = Sour_Message_VECTOR[x];
		czesc = temp*(2^i);
		suma = concat(Str(suma), Str(czesc));
		\\suma = suma + (temp*(2^i));
		print("temp:",temp,", potega=",2^i,", czesc=",czesc,", suma=",suma);
		})			\\	Evaluates seq, where the formal variable X goes from a to b. Nothing is done if a > b. a and b must be in R.
/**/

print("suma=",suma);

org_tex = Strchr(Sour_Message_VECTOR);

/*Forma zamiany stringa na liczbę ;(*/
write(Temp,suma)
temp2 = readvec(Temp);
maxi=length(temp2);
liczba = temp2[maxi];

secretMessage = E(liczba);
DecryptINTmessage = D(secretMessage);

print("dług.szyfr: ",length(Str(secretMessage)));

print ("Sour_Message_VECTOR:", Sour_Message_VECTOR);
print ("org_tex:", org_tex);

write(DecryptINTMessage, DecryptINTmessage)
write(Secret_Message, secretMessage)

