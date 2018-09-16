// Aegis UDK Project
// © 2012 Soverance Studios
// Scott McCutchen
// info@soverance.com

class AegisGFxHUD extends GFxMoviePlayer;

//Create a Health Cache variable
var float LastHealthpc;

//Create variables to hold references to the Flash MovieClips and Text Fields that will be modified
var GFxObject MainHUDMC, HealthBarMC;
var GFxObject HealthText;

//reference our player controller
var AegisPlayerController PlayerOwner;

//  Function to round a float value to an int
function int roundNum(float NumIn)
{
	local int iNum;
	local float fNum;

	fNum = NumIn;
	iNum = int(fNum);
	fNum -= iNum;
	if (fNum >= 0.5f)
	{
		return (iNum + 1);
	}
	else
	{
		return iNum;
	}
}

//  Function to return a percentage by dividing the actual value from the maximum value
function int getpc2(int val, int max)
{
	return roundNum((float(val) / float(max)) * 100.0f);
}

//Called from AegisHUD'd PostBeginPlay() to begin playing the HUD movie
function Init2(PlayerController PC)
{
	//Start and load the SWF Movie
	Start();
	Advance(0.f);

	//Set the cache value to something rediculous to know it gets updated on the first tick
	LastHealthpc = -1337;

	//Load the references using the instance names from our HUD movie flash file
	MainHUDMC = GetVariableObject("_root.Base_mc");
	HealthBarMC = GetVariableObject("_root.Base_mc.HPbar_mc");
	HealthText = GetVariableObject("_root.Base_mc.health_txt");
}

//Updates the HUD
function TickHUD()
{
	//If the cached value for Health percentage isn't equal to the current...
	if (LastHealthpc != getpc2(GetPC().Pawn.Health, GetPC().Pawn.HealthMax))
	{
		//...Make it so...
		LastHealthpc = getpc2(GetPC().Pawn.Health, GetPC().Pawn.HealthMax);
		//...Update the bar's xscale (but don't let it go over 100)...
		HealthBarMC.SetFloat("_xscale", (LastHealthpc > 100) ? 100.0f : LastHealthpc);
		//...and update the text field
		HealthText.SetString("text", round(LastHealthpc)$"%");
	}
}

DefaultProperties
{
	//hide the flash movie if the HUD is hidden
	bDisplayWithHudOff=false
	//The path to the swf asset we will create later
	MovieInfo=SwfMovie'soldier.Aegis_MainHUD'
}
