

:- load_files('req2.pl').

:- use_module(library(clpfd)).
% :- use_module(library(pairs)).

requirements(Rs) :-
        Goal = class_subject_teacher_times(Class,Subject,Teacher,Number),
        setof(req(Class,Subject,Teacher,Number), Goal, Rs0),
        maplist(req_with_slots, Rs0, Rs).

req_with_slots(R, R-Slots) :- R = req(_,_,_,N), length(Slots, N).	

classes(Classes) :-
        setof(C, S^N^T^class_subject_teacher_times(C,S,T,N), Classes).
		
teachers(Teachers) :-
        setof(T, C^S^N^class_subject_teacher_times(C,S,T,N), Teachers).	
		
requirements_variables(Rs, Vars) :-
        requirements(Rs),
        pairs_slots(Rs, Vars),
        slots_per_week(SPW),
        Max #= SPW - 1,
        Vars ins 0..Max,
        maplist(constrain_subject, Rs).
		
pairs_slots(Ps, Vs) :-
        pairs_values(Ps, Vs0),
        append(Vs0, Vs).

constrain_subject(req(Class,Subj,_Teacher,_Num)-Slots) :-
        strictly_ascending(Slots), % break symmetry
        maplist(slot_quotient, Slots, Qs0),
        strictly_ascending(Qs0).		

strictly_ascending(Ls) :- chain(#<, Ls).

slot_quotient(S, Q) :-
        slots_per_day(SPD),
        Q #= S // SPD.