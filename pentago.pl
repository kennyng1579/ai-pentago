/*---------------Variables---------------*/
/* BlackL: A list of position for Black player;*/
/* RedL: A list of position for Red player */

/*----------------Atoms------------------*/
/* o: Black player in board*/
/* x: Red player in board*/

%----------Board Construction---------%
boardConstruct(BlackL, RedL, NewBoard):-
	toBoard([-,-,-,-,-,-,
			 -,-,-,-,-,-,
			 -,-,-,-,-,-,
			 -,-,-,-,-,-,
			 -,-,-,-,-,-,
			 -,-,-,-,-,-], Outputboard, BlackL, black),
	toBoard(Outputboard, NewBoard, RedL, red),!.

toBoard(InputBoard, Outputboard, [], _):-
	append([], InputBoard, Outputboard).
toBoard(InputBoard, Outputboard, [Head|Rest], Color):-
	Color == black,replaceByChess(InputBoard, Head, o, InputBoard1),toBoard(InputBoard1, Outputboard, Rest, Color);
	Color == red,replaceByChess(InputBoard, Head, x, InputBoard1),toBoard(InputBoard1, Outputboard, Rest, Color).

replaceByChess([_|Rest], 1, Chess,	[Chess|Rest]).
replaceByChess([Head|Rest], Position, Chess, [Head|Out]):-
    Position > 1, NP is Position-1, replaceByChess(Rest, NP, Chess, Out).


%------------WINNING CASES------------%
/*---------Vertical cases---------*/
winBoard(X,[X,_,_,_,_,_,
			X,_,_,_,_,_,
			X,_,_,_,_,_,
			X,_,_,_,_,_,
			X,_,_,_,_,_,
			_,_,_,_,_,_]):-!.
winBoard(X,[_,_,_,_,_,_,
			X,_,_,_,_,_,
			X,_,_,_,_,_,
			X,_,_,_,_,_,
			X,_,_,_,_,_,
			X,_,_,_,_,_]):-!.
winBoard(X,[_,X,_,_,_,_,
		  	_,X,_,_,_,_,
		  	_,X,_,_,_,_,
		  	_,X,_,_,_,_,
		  	_,X,_,_,_,_,
		  	_,_,_,_,_,_]):-!.
winBoard(X,[_,_,_,_,_,_,
		  	_,X,_,_,_,_,
		  	_,X,_,_,_,_,
		  	_,X,_,_,_,_,
		  	_,X,_,_,_,_,
		  	_,X,_,_,_,_]):-!.
winBoard(X,[_,_,X,_,_,_,
		  	_,_,X,_,_,_,
		  	_,_,X,_,_,_,
		  	_,_,X,_,_,_,
		  	_,_,X,_,_,_,
		  	_,_,_,_,_,_]):-!.
winBoard(X,[_,_,_,_,_,_,
		  	_,_,X,_,_,_,
		  	_,_,X,_,_,_,
		  	_,_,X,_,_,_,
		  	_,_,X,_,_,_,
		  	_,_,X,_,_,_]):-!.
winBoard(X,[_,_,_,X,_,_,
		  	_,_,_,X,_,_,
			_,_,_,X,_,_,
			_,_,_,X,_,_,
			_,_,_,X,_,_,
			_,_,_,_,_,_]):-!.
winBoard(X,[_,_,_,_,_,_,
		  	_,_,_,X,_,_,
		  	_,_,_,X,_,_,
		  	_,_,_,X,_,_,
		  	_,_,_,X,_,_,
		  	_,_,_,X,_,_]):-!.
winBoard(X,[_,_,_,_,X,_,
		  	_,_,_,_,X,_,
		  	_,_,_,_,X,_,
		  	_,_,_,_,X,_,
		  	_,_,_,_,X,_,
		  	_,_,_,_,_,_]):-!.
winBoard(X,[_,_,_,_,_,_,
		  	_,_,_,_,X,_,
		  	_,_,_,_,X,_,
		  	_,_,_,_,X,_,
		  	_,_,_,_,X,_,
		  	_,_,_,_,X,_]):-!.
winBoard(X,[_,_,_,_,_,X,
		   	_,_,_,_,_,X,
		   	_,_,_,_,_,X,
		   	_,_,_,_,_,X,
		   	_,_,_,_,_,X,
		   	_,_,_,_,_,_]):-!.
winBoard(X,[_,_,_,_,_,_,
		  	_,_,_,_,_,X,
		  	_,_,_,_,_,X,
		  	_,_,_,_,_,X,
		  	_,_,_,_,_,X,
		  	_,_,_,_,_,X]):-!.
/*----------Horizontal cases----------*/
winBoard(X,[X,X,X,X,X,_,
		  	_,_,_,_,_,_,
		  	_,_,_,_,_,_,
		  	_,_,_,_,_,_,
		  	_,_,_,_,_,_,
		  	_,_,_,_,_,_]):-!.
winBoard(X,[_,X,X,X,X,X,
		  	_,_,_,_,_,_,
		  	_,_,_,_,_,_,
		  	_,_,_,_,_,_,
		  	_,_,_,_,_,_,
		  	_,_,_,_,_,_]):-!.
winBoard(X,[_,_,_,_,_,_,
		  	X,X,X,X,X,_,
		  	_,_,_,_,_,_,
		  	_,_,_,_,_,_,
		  	_,_,_,_,_,_,
		  	_,_,_,_,_,_]):-!.
winBoard(X,[_,_,_,_,_,_,
		  	_,X,X,X,X,X,
		  	_,_,_,_,_,_,
		  	_,_,_,_,_,_,
		  	_,_,_,_,_,_,
		  	_,_,_,_,_,_]):-!.
winBoard(X,[_,_,_,_,_,_,
		  	_,_,_,_,_,_,
		  	X,X,X,X,X,_,
		  	_,_,_,_,_,_,
		  	_,_,_,_,_,_,
		  	_,_,_,_,_,_]):-!.
winBoard(X,[_,_,_,_,_,_,
		  	_,_,_,_,_,_,
		  	_,X,X,X,X,X,
		  	_,_,_,_,_,_,
		  	_,_,_,_,_,_,
		  	_,_,_,_,_,_]):-!.
winBoard(X,[_,_,_,_,_,_,
		  	_,_,_,_,_,_,
		  	_,_,_,_,_,_,
		  	X,X,X,X,X,_,
		  	_,_,_,_,_,_,
		  	_,_,_,_,_,_]):-!.
