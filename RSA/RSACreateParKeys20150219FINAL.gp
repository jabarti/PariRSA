/* RSACreateParKeys.gp */
/* Tworzy niezbędne pliki, po pierwszym wykonaniu do zakomentowania!!!!!*/
/*
system("C:\xampp\htdocs\Pari-2-7-2 > RSA_01_public_key");
system("C:\xampp\htdocs\Pari-2-7-2 > RSA_02_private_key");
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
v1=readvec(RSA_01_public_key);
lengV1 = length(v1);
v2 = readvec(RSA_02_private_key);
lengV2 = length(v2);

if(lengV1 == 0, if(check, write(RSA_01_public_key, e"\n"n)), print("ZLO!!!"));	
if(lengV2 == 0, if(check, write(RSA_02_private_key, d"\n"n)), print("ZLO!!!"));


/* Powinno być odkomentowane w wersji docelowej skryptu to co chcemy żeby sie wyświetlało jako wynik*/
system("start RSA_01_public_key");
\\system("start RSA_02_private_key");				\\ raczej nie powinno być odkomentowane!, niech dostęp będzie trudny!


/* Powinno być odkomentowane w wersji docelowej skryptu*/
\\quit();
