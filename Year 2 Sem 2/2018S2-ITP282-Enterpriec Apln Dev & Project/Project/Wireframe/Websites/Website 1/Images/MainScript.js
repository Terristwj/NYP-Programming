
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
