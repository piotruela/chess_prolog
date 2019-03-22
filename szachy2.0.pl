int_to_char(1,L) :- L = a.
int_to_char(2,L) :- L = b.
int_to_char(3,L) :- L = c.
int_to_char(4,L) :- L = d.
int_to_char(5,L) :- L = e.
int_to_char(6,L) :- L = f.
int_to_char(7,L) :- L = g.
int_to_char(8,L) :- L = h.


figura(skoczek,biale,1,6).
figura(skoczek,biale,8,3).
figura(goniec,biale,1,2).
figura(goniec,biale,2,2).
figura(wieza,biale,2,4).
figura(wieza,biale,7,5).
figura(hetman,biale,6,3).
figura(krol,biale,7,6).
figura(pion,czarne,4,5).
figura(pion,biale,8,5). %figura dodana
figura(pion,biale,5,4). %figura dodana
figura(pion,czarne,4,6). 
figura(pion,czarne,4,7). 
figura(pion,czarne,5,2). 
figura(pion,czarne,5,7). 
figura(pion,czarne,7,4).
figura(skoczek,czarne,3,2).
figura(goniec,czarne,1,8).
figura(goniec,czarne,5,3).
figura(wieza,czarne,3,4).
figura(wieza,czarne,3,5).
figura(hetman,czarne,6,1).
figura(krol,czarne,5,6).

%ruchy skoczka
ruch(skoczek,X,Y,X1,Y1) :- X1 is X + 2, Y1 is Y + 1.  
ruch(skoczek,X,Y,X1,Y1) :- X1 is X + 2, Y1 is Y - 1.
ruch(skoczek,X,Y,X1,Y1) :-  X1 is X - 2, Y1 is Y - 1.
ruch(skoczek,X,Y,X1,Y1) :-  X1 is X - 2, Y1 is Y + 1.
ruch(skoczek,X,Y,X1,Y1) :- X1 is X + 1, Y1 is Y + 2.
ruch(skoczek,X,Y,X1,Y1) :-  X1 is X + 1, Y1 is Y - 2.
ruch(skoczek,X,Y,X1,Y1) :-  X1 is X - 1, Y1 is Y + 2.
ruch(skoczek,X,Y,X1,Y1) :-  X1 is X - 1, Y1 is Y - 2.

%ruchy króla
ruch(krol,X,Y, X1, Y1) :- X1 is X - 1, Y1 is Y + 1. 
ruch(krol,X,Y, X1, Y1) :- X1 is X, Y1 is Y + 1. 
ruch(krol,X,Y, X1, Y1) :- X1 is X + 1, Y1 is Y + 1. 
ruch(krol,X,Y, X1, Y1) :- X1 is X - 1, Y1 is Y. 
ruch(krol,X,Y, X1, Y1) :- X1 is X + 1, Y1 is Y. 
ruch(krol,X,Y, X1, Y1) :- X1 is X - 1, Y1 is Y - 1. 
ruch(krol,X,Y, X1, Y1) :- X1 is X, Y1 is Y - 1. 
ruch(krol,X,Y, X1, Y1) :- X1 is X - 1, Y1 is Y + 1. 

%ruchy bialego piona bez bicia
ruch(pion,X,Y, X1, Y1) :- X1 is X, Y1 is Y + 1, jaki_kolor(X,Y,Z), Z = 'biale',
    czy_wolne(X1,Y1).

%ruchy czarnego piona bez bicia
ruch(pion,X,Y, X1, Y1) :- X1 is X, Y1 is Y - 1, jaki_kolor(X,Y,Z), Z = 'czarne',
    czy_wolne(X1,Y1).

%ruchy bialego piona z biciem
ruch(pion,X,Y, X1, Y1) :- X1 is X + 1, Y1 is Y + 1, jaki_kolor(X,Y,Z), Z= 'biale',
    (   \+czy_wolne(X1,Y1), czy_przeciwnik(X,Y,X1,Y1)).
ruch(pion,X,Y, X1, Y1) :- X1 is X - 1, Y1 is Y + 1, jaki_kolor(X,Y,Z), Z= 'biale',
    (   \+czy_wolne(X1,Y1), czy_przeciwnik(X,Y,X1,Y1)).

