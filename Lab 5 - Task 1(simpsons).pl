% ===== FACTS =====

% --- Males ---
male(abraham).
male(clancy).
male(herb).
male(homer).
male(bart).

% --- Females ---
female(mona).
female(jackie).
female(marge).
female(patty).
female(selma).
female(lisa).
female(maggie).
female(ling).

% --- Parent relations ---

parent(abraham, herb).
parent(abraham, homer).
parent(mona, herb).
parent(mona, homer).

parent(clancy, marge).
parent(clancy, patty).
parent(clancy, selma).
parent(jackie, marge).
parent(jackie, patty).
parent(jackie, selma).

parent(homer, bart).
parent(homer, lisa).
parent(homer, maggie).
parent(marge, bart).
parent(marge, lisa).
parent(marge, maggie).

parent(selma, ling).

% ===== RULES =====

% 1. father(X, Y): X is father of Y
father(X, Y) :-
    male(X),
    parent(X, Y).

% 2. mother(X, Y): X is mother of Y
mother(X, Y) :-
    female(X),
    parent(X, Y).

% 3. son(X, Y): X is son of Y
son(X, Y) :-
    male(X),
    parent(Y, X).

% 4. daughter(X, Y): X is daughter of Y
daughter(X, Y) :-
    female(X),
    parent(Y, X).

% 5. brother(X, Y): X is brother of Y
brother(X, Y) :-
    male(X),
    parent(P, X),
    parent(P, Y),
    X \= Y.

% 6. sister(X, Y): X is sister of Y
sister(X, Y) :-
    female(X),
    parent(P, X),
    parent(P, Y),
    X \= Y.

% 7. grandfather(X, Z): X is grandfather of Z
grandfather(X, Z) :-
    male(X),
    parent(X, Y),
    parent(Y, Z).

% 8. aunt(X, Y): X is aunt of Y
aunt(X, Y) :-
    female(X),
    parent(P, Y),
    sister(X, P).

% 9. uncle(X, Y): X is uncle of Y
uncle(X, Y) :-
    male(X),
    parent(P, Y),
    brother(X, P).

% 10. cousin(X, Y): X is cousin of Y
cousin(X, Y) :-
    parent(P1, X),
    parent(P2, Y),
    parent(G, P1),
    parent(G, P2),
    P1 \= P2,
    X \= Y.

% 11. ancestor(X, Y): X is ancestor of Y
% Base case
ancestor(X, Y) :-
    parent(X, Y).

% Recursive case
ancestor(X, Y) :-
    parent(X, Z),
    ancestor(Z, Y).