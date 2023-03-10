//clock
function clock()
{
	var time = new Date()
	var hr = time.getHours()
	var min = time.getMinutes()
	var sec = time.getSeconds()
	var ampm = " PM "
	if (hr < 12)									//<!-- Done in:								    -->
	{												//<!-- 1920 x 1080 Resolution					-->
		ampm = " AM "								//<!-- Size of Text, Apps and other items: 100% -->
	}
	if (hr > 12)
	{
	hr -= 12
	}
	if (hr < 10)
	{
	hr = " " + hr
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

//	Back to Top of scroll by refreshing

	// When the user clicks on the button, refreshes the document
function topFunction() 
{
	location.reload();
}


//  Disappear
function disappear()
{
	document.getElementById("promptDown").innerHTML = "&nbsp"
}


// BMI Calculator
function calculateBmi() 
{
	var weight = document.bmiForm.weight.value
	var height = document.bmiForm.height.value
	if(weight > 0 && height > 0)
	{	
		var finalBmi = weight/(height/100*height/100)
		document.bmiForm.bmi.value = finalBmi
		if(finalBmi < 18.5)
		{
			document.bmiForm.meaning.value = "You are underweight."
		}
		if(finalBmi > 18.5 && finalBmi < 25)
		{
			document.bmiForm.meaning.value = "You are healthy."
		}
		if(finalBmi >= 25 && finalBmi < 30)
		{
			document.bmiForm.meaning.value = "You are overweight."
		}
		if(finalBmi >= 30 && finalBmi < 40)
		{
			document.bmiForm.meaning.value = "You are obese."
		}
		if(finalBmi >= 40)
		{
			document.bmiForm.meaning.value = "You are severely obese."
		}
	}
	else
	{
		document.bmiForm.bmi.value = "Error."
		document.bmiForm.meaning.value = "Error."
		alert("Please Fill in everything correctly")
	}
	
}


//	Explore Button mouseover
function exploreOver(i)
{
	var x = document.getElementsByClassName("catergory");
	x[i].style.backgroundColor = "#555555";
	x[i].style.color = "white";
	x[i].style.transitionDuration = "0.25s";
}


//	Explore Button mouseout
function exploreOut(i)
{
	var x = document.getElementsByClassName("catergory");
	x[i].style.backgroundColor = "#e7e7e7";
	x[i].style.color = "black";
	x[i].style.transitionDuration = "0.5s";
}


//	Explore Button mouseClick (Part_1)
function exploreClick(i)
{
	var x = document.getElementsByClassName("catergory");
	x[i].style.backgroundColor = "#e7e7e7";
	x[i].style.color = "black";
	x[i].style.transitionDuration = "0.5s";
	display(i);
}
//	Explore Button mouseClick (Part_2)
function display(i)
{
	var x = document.getElementsByClassName("catergoryContent");
	var y = document.getElementById("defaultContent");
	y.style.display = 'none';
	for (var n=0; n<x.length; n++)
	{
		x[n].style.display = 'none';
	}
	
	if (x[i].style.display == 'block') 
	{
		x[i].style.display = 'none';
	} 
	else 
	{
		x[i].style.display = 'block';
	}
}