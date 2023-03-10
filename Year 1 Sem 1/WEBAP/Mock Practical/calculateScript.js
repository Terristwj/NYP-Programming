var num1;
var num2;

function getNumbers(){
	num1 = prompt("Please enter first number:");
	num2 = prompt("Please enter second number:");
}

function add(){
	var total = parseInt(num1) + parseInt(num2);
	alert("ADD: " + num1 + " + " + num2 + " = " + total);
}

function subtract(){
	var total = parseInt(num1) - parseInt(num2);
	alert("SUBTRACT: " + num1 + " - " + num2 + " = " + total);
}