%ruchy czarnego piona z biciem
ruch(pion,X,Y, X1, Y1) :- X1 is X - 1, Y1 is Y - 1, jaki_kolor(X,Y,Z), Z = 'czarne',
    (   \+czy_wolne(X1,Y1), czy_przeciwnik(X,Y,X1,Y1)).
ruch(pion,X,Y, X1, Y1) :- X1 is X + 1, Y1 is Y - 1, jaki_kolor(X,Y,Z), Z = 'czarne',
    (   \+czy_wolne(X1,Y1), czy_przeciwnik(X,Y,X1,Y1)).

%ruch w prawo w poziomie
ruch(F,X,Y,X1,Y1) :- (F = 'wieza' ; F = 'hetman'), X1 is X + 1, Y1 is Y,
    czy_droga_wolna2(X,Y,X1,Y1).
ruch(F,X,Y,X1,Y1) :- (F = 'wieza' ; F = 'hetman'), X1 is X + 2, Y1 is Y,
    czy_droga_wolna2(X,Y,X1,Y1).
ruch(F,X,Y,X1,Y1) :- (F = 'wieza' ; F = 'hetman'), X1 is X + 3, Y1 is Y,
    czy_droga_wolna2(X,Y,X1,Y1).
ruch(F,X,Y,X1,Y1) :- (F = 'wieza' ; F = 'hetman'), X1 is X + 4, Y1 is Y,
    czy_droga_wolna2(X,Y,X1,Y1).
ruch(F,X,Y,X1,Y1) :- (F = 'wieza' ; F = 'hetman'), X1 is X + 5, Y1 is Y,
    czy_droga_wolna2(X,Y,X1,Y1).
ruch(F,X,Y,X1,Y1) :- (F = 'wieza' ; F = 'hetman'), X1 is X + 6, Y1 is Y,
    czy_droga_wolna2(X,Y,X1,Y1).
ruch(F,X,Y,X1,Y1) :- (F = 'wieza' ; F = 'hetman'), X1 is X + 7, Y1 is Y,
    czy_droga_wolna2(X,Y,X1,Y1).

%ruch w lewo w poziomie
ruch(F,X,Y,X1,Y1) :- (F = 'wieza' ; F = 'hetman'), X1 is X - 1, Y1 is Y,
    czy_droga_wolna6(X,Y,X1,Y1).
ruch(F,X,Y,X1,Y1) :- (F = 'wieza' ; F = 'hetman'), X1 is X - 2, Y1 is Y,
    czy_droga_wolna6(X,Y,X1,Y1).
ruch(F,X,Y,X1,Y1) :- (F = 'wieza' ; F = 'hetman'), X1 is X - 3, Y1 is Y,
    czy_droga_wolna6(X,Y,X1,Y1).
ruch(F,X,Y,X1,Y1) :- (F = 'wieza' ; F = 'hetman'), X1 is X - 4, Y1 is Y,
    czy_droga_wolna6(X,Y,X1,Y1).
ruch(F,X,Y,X1,Y1) :- (F = 'wieza' ; F = 'hetman'), X1 is X - 5, Y1 is Y,
    czy_droga_wolna6(X,Y,X1,Y1).
ruch(F,X,Y,X1,Y1) :- (F = 'wieza' ; F = 'hetman'), X1 is X - 6, Y1 is Y,
    czy_droga_wolna6(X,Y,X1,Y1).
ruch(F,X,Y,X1,Y1) :- (F = 'wieza' ; F = 'hetman'), X1 is X - 7, Y1 is Y,
    czy_droga_wolna6(X,Y,X1,Y1). 

%ruch pionowo w góre
ruch(F,X,Y,X1,Y1) :- (F = 'wieza' ; F = 'hetman'), X1 is X, Y1 is Y + 1,
    czy_droga_wolna8(X,Y,X1,Y1).
ruch(F,X,Y,X1,Y1) :- (F = 'wieza' ; F = 'hetman'), X1 is X, Y1 is Y + 2,
    czy_droga_wolna8(X,Y,X1,Y1).
ruch(F,X,Y,X1,Y1) :- (F = 'wieza' ; F = 'hetman'), X1 is X, Y1 is Y + 3,
    czy_droga_wolna8(X,Y,X1,Y1).
ruch(F,X,Y,X1,Y1) :- (F = 'wieza' ; F = 'hetman'), X1 is X, Y1 is Y + 4,
    czy_droga_wolna8(X,Y,X1,Y1).
