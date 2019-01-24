// hhGregg's Quest for Coupons; Autosplitter

// State
state("HHGQFC(v0.6.0)")
{
	uint coins : "UnityPlayer.dll", 0x10B07B8, 0x198, 0x24, 0xA4, 0xC, 0x2F0;
	uint uiElements : "UnityPlayer.dll", 0x10C5668, 0x4, 0x4A4, 0x1E8, 0x13C, 0x51C;
	uint coupons : "UnityPlayer.dll", 0x10D8F54, 0x3D0, 0x43C, 0xB8, 0x8, 0x470;
	uint movementTime : "UnityPlayer.dll", 0x10C761C, 0x38, 0xB8, 0x1C, 0x3C, 0x35C;
	uint grounded : "UnityPlayer.dll", 0x10DFBC0, 0x50, 0x0, 0x8, 0xE8, 0x68;
	float xPos : "UnityPlayer.dll", 0x11073D0, 0x238, 0x4, 0x44, 0x80, 0x10;
	
}

// Initialization
init
{
	vars.fresh = 0;
	vars.split = 0;
}

// Updating
update
{

}

// Startup
startup
{
    //settings.Add("option1", true, "Load Removal");
	//settings.SetToolTip("option1", "Load Description");
}

 // Start Timer
start
{
	if (current.uiElements == 0 && old.movementTime == 0 && (current.movementTime > old.movementTime) && vars.fresh == 0)
    {
		vars.fresh = 1;
        return true;
    }
}

// Split
split
{	
    if (old.coupons < current.coupons)
    {
		vars.split += 1;
		return true;
	} 
	if (current.grounded == 0 && current.movementTime == 0 && old.movementTime == 0 && vars.split == 0 && current.xPos == 0)
	{
		vars.split += 1;
		return true;
	}
}

// Reset
reset
{

}

isLoading
{

}