winBoard(X,[_,_,_,_,_,_,
		  	_,_,_,_,_,_,
		  	_,_,_,_,_,_,
		  	_,X,X,X,X,X,
		  	_,_,_,_,_,_,
		  	_,_,_,_,_,_]):-!.
winBoard(X,[_,_,_,_,_,_,
		  	_,_,_,_,_,_,
		  	_,_,_,_,_,_,
		  	_,_,_,_,_,_,
		  	X,X,X,X,X,_,
		  	_,_,_,_,_,_]):-!.
winBoard(X,[_,_,_,_,_,_,
		  	_,_,_,_,_,_,
		  	_,_,_,_,_,_,
		  	_,_,_,_,_,_,
		  	_,X,X,X,X,X,
		  	_,_,_,_,_,_]):-!.
winBoard(X,[_,_,_,_,_,_,
		  	_,_,_,_,_,_,
		  	_,_,_,_,_,_,
		  	_,_,_,_,_,_,
		  	_,_,_,_,_,_,
		  	X,X,X,X,X,_]):-!.
winBoard(X,[_,_,_,_,_,_,
		  	_,_,_,_,_,_,
		  	_,_,_,_,_,_,
		  	_,_,_,_,_,_,
		  	_,_,_,_,_,_,
		  	_,X,X,X,X,X]):-!.
/*----------Diagonal cases----------*/
winBoard(X,[_,_,_,_,X,_,
		  	_,_,_,X,_,_,
		  	_,_,X,_,_,_,
		  	_,X,_,_,_,_,
		  	X,_,_,_,_,_,
		  	_,_,_,_,_,_]):-!.
winBoard(X,[_,X,_,_,_,_,
		  	_,_,X,_,_,_,
		  	_,_,_,X,_,_,
		  	_,_,_,_,X,_,
		  	_,_,_,_,_,X,
		  	_,_,_,_,_,_]):-!.
winBoard(X,[_,_,_,_,_,_,
		  	X,_,_,_,_,_,
		  	_,X,_,_,_,_,
		  	_,_,X,_,_,_,
		  	_,_,_,X,_,_,
		  	_,_,_,_,X,_]):-!.
winBoard(X,[_,_,_,_,_,_,
		  	_,_,_,_,_,X,
		  	_,_,_,_,X,_,
		  	_,_,_,X,_,_,
		  	_,_,X,_,_,_,
		  	_,X,_,_,_,_]):-!.
winBoard(X,[X,_,_,_,_,_,
		  	_,X,_,_,_,_,
		  	_,_,X,_,_,_,
		  	_,_,_,X,_,_,
		  	_,_,_,_,X,_,
		  	_,_,_,_,_,_]):-!.
winBoard(X,[_,_,_,_,_,_,
		  	_,X,_,_,_,_,
		  	_,_,X,_,_,_,
		  	_,_,_,X,_,_,
		  	_,_,_,_,X,_,
		  	_,_,_,_,_,X]):-!.
winBoard(X,[_,_,_,_,_,X,
		  	_,_,_,_,X,_,
		  	_,_,_,X,_,_,
		  	_,_,X,_,_,_,
		  	_,X,_,_,_,_,
		  	_,_,_,_,_,_]):-!.
winBoard(X,[_,_,_,_,_,_,
		  	_,_,_,_,X,_,
		  	_,_,_,X,_,_,
		  	_,_,X,_,_,_,
		  	_,X,_,_,_,_,
		  	X,_,_,_,_,_]):-!.

%------------Threatening----------%
threatening(board(BlackL, RedL), CurrentPlayer, ThreatsCount):-
	boardConstruct(BlackL, RedL, NewBoard),
	CurrentPlayer == black, countThreats(NewBoard, x, ThreatsCount),!;
	boardConstruct(BlackL, RedL, NewBoard),
	CurrentPlayer == red, countThreats(NewBoard, o, ThreatsCount),!.