ruch(F,X,Y,X1,Y1) :- (F = 'wieza' ; F = 'hetman'), X1 is X, Y1 is Y + 5,
    czy_droga_wolna8(X,Y,X1,Y1).
ruch(F,X,Y,X1,Y1) :- (F = 'wieza' ; F = 'hetman'), X1 is X, Y1 is Y + 6,
    czy_droga_wolna8(X,Y,X1,Y1).
ruch(F,X,Y,X1,Y1) :- (F = 'wieza' ; F = 'hetman'), X1 is X, Y1 is Y + 7,
    czy_droga_wolna8(X,Y,X1,Y1). 

%ruch pionowo w dół
ruch(F,X,Y,X1,Y1) :- (F = 'wieza' ; F = 'hetman'), X1 is X, Y1 is Y - 1,
    czy_droga_wolna4(X,Y,X1,Y1).
ruch(F,X,Y,X1,Y1) :- (F = 'wieza' ; F = 'hetman'), X1 is X, Y1 is Y - 2,
    czy_droga_wolna4(X,Y,X1,Y1).
ruch(F,X,Y,X1,Y1) :- (F = 'wieza' ; F = 'hetman'), X1 is X, Y1 is Y - 3,
    czy_droga_wolna4(X,Y,X1,Y1).
ruch(F,X,Y,X1,Y1) :- (F = 'wieza' ; F = 'hetman'), X1 is X, Y1 is Y - 4,
    czy_droga_wolna4(X,Y,X1,Y1).
ruch(F,X,Y,X1,Y1) :- (F = 'wieza' ; F = 'hetman'), X1 is X, Y1 is Y - 5,
    czy_droga_wolna4(X,Y,X1,Y1).
ruch(F,X,Y,X1,Y1) :- (F = 'wieza' ; F = 'hetman'), X1 is X, Y1 is Y - 6,
    czy_droga_wolna4(X,Y,X1,Y1).
ruch(F,X,Y,X1,Y1) :- (F = 'wieza' ; F = 'hetman'), X1 is X, Y1 is Y - 7,
    czy_droga_wolna4(X,Y,X1,Y1). 

%ruch w prawo i w góre
ruch(F,X,Y,X1,Y1) :- (F = 'goniec' ; F = 'hetman'), X1 is X + 1, Y1 is Y + 1.
ruch(F,X,Y,X1,Y1) :- (F = 'goniec' ; F = 'hetman'), X1 is X + 2, Y1 is Y + 2,
    czy_droga_wolna1(X,Y,X1,Y1).
ruch(F,X,Y,X1,Y1) :- (F = 'goniec' ; F = 'hetman'), X1 is X + 3, Y1 is Y + 3,
    czy_droga_wolna1(X,Y,X1,Y1).
ruch(F,X,Y,X1,Y1) :- (F = 'goniec' ; F = 'hetman'), X1 is X + 4, Y1 is Y + 4,
    czy_droga_wolna1(X,Y,X1,Y1).
ruch(F,X,Y,X1,Y1) :- (F = 'goniec' ; F = 'hetman'), X1 is X + 5, Y1 is Y + 5,
    czy_droga_wolna1(X,Y,X1,Y1).
ruch(F,X,Y,X1,Y1) :- (F = 'goniec' ; F = 'hetman'), X1 is X + 6, Y1 is Y + 6,
    czy_droga_wolna1(X,Y,X1,Y1).
ruch(F,X,Y,X1,Y1) :- (F = 'goniec' ; F = 'hetman'), X1 is X + 7, Y1 is Y + 7,
    czy_droga_wolna1(X,Y,X1,Y1).

%ruch w lewo i w góre
ruch(F,X,Y,X1,Y1) :- (F = 'goniec' ; F = 'hetman'), X1 is X - 1, Y1 is Y + 1,
    czy_droga_wolna7(X,Y,X1,Y1).
ruch(F,X,Y,X1,Y1) :- (F = 'goniec' ; F = 'hetman'), X1 is X - 2, Y1 is Y + 2,
    czy_droga_wolna7(X,Y,X1,Y1).
ruch(F,X,Y,X1,Y1) :- (F = 'goniec' ; F = 'hetman'), X1 is X - 3, Y1 is Y + 3,
    czy_droga_wolna7(X,Y,X1,Y1).
