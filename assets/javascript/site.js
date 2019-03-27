// This is where it all goes :)
import 'lightgallery.js'


window.onload=function(){
	
	const navBurgers = document.getElementsByClassName("navbar-burger"); 
	  
	if (navBurgers.length > 0) { 
		for(var i = 0; i < navBurgers.length; i++){
		 navBurgers[0].addEventListener('click', () => { 
		   const target = document.getElementById(navBurgers[0].dataset.target); 
		   navBurgers[0].classList.toggle('is-active'); 
		   target.classList.toggle('is-active'); 
		 }); 
		} 
	}
}