countThreats(Board, X, ThreatsCount):-
	sumThreat(Board, 0, ThreatsCount, [
[X,X,X,X,-,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_],
[X,X,X,-,X,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_],  
[X,X,-,X,X,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_], 
[X,-,X,X,X,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_], 
[-,X,X,X,X,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_], 
[_,-,X,X,X,X,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_], 
[_,X,-,X,X,X,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_], 
[_,X,X,-,X,X,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_], 
[_,X,X,X,-,X,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_], 
[_,X,X,X,X,-,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_], 

[_,_,_,_,_,_,X,X,X,X,-,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_],
[_,_,_,_,_,_,X,X,X,-,X,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_],
[_,_,_,_,_,_,X,X,-,X,X,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_],
[_,_,_,_,_,_,X,-,X,X,X,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_],
[_,_,_,_,_,_,-,X,X,X,X,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_],
[_,_,_,_,_,_,_,-,X,X,X,X,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_],
[_,_,_,_,_,_,_,X,-,X,X,X,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_],
[_,_,_,_,_,_,_,X,X,-,X,X,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_],
[_,_,_,_,_,_,_,X,X,X,-,X,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_],
[_,_,_,_,_,_,_,X,X,X,X,-,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_],

[_,_,_,_,_,_,_,_,_,_,_,_,X,X,X,X,-,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_],
[_,_,_,_,_,_,_,_,_,_,_,_,X,X,X,-,X,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_],
[_,_,_,_,_,_,_,_,_,_,_,_,X,X,-,X,X,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_],
[_,_,_,_,_,_,_,_,_,_,_,_,X,-,X,X,X,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_],
[_,_,_,_,_,_,_,_,_,_,_,_,-,X,X,X,X,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_],
[_,_,_,_,_,_,_,_,_,_,_,_,_,-,X,X,X,X,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_],
[_,_,_,_,_,_,_,_,_,_,_,_,_,X,-,X,X,X,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_],
[_,_,_,_,_,_,_,_,_,_,_,_,_,X,X,-,X,X,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_],
[_,_,_,_,_,_,_,_,_,_,_,_,_,X,X,X,-,X,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_],
[_,_,_,_,_,_,_,_,_,_,_,_,_,X,X,X,X,-,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_],

[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X,X,X,X,-,_,_,_,_,_,_,_,_,_,_,_,_,_],
[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X,X,X,-,X,_,_,_,_,_,_,_,_,_,_,_,_,_],
[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X,X,-,X,X,_,_,_,_,_,_,_,_,_,_,_,_,_],
[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X,-,X,X,X,_,_,_,_,_,_,_,_,_,_,_,_,_],
[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,-,X,X,X,X,_,_,_,_,_,_,_,_,_,_,_,_,_],
[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,-,X,X,X,X,_,_,_,_,_,_,_,_,_,_,_,_],
[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X,-,X,X,X,_,_,_,_,_,_,_,_,_,_,_,_],
[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X,X,-,X,X,_,_,_,_,_,_,_,_,_,_,_,_],
[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X,X,X,-,X,_,_,_,_,_,_,_,_,_,_,_,_],
[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X,X,X,X,-,_,_,_,_,_,_,_,_,_,_,_,_],

[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X,X,X,X,-,_,_,_,_,_,_,_],
[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X,X,X,-,X,_,_,_,_,_,_,_],
[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X,X,-,X,X,_,_,_,_,_,_,_],
[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X,-,X,X,X,_,_,_,_,_,_,_],
[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,-,X,X,X,X,_,_,_,_,_,_,_],
[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,-,X,X,X,X,_,_,_,_,_,_],
[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X,-,X,X,X,_,_,_,_,_,_],
[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X,X,-,X,X,_,_,_,_,_,_],
[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X,X,X,-,X,_,_,_,_,_,_],
[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X,X,X,X,-,_,_,_,_,_,_],

[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X,X,X,X,-,_],
[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X,X,X,-,X,_],
[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X,X,-,X,X,_],
[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X,-,X,X,X,_],
[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,-,X,X,X,X,_],
[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,-,X,X,X,X],
[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X,-,X,X,X],
[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X,X,-,X,X],
[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X,X,X,-,X],
[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X,X,X,X,-],



[X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,-,_,_,_,_,_,_,_,_,_,_,_], 
[X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,-,_,_,_,_,_,X,_,_,_,_,_,_,_,_,_,_,_], 
[X,_,_,_,_,_,X,_,_,_,_,_,-,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,_,_,_,_,_,_], 
[X,_,_,_,_,_,-,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,_,_,_,_,_,_], 
[-,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,_,_,_,_,_,_], 
[_,_,_,_,_,_,-,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_], 
[_,_,_,_,_,_,X,_,_,_,_,_,-,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_], 
[_,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,-,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_], 
[_,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,-,_,_,_,_,_,X,_,_,_,_,_], 
[_,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,-,_,_,_,_,_],

[_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,-,_,_,_,_,_,_,_,_,_,_], 
[_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,-,_,_,_,_,_,X,_,_,_,_,_,_,_,_,_,_], 
[_,X,_,_,_,_,_,X,_,_,_,_,_,-,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,_,_,_,_,_], 
[_,X,_,_,_,_,_,-,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,_,_,_,_,_], 
[_,-,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,_,_,_,_,_], 
[_,_,_,_,_,_,_,-,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_], 
[_,_,_,_,_,_,_,X,_,_,_,_,_,-,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_], 
[_,_,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,-,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_], 
[_,_,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,-,_,_,_,_,_,X,_,_,_,_], 
[_,_,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,-,_,_,_,_],  

[_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,-,_,_,_,_,_,_,_,_,_], 
[_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,-,_,_,_,_,_,X,_,_,_,_,_,_,_,_,_], 
[_,_,X,_,_,_,_,_,X,_,_,_,_,_,-,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,_,_,_,_], 
[_,_,X,_,_,_,_,_,-,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,_,_,_,_], 
[_,_,-,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,_,_,_,_], 
[_,_,_,_,_,_,_,_,-,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_], 
[_,_,_,_,_,_,_,_,X,_,_,_,_,_,-,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_], 
[_,_,_,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,-,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_], 
[_,_,_,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,-,_,_,_,_,_,X,_,_,_], 
[_,_,_,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,-,_,_,_], 

[_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,-,_,_,_,_,_,_,_,_], 
[_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,-,_,_,_,_,_,X,_,_,_,_,_,_,_,_], 
[_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,-,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,_,_,_], 
[_,_,_,X,_,_,_,_,_,-,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,_,_,_], 
[_,_,_,-,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,_,_,_], 
[_,_,_,_,_,_,_,_,_,-,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_], 
[_,_,_,_,_,_,_,_,_,X,_,_,_,_,_,-,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_], 
[_,_,_,_,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,-,_,_,_,_,_,X,_,_,_,_,_,X,_,_], 
[_,_,_,_,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,-,_,_,_,_,_,X,_,_], 
[_,_,_,_,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,-,_,_], 

[_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,-,_,_,_,_,_,_,_], 
[_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,-,_,_,_,_,_,X,_,_,_,_,_,_,_], 
[_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,-,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,_,_], 
[_,_,_,_,X,_,_,_,_,_,-,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,_,_], 
[_,_,_,_,-,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,_,_], 
[_,_,_,_,_,_,_,_,_,_,-,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_], 
[_,_,_,_,_,_,_,_,_,_,X,_,_,_,_,_,-,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_], 
[_,_,_,_,_,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,-,_,_,_,_,_,X,_,_,_,_,_,X,_], 
[_,_,_,_,_,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,-,_,_,_,_,_,X,_], 
[_,_,_,_,_,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,-,_], 

[_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,-,_,_,_,_,_,_], 
[_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,-,_,_,_,_,_,X,_,_,_,_,_,_], 
[_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,-,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,_], 
[_,_,_,_,_,X,_,_,_,_,_,-,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,_], 
[_,_,_,_,_,-,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,_], 
[_,_,_,_,_,_,_,_,_,_,_,-,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X], 
[_,_,_,_,_,_,_,_,_,_,_,X,_,_,_,_,_,-,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X], 
[_,_,_,_,_,_,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,-,_,_,_,_,_,X,_,_,_,_,_,X], 
[_,_,_,_,_,_,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,-,_,_,_,_,_,X], 
[_,_,_,_,_,_,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,-], 



[X,_,_,_,_,_,_,X,_,_,_,_,_,_,X,_,_,_,_,_,_,X,_,_,_,_,_,_,-,_,_,_,_,_,_,_], 
[X,_,_,_,_,_,_,X,_,_,_,_,_,_,X,_,_,_,_,_,_,-,_,_,_,_,_,_,X,_,_,_,_,_,_,_], 
[X,_,_,_,_,_,_,X,_,_,_,_,_,_,-,_,_,_,_,_,_,X,_,_,_,_,_,_,X,_,_,_,_,_,_,_], 
[X,_,_,_,_,_,_,-,_,_,_,_,_,_,X,_,_,_,_,_,_,X,_,_,_,_,_,_,X,_,_,_,_,_,_,_], 
[-,_,_,_,_,_,_,X,_,_,_,_,_,_,X,_,_,_,_,_,_,X,_,_,_,_,_,_,X,_,_,_,_,_,_,_], 
[_,_,_,_,_,_,_,-,_,_,_,_,_,_,X,_,_,_,_,_,_,X,_,_,_,_,_,_,X,_,_,_,_,_,_,X], 
[_,_,_,_,_,_,_,X,_,_,_,_,_,_,-,_,_,_,_,_,_,X,_,_,_,_,_,_,X,_,_,_,_,_,_,X], 
[_,_,_,_,_,_,_,X,_,_,_,_,_,_,X,_,_,_,_,_,_,-,_,_,_,_,_,_,X,_,_,_,_,_,_,X], 
[_,_,_,_,_,_,_,X,_,_,_,_,_,_,X,_,_,_,_,_,_,X,_,_,_,_,_,_,-,_,_,_,_,_,_,X], 
[_,_,_,_,_,_,_,X,_,_,_,_,_,_,X,_,_,_,_,_,_,X,_,_,_,_,_,_,X,_,_,_,_,_,_,-], 

[_,_,_,_,_,X,_,_,_,_,X,_,_,_,_,X,_,_,_,_,X,_,_,_,_,-,_,_,_,_,_,_,_,_,_,_], 
[_,_,_,_,_,X,_,_,_,_,X,_,_,_,_,X,_,_,_,_,-,_,_,_,_,X,_,_,_,_,_,_,_,_,_,_], 
[_,_,_,_,_,X,_,_,_,_,X,_,_,_,_,-,_,_,_,_,X,_,_,_,_,X,_,_,_,_,_,_,_,_,_,_], 
[_,_,_,_,_,X,_,_,_,_,-,_,_,_,_,X,_,_,_,_,X,_,_,_,_,X,_,_,_,_,_,_,_,_,_,_], 
[_,_,_,_,_,-,_,_,_,_,X,_,_,_,_,X,_,_,_,_,X,_,_,_,_,X,_,_,_,_,_,_,_,_,_,_], 
[_,_,_,_,_,_,_,_,_,_,-,_,_,_,_,X,_,_,_,_,X,_,_,_,_,X,_,_,_,_,X,_,_,_,_,_],
[_,_,_,_,_,_,_,_,_,_,X,_,_,_,_,-,_,_,_,_,X,_,_,_,_,X,_,_,_,_,X,_,_,_,_,_],
[_,_,_,_,_,_,_,_,_,_,X,_,_,_,_,X,_,_,_,_,-,_,_,_,_,X,_,_,_,_,X,_,_,_,_,_],
[_,_,_,_,_,_,_,_,_,_,X,_,_,_,_,X,_,_,_,_,X,_,_,_,_,-,_,_,_,_,X,_,_,_,_,_],
[_,_,_,_,_,_,_,_,_,_,X,_,_,_,_,X,_,_,_,_,X,_,_,_,_,X,_,_,_,_,-,_,_,_,_,_],

[_,_,_,_,X,_,_,_,_,X,_,_,_,_,X,_,_,_,_,X,_,_,_,_,-,_,_,_,_,_,_,_,_,_,_,_],
[_,_,_,_,X,_,_,_,_,X,_,_,_,_,X,_,_,_,_,-,_,_,_,_,X,_,_,_,_,_,_,_,_,_,_,_],
[_,_,_,_,X,_,_,_,_,X,_,_,_,_,-,_,_,_,_,X,_,_,_,_,X,_,_,_,_,_,_,_,_,_,_,_],
[_,_,_,_,X,_,_,_,_,-,_,_,_,_,X,_,_,_,_,X,_,_,_,_,X,_,_,_,_,_,_,_,_,_,_,_],
[_,_,_,_,-,_,_,_,_,X,_,_,_,_,X,_,_,_,_,X,_,_,_,_,X,_,_,_,_,_,_,_,_,_,_,_],

[_,_,_,_,_,_,_,_,_,_,_,X,_,_,_,_,X,_,_,_,_,X,_,_,_,_,X,_,_,_,_,-,_,_,_,_],
[_,_,_,_,_,_,_,_,_,_,_,X,_,_,_,_,X,_,_,_,_,X,_,_,_,_,-,_,_,_,_,X,_,_,_,_],
[_,_,_,_,_,_,_,_,_,_,_,X,_,_,_,_,X,_,_,_,_,-,_,_,_,_,X,_,_,_,_,X,_,_,_,_],
[_,_,_,_,_,_,_,_,_,_,_,X,_,_,_,_,-,_,_,_,_,X,_,_,_,_,X,_,_,_,_,X,_,_,_,_],
[_,_,_,_,_,_,_,_,_,_,_,-,_,_,_,_,X,_,_,_,_,X,_,_,_,_,X,_,_,_,_,X,_,_,_,_],

[_,X,_,_,_,_,_,_,X,_,_,_,_,_,_,X,_,_,_,_,_,_,X,_,_,_,_,_,_,-,_,_,_,_,_,_],
[_,X,_,_,_,_,_,_,X,_,_,_,_,_,_,X,_,_,_,_,_,_,-,_,_,_,_,_,_,X,_,_,_,_,_,_],
[_,X,_,_,_,_,_,_,X,_,_,_,_,_,_,-,_,_,_,_,_,_,X,_,_,_,_,_,_,X,_,_,_,_,_,_],
[_,X,_,_,_,_,_,_,-,_,_,_,_,_,_,X,_,_,_,_,_,_,X,_,_,_,_,_,_,X,_,_,_,_,_,_],
[_,-,_,_,_,_,_,_,X,_,_,_,_,_,_,X,_,_,_,_,_,_,X,_,_,_,_,_,_,X,_,_,_,_,_,_],

[_,_,_,_,_,_,X,_,_,_,_,_,_,X,_,_,_,_,_,_,X,_,_,_,_,_,_,X,_,_,_,_,_,_,-,_],
[_,_,_,_,_,_,X,_,_,_,_,_,_,X,_,_,_,_,_,_,X,_,_,_,_,_,_,-,_,_,_,_,_,_,X,_],
[_,_,_,_,_,_,X,_,_,_,_,_,_,X,_,_,_,_,_,_,-,_,_,_,_,_,_,X,_,_,_,_,_,_,X,_],
[_,_,_,_,_,_,X,_,_,_,_,_,_,-,_,_,_,_,_,_,X,_,_,_,_,_,_,X,_,_,_,_,_,_,X,_],
[_,_,_,_,_,_,-,_,_,_,_,_,_,X,_,_,_,_,_,_,X,_,_,_,_,_,_,X,_,_,_,_,_,_,X,_]	]).

