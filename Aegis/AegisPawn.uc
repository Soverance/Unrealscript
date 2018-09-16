// Aegis UDK Project
// © 2012 Soverance Studios
// Scott McCutchen
// info@soverance.com

class AegisPawn extends UTPawn;

// shield variable
var archetype AegisShield ShieldArchetype;

// PostBeginPlay
simulated event PostBeginPlay()
{		
	local Vector SocketLocation;
	local Rotator SocketRotation;
	local AegisShield shield;
	
	super.PostBeginPlay();
	AddInventoryItems();
	`Log("Ethereal Soldier has been spawned with Inventory"); //debug	
	
	if (Mesh != None)
	{
		if (ShieldArchetype != None && Mesh.GetSocketByName('ShieldSocket') != None)
		{
			Mesh.GetSocketWorldLocationAndRotation('ShieldSocket', SocketLocation, SocketRotation);
			
			shield = Spawn(ShieldArchetype.class,,, SocketLocation, SocketRotation, ShieldArchetype);
			
			if (shield != None)
			{
				shield.SetBase(Self,, Mesh, 'ShieldSocket');
			}
		}
	}	
}


defaultproperties
{
	// camera properties
	CamHeight = 70.0
	CamMinDistance = 40.0
	CamMaxDistance = 350.0
   	CamOffsetDistance=250.0
	CamZoomTick=20.0
	
	// Shield attachment properties
	ShieldArchetype=AegisShield'Soldier_Inventory.testShield'
	bCanBeBaseForPawns=True 
	
	//set light environment for player pawn
	Begin Object Class=DynamicLightEnvironmentComponent Name=AegisLightEnvironment
		bSynthesizeSHLight=TRUE
		bIsCharacterLightEnvironment=TRUE
		bUseBooleanEnvironmentShadowing=FALSE
		InvisibleUpdateTime=1
		MinTimeBetweenFullUpdates=.2
	End Object
	Components.Add(AegisLightEnvironment)		
	
	// begin player pawn configuration
	Begin Object Class=SkeletalMeshComponent Name=AegisPawnComponent
    		SkeletalMesh=SkeletalMesh'Soldier_Pawn.Soldier_CAT_Run'
    		PhysicsAsset=PhysicsAsset'CH_AnimCorrupt.Mesh.SK_CH_Corrupt_Male_Physics'
    		bCacheAnimSequenceNodes=FALSE
    		AlwaysLoadOnClient=true
    		AlwaysLoadOnServer=true
    		bOwnerNoSee=false
    		CastShadow=true
    		BlockRigidBody=TRUE
    		bUpdateSkelWhenNotRendered=false
    		bIgnoreControllersWhenNotRendered=TRUE
    		bUpdateKinematicBonesFromAnimation=true
    		LightEnvironment=AegisLightEnvironment
    		bCastDynamicShadow=true
    		RBChannel=RBCC_Untitled3
    		RBCollideWithChannels=(Untitled3=true)
    		bOverrideAttachmentOwnerVisibility=true
    		bAcceptsDynamicDecals=FALSE
        	AnimTreeTemplate=AnimTree'Soldier_Pawn.Aegis_AnimTree'
        	bHasPhysicsAssetInstance=true
        	TickGroup=TG_PreAsyncWork
        	MinDistFactorForKinematicUpdate=0.2
        	bChartDistanceFactor=true
        	bSkipAllUpdateWhenPhysicsAsleep=TRUE
        	RBDominanceGroup=20
        	Scale=1.3975
        	bAllowAmbientOcclusion=false
        End Object  
	
	//  collision cylinder config
	Begin Object Name=CollisionCylinder
		CollisionRadius=+010.000000
		CollisionHeight=+038.000000
	End Object
	CylinderComponent=CollisionCylinder	
}
