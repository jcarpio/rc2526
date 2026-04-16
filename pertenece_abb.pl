

/*

pertenece_abb(+Elem, +Abb)
  es cierto si Elem pertenece al árbol binario de búsqueda
  Abb.
  
*/

pertenece_abb(Elem, a(Elem, _, _) ).
pertenece_abb(Elem, a(Raiz, _, Hd) ):- Elem > Raiz, pertenece_abb(Elem, Hd).
pertenece_abb(Elem, a(Raiz, Hi, _) ):- Elem < Raiz, pertenece_abb(Elem, Hi). 