opponentMustWinThreatening(board(BlackL, RedL), CurrentPlayer, ThreatsCount):-
	boardConstruct(BlackL, RedL, NewBoard),
	CurrentPlayer == black, countMustWinThreats(NewBoard, x, ThreatsCount),!;
	boardConstruct(BlackL, RedL, NewBoard),
	CurrentPlayer == red, countMustWinThreats(NewBoard, o, ThreatsCount),!.

countMustWinThreats(Board, X, ThreatsCount):-
	sumThreat(Board, 0, ThreatsCount, [
[-,X,X,X,X,-,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_], 
[_,_,_,_,_,_,-,X,X,X,X,-,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_],
[_,_,_,_,_,_,_,_,_,_,_,_,-,X,X,X,X,-,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_],
[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,-,X,X,X,X,-,_,_,_,_,_,_,_,_,_,_,_,_],
[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,-,X,X,X,X,-,_,_,_,_,_,_],
[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,-,X,X,X,X,-],

[-,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,-,_,_,_,_,_],
[_,-,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,-,_,_,_,_],
[_,_,-,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,-,_,_,_], 
[_,_,_,-,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,-,_,_],
[_,_,_,_,-,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,-,_],
[_,_,_,_,_,-,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,X,_,_,_,_,_,-],

[-,_,_,_,_,_,_,X,_,_,_,_,_,_,X,_,_,_,_,_,_,X,_,_,_,_,_,_,X,_,_,_,_,_,_,-],
[_,_,_,_,_,-,_,_,_,_,X,_,_,_,_,X,_,_,_,_,X,_,_,_,_,X,_,_,_,_,-,_,_,_,_,_]	]).



