/*

crea_lista_n(+Tam, +N, -ListaR)
  es cierto si ListaR unifica con una lista de tamaño N
  que contiene valores entre 0 y N - 1.
 
*/


crea_lista_n(0, _, []).

crea_lista_n(Tam, N, R2):- Tam > 0, Tam2 is Tam - 1, crea_lista_n(Tam2, N, R),
  append(R, [Tam], R2).