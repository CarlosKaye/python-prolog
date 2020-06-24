/*---Hermanos----*/
hermanos(A,B) :- A\==B,
	padres(A,X),
	padres(B,X).

/*----- sangre ---------*/
tios(A,B) :-
	padres(B,X),
	hermanos(X,A),
	X\==B.

abuelos(PA,PB):- padres(PA,X),padres(X,PB).
/*------ Bisabuelos ---------*/
bisabu(A,B) :- A\==B,
	padres(A,X),
	padres(X,Y),
	padres(Y,B).
/*------ tataraabuelos ----------*/
tatarabuelo(A,B) :- A\==B,
	bisabu(A,X),
	padres(X,B).
/*--------- taratarataraabuelo ---------*/
tatararabuelo(A,B) :- A\==B,
	tatarabuelo(A,X),
	padres(X,B).
/*-------- Tios Abuelos ---------------*/
tioabu(A,B) :- A\==B,
	padres(A,X),
	tios(X,B).
/*------------ Tios Bisabuelos -------------------*/
tiobis(A,B) :- A\==B,
	bisabu(A,X),
	hermanos(X,B).
/*----- Bisnietos ----------------*/
bisnie(A,B) :- A\==B,
	bisabu(B,A).
/*----------- Primos --------------*/
primos(A,B) :- A\==B,
	padres(A,X),
	padres(B,Y),
	hermanos(X,Y).
/*------------- Primos Segundos ----------*/
primosseg(A,B) :- A\==B,
	padres(A,X),
	padres(X,Y),
	hermanos(Y,Z),
	padres(W,Z),
	padres(B,W).

/*--------- Primos terceros ------------------*/
primoster(A,B) :- A\==B,
	bisabu(A,X),
	hermanos(X,Y),
	bisnie(Y,B).
/*---------- Sobrinos -------------------*/
sobrinos(A,B) :- A\==B,
	tios(B,A).
/*----------- Sobrinos nietos ---------------*/
sobrinietos(A,B) :- A\==B,
	tioabu(B,A).
/*---------- Sobrinos Bisnietos --------------*/
sobribis(A,B) :- A\==B,
	tiobis(B,A).
/*-------- Dusuegros ------------------*/
duossue(A,B) :- A\==B,
	padres(W,A),
	padres(W,V),
	V\==A,
	padres(V,X),
	padres(X,B).