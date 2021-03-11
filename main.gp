nb = 512;
nbm = 12;
mod = 1<<nbm;
mask = 2*(4^(nbm/2)-1)/(4-1);
n = read("input.txt");
chiffre(m) = [m^2%n,kronecker(m,n),m%2];
dechiffre(c) = read("dec")(c);
m = random(1<<500)<<nb+mask;
if(dechiffre(chiffre(m)) != m,error("problème d'énoncé à signaler"));


\\ On va appliquer la méthode vue en cours qui consiste à déchiffrer
\\ (m²,-1, m%2) et (m²,1, m%2) 
\\ (c'est donc une attaque à chiffré choisi)
\\ Problème : la sécurité mise en place impose une certaine forme pour le
\\ message d'origine. Si elle n'est pas respectée, le déchiffrement ne fonctionne pas (il renvoie 0).
\\ Il va donc falloir chercher aléatoirement un couple de messages différents
\\ (sinon on ne pourra pas factoriser n) qui respecte le critère.



find_couple()={
	\\ on verifie d'abord avec le m donné
	c=chiffre(m);
	cmoins=c;
	cmoins[2]=-c[2];  
	testm=dechiffre(cmoins);
	\\ Tant que le déchiffrement ne donne rien, on retente.
	\\ Ne pas oublier de vérifier que les clairs sont différents !
	while(testm==0 || testm==m,
			m= random(1<<500)<<nb+mask;
			c= chiffre(m);
			c[2]= -c[2];
			testm=dechiffre(c));
	\\ On renvoie le couple trouvé
	[m,testm];
}



\\ On retrouve les facteurs de n grace au pgcd.
find_factor(c,m,n)={
	\\ c et m ont le même chiffrement, à l'exeption de leur symbole de Jacobi
	\\ On a alors m=m_p[p], m=m_q[q] et (quitte à intervertir p et q)
	\\ c=-m_p[p], c=m_q[q]
	\\ Les deux facteurs sont pgcd(c+m,n) et pgcd(c-m,n) !
	p=gcd(c-m,n);
	q=gcd(c+m,n);
	\\ On affiche le plus petit des deux comme demandé.
	print(if( p<q, p, q));
}



\\ Il suffit d'appliquer les deux fonctions définies ci-dessus pour pouvoir
\\ factoriser n !

[c1,c2]=find_couple();
find_factor(c1,c2,n);




