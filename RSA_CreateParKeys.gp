/* RSA_CreateParKeys.gp */
/* Tworzy niezbędne pliki, po pierwszym wykonaniu do zakomentowania!!!!!*/
/*
system("C:\xampp\htdocs\Pari-2-7-2 > RSA_01_public_key");
system("C:\xampp\htdocs\Pari-2-7-2 > RSA_02_private_key");
/**/

\\setrand(random(10000))

p = nextprime(2^500+random(2^500))
q = nextprime(2^550+random(2^500));
n = p * q;
e=random(n);					\\ PUBLIC KEY

/* TRZEBA SPRAWDZIĆ CZY PUBL_KEY NIE JEST NA RSA_09_public_key_created_LIST!!!! (BŁĄD STAŁEGO SEEDA PO WYŁACZENIU PARI!!!!!*/
FUN(e)={
	LIST=readvec(RSA_09_public_key_created_LIST);
	LENcheckLIST = length(LIST);
	for(i=1,LENcheckLIST,if(e-LIST[i]==0,return false,return true));
}
/**/

\\write("check.txt", getrand())

temp1=(p-1)*(q-1);
while((gcd(e,temp1)!=1 && FUN(e) != false), e=e+1);

d=lift(Mod(e,temp1)^(-1));		\\ PRIVATE KEY

check = (e*d)%temp1;						\\ check - if = 1 OK;


/* SPRAWDZAMY CZY PLIKI SĄ PUSTE!!! */
v1=readvec(RSA_01_public_key);
lengV1 = length(v1);
v2 = readvec(RSA_02_private_key);
lengV2 = length(v2);


if(lengV1 == 0, if(check, {	write(RSA_01_public_key, e"\n"n); write(RSA_09_public_key_created_LIST, e); }, print("ZLO1!!!")));	
if(lengV2 == 0, if(check, write(RSA_02_private_key, d"\n"n)), print("ZLO2!!!"));
/**/

/* to jest wersja ze stałym tworzeniem nowej pary kluczy  [GROZI USUNIĘCIEM TRWAŁYM NIEZAPISANEGO!!!] *//*
system("rm RSA_01_public_key");
system("rm RSA_02_private_key");

if(check, {	write(RSA_01_public_key, e"\n"n); write(RSA_09_public_key_created_LIST, e); })
if(check, write(RSA_02_private_key, d"\n"n))
/**/

\\write(RSA_01_public_key2, e"\n"n);
\\write(RSA_02_private_key2, d"\n"n);


/* Powinno być odkomentowane w wersji docelowej skryptu to co chcemy żeby sie wyświetlało jako wynik*/
\\system("start RSA_02_private_key");				\\ raczej nie powinno być odkomentowane!, niech dostęp będzie trudny!
\\system("start RSA_01_public_key");



/* Powinno być odkomentowane w wersji docelowej skryptu*/
\\quit();			\\ jak niezakomentowane to tworzy taki same klucze!!
