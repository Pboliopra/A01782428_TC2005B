/*
1 Escribe una función que encuentre el 
primer carácter de un cadena de texto que 
no se repite. Prueba tu función con: 
'abacddbec'
*/
function noDuplicates(text){
    new Set(text);
}1
/*
2 Escribe una función que implemente 
el algoritmo 'bubble-sort' para 
ordenar una lista de números.
*/
/*
Escribe dos funciones: la primera que 
invierta un arreglo de números y 
regrese un nuevo arreglo con el 
resultado; la segunda que modifique el 
mismo arreglo que se pasa como 
argumento. No se permite usar la 
función integrada 'reverse'.
*/
// 4
// 5
// 6
function translate(text) {
let dict = {
    'o':0,
    'i':1,
    'z':2,
    'e':3,
    'a':4,
    's':5,
    'b':6,
    't':7,
    'g':9
}
text = 'Javascript es divertido'
for (let i = 0; i < text(length); i++){
    let out = text[i].replace(dict); 
}
console.log(out);
}
// 7
// 8
// 9
// 10
// 11
// 12
// 13
// 14
// 15