ruch(F,X,Y,X1,Y1) :- (F = 'goniec' ; F = 'hetman'), X1 is X - 4, Y1 is Y + 4,
    czy_droga_wolna7(X,Y,X1,Y1).
ruch(F,X,Y,X1,Y1) :- (F = 'goniec' ; F = 'hetman'), X1 is X - 5, Y1 is Y + 5,
    czy_droga_wolna7(X,Y,X1,Y1).
ruch(F,X,Y,X1,Y1) :- (F = 'goniec' ; F = 'hetman'), X1 is X - 6, Y1 is Y + 6,
    czy_droga_wolna7(X,Y,X1,Y1).
ruch(F,X,Y,X1,Y1) :- (F = 'goniec' ; F = 'hetman'), X1 is X - 7, Y1 is Y + 7,
    czy_droga_wolna7(X,Y,X1,Y1).

%ruch w lewo i w dół
ruch(F,X,Y,X1,Y1) :- (F = 'goniec' ; F = 'hetman'), X1 is X - 1, Y1 is Y - 1,
    czy_droga_wolna5(X,Y,X1,Y1).
ruch(F,X,Y,X1,Y1) :- (F = 'goniec' ; F = 'hetman'), X1 is X - 2, Y1 is Y - 2,
    czy_droga_wolna5(X,Y,X1,Y1).
ruch(F,X,Y,X1,Y1) :- (F = 'goniec' ; F = 'hetman'), X1 is X - 3, Y1 is Y - 3,
    czy_droga_wolna5(X,Y,X1,Y1).
ruch(F,X,Y,X1,Y1) :- (F = 'goniec' ; F = 'hetman'), X1 is X - 4, Y1 is Y - 4,
    czy_droga_wolna5(X,Y,X1,Y1).
ruch(F,X,Y,X1,Y1) :- (F = 'goniec' ; F = 'hetman'), X1 is X - 5, Y1 is Y - 5,
    czy_droga_wolna5(X,Y,X1,Y1).
ruch(F,X,Y,X1,Y1) :- (F = 'goniec' ; F = 'hetman'), X1 is X - 6, Y1 is Y - 6,
    czy_droga_wolna5(X,Y,X1,Y1).
ruch(F,X,Y,X1,Y1) :- (F = 'goniec' ; F = 'hetman'), X1 is X - 7, Y1 is Y - 7,
    czy_droga_wolna5(X,Y,X1,Y1).

%ruch w prawo i w dół
ruch(F,X,Y,X1,Y1) :- (F = 'goniec' ; F = 'hetman'), X1 is X + 1, Y1 is Y - 1,
    czy_droga_wolna3(X,Y,X1,Y1).
ruch(F,X,Y,X1,Y1) :- (F = 'goniec' ; F = 'hetman'), X1 is X + 2, Y1 is Y - 2,
    czy_droga_wolna3(X,Y,X1,Y1).
ruch(F,X,Y,X1,Y1) :- (F = 'goniec' ; F = 'hetman'), X1 is X + 3, Y1 is Y - 3,
    czy_droga_wolna3(X,Y,X1,Y1).
ruch(F,X,Y,X1,Y1) :- (F = 'goniec' ; F = 'hetman'), X1 is X + 4, Y1 is Y - 4,
    czy_droga_wolna3(X,Y,X1,Y1).
ruch(F,X,Y,X1,Y1) :- (F = 'goniec' ; F = 'hetman'), X1 is X + 5, Y1 is Y - 5,
    czy_droga_wolna3(X,Y,X1,Y1).
ruch(F,X,Y,X1,Y1) :- (F = 'goniec' ; F = 'hetman'), X1 is X + 6, Y1 is Y - 6,
    czy_droga_wolna3(X,Y,X1,Y1).
ruch(F,X,Y,X1,Y1) :- (F = 'goniec' ; F = 'hetman'), X1 is X + 7, Y1 is Y - 7,
    czy_droga_wolna3(X,Y,X1,Y1).

%X1,Y1 to docelowe wspolrzedne
pos(X,Y,X2,Y1) :- jaka_figura(X,Y,Z),ruch(Z, X, Y,X1,Y1),czy_plansza(X1,Y1),
    (   czy_wolne(X1,Y1); czy_przeciwnik(X,Y,X1,Y1)), int_to_char(X1,X2).

