//clock
function clock()
{
	var time = new Date()
	var hr = time.getHours()
	var min = time.getMinutes()
	var sec = time.getSeconds()
	var ampm = " PM "
	if (hr < 12)
	{
		ampm = " AM "
	}
	if (hr > 12)
	{
	hr -= 12
	}
	if (hr < 10)
	{
	hr = " " + hr
	}
	if (hr == 0)
	{
		hr = 12
	}
	if (min < 10)
	{
	min = "0" + min
	}
	if (sec < 10)
	{
	sec = "0" + sec
	}
	document.clockForm.clockButton.value = "" + hr + ":" + min + ":" + sec + ampm
	setTimeout("clock()", 1000)
}
function showDate()
{
	var date = new Date()
	var year = date.getYear()
	if(year < 1000)
	{
	year += 1900
	}
	var monthArray = new Array("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December")
	alert( monthArray[date.getMonth()] + " " + date.getDate() + ", " + year)
}
window.onload = clock;

//Social Media Chip
function overChip(i)
{
	var x = document.getElementsByClassName("chipName2");
	x[i].style.color = 'white';
	x[i].style.transitionDuration = "0.5s";
}
function outChip(i)
{
	var x = document.getElementsByClassName("chipName2");
	x[i].style.color = 'black';
	x[i].style.transitionDuration = "1s";
}

//Login Top
function overLogin(i)
{
	var x = document.getElementsByClassName("username");
	x[i].style.color = 'white';
	x[i].style.transitionDuration = "0.2s";
}
function outLogin(i)
{
	var x = document.getElementsByClassName("username");
	x[i].style.color = 'black';
	x[i].style.transitionDuration = "1s";
}
