write(DecryptINTMessage);


inv2(x) = {
iferr(1/x,
ERR, if (errname(ERR) == "e_INV", print(ERR)); "oo")
}
\\print(inv2(0));


\\iferr(readvec(file),ERR, if (errname(ERR) == "e_INV", print(ERR)); "oo");
iferr(readvec(file),ERR,"oo")


p = nextprime(2^500+random(2^500))
q = nextprime(2^550+random(2^500));

\\write(public_key, "p: "p"\nq: "q);

n = p * q;
\\m = lcm(p-1, q-1);    		\\ lcm(x, {y}). Least common multiple of x and y

e=random(n);					\\ PUBLIC KEY

temp1=(p-1)*(q-1);
while(gcd(e,temp1)!=1, e=e+1);

d=lift(Mod(e,temp1)^(-1));		\\ PRIVATE KEY

check = (e*d)%temp1;						\\ check - if = 1 OK;

\\if(check, write(public_key, "p: "p "\nq: "q "\nKEY PAR(n, PubKey):\nn: "n "\nPubKey: "e));
\\if(check, write(private_key, "PriKey: "d));	


E(x)=lift(Mod(x,n)^e) 		\\ Encodes using above data (szyfrowane PUBLIC KEY)

D(x)=lift(Mod(x,n)^d) 		\\ Decodes using above data (odszyfrowane PRIVATE KEY)

/* SPRAWDZAMY CZY PLIKI SĄ PUSTE!!! */
v1=readvec(public_key);
lengV1 = length(v1);
v2 = readvec(private_key);
lengV2 = length(v2);
v3=readvec(Message);
lengV3 = length(v3);


if(lengV1 == 0, if(check, write(public_key, e"\n"n)));	
if(lengV2 == 0, if(check, write(private_key, d"\n"n)));
if(lengV3 == 0, Sour_Message = "Zuzanna i Maciek", Sour_Message = v3[1]);	


print("Sour_Message: ",Sour_Message);
Sour_Message_VECTOR = Vecsmall(Sour_Message);


suma=0;
\\suma2=0;
i=0;
lenVEC = length(Sour_Message_VECTOR);

for(x = 1, lenVEC, {
		i = x-1;
		temp = Sour_Message_VECTOR[x];
		suma = suma + (temp*(2^i));
		print("temp:",temp,"potega=",2^i,"suma=",suma);
		\\suma2 = suma2 + (temp);
		})			\\	Evaluates seq, where the formal variable X goes from a to b. Nothing is done if a > b. a and b must be in R.
/**/

print("suma=",suma);
\\print("suma2=",suma2);


org_tex = Strchr(Sour_Message_VECTOR)


secretMessage = E(suma);
DecryptINTmessage = D(secretMessage);

print("dług.szyfr: ",length(Str(secretMessage)));

print ("Sour_Message_VECTOR:", Sour_Message_VECTOR);
print ("org_tex:", org_tex);


/* SPRAWDZAMY CZY PLIKI SĄ PUSTE!!! *//* BEZ SENSU!!!
v4=readvec(DecryptINTMessage);
lengV4 = length(v4);
v5 = readvec(Secret_Message);
lengV5 = length(v5);

if(lengV4 == 0, write(DecryptINTMessage, DecryptINTmessage));
if(lengV5 == 0, write(Secret_Message, secretMessage));
/**/


write(DecryptINTMessage, DecryptINTmessage)
write(Secret_Message, secretMessage)