sumThreat(_, A, A, []).
sumThreat(Board, Counter, ThreatSum, [ThreatBoardH|ThreatBoardT]):-
	isEqual(Board, ThreatBoardH), NewThreatSum is Counter+1,
	sumThreat(Board, NewThreatSum, ThreatSum, ThreatBoardT).
sumThreat(Board, Counter, ThreatSum, [_|ThreatBoardT]):-
	sumThreat(Board, Counter, ThreatSum, ThreatBoardT).

isEqual([BoardH|_], [BoardH, _]).
isEqual([], []):-!,fail.
isEqual([BoardH|BoardT], [BoardH|ThreatBoardT]):-
	isEqual(BoardT, ThreatBoardT).

%---------------Utility--------------%
inputPosition(Pos, [], [Pos]).
inputPosition(Y, [X|Tail], [Y,X|Tail]):-
	Y < X,!.
inputPosition(Pos, [X|Tail], [X|Tail2]):-
	inputPosition(Pos, Tail, Tail2).

getQuadrant(Pos, Qua):-
	(Pos==1;Pos==2;Pos==3;Pos==7;Pos==8;Pos==9;Pos==13;Pos==14;Pos==15), 
		Qua = top-left,!;
	(Pos==4;Pos==5;Pos==6;Pos==10;Pos==11;Pos==12;Pos==16;Pos==17;Pos==18), 
		Qua = top-right,!;
	(Pos==19;Pos==20;Pos==21;Pos==25;Pos==26;Pos==27;Pos==31;Pos==32;Pos==33), 
		Qua = bottom-left,!;
	(Pos==22;Pos==23;Pos==24;Pos==28;Pos==29;Pos==30;Pos==34;Pos==35;Pos==36), 
		Qua = bottom-right,!.

genQuaAndDir(Input, Qua, Dir, Pos):-
	Selection is Input mod 8, Pos is (Input-1)//8+1,
	((Selection == 1, Qua = top-left, Dir = clockwise); (Selection == 2, Qua = top-left, Dir = anti-clockwise);
	 (Selection == 3, Qua = top-right, Dir = clockwise); (Selection == 4, Qua = top-right, Dir = anti-clockwise);
	 (Selection == 5, Qua = bottom-left, Dir = clockwise); (Selection == 6, Qua = bottom-left, Dir = anti-clockwise);
	 (Selection == 7, Qua = bottom-right, Dir = clockwise); (Selection == 0, Qua = bottom-right, Dir = anti-clockwise)),!.

genRandomPosition(Start, B, R, Pos):-
	not(member(Start, B)), not(member(Start, R)), Pos = Start,!;
	NewStart is Start+1, genRandomPosition(NewStart, B, R, Pos),!.

%--------------Pentago AI------------%
%Case1
isWin(CurrentPlayer, B, R, Position, NewB, NewR):-
	checkWin(1, CurrentPlayer, B, R, Position, NewB, NewR).

checkWin(Start, X, B, R, Pos, NewB, NewR):-
	Start < 37, X == black, not(member(Start, B)), not(member(Start, R)),
	inputPosition(Start, B, NewB), NewR = R, boardConstruct(NewB, NewR, NewBoard),
	winBoard(o, NewBoard), Pos = Start,!.
checkWin(Start, X, B, R, Pos, NewB, NewR):-
	Start < 37, X == red, not(member(Start, B)), not(member(Start, R)),
	inputPosition(Start, R, NewR), NewB = B, boardConstruct(NewB, NewR, NewBoard),
	winBoard(x, NewBoard), Pos = Start,!.
checkWin(Start, X, B, R, Pos, NewB, NewR):-
	NewStart is Start+1, NewStart < 37,
	checkWin(NewStart, X, B, R, Pos, NewB, NewR),!.


