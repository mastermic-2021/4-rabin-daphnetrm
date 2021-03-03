# Rabin

On considère un cryptosystème de Rabin pour l'entier de ``1024`` bits
```
n = 27328417631308277322150562883314533200963002826716705199968875674106406752147424222024338127563628593224661592571938485301935882942995461145895711114923374531636454291853327561820612951870422339965236147439814490182689636048215824374569331866443582899661940664297395527208577159582046566117830509217529095109
```
Pour assurer la sécurité du système, on impose de
ne chiffrer que des messages dont les 10 derniers bits sont
``1010101010``.

Pour un chiffré ``c = [m^2,kronecker(m,c),m%2]``,
``c->dechiffre(c)`` renvoie le message ``m``, s'il satisfait
à la condition sur les 12 derniers bits.

Déterminer le plus petit facteur de ``n``.

## Format

Vous devez écrire un programme `main.gp` en Pari/GP dont l'exécution via
```
gp -fq < main.gp
```
affiche (uniquement) la solution cherchée.

taper `make check` permet de vérifier que votre solution est bonne.

Veillez à mettre des commentaires sur votre démarche et sa validité
dans le fichier ``main.gp``.

## Validation

Il reste à faire un commit et à envoyer votre solution pour l'enregistrer
```
git add main.gp
git commit -m 'ma solution'
git push
```

