// 1.- position of mouse cursor
const mousePos = document.getElementById("mousePosition");

document.addEventListener("mousemove", function(event){
    const posX = event.clientX;
    const posY = event.clientY;
    mousePos.textContent = "Posición del mouse: " + posX + ", " + posY;
});

// 2.- full name to be printed after submission
const form = document.getElementById("form1");
const firstName = document.getElementById("form-fname");
const lastName = document.getElementById("form-lname");
const submit = document.getElementById("form1-submit");

submit.addEventListener("click", function(event){
    event.preventDefault();

    const fname = firstName.value;
    const lname = lastName.value;
    const fullName = fname + " " + lname;

    const fullNameE = document.createElement("p");
    fullNameE.textContent = "Nombre completo: " + fullName;

    form.append(fullNameE);
});

// 3.- Adds rows or cols on command
const table = document.getElementById("sampleTable");
const rowButton = document.getElementById("btn-insert-r");
const colButton = document.getElementById("btn-insert-c");

rowButton.addEventListener("click", function() {

    const newRow = table.insertRow();
    const columns = table.rows[0].cells.length;
    let j = 3;
    for (let i = 0; i < columns; i++) {
        const newRowCell = newRow.insertCell();
        newRowCell.textContent = "Row " + " Column " + (i+1);
    }
});

colButton.addEventListener("click", function() {
    const rows = table.rows;
    for (let i = 0; i < rows.length; i++) {
        const newColCell = rows[i].insertCell();
        newColCell.textContent = "Row " + (i+1) + " Column ";
    }
});

// 4.- changes the text in a cell with its row and col index
const table2 = document.getElementById("myTable");
const change = document.getElementById("btn-change");

change.addEventListener("click", function(){
    const rowIndex = parseInt(document.getElementById("rowIndex").value);
    const colIndex = parseInt(document.getElementById("colIndex").value);
    const newValue = document.getElementById("newValue").value;

    const cell = table2.rows[rowIndex]?.cells[colIndex];

    if (cell)
        cell.textContent = newValue;
});

// 5.- adds or removes elements to the options list
const colorSelect = document.getElementById("colorSelect");
const addButton = document.getElementById("btn-add-color");
const removeButton = document.getElementById("btn-rmv-color");

addButton.addEventListener("click", function(){
    const colors = ["Blue", "Yellow", "Orange", "Purple"];
    const randy = colors[Math.floor(Math.random() * colors.length)];

    const option = document.createElement("option");
    option.textContent = randy;
    colorSelect.appendChild(option);
});

removeButton.addEventListener("click", function() {
    if (colorSelect.options.length > 0){
        colorSelect.removeChild(colorSelect.lastElementChild);
    }
});

// 6.- change the image by dragging the cursor over the image
const cattoPic = document.getElementById("imagenGato");

cattoPic.addEventListener("mouseenter", function(){
    const minWidth = 300;
    const maxWidth = 600;
    const minHeight = 300;
    const maxHeight = 600;

    const width = Math.floor(Math.random() * (maxWidth - minWidth + 1)) + minWidth;
    const height = Math.floor(Math.random() * (maxHeight - minHeight + 1)) + minHeight;

    const newSrc = `http://placekitten.com/${width}/${height}`;

    const newImage = new Image();
    newImage.src = newSrc;

    newImage.addEventListener("load", function(){
        cattoPic.src = newSrc;
    });
});