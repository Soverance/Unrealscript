// Aegis UDK Project
// © 2012 Soverance Studios
// Scott McCutchen
// info@soverance.com

class AegisGameInfo extends UTGame;
	
defaultproperties
{
	//Identifies files associated with your game type using prefixes
	Acronym="Aegis"
	
	//Define commonly used classes
	PlayerControllerClass=class'Aegis.AegisPlayerController'
	DefaultPawnClass=class'Aegis.AegisPawn'
	HUDType=class'Aegis.AegisHUD'
	
	//variable created to allow backwards compatability with UIScenes
	bUseClassicHUD=true
	
	//required values
	bDelayedStart=false
	bRestartLevel=false
	
	Name="Default__AegisGameInfo"
}