%Case2
isRotationWin(CurrentPlayer, B, R, Position, Direction, Quadrant, NewB, NewR):-
	checkRotationWin(1, Output, CurrentPlayer, B, R), genQuaAndDir(Output, Quadrant, Direction, Position),
	moveAndRotate(CurrentPlayer, Position, Quadrant, Direction, B, R, NewB, NewR).

moveAndRotate(Player, Pos, Qua, Dir, B, R, NewB, NewR):-
	(Player == black, inputPosition(Pos, B, B2), rotate(Qua, Dir, B2, R, NewB, NewR));
	(Player == red, inputPosition(Pos, R, R2), rotate(Qua, Dir, B, R2, NewB, NewR)),!.


checkRotationWin(Start, Output, X, B, R):-
	Start < 289, X == black, genQuaAndDir(Start, Qua, Dir, Pos),
	not(member(Pos, B)), not(member(Pos, R)), 
	moveAndRotate(X, Pos, Qua, Dir, B, R, NewB, NewR),
	boardConstruct(NewB, NewR, NewBoard), winBoard(o, NewBoard),
	Output = Start,!.
checkRotationWin(Start, Output, X, B, R):-
	Start < 289, X == red, genQuaAndDir(Start, Qua, Dir, Pos),
	not(member(Pos, B)), not(member(Pos, R)), 
	moveAndRotate(X, Pos, Qua, Dir, B, R, NewB, NewR),
	boardConstruct(NewB, NewR, NewBoard), winBoard(x, NewBoard),
	Output = Start,!.
checkRotationWin(Start, Output, X, B, R):-
	NewStart is Start+1, NewStart < 289, 
	checkRotationWin(NewStart, Output, X, B, R),!.

%Case3
opponentWin(B, R, X):-
	checkOpponentWin(1, B, R, X).

checkOpponentWin(Start, B, R, _):-
	Start = 36, (member(Start, B);member(Start, R)).
checkOpponentWin(Start, B, R, X):-
	Start < 37, X == black, not(member(Start, B)), not(member(Start, R)),
	inputPosition(Start, B, NewB), opponentMustWinThreatening(board(NewB, R), X, MustWinThreatsCount),
	threatening(board(NewB, R), X, ThreatsCount),(ThreatsCount > 1; MustWinThreatsCount > 0),
	NewStart is Start+1, (NewStart == 37;NewStart < 37, checkOpponentWin(NewStart, B, R, X)),!.
checkOpponentWin(Start, B, R, X):-
	Start < 37, X == red, not(member(Start, B)), not(member(Start, R)),
	inputPosition(Start, R, NewR), opponentMustWinThreatening(board(B, NewR), X, MustWinThreatsCount),
	threatening(board(B, NewR), X, ThreatsCount), (ThreatsCount > 1; MustWinThreatsCount > 0),
	NewStart is Start+1, (NewStart == 37;NewStart < 37, checkOpponentWin(NewStart, B, R, X)),!.
checkOpponentWin(Start, B, R, X):-
	Start < 37, (member(Start, B);member(Start, R)), NewStart is Start+1,
	checkOpponentWin(NewStart, B, R, X),!.

%Case4
miniMax(X, B, R, Pos, Dir, Qua, NewB, NewR):-
	bestMin(1, X, B, R, [], MinList), sort(MinList, NewMinList), bestMax(1, NewMinList, X, B, R, 0, OutputMax), 
	genQuaAndDir(OutputMax, Qua, Dir, Pos), moveAndRotate(X, Pos, Qua, Dir, B, R, NewB, NewR),!.


bestMin(Start, X, B, R, Store, MinList):-
	Start == 288, genQuaAndDir(Start, Qua, Dir, Pos), not(member(Pos, B)), not(member(Pos, R)),
	moveAndRotate(X, Pos, Qua, Dir, B, R, NewB, NewR), threatening(board(NewB, NewR), X, ThreatsCount),
	(ThreatsCount == 0, append([Start], Store, MinList);
	ThreatsCount > 0, append(Store, [], MinList)),!.
bestMin(Start, _, _, _, Store, MinList):-
	NewStart is Start+1, NewStart == 288, append(Store, [], MinList),!.
bestMin(Start, X, B, R, Store, MinList):-
	Start < 289, genQuaAndDir(Start, Qua, Dir, Pos), not(member(Pos, B)), not(member(Pos, R)),
	moveAndRotate(X, Pos, Qua, Dir, B, R, NewB, NewR), threatening(board(NewB, NewR), X, ThreatsCount),
	NewStart is Start+1, 
	(ThreatsCount == 0, append([Start], Store, StoreList), bestMin(NewStart, X, B, R, StoreList, MinList);
	ThreatsCount > 0, bestMin(NewStart, X, B, R, Store, MinList)),!.
bestMin(Start, X, B, R, Store, MinList):-
	NewStart is Start+1, NewStart < 289, bestMin(NewStart, X, B, R, Store, MinList),!.


bestMax(Start, [], _, _, _, _, OutputMax):-
	OutputMax = Start,!.
bestMax(Start, [MinHead|MinTail], X, B, R, CurThreat, OutputMax):-
	bestMaxMove(MinHead, X, B, R, NewThreat),
	(NewThreat > CurThreat, bestMax(MinHead, MinTail, X, B, R, NewThreat, OutputMax);
	NewThreat == CurThreat, bestMax(Start, MinTail, X, B, R, CurThreat, OutputMax);
	NewThreat < CurThreat, bestMax(Start, MinTail, X, B, R, CurThreat, OutputMax)),!.

bestMaxMove(MinVal, X, B, R, OutThreat):-
	X == black, genQuaAndDir(MinVal, Qua, Dir, Pos), moveAndRotate(X, Pos, Qua, Dir, B, R, NewB, NewR),
	threatening(board(NewB, NewR), red, OutThreat),!.
bestMaxMove(MinVal, X, B, R, OutThreat):-
	X == red, genRandomPosition(MinVal, Qua, Dir, Pos), moveAndRotate(X, Pos, Qua, Dir, B, R, NewB, NewR),
	threatening(board(NewB, NewR), black ,OutThreat),!.




%Case1 
%Current Player wins in this turn without rotation
%(Direction and Quadrant does not matter)
pentago_ai(board(BlackL, RedL), CurrentPlayer, move(Position, Direction, Quadrant), board(NewBlackL, NewRedL)):-write(1),
	isWin(CurrentPlayer, BlackL, RedL, Position, NewBlackL, NewRedL),
	Direction = clockwise, Quadrant = top-left,!.

