/*
1.- Escribe una función que encuentre el 
primer carácter de un cadena de texto que 
no se repite. Prueba tu función con: 
'abacddbec'
*/
function firstNonRepeated(strng) {
    const arr = [...strng];
    
    const seenCount = {};
    for (let char of arr) {
            if (seenCount[char] === undefined)
                seenCount[char] = 0;
            else 
                seenCount[char]++;
    }
    return arr.filter(chr => !seenCount[chr])[0];
}
console.log("Testing function to return the first char to not be repeated");
console.log(firstNonRepeated("abacddbec"));
/*
2.- Escribe una función que implemente 
el algoritmo 'bubble-sort' para 
ordenar una lista de números.
*/
function bubbleSort(NumList){
    for (let i = 0; i < NumList.length; i++) {
        for (let j = 0; j < NumList.length - i - 1; j++) {
            if (NumList[j]>NumList[j+1]) {
                temp = NumList[j];
                NumList[j] = NumList[j+1];
                NumList[j+1] = temp;
            }  
        } 
    }
    return NumList; 
}
console.log("Testing function to bubble sort an array");
console.log(bubbleSort([2,3,6,78,3,9,2,7,4,2]));
/*
3.- Escribe dos funciones: la primera que 
invierta un arreglo de números y 
regrese un nuevo arreglo con el 
resultado; la segunda que modifique el 
mismo arreglo que se pasa como 
argumento. No se permite usar la 
función integrada 'reverse'.
*/
function invert(arr) {
    const newArr = [];
    for (let i = arr.length - 1; i >= 0; i--)
        newArr.push(arr[i]);
    return newArr;
}
console.log("Testing function to a capella invert an array returning a new array");
console.log(invert(["a", "e", "i", "o", "u"]));

function modify(arr) {
    let n = arr.length;
    for (let i = 0; i < Math.floor(n/2); i++) {
        temp = arr[i];
        arr[i] = arr[n - 1 - i];
        arr[n - 1 - i] = temp; 
    }
    return arr;
}
console.log("Testing function to a capella invert an array returning the same array but modified");
console.log(modify(["a", "e", "i", "o", "u"]));
/*
4.- Escribe una función que reciba una 
cadena de texto y regrese una nueva con 
la primer letra de cada palabra en 
mayúscula.
*/
function Caps(strng) {
    const arr = strng.split(/\s+/);
    return arr.map(word => word.charAt(0).toUpperCase() + word.slice(1));
}
console.log("Testing function to make the first char of every word in a string caps");
console.log(Caps("what is life"));
/*
5.- Escribe una función que calcule el 
máximo común divisor de dos números.
*/
function mcd(x, y){
    let temp;
    if (y > x){
        temp = x;
        x = y;
        y = temp;
    }
    if (y == 0){
        return x;
    }
    else{
        return mcd(y, x % y);
    }
}
console.log("Testing the function to calculate the MCD of two numbers")
console.log(mcd(90, 34));
/*
6.- Crea una función que cambie una 
cadena de texto a 'Hacker Speak'. 
Por ejemplo, para la cadena 
'Javascript es divertido', su hacker 
speak es: 'J4v45c1pt 35 d1v3rt1d0'.
*/
function translate(strng) {
const dict = {
    'o':0,
    'i':1,
    'z':2,
    'e':3,
    'a':4,
    's':5,
    'b':6,
    't':7,
    'g':9
};
/*
... unpacking operator/spread syntax, it basically 
converts an array into its different values but in 
strings it separates them into its chars which is 
what I used to separate the given text, then I 
used map which takes a callback which is basically 
any function and I gave it a char parameter that 
was then used to check if whatever lowercase char 
exists in the dictionary, this will be undefined 
when it doesn't exist so I couldn't use a simple 
or so I used the coalescence operator instead, in 
order to simply add the char if it doesn't exist 
in the dictionary
*/
return [...strng].map(chr => {dict[chr.toLowerCase()] ?? chr}).join("");
}
console.log("Testing the function to translate text to hacker speak");
// console.log(translate("Javascript es divertido"));
/*
7.- Escribe una función que reciba un número, y 
regrese una lista con todos sus factores. Por 
ejemplo: factoriza(12) -> [1, 2, 3, 4, 6, 12].
*/
function factorize(number) {
    
}
/*
8.- Escribe una función que quite los elementos 
duplicados de un arreglo y regrese una lista con 
los elementos que quedan. Por ejemplo: 
quitaDuplicados([1, 0, 1, 1, 0, 0]) -> [1, 0]
*/
function noDuplicates(arr){
    return [...new Set(arr)];
}
console.log("Testing the function to impede duplicate items");
console.log(noDuplicates([1, 0, 1, 1, 0, 0]));
/*
9.- Escribe una función que reciba como parámetro 
una lista de cadenas de texto, y regrese la 
longitud de la cadena más corta.
*/
function shortestString(stringArray) {
    let smaller = stringArray[0].length;
    for (let i = 1; i < stringArray.length; i++) {
        if(smaller>stringArray[i].length){
            smaller = stringArray[i].length;
        }
    }
    return smaller;
}
console.log("Testing function that returns the shortest string in a list of strings");
console.log(shortestString(["o", "hell", "world"]))
/*
10.- Escribe una función que revise si una cadena 
de texto es un palíndromo o no.
*/
function isPalindrome(strng) {
    const arr = [...strng];
    const revarr = [...arr];
    revarr.reverse();
    for (let i = 0; i < arr.length; i++) {
        if (arr[i] != revarr[i]) {
            return false;
        }
    }
    return true;
}
console.log("Testing the function to detect a palindrome");
console.log(isPalindrome("abba"));
console.log(isPalindrome("freedom"));
/*
11.- Escribe una función que tome una lista de 
cadena de textos y devuelva una nueva lista con 
todas las cadenas en orden alfabético.
*/
function alphabeticOrder(arr) {
    const newArr = [...arr];
    return newArr.sort((item1, item2) => item1.localeCompare(item2)); 
}
console.log("Testing the function to sort the strings of an array");
console.log(alphabeticOrder(["d", "n", "a"]));
/*
12.- Escribe una función que tome una lista de 
números y devuelva la mediana y la moda.
*/
function medianMode(numList) {
    
}
/*
13.- Escribe una función que tome una lista de 
cadenas de texto y devuelva la cadena más 
frecuente.
*/
function mostRepeats(params) {
    
}
/*
14.- Escribe una función que tome un número y 
devuelva verdadero si es una potencia de dos, 
falso de lo contrario.
*/
function isPower2(number) {
    while (number % 2 == 0) {
        number = number/2;
    }
    if (number == 1) {
        return true;
    }
    else{
        return false;
    }
}
console.log("Testing the function that verifies if a number is a power of 2");
console.log(isPower2(512));
console.log(isPower2(34));
/*
15.- Escribe una función que tome una lista de 
números y devuelva una nueva lista con todos 
los números en orden descendente.
*/
function descendingOrder(NumList) {
    /*
    This basically does the sort through a subtraction where 
    it compares item1 to item2. Taking advantage of the fact 
    it's a subtraction, what this arrow function does is it 
    places item1 before item2 only if the subtraction comes 
    out negative but when positive, item2 is placed first.
    */
    return NumList.sort((item1, item2) => item2-item1);
}
console.log("Testing the function that sorts an array in descending order");
console.log(descendingOrder([7,4,8,3,2,9]));