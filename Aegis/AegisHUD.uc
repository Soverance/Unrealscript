// Aegis UDK Project
// © 2012 Soverance Studios
// Scott McCutchen
// info@soverance.com

class AegisHUD extends UTHUDBase;

//Reference the actual SWF container
var AegisGFxHUD HudMovie;
var AegisPlayerController PO;

singular event Destroyed () 
{
	// if there is no flash file to play for the HUD
	if (HudMovie != none) 
	{
		//get rid of the memory usage of HudMovie
		HudMovie.Close(true);
		HudMovie = none;
	}
	
}

//Called after game loaded - initialize 
simulated function PostBeginPlay() 
{
	super.PostBeginPlay();
	
	//create a AegisGFxHUD for HudMovie
	HudMovie = new class'AegisGFxHUD';
	//play the HUD movie for the player
	HudMovie.PlayerOwner = PO;
	//used so you can pause the game
	HudMovie.SetTimingMode(TM_Real);
	//Call HudMovie's initialize function
	HudMovie.Init2(HudMovie.PlayerOwner);
}

//Called every tick the HUD should be updated
event PostRender() 
{
	HudMovie.TickHUD();
}

DefaultProperties
{
}