%Case2
%Current Player wins in this turn with rotation
pentago_ai(board(BlackL, RedL), CurrentPlayer, move(Position, Direction, Quadrant), board(NewBlackL, NewRedL)):-write(2),
	isRotationWin(CurrentPlayer, BlackL, RedL, Position, Direction, Quadrant, NewBlackL, NewRedL),!.

%Case3
%Opponent Player wins in next turn whatever
pentago_ai(board(BlackL, RedL), CurrentPlayer, move(Position, Direction, Quadrant), board(NewBlackL, NewRedL)):-write(3),
	CurrentPlayer == black, opponentWin(BlackL, RedL, CurrentPlayer), genRandomPosition(1, BlackL, RedL, Position),
	Direction = clockwise, getQuadrant(Position, Quadrant), moveAndRotate(CurrentPlayer, Position, Quadrant, Direction, BlackL, RedL, NewBlackL, NewRedL),!;
	CurrentPlayer == red, opponentWin(BlackL, RedL, CurrentPlayer), genRandomPosition(1, BlackL, RedL, Position),
	Direction = clockwise, getQuadrant(Position, Quadrant), moveAndRotate(CurrentPlayer, Position, Quadrant, Direction, BlackL, RedL, NewBlackL, NewRedL),!.

%Case4
%Move to reduce threatening from opponent
pentago_ai(board(BlackL, RedL), CurrentPlayer, move(Position, Direction, Quadrant), board(NewBlackL, NewRedL)):-write(4),
	miniMax(CurrentPlayer, BlackL, RedL, Position, Direction, Quadrant, NewBlackL, NewRedL),!.

%-------------Rotation-------------%
rotate(Quadrant, Direction, BlackL, RedL, SortedBlackL, SortedRedL):-
	Direction == clockwise, clockwiseRotation(Quadrant, BlackL, NewBlackL), clockwiseRotation(Quadrant, RedL, NewRedL),
	sort(NewBlackL, SortedBlackL), sort(NewRedL, SortedRedL),!;
	Direction == anti-clockwise, anticlockwiseRotation(Quadrant, BlackL, NewBlackL), anticlockwiseRotation(Quadrant, RedL, NewRedL),
	sort(NewBlackL, SortedBlackL), sort(NewRedL, SortedRedL),!.

/*Clockwise rotations*/
clockwiseRotation(_, [], []).
/*Top-left*/
clockwiseRotation(top-left, [1|L], [3|NewL]):-
	clockwiseRotation(top-left, L, NewL),!.
clockwiseRotation(top-left, [2|L], [9|NewL]):-
	clockwiseRotation(top-left, L, NewL),!.
clockwiseRotation(top-left, [3|L], [15|NewL]):-
	clockwiseRotation(top-left, L, NewL),!.
clockwiseRotation(top-left, [7|L], [2|NewL]):-
	clockwiseRotation(top-left, L, NewL),!.
clockwiseRotation(top-left, [9|L], [14|NewL]):-
	clockwiseRotation(top-left, L, NewL),!.
clockwiseRotation(top-left, [13|L], [1|NewL]):-
	clockwiseRotation(top-left, L, NewL),!.
clockwiseRotation(top-left, [14|L], [7|NewL]):-
	clockwiseRotation(top-left, L, NewL),!.
clockwiseRotation(top-left, [15|L], [13|NewL]):-
	clockwiseRotation(top-left, L, NewL),!.
clockwiseRotation(top-left, [NULL|L], [NULL|NewL]):-
	clockwiseRotation(top-left, L, NewL),!.
/*Top-right*/
clockwiseRotation(top-right, [4|L], [6|NewL]):-
	clockwiseRotation(top-right, L, NewL),!.
clockwiseRotation(top-right, [5|L], [12|NewL]):-
	clockwiseRotation(top-right, L, NewL),!.
clockwiseRotation(top-right, [6|L], [18|NewL]):-
	clockwiseRotation(top-right, L, NewL),!.
clockwiseRotation(top-right, [10|L], [5|NewL]):-
	clockwiseRotation(top-right, L, NewL),!.
clockwiseRotation(top-right, [12|L], [17|NewL]):-
	clockwiseRotation(top-right, L, NewL),!.
clockwiseRotation(top-right, [16|L], [4|NewL]):-
	clockwiseRotation(top-right, L, NewL),!.
clockwiseRotation(top-right, [17|L], [10|NewL]):-
	clockwiseRotation(top-right, L, NewL),!.
clockwiseRotation(top-right, [18|L], [16|NewL]):-
	clockwiseRotation(top-right, L, NewL),!.
clockwiseRotation(top-right, [NULL|L], [NULL|NewL]):-
	clockwiseRotation(top-right, L, NewL),!.
/*Bottom-left*/
clockwiseRotation(bottom-left, [19|L], [21|NewL]):-
	clockwiseRotation(bottom-left, L, NewL),!.
clockwiseRotation(bottom-left, [20|L], [27|NewL]):-
	clockwiseRotation(bottom-left, L, NewL),!.
clockwiseRotation(bottom-left, [21|L], [33|NewL]):-
	clockwiseRotation(bottom-left, L, NewL),!.
clockwiseRotation(bottom-left, [25|L], [20|NewL]):-
	clockwiseRotation(bottom-left, L, NewL),!.
clockwiseRotation(bottom-left, [27|L], [32|NewL]):-
	clockwiseRotation(bottom-left, L, NewL),!.
clockwiseRotation(bottom-left, [31|L], [19|NewL]):-
	clockwiseRotation(bottom-left, L, NewL),!.
clockwiseRotation(bottom-left, [32|L], [25|NewL]):-
	clockwiseRotation(bottom-left, L, NewL),!.
clockwiseRotation(bottom-left, [33|L], [31|NewL]):-
	clockwiseRotation(bottom-left,L , NewL),!.
clockwiseRotation(bottom-left, [NULL|L], [NULL|NewL]):-
	clockwiseRotation(bottom-left, L, NewL),!.
/*Bottom-right*/
clockwiseRotation(bottom-right, [22|L], [24|NewL]):-
	clockwiseRotation(bottom-right, L, NewL),!.
clockwiseRotation(bottom-right, [23|L], [30|NewL]):-
	clockwiseRotation(bottom-right, L, NewL),!.
clockwiseRotation(bottom-right, [24|L], [36|NewL]):-
	clockwiseRotation(bottom-right, L, NewL),!.
clockwiseRotation(bottom-right, [28|L], [23|NewL]):-
	clockwiseRotation(bottom-right, L, NewL),!.
clockwiseRotation(bottom-right, [30|L], [35|NewL]):-
	clockwiseRotation(bottom-right, L, NewL),!.
clockwiseRotation(bottom-right, [34|L], [22|NewL]):-
	clockwiseRotation(bottom-right, L, NewL),!.
clockwiseRotation(bottom-right, [35|L], [28|NewL]):-
	clockwiseRotation(bottom-right, L, NewL),!.
clockwiseRotation(bottom-right, [36|L], [34|NewL]):-
	clockwiseRotation(bottom-right, L, NewL),!.
clockwiseRotation(bottom-right, [NULL|L], [NULL|NewL]):-
	clockwiseRotation(bottom-right, L, NewL).

/*Anti-Clockwise rotations*/
anticlockwiseRotation(_, [], []).
/*Top-left*/
anticlockwiseRotation(top-left, [1|L], [13|NewL]):-
	anticlockwiseRotation(top-left, L, NewL),!.
anticlockwiseRotation(top-left, [2|L], [7|NewL]):-
	anticlockwiseRotation(top-left, L, NewL),!.
anticlockwiseRotation(top-left, [3|L], [1|NewL]):-
	anticlockwiseRotation(top-left, L, NewL),!.
anticlockwiseRotation(top-left, [7|L], [14|NewL]):-
	anticlockwiseRotation(top-left, L, NewL),!.
anticlockwiseRotation(top-left, [9|L], [2|NewL]):-
	anticlockwiseRotation(top-left, L, NewL),!.
anticlockwiseRotation(top-left, [13|L], [15|NewL]):-
	anticlockwiseRotation(top-left, L, NewL),!.
anticlockwiseRotation(top-left, [14|L], [9|NewL]):-
	anticlockwiseRotation(top-left, L, NewL),!.
anticlockwiseRotation(top-left, [15|L], [3|NewL]):-
	anticlockwiseRotation(top-left, L, NewL),!.
anticlockwiseRotation(top-left, [NULL|L], [NULL|NewL]):-
	anticlockwiseRotation(top-left, L, NewL),!.
/*Top-right*/
anticlockwiseRotation(top-right, [4|L], [16|NewL]):-
	anticlockwiseRotation(top-right, L, NewL),!.
anticlockwiseRotation(top-right, [5|L], [10|NewL]):-
	anticlockwiseRotation(top-right, L, NewL),!.
anticlockwiseRotation(top-right, [6|L], [4|NewL]):-
	anticlockwiseRotation(top-right, L, NewL),!.
anticlockwiseRotation(top-right, [10|L], [17|NewL]):-
	anticlockwiseRotation(top-right, L, NewL),!.
anticlockwiseRotation(top-right, [12|L], [5|NewL]):-
	anticlockwiseRotation(top-right, L, NewL),!.
anticlockwiseRotation(top-right, [16|L], [18|NewL]):-
	anticlockwiseRotation(top-right, L, NewL),!.
anticlockwiseRotation(top-right, [17|L], [12|NewL]):-
	anticlockwiseRotation(top-right, L, NewL),!.
anticlockwiseRotation(top-right, [18|L], [6|NewL]):-
	anticlockwiseRotation(top-right, L, NewL),!.
anticlockwiseRotation(top-right, [NULL|L], [NULL|NewL]):-
	anticlockwiseRotation(top-right, L, NewL),!.
/*Bottom-left*/
anticlockwiseRotation(bottom-left, [19|L], [31|NewL]):-
	anticlockwiseRotation(bottom-left, L, NewL),!.
anticlockwiseRotation(bottom-left, [20|L], [25|NewL]):-
	anticlockwiseRotation(bottom-left, L, NewL),!.
anticlockwiseRotation(bottom-left, [21|L], [19|NewL]):-
	anticlockwiseRotation(bottom-left, L, NewL),!.
anticlockwiseRotation(bottom-left, [25|L], [32|NewL]):-
	anticlockwiseRotation(bottom-left, L, NewL),!.
anticlockwiseRotation(bottom-left, [27|L], [20|NewL]):-
	anticlockwiseRotation(bottom-left, L, NewL),!.
anticlockwiseRotation(bottom-left, [31|L], [33|NewL]):-
	anticlockwiseRotation(bottom-left, L, NewL),!.
anticlockwiseRotation(bottom-left, [32|L], [27|NewL]):-
	anticlockwiseRotation(bottom-left, L, NewL),!.
anticlockwiseRotation(bottom-left, [33|L], [21|NewL]):-
	anticlockwiseRotation(bottom-left, L, NewL),!.
anticlockwiseRotation(bottom-left, [NULL|L], [NULL|NewL]):-
	anticlockwiseRotation(bottom-left, L, NewL),!.
/*Bottom-right*/
anticlockwiseRotation(bottom-right, [22|L], [34|NewL]):-
	anticlockwiseRotation(bottom-right, L, NewL),!.
anticlockwiseRotation(bottom-right, [23|L], [28|NewL]):-
	anticlockwiseRotation(bottom-right, L, NewL),!.
anticlockwiseRotation(bottom-right, [24|L], [22|NewL]):-
	anticlockwiseRotation(bottom-right, L, NewL),!.
anticlockwiseRotation(bottom-right, [28|L], [35|NewL]):-
	anticlockwiseRotation(bottom-right, L, NewL),!.
anticlockwiseRotation(bottom-right, [30|L], [23|NewL]):-
	anticlockwiseRotation(bottom-right, L, NewL),!.
anticlockwiseRotation(bottom-right, [34|L], [36|NewL]):-
	anticlockwiseRotation(bottom-right, L, NewL),!.
anticlockwiseRotation(bottom-right, [35|L], [30|NewL]):-
	anticlockwiseRotation(bottom-right, L, NewL),!.
anticlockwiseRotation(bottom-right, [36|L], [24|NewL]):-
	anticlockwiseRotation(bottom-right, L, NewL),!.
anticlockwiseRotation(bottom-right, [NULL|L], [NULL|NewL]):-
	anticlockwiseRotation(bottom-right, L, NewL).
