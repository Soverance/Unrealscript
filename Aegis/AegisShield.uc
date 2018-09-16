// Aegis UDK Project
// © 2012 Soverance Studios
// Scott McCutchen
// info@soverance.com

class AegisShield extends Actor;

var SkeletalMeshComponent ShieldMesh;


DefaultProperties
{
	bHardAttach=true
	
	Begin Object Class=SkeletalMeshComponent Name=ShieldComponent
		SkeletalMesh=SkeletalMesh'soldiercontent.Weapons.aegis'
	End Object
	ShieldMesh=ShieldComponent
	Components.Add(ShieldComponent)
}