wszystkie_pos_bialych :- figura(F, biale, X, Y),nl,  write(F), write(' na pozycji: ('), write(X), write(' ,'),
    write(Y), write(' )'), write(' moze wykonac ruch na pozycje: '), pos(X,Y,X1,Y1), write(X1), write(', '),
    write(Y1), write(' | ').     

wszystkie_pos_czarnych :- figura(F, czarne, X, Y),nl, write(F), write(' na pozycji: ('), write(X), write(' ,'),
    write(Y), write(' )'), write(' moze wykonac ruch na pozycje: '), pos(X,Y,X1,Y1), write(X1), write(', '),
    write(Y1), write(' | ').    

%sprawdzenie czy pole znajduje sie na planszy
czy_plansza(X,Y) :- X < 9, X > 0, Y < 9, Y > 0.

czy_przeciwnik(X,Y,X1,Y1) :- jaki_kolor(X,Y,K1), jaki_kolor(X1,Y1,K2), K1 \= K2.

%sprawdzenie jakiego koloru jest figura na polu
jaki_kolor(X,Y,Z) :- figura(_,Z,X,Y).

%sprawdzenie jaka figura znajduje sie na polu
jaka_figura(X,Y,Z) :- figura(Z,_,X,Y).

%sprawdzenie czy pole jest wolne
czy_wolne(X,Y) :- \+figura(_,_,X,Y).

%prawo i góra
czy_droga_wolna1(X,Y,X1,Y1) :- X1 is X + 1, Y1 is Y + 1.
czy_droga_wolna1(X,Y,X1,Y1) :- X1 > X, Y1 > Y,X2 is X + 1, Y2 is Y + 1,
    czy_wolne(X2,Y2), czy_droga_wolna1(X2,Y2,X1,Y1).

%prawo w poziomie
czy_droga_wolna2(X,Y,X1,Y1) :- X1 is X + 1, Y1 is Y.
czy_droga_wolna2(X,Y,X1,Y1) :- X1 > X, Y1 == Y,X2 is X + 1, Y2 is Y,
    czy_wolne(X2,Y2), czy_droga_wolna2(X2,Y2,X1,Y1).

%prawo i w dół
czy_droga_wolna3(X,Y,X1,Y1) :- X1 is X + 1, Y1 is Y - 1.
czy_droga_wolna3(X,Y,X1,Y1) :- X1 > X, Y1 < Y,X2 is X + 1, Y2 is Y - 1,
    czy_wolne(X2,Y2), czy_droga_wolna3(X2,Y2,X1,Y1).

%dół w pionie
czy_droga_wolna4(X,Y,X1,Y1) :- X1 is X, Y1 is Y - 1.
czy_droga_wolna4(X,Y,X1,Y1) :- X1 == X, Y1 < Y,X2 is X, Y2 is Y - 1,
    czy_wolne(X2,Y2), czy_droga_wolna4(X2,Y2,X1,Y1).

%lewo i dół
czy_droga_wolna5(X,Y,X1,Y1) :- X1 is X - 1, Y1 is Y - 1.
czy_droga_wolna5(X,Y,X1,Y1) :- X1 < X, Y1 < Y,X2 is X - 1, Y2 is Y - 1,
    czy_wolne(X2,Y2), czy_droga_wolna5(X2,Y2,X1,Y1).

%lewo w poziomie
czy_droga_wolna6(X,Y,X1,Y1) :- X1 is X - 1, Y1 is Y.
czy_droga_wolna6(X,Y,X1,Y1) :- X1 < X, Y1 == Y,X2 is X - 1, Y2 is Y,
    czy_wolne(X2,Y2), czy_droga_wolna6(X2,Y2,X1,Y1).

%lewo i góra
czy_droga_wolna7(X,Y,X1,Y1) :- X1 is X - 1, Y1 is Y + 1.
czy_droga_wolna7(X,Y,X1,Y1) :- X1 < X, Y1 > Y,X2 is X - 1, Y2 is Y + 1,
    czy_wolne(X2,Y2), czy_droga_wolna7(X2,Y2,X1,Y1).

%góra w pionie
czy_droga_wolna8(X,Y,X1,Y1) :- X1 is X, Y1 is Y + 1.
czy_droga_wolna8(X,Y,X1,Y1) :- X1 == X, Y1 > Y,X2 is X, Y2 is Y + 1,
    czy_wolne(X2,Y2), czy_droga_wolna8(X2,Y2,X1,Y1).