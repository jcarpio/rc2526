

/*

crea_abb(+ListaEtiquetas, -ArbolBinario)
  es cierto cuando ArbolBinario unifica con
  un árbol binario de búsqueda balanceado que contiene solo las
  etiquetas de ListaEtiquetas.

*/

crea_abb([], nil).

crea_abb(Lista, a(Raiz, Hi, Hd) ):-
  length(Lista, L),
  Mitad is L div 2,
  length(ListaIzq, Mitad),
  append(ListaIzq, [Raiz|ListaDch], Lista),
  crea_ab(ListaIzq, Hi),
  crea_ab(ListaDch, Hd).