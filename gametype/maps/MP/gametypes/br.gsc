main()
{
    level.callbackStartGameType = ::Callback_StartGameType;
    level.callbackPlayerConnect = ::Callback_PlayerConnect;
    level.callbackPlayerDisconnect = ::Callback_PlayerDisconnect;
    level.callbackPlayerDamage = ::Callback_PlayerDamage;
    level.callbackPlayerKilled = ::Callback_PlayerKilled;
    maps\mp\gametypes\_callbacksetup::SetupCallbacks();

    ambientPlay("ambient_mp_harbor");

    level.objectiveText = "Be the last man standing.";
    level.maxClients = getCvarInt("sv_maxclients");
    level.text_waitingPlayers = &"WAITING FOR PLAYERS";
    level.text_parachuteDeployed = &"PARACHUTE DEPLOYED";
    level.text_parachuteNotDeployed = &"PARACHUTE NOT DEPLOYED";
    level.text_zoneIsShrinking = &"Zone shrinking ";
    level.text_zoneWillShrink = &"Zone shrinks in ";

    level.minPlayers = 10;
    if(getCvarInt("br_minPlayers"))
        level.minPlayers = getCvarInt("br_minPlayers");
    level.startBattleCountdown = 30;
    if(getCvarInt("br_startBattleCountdown"))
        level.startBattleCountdown = getCvarInt("br_startBattleCountdown");
    level.quickChatDelay = 0.5;
    if(getCvarFloat("br_quickChatDelay"))
        level.quickChatDelay = getCvarFloat("br_quickChatDelay");
    level.instantKill_bolt = true;
    if(getCvar("br_instantkill_bolt") == "0")
        level.instantKill_bolt = false;
    level.instantKill_pistol = false;
    if(getCvarInt("br_instantkill_pistol"))
        level.instantKill_pistol = true;
    level.instantKill_melee = true;
    if(getCvar("br_instantkill_melee") == "0")
        level.instantKill_melee = false;
    level.damageFeedback = true;
    if(getCvar("br_damagefeedback") == "0")
        level.damageFeedback = false;
    level.zoneDuration = 120;
    if(getCvarInt("br_zoneDuration"))
        level.zoneDuration = getCvarInt("br_zoneDuration");
    
    //MODEL PATHS
    level.model_zone = "xmodel/playerhead_default"; //TODO: For cleanliness/professionalism, use some dedicated invisible model instead.
    level.model_plane = "xmodel/c47";
    level.model_parachute = "xmodel/bx_parachute";

    // TODO: Check if can show hands/parachute handles without using a weapon file.
    level.parachute_deployed_hands = "br_parachute_mp"; // Weapon file used to show hands to indicate parachute is deployed.

    level.camouflages = [];
    level.camouflages[0] = "american";
    level.camouflages[1] = "british";
    level.camouflages[2] = "german";
    level.camouflages[3] = "russian";
    
    zoneOriginStart = (-540, -450, -900); //~center of map (zh_elusive)
    level.zone = spawn("script_model", zoneOriginStart);
    level.zoneStatic = spawn("script_model", zoneOriginStart);

    level.zone.angles = (-90, 0, 0); //DEPENDS ON MODELS TAG
    level.zone.modelTag = "bip01 spine2";
    level.zone.objnum = 0;

    level.zone.modes = [];

    level.zone.modes[0]["id"] = "start";
    level.zone.modes[0]["fxId"] = loadfx("fx/zone-start.efx");
    level.zone.modes[0]["startSize"] = "15000";

    level.zone.modes[1]["id"] = "start_1";
    level.zone.modes[1]["fxId"] = loadfx("fx/zone-start_1.efx");
    level.zone.modes[1]["life"] = "10000";
    level.zone.modes[1]["startSize"] = level.zone.modes[1-1]["startSize"];
    level.zone.modes[1]["endSize"] = "12000";

    level.zone.modes[2]["id"] = "1";
    level.zone.modes[2]["fxId"] = loadfx("fx/zone1.efx");
    level.zone.modes[2]["startSize"] = level.zone.modes[2-1]["endSize"];

    level.zone.modes[3]["id"] = "1_2";
    level.zone.modes[3]["fxId"] = loadfx("fx/zone1_2.efx");
    level.zone.modes[3]["life"] = "10000";
    level.zone.modes[3]["startSize"] = level.zone.modes[3-1]["startSize"];
    level.zone.modes[3]["endSize"] = "9000";

    level.zone.modes[4]["id"] = "2";
    level.zone.modes[4]["fxId"] = loadfx("fx/zone2.efx");
    level.zone.modes[4]["startSize"] = level.zone.modes[4-1]["endSize"];

    level.zone.modes[5]["id"] = "2_3";
    level.zone.modes[5]["fxId"] = loadfx("fx/zone2_3.efx");
    level.zone.modes[5]["life"] = "10000";
    level.zone.modes[5]["startSize"] = level.zone.modes[5-1]["startSize"];
    level.zone.modes[5]["endSize"] = "6500";

    level.zone.modes[6]["id"] = "3";
    level.zone.modes[6]["fxId"] = loadfx("fx/zone3.efx");
    level.zone.modes[6]["startSize"] = level.zone.modes[6-1]["endSize"];

    level.zone.modes[7]["id"] = "3_4";
    level.zone.modes[7]["fxId"] = loadfx("fx/zone3_4.efx");
    level.zone.modes[7]["life"] = "10000";
    level.zone.modes[7]["startSize"] = level.zone.modes[7-1]["startSize"];
    level.zone.modes[7]["endSize"] = "4250";

    level.zone.modes[8]["id"] = "4";
    level.zone.modes[8]["fxId"] = loadfx("fx/zone4.efx");
    level.zone.modes[8]["startSize"] = level.zone.modes[8-1]["endSize"];

    level.zone.modes[9]["id"] = "4_5";
    level.zone.modes[9]["fxId"] = loadfx("fx/zone4_5.efx");
    level.zone.modes[9]["life"] = "10000";
    level.zone.modes[9]["startSize"] = level.zone.modes[9-1]["startSize"];
    level.zone.modes[9]["endSize"] = "2000";

    level.zone.modes[10]["id"] = "5";
    level.zone.modes[10]["fxId"] = loadfx("fx/zone5.efx");
    level.zone.modes[10]["startSize"] = level.zone.modes[10-1]["endSize"];

    level.zone.modes[11]["id"] = "5_end";
    level.zone.modes[11]["fxId"] = loadfx("fx/zone5_end.efx");
    level.zone.modes[11]["life"] = "10000";
    level.zone.modes[11]["startSize"] = level.zone.modes[11-1]["startSize"];
    level.zone.modes[11]["endSize"] = "0";

    level.color_red = (1, 0, 0);
    level.color_blue = (0, 0, 1);
    level.color_green = (0, 1, 0);

    if(!isDefined(game["state"]))
        game["state"] = "playing";

    level.zone.active = false;
    level.startingBattle = false;
    level.battleStarted = false;
    level.battleOver = false;
    level.checkingVictoryRoyale = false;
    level.noWinner = false;

    level.healthqueue = [];
    level.healthqueuecurrent = 0;

    setarchive(true);
}
//CALLBACKS
Callback_StartGameType()
{
    //MENUS
    game["menu_camouflage"] = "camouflage";
    game["menu_weapon_all"] = "weapon_bolt";
    game["menu_quickcommands"] = "quickcommands";
    game["menu_quickstatements"] = "quickstatements";
    game["menu_quickresponses"] = "quickresponses";
    precacheMenu(game["menu_camouflage"]);
    precacheMenu(game["menu_weapon_all"]);
    precacheMenu(game["menu_quickcommands"]);
    precacheMenu(game["menu_quickstatements"]);
    precacheMenu(game["menu_quickresponses"]);

    //SHADERS
    precacheShader("black");
    precacheShader("hudScoreboard_mp");
    precacheShader("gfx/hud/hud@mpflag_none.tga");
    precacheShader("gfx/hud/hud@mpflag_spectator.tga");
    precacheShader("gfx/hud/damage_feedback.dds");
    precacheShader("gfx/hud/zone_center.dds");

    precacheStatusIcon("gfx/hud/hud@status_dead.tga");
    precacheStatusIcon("gfx/hud/hud@status_connecting.tga");

    //OBJECT MODELS
    precacheModel(level.model_zone);
    precacheModel(level.model_plane);
    precacheModel(level.model_parachute);

    //PLAYER MODELS
    mptype\american_airborne::precache();
    mptype\british_airborne::precache();
    mptype\german_wehrmacht::precache();
    mptype\russian_conscript::precache();
    game["american_model"] = mptype\american_airborne::main;
    game["british_model"] = mptype\british_airborne::main;
    game["german_model"] = mptype\german_wehrmacht::main;
    game["russian_model"] = mptype\russian_conscript::main;

    //WEAPONS
    precacheItem("springfield_mp");
    precacheItem("enfield_mp");
    precacheItem("mosin_nagant_mp");
    precacheItem("mosin_nagant_sniper_mp");
    precacheItem("kar98k_mp");
    precacheItem("kar98k_sniper_mp");
    //PISTOLS
    precacheItem("colt_mp");
    precacheItem("luger_mp");
    //GRENADES
    precacheItem("fraggrenade_mp");
    precacheItem("stielhandgranate_mp");
    precacheItem("mk1britishfrag_mp");
    precacheItem("rgd-33russianfrag_mp");

    precacheItem("item_health");

    precacheItem(level.parachute_deployed_hands);

    maps\mp\gametypes\_teams::initGlobalCvars();
    maps\mp\gametypes\_teams::restrictPlacedWeapons();

    setClientNameMode("auto_change");

    objective_add(level.zone.objnum, "current", level.zone.origin, "gfx/hud/zone_center.dds");
    objective_onEntity(level.zone.objnum, level.zone);
    objective_team(level.zone.objnum, "none");
    level.zone setModel(level.model_zone);
    level.zoneStatic setModel(level.model_zone);
    
    thread manageZoneLifecycle();
    thread checkBattleReady();
}
Callback_PlayerConnect()
{
    self.statusicon = "gfx/hud/hud@status_connecting.tga";
    self waittill("begin");
    self.statusicon = "";

    if (game["state"] == "intermission")
    {
        spawnIntermission();
        return;
    }

    self.pers["connected"] = true;
    iprintln(&"MPSCRIPT_CONNECTED", self);

    self.fights = true;
    self.inPlane = false;
    self.jumped = false;

    level endon("intermission");
    
    self setClientCvar("g_scriptMainMenu", game["menu_camouflage"]);
    self setClientCvar("scr_showweapontab", "0");
    self openMenu(game["menu_camouflage"]);
    self.sessionteam = "spectator";
    spawnSpectator();

    for(;;)
    {
        self waittill("menuresponse", menu, response);

        if (response == "open" || response == "close")
            continue;

        if (menu == game["menu_camouflage"])
        {
            switch(response)
            {
            case "american":
            case "british":
            case "german":
            case "russian":
            case "autoassign":
                if(self.jumped)
                    break;
                if(isDefined(self.pers["camouflage"]) && response == self.pers["camouflage"])
                    break; //SELECTED SAME CAMOUFLAGE
                if(response == "autoassign")
                    response = level.camouflages[randomInt(level.camouflages.size)];
                    
                self.fights = true;
                
                self.pers["camouflage"] = response;
                model();
                self setClientCvar("scr_showweapontab", "1");
                self setClientCvar("g_scriptMainMenu", game["menu_weapon_all"]);
                self openMenu(game["menu_weapon_all"]);
                break;

            case "spectator":
                self.fights = false;
                if (isDefined(self.pers["camouflage"]))
                {
                    self.pers["weapon"] = undefined;
                    self.pers["camouflage"] = undefined;
                    self.sessionteam = "spectator";
                    self setClientCvar("g_scriptMainMenu", game["menu_camouflage"]);
                    self setClientCvar("scr_showweapontab", "0");
                    spawnSpectator();
                }
                break;

            case "weapon":
                self openMenu(game["menu_weapon_all"]);
                break;
            }
        }
        else if (menu == game["menu_weapon_all"])
        {
            if (response == "camouflage")
            {
                self openMenu(game["menu_camouflage"]);
                continue;
            }
            else if (response == "viewmap")
            {
                continue;
            }
            if(!isDefined(self.pers["camouflage"]))
                continue;
            if(self.jumped)
                break;
            
            weapon = response; //TODO: check if should verify the weapon is allowed
            if(isDefined(self.pers["weapon"]) && self.pers["weapon"] == weapon)
                continue; //Selected same weapon

            if (isDefined(self.pers["weapon"]))
            {
                //Selected another weapon
                self.pers["weapon"] = weapon;
                if (!self.inPlane)
                {
                    self takeWeapon(self getWeaponSlotWeapon("primary"));
                    self giveWeapon(self.pers["weapon"]);
                    self giveMaxAmmo(self.pers["weapon"]);
                    self setSpawnWeapon(self.pers["weapon"]);
                    self switchToWeapon(self.pers["weapon"]);
                }
            }
            else
            {
                self.pers["weapon"] = weapon;
                // Preventing player from spawning normally if battle already started.
                //TODO: Attach to plane if still flying.
                if (!level.battleStarted)
                {
                    spawnPlayer();
                }
            }
        }
        else if(menu == game["menu_quickcommands"])
            quickcommands(response);
        else if(menu == game["menu_quickstatements"])
            quickstatements(response);
        else if(menu == game["menu_quickresponses"])
            quickresponses(response);
    }
}
Callback_PlayerDisconnect()
{
    printLn("###### [BR] Callback_PlayerDisconnect");

    iprintln(&"MPSCRIPT_DISCONNECTED", self);
    self notify("death");
    
    self.sessionstate = "dead"; // Because isAlive() will still return true in checkVictoryRoyale().

    level thread checkVictoryRoyale(self);
}
Callback_PlayerDamage(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, sWeapon, vPoint, vDir, sHitLoc)
{
    if(self.sessionteam == "spectator")
        return;
    if(level.battleOver)
        return;

    // Don't do knockback if the damage direction was not specified
    if(!isDefined(vDir))
        iDFlags |= level.iDFLAGS_NO_KNOCKBACK;

    // Make sure at least one point of damage is done
    if(iDamage < 1)
        iDamage = 1;

    if (isDefined(eAttacker) && isPlayer(eAttacker) && isAlive(eAttacker))
    {
        if (sMeansOfDeath != "MOD_FALL" && sMeansOfDeath != "MOD_MELEE")
        {
            if (isBoltWeapon(sWeapon))
            {
                if(level.instantKill_bolt)
                    iDamage = iDamage + 100;
            }
            else if (isSecondaryWeapon(sWeapon))
            {
                if(level.instantKill_pistol)
                    iDamage = iDamage + 100;
            }
        }
        else if (sMeansOfDeath == "MOD_MELEE")
        {
            if(level.instantKill_melee)
                iDamage = iDamage + 100;
        }

        if(eAttacker != self && level.damageFeedback)
            eAttacker thread showDamageFeedback();
    }

    if(!level.battleStarted)
        return;

    if ((self.health - iDamage) <= 0)
    {
        // Player will die
        // Make the player drop his weapons
        primary = self getWeaponSlotWeapon("primary");
        primaryb = self getWeaponSlotWeapon("primaryb");
        pistol = self getWeaponSlotWeapon("pistol");
        grenade = self getWeaponSlotWeapon("grenade");
        if(isDefined(primary))
            self dropItem(primary);
        if(isDefined(primaryb))
            self dropItem(primaryb);
        if(isDefined(pistol))
            self dropItem(pistol);
        if(isDefined(grenade))
            self dropItem(grenade);
    }

    // Apply the damage to the player
    self finishPlayerDamage(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, sWeapon, vPoint, vDir, sHitLoc);
}
Callback_PlayerKilled(eInflictor, attacker, iDamage, sMeansOfDeath, sWeapon, vDir, sHitLoc)
{
    self endon("spawned");

    if(self.sessionteam == "spectator")
        return;

    // If the player was killed by a head shot, let players know it was a head shot kill
    if(sHitLoc == "head" && sMeansOfDeath != "MOD_MELEE")
        sMeansOfDeath = "MOD_HEAD_SHOT";

    // send out an obituary message to all clients about the kill
    obituary(self, attacker, sWeapon, sMeansOfDeath);
    self notify("death");

    self.sessionstate = "dead";

    if (attacker == level.zone || attacker == level.zoneStatic)
    {
        printLn("###### [BR] Callback_PlayerKilled: attacker is zone");
        level thread checkVictoryRoyale(self);
    }
    else if (sMeansOfDeath == "MOD_FALLING")
    {
        printLn("###### [BR] Callback_PlayerKilled: MOD_FALLING");
        level thread checkVictoryRoyale(self);
    }
    else
    {
        level thread checkVictoryRoyale(attacker);
    }

    self.statusicon = "gfx/hud/hud@status_dead.tga";
    self.deaths = 1;
    
    doKillcam = false;
    if (!level.battleOver)
    {
        if (isPlayer(attacker))
        {
            if (attacker == self) // killed himself
            {
                attacker.score = attacker.pers["score"];
            }
            else
            {
                printLn("###### [BR] Callback_PlayerKilled doKillcam = true");
                doKillcam = true;
                attacker.pers["score"]++;
                attacker.score = attacker.pers["score"];
            }
        }
        else
        {
            printLn("###### [BR] Callback_PlayerKilled !isPlayer(attacker)");
        }
    }

    // Make the player drop health
    self dropHealth();
    body = self cloneplayer();

    timeToWaitAfterDeath = 2; // Delay the player becoming a spectator
    wait timeToWaitAfterDeath;
    totalDurationBeforeKill = timeToWaitAfterDeath + 3;
    
    if (doKillcam)
    {
        self thread killcamNormal(attacker, timeToWaitAfterDeath, totalDurationBeforeKill);
    }
    else
    {
        currentorigin = self.origin;
        currentangles = self getPlayerAngles();
        self thread spawnSpectator(currentorigin + (0, 0, 60), currentangles, true);
    }
}
//CALLBACKS END

spawnSpectator(origin, angles, died)
{
    printLn("###### [BR] spawnSpectator");

    self notify("spawned");
    self notify("spawned_spectator");

    resettimeout();

    if (!isDefined(died))
    {
        self.statusicon = "";
        self.sessionteam = "spectator";
    }
    self.sessionstate = "spectator";

    level thread checkVictoryRoyale(self);

    self.spectatorclient = -1;
    self.archivetime = 0;

    if (isDefined(origin) && isDefined(angles))
    {
        self spawn(origin, angles);
    }
    else
    {
        spawnpointname = "mp_deathmatch_intermission";
		spawnpoints = getentarray(spawnpointname, "classname");
		spawnpoint = maps\mp\gametypes\_spawnlogic::getSpawnpoint_Random(spawnpoints);

		if(isdefined(spawnpoint))
			self spawn(spawnpoint.origin, spawnpoint.angles);
		else
			maps\mp\_utility::error("NO " + spawnpointname + " SPAWNPOINTS IN MAP");
    }

    self setClientCvar("cg_objectiveText", level.objectiveText);
}
spawnPlayer(origin, angles)
{
    self notify("spawned");

    resettimeout();

    self.sessionteam = "none";
    self.sessionstate = "playing";
    self.spectatorclient = -1;
    self.archivetime = 0;

    if (isDefined(origin) && isDefined(angles))
    {
        self spawn(origin, angles);
    }
    else
    {
        spawnpointname = "mp_deathmatch_spawn";
        spawnpoints = getentarray(spawnpointname, "classname");
        spawnpoint = maps\mp\gametypes\_spawnlogic::getSpawnpoint_DM(spawnpoints);

        if(isDefined(spawnpoint))
            self spawn(spawnpoint.origin, spawnpoint.angles);
        else
            maps\mp\_utility::error("NO " + spawnpointname + " SPAWNPOINTS IN MAP");
    }

    self.statusicon = "";
    self.maxhealth = 100;
    self.health = self.maxhealth;

    self.pers["score"] = 0;
    self.score = self.pers["score"];
    self.deaths = 0;

    model();

    if (!self.inPlane)
    {
        loadout();
        self giveWeapon(self.pers["weapon"]);
        self giveMaxAmmo(self.pers["weapon"]);
        self setSpawnWeapon(self.pers["weapon"]);
    }
    
    self setClientCvar("cg_objectiveText", level.objectiveText);
}
spawnIntermission()
{
    printLn("###### [BR] spawnIntermission");

    self notify("spawned");
    self notify("end_respawn");
    
    resettimeout();

    self.sessionstate = "intermission";
    self.spectatorclient = -1;
    self.archivetime = 0;

    spawnpointname = "mp_deathmatch_intermission";
	spawnpoints = getentarray(spawnpointname, "classname");
	spawnpoint = maps\mp\gametypes\_spawnlogic::getSpawnpoint_Random(spawnpoints);

	if(isdefined(spawnpoint))
		self spawn(spawnpoint.origin, spawnpoint.angles);
	else
		maps\mp\_utility::error("NO " + spawnpointname + " SPAWNPOINTS IN MAP");
}

checkBattleReady()
{
    printLn("###### [BR] checkBattleReady");

    level endon("battle_start");

    fontScale_playerCount = 1.2;

    level.hud_waitingBackground = newHudElem();
    level.hud_waitingBackground.alignX = "center";
    level.hud_waitingBackground.x = 320;
    level.hud_waitingBackground.y = 20;
    level.hud_waitingBackground.alpha = 0.6;
    level.hud_waitingBackground.sort = -1;
    level.hud_waitingBackground setShader("black", 365, 66);

    level.hud_waitingForPlayers = newHudElem();
    level.hud_waitingForPlayers.alignX = "center";
    level.hud_waitingForPlayers.alignY = "middle";
    level.hud_waitingForPlayers.x = 320;
    level.hud_waitingForPlayers.y = level.hud_waitingBackground.y + 21;
    level.hud_waitingForPlayers.fontScale = 1.1;
    level.hud_waitingForPlayers.font = "bigfixed";
    level.hud_waitingForPlayers.label = level.text_waitingPlayers;

    distance_ready_min = 15;

    level.hud_playersReady = newHudElem();
    level.hud_playersReady.alignX = "center";
    level.hud_playersReady.alignY = "middle";
    level.hud_playersReady.x = level.hud_waitingForPlayers.x - distance_ready_min;
    level.hud_playersReady.y = level.hud_waitingForPlayers.y + 24;
    level.hud_playersReady.fontScale = fontScale_playerCount;
    level.hud_playersReady.font = "bigfixed";
    
    level.hud_playersMin = newHudElem();
    level.hud_playersMin.alignX = "center";
    level.hud_playersMin.alignY = "middle";
    level.hud_playersMin.x = level.hud_waitingForPlayers.x + distance_ready_min;
    level.hud_playersMin.y = level.hud_playersReady.y;
    level.hud_playersMin.fontScale = fontScale_playerCount;
    level.hud_playersMin.font = "bigfixed";
    level.hud_playersMin.label = &"/";
    level.hud_playersMin setValue(level.minPlayers);

    for(;;)
    {
        numberOfReadyPlayers = [];
        for (i = 0; i < level.maxClients; i++)
        {
            player = getEntByNum(i);
            if (isDefined(player))
            {
                if (isDefined(player.pers["connected"]))
                {
                    //PLAYER IS CONNECTED
                    if(player.fights)
                        numberOfReadyPlayers[numberOfReadyPlayers.size] = player;
                }
            }
        }
        level.hud_playersReady setValue(numberOfReadyPlayers.size);

        if (numberOfReadyPlayers.size > 0) //AT LEAST 1 READY PLAYER
        {
            if (numberOfReadyPlayers.size < level.minPlayers) //MIN PLAYERS NOT REACHED YET
            {
                if (level.startingBattle) //Lost required players count, reset
                {
                    level notify("battle_cancel");
                    level.startingBattle = false;

                    //Reset HUD
                    alignX = level.hud_waitingForPlayers.alignX;
                    alignY = level.hud_waitingForPlayers.alignY;
                    x = level.hud_waitingForPlayers.x;
                    y = level.hud_waitingForPlayers.y;
                    fontScale = level.hud_waitingForPlayers.fontScale;
                    font = level.hud_waitingForPlayers.font;

                    level.hud_waitingForPlayers reset();
                    level.hud_waitingForPlayers.alignX = alignX;
                    level.hud_waitingForPlayers.alignY = alignY;
                    level.hud_waitingForPlayers.x = x;
                    level.hud_waitingForPlayers.y = y;
                    level.hud_waitingForPlayers.fontScale = fontScale;
                    level.hud_waitingForPlayers.font = font;
                    level.hud_waitingForPlayers.label = level.text_waitingPlayers;
                }
            }
            else if (numberOfReadyPlayers.size >= level.minPlayers) //MIN PLAYERS REACHED, START COUNTDOWN
            {
                if (numberOfReadyPlayers.size <= level.maxClients && !level.startingBattle)
                {
                    level.hud_waitingForPlayers.color = level.color_red;
                    level.hud_waitingForPlayers.label = &"BATTLE STARTING ";
                    level.hud_waitingForPlayers setTimer(level.startBattleCountdown);
                    thread startBattle();
                }
            }
        }

        wait .05;
    }
}
startBattle()
{
    printLn("###### [BR] startBattle");

    level endon("battle_cancel");
    level.startingBattle = true;
    wait level.startBattleCountdown;
    level notify("battle_start");

    level.startingBattle = false;
    level.battleStarted = true;
    
    level.hud_waitingBackground destroy();
    level.hud_waitingForPlayers destroy();
    level.hud_playersReady destroy();
    level.hud_playersMin destroy();

    level.hud_numLivingPlayers = newHudElem();
    level.hud_numLivingPlayers.x = 640 - 55;
    level.hud_numLivingPlayers.y = 80;
    level.hud_numLivingPlayers.label = &"Alive: ";
    thread updateNumLivingPlayers();

    // Using map zh_elusive
    originPlane = (-1520, 12000, 3500);
    anglesPlane = (0, -90, 0);
    level.plane = spawn("script_model", originPlane);
    level.plane setModel(level.model_plane);
    level.plane.angles = anglesPlane;

    originPlanePov =
        (level.plane.origin[0],
        level.plane.origin[1] + 700,
        level.plane.origin[2] + 200);
    anglesPlanePov =
        (level.plane.angles[0] + 25,
        level.plane.angles[1],
        level.plane.angles[2]);

    moveDistance = -25000;
    moveDuration = 22;
    level.planePov = spawn("script_origin", originPlanePov);

    //MAKE PLAYERS FOLLOW THE PLANE
    players = getEntArray("player", "classname");
    for (i = 0; i < players.size; i++)
    {
        player = players[i];

        if(!player.fights)
            continue;

        player.inPlane = true;
        player closeMenu();

        if(!isDefined(player.pers["camouflage"]))
            player.pers["camouflage"] = level.camouflages[randomInt(level.camouflages.size)];
        if(!isDefined(player.pers["weapon"]))
            player.pers["weapon"] = "mosin_nagant_mp";

        player spawnPlayer(originPlanePov, anglesPlanePov);
        player showToPlayer(player); // Player invisible while following plane.
        player linkto(level.planePov);
        player thread checkPlayerInZone();
        player thread checkPlayerJumped();
    }
    level.plane moveY(moveDistance, moveDuration);
    level.plane playLoopSound("in_plane");
    level.planePov moveY(moveDistance, moveDuration);

    wait moveDuration - 2; // Check if everyone jumped 2 seconds before removing the plane.
    for (i = 0; i < players.size; i++)
    {
        player = players[i];
        if(isAlive(player) && !player.jumped)
            player.forceJump = true;
    }

    level.plane stopLoopSound();
    level.plane delete();
    level.planePov delete();
}

//ZONE FUNCTIONS
manageZoneLifecycle()
{
    level.hud_zoneShrinkAlert = newHudElem();
    level.hud_zoneShrinkAlert.x = 640 - 140;
    level.hud_zoneShrinkAlert.y = 170;
    level.hud_zoneShrinkAlert.fontScale = 1.1;

    zoneIndex = 0; //Waiting for players
    thread setupZone(zoneIndex);

    level waittill("battle_start");
    zoneIndex++; //In plane, start zone is shrinking
    thread setupZone(zoneIndex);

    for(;;)
    {
        level waittill("zone_idle");
        wait level.zoneDuration;

        zoneIndex += 2;
        thread setupZone(zoneIndex);
        
        wait .05;
    }
}
setupZone(zoneModeIndex)
{
    printLn("###### [BR] setupZone: id = " + level.zone.modes[zoneModeIndex]["id"]);

    if (!isDefined(level.zone.modes[zoneModeIndex]["endSize"])) //STATIC ZONE
    {
        level.zone.indexMode = zoneModeIndex;
        level.zone.currentSize = (int)level.zone.modes[zoneModeIndex]["startSize"];
        level thread playZone(level.zone.modes[zoneModeIndex]["fxId"], true);

        if (zoneModeIndex != 0) //START ZONE NO COUNTDOWN
        {
            //Reset HUD
            x = level.hud_zoneShrinkAlert.x;
            y = level.hud_zoneShrinkAlert.y;
            fontScale = level.hud_zoneShrinkAlert.fontScale;
            level.hud_zoneShrinkAlert reset();
            level.hud_zoneShrinkAlert.x = x;
            level.hud_zoneShrinkAlert.y = y;
            level.hud_zoneShrinkAlert.fontScale = fontScale;
            level.hud_zoneShrinkAlert.label = level.text_zoneWillShrink;
            level.hud_zoneShrinkAlert setTimer(level.zoneDuration);

            level notify("zone_idle");
        }
    }
    else //SHRINKING ZONE
    {
        level.zone.active = false;
        
        level notify("zone_static_stop");
        printLn("###### [BR] zoneStatic flip angle");
        /*
        Before reading this comment, see first explanation in playZone()
        Thought about making the zone go down the map to hide it, but moveTo()/moveZ() didn't want to make the 
        efx go down/through the floor. So now flipping angles[0] to hide the zone under the map.
        To replace the angles, the efx requires "flags relative"
        */
        level.zoneStatic.angles = (0 - level.zone.angles[0], level.zone.angles[1], level.zone.angles[2]);
        
        level.zone.indexMode = zoneModeIndex;
        level.zone.life = (int)level.zone.modes[zoneModeIndex]["life"];
        level.zone.startSize = (int)level.zone.modes[zoneModeIndex]["startSize"];
        level.zone.currentSize = level.zone.startSize;
        level.zone.endSize = (int)level.zone.modes[zoneModeIndex]["endSize"];
        level.zone.nextZoneIndex = level.zone.indexMode + 1;
        level.zone thread playZone(level.zone.modes[zoneModeIndex]["fxId"], false);
        level.zone thread keepZoneSizeVarUpdated();

        //Reset HUD
        x = level.hud_zoneShrinkAlert.x;
        y = level.hud_zoneShrinkAlert.y;
        fontScale = level.hud_zoneShrinkAlert.fontScale;
        level.hud_zoneShrinkAlert reset();
        level.hud_zoneShrinkAlert.x = x;
        level.hud_zoneShrinkAlert.y = y;
        level.hud_zoneShrinkAlert.fontScale = fontScale;
        level.hud_zoneShrinkAlert.color = level.color_red;
        level.hud_zoneShrinkAlert.label = level.text_zoneIsShrinking;
        level.hud_zoneShrinkAlert setTimer(level.zone.life / 1000);
    }

    level.zone.active = true;
}
playZone(fx, static)
{
    printLn("###### [BR] playZone");

    if (static)
    {
        /*
        To play the static zone efx, I encountered an issue with playLoopedFX(),
        when calling hide() or delete() on its returned ent, that didn't stop/hid the efx before completion,
        so the problem was you would see the static zone still playing behind the shrinking zone.

        A solution could have been to use static zones with a very short life, but when looping the static zone,
        you can see some frequent blinking, not perfectly regularly though.
        This is probably caused by the delay between the server informing the client to play again the efx.
        Longer is the life, less blinking there is.

        So now using playFXOnTag() to be able to hide it afterwards by using a trick, see comment in setupZone().
        */
        
        for(;;)
        {
            level endon("zone_static_stop");

            level.zoneStatic.angles = level.zone.angles; // Reset angle to initial value (unhide).
            printLn("###### [BR] playFXOnTag zoneStatic");
            playFXOnTag(fx, level.zoneStatic, level.zone.modelTag);
            wait 10; // Using same life value in efx files for all static zones.
        }
    }
    else
    {
        playFXOnTag(fx, self, self.modelTag);
        
        if (self.indexMode != self.modes.size - 1) //FINAL FULL SHRINKS DOESNT PLAY NEXT
        {
            wait (self.life / 1000);
            //PLAY NEXT STATIC ZONE
            self.active = false;
            self thread setupZone(self.nextZoneIndex);
        }
        else
        {
            printLn("###### [BR] playZone FINAL");

            wait (self.life / 1000);
            //Destroy HUD
            level.hud_zoneShrinkAlert destroy();
        }
    }
}
/*
moveZone() //TODO: move zone while shrinking
{
    zoneX = self.origin[0];
    zoneY = self.origin[1];
    zoneZ = self.origin[2];
    destinationOrigin = (zoneX, zoneY + 800, zoneZ);
    // To move, the efx requires "flags relative"
    self moveTo(destinationOrigin, (self.life / 1000));
    wait (self.life / 1000);
    self delete();
    level.zoneActive = undefined;
}
*/
keepZoneSizeVarUpdated()
{
    currentTime = getTime();
    startTime = currentTime;
    while(currentTime - startTime < self.life)
    {
        progress = (float)(currentTime - startTime) / self.life;
        currentSize = self.startSize + (int)((self.endSize - self.startSize) * progress);
        self.currentSize = currentSize;
        wait .05;
        currentTime = getTime();
    }
}
checkPlayerInZone()
{
    self endon("death");
    self endon("spawned_spectator");
    self.inZone = true;

    self.hudInStormDarkness = newClientHudElem(self);
    self.hudInStormDarkness.x = 0;
    self.hudInStormDarkness.y = 0;
    self.hudInStormDarkness setShader("black", 640, 480);
    self.hudInStormDarkness.alpha = 0;
    self.hudInStormDarkness.sort = -1;

    self.hudInStormAlert = newClientHudElem(self);
    self.hudInStormAlert.x = 460;
    self.hudInStormAlert.y = 140;
    self.hudInStormAlert.color = level.color_red;
    self.hudInStormAlert.fontScale = 1.3;

    for(;;)
    {
        if(level.zone.active)
        {
            //IGNORE Z
            selfOriginX = self.origin[0];
            selfOriginY = self.origin[1];
            selfOriginNoZ = (selfOriginX, selfOriginY, 0);

            zoneOriginX = level.zone.origin[0];
            zoneOriginY = level.zone.origin[1];
            zoneOriginNoZ = (zoneOriginX, zoneOriginY, 0);

            inZone = (distance(selfOriginNoZ, zoneOriginNoZ) < level.zone.currentSize);
            if (inZone && !self.inZone)
            {
                //ENTERED ZONE
                self.inZone = true;
                self.hudInStormDarkness.alpha = 0;
                self.hudInStormAlert setText(&"");
            }
            else if (!inZone)
            {
                if (self.inZone)
                {
                    //ENTERED STORM
                    self.inZone = false;
                    self.hudInStormDarkness.alpha = 0.3;
                    self.hudInStormAlert setText(&"You are in the storm!");
                }

                if (level.battleOver)
                {
                    wait .05;
                    continue;
                }

                damagePlayer = false;
                if (isDefined(self.lastZoneDamageTime))
                {
                    secondsPassed = (getTime() - self.lastZoneDamageTime) / 1000;
                    if(secondsPassed > 2)
                        damagePlayer = true;
                }
                else
                {
                    damagePlayer = true;
                }

                if (damagePlayer)
                {
                    eInflictor = level.zone;
                    eAttacker = level.zone;
                    iDamage = 5;
                    iDFlags = 0;
                    sMeansOfDeath = "MOD_UNKNOWN";
                    sWeapon = "none";
                    vPoint = undefined;
                    vDir = undefined;
                    sHitLoc = "none";
                    psOffsetTime = 0;
                    self finishPlayerDamage(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, sWeapon, vPoint, vDir, sHitLoc, psOffsetTime);
                    self.lastZoneDamageTime = getTime();
                }
            }
        }

        wait .05;
    }
}
//ZONE FUNCTIONS END

//SKYDIVE FUNCTIONS
checkPlayerJumped()
{
    self endon("death");
    self endon("spawned_spectator");

    self.hud_jump_parachute = newClientHudElem(self);
    self.hud_jump_parachute.alignX = "center";
    self.hud_jump_parachute.alignY = "middle";
    self.hud_jump_parachute.x = 320;
    self.hud_jump_parachute.y = 40;
    self.hud_jump_parachute.fontScale = 1.2;
    self.hud_jump_parachute setText(&"Press ^1[{+gostand}] ^7to jump");

    for(;;)
    {
        //FORCE STANDING
        if(self getStance() != "stand")
            self setClientCvar("cl_stance", "0");

        if (self jumpButtonPressed() || isDefined(self.forceJump))
        {
            self.jumped = true;

            self setClientCvar("g_scriptMainMenu", game["menu_camouflage"]);
            self setClientCvar("scr_showweapontab", "0");

            self.hud_jump_parachute setText(&"");

            anglesBeforeSpawn = self getPlayerAngles();
            self spawnPlayer(level.planePov.origin, anglesBeforeSpawn);
            self.inPlane = false;
            self showToPlayer(undefined); // Player is visible again.

            delayExitPlane = 0.35;
            underPlaneOrigin =
                (level.planePov.origin[0],
                level.planePov.origin[1] - 100,
                (level.planePov.origin[2] - 1000));

            self.jumpPov = spawn("script_origin", level.planePov.origin);

            self linkto(self.jumpPov);
            self.jumpPov moveTo(underPlaneOrigin, delayExitPlane);
            wait delayExitPlane;

            self unlink();
            self.jumpPov delete();
            self thread checkPlayerDive();

            break;
        }
        wait .05;
    }
}
checkReleasedUseButton()
{
    self endon("death");
    self endon("spawned_spectator");
    self endon("landed");

    while(self jumpButtonPressed())
        wait .05;
    self.blockParachuteCheck = false;
}
checkPlayerDive()
{
    self endon("death");
    self endon("spawned_spectator");
    self endon("landed");

    self.parachuteEnabled = false;
    self.parachuteDeploymentForced = false;

    self thread checkLanded();

    text_hud_jump_parachute_part1 = "Press ^1[{+gostand}] ^7to ";
    text_hud_jump_parachute_part2 = "open";
    text_hud_jump_parachute_part3 = " parachute";
    text_hud_jump_parachute_part_concatenated = text_hud_jump_parachute_part1 + text_hud_jump_parachute_part2 + text_hud_jump_parachute_part3;
    text_hud_jump_parachute_part_concatenated_localized = makeLocalizedString(text_hud_jump_parachute_part_concatenated);
    self.hud_jump_parachute setText(text_hud_jump_parachute_part_concatenated_localized);

    /*self.hud_parachuteStateIndicator = newClientHudElem(self); //TODO: show arms/hands instead
    self.hud_parachuteStateIndicator.alignX = "center";
    self.hud_parachuteStateIndicator.alignY = "middle";
    self.hud_parachuteStateIndicator.x = 320;
    self.hud_parachuteStateIndicator.y = self.hud_jump_parachute.y + 25;
    self.hud_parachuteStateIndicator.color = level.color_red;
    self.hud_parachuteStateIndicator.fontScale = 1.3;
    self.hud_parachuteStateIndicator setText(level.text_parachuteNotDeployed);*/

    self.blockParachuteCheck = false;

    //PHYSICS VARIABLES
    //Acceleration multiplier (diagonal fall)
    acceleration_skydive_forward = 40;
    acceleration_skydive_onlyLeftRight = 25;
    acceleration_skydive_forwardLeftRight = 35;

    acceleration_parachute_forward = 60;
    acceleration_parachute_onlyLeftRight = 40;
    acceleration_parachute_forwardLeftRight = 50;

    acceleration_parachute_backward = 35;
    acceleration_parachute_backwardLeftRight = 20;

    //Air resistance multiplier (fall slowdown)
    airResistance_skydive_idle = 0.975;
    airResistance_skydive_forward = 0.99;
    airResistance_parachute_idle = 0.85;
    airResistance_parachute_forward = 0.925;

    //CHECK MOVEMENTS
    for(;;)
    {
        //FORCE STANDING
        if(self getStance() != "stand")
            self setClientCvar("cl_stance", "0");

        //DIRECTION KEYS CHECK
        goingForward = (self forwardButtonPressed());
        goingBackward = (self backButtonPressed());
        goingLeft = (self leftButtonPressed());
        goingRight = (self rightButtonPressed());

        if (goingLeft && goingRight)
        {
            //left + right = none
            goingLeft = false;
            goingRight = false;
        }
        if (goingForward && goingBackward)
        {
            //forward + backward = none
            goingForward = false;
            goingBackward = false;
        }

        //PARACHUTE STATE CHECK
        checkParachute = false;
        if (self jumpButtonPressed() && !self.blockParachuteCheck)
        {
            self.blockParachuteCheck = true;
            self thread checkReleasedUseButton();
            checkParachute = true;
        }
        
        if (!self.parachuteEnabled && !self.parachuteDeploymentForced)
        {
            // Force parachute deployment before touching ground/roof.
            trace = bulletTrace(self.origin, self.origin - (0, 0, 8192), false, undefined);
            trace_position_distance = distance(self.origin, trace["position"]);
            //printLn("###### [BR] trace_position_distance: " + trace_position_distance);
            if (trace_position_distance < 1200)
            {
                self.parachuteDeploymentForced = true;

                self giveWeapon(level.parachute_deployed_hands);
                self switchToWeapon(level.parachute_deployed_hands);
                self.parachuteEnabled = true;
                self attach(level.model_parachute, "tag_belt_back");
                
                self.hud_jump_parachute destroy();
            }
        }

        if (checkParachute && !self.parachuteDeploymentForced)
        {
            if (!self.parachuteEnabled)
            {
                //OPENED
                /*self.hud_parachuteStateIndicator.color = level.color_green;
                self.hud_parachuteStateIndicator setText(level.text_parachuteDeployed);*/

                self giveWeapon(level.parachute_deployed_hands);
                self switchToWeapon(level.parachute_deployed_hands);

                self.parachuteEnabled = true;
                self attach(level.model_parachute, "tag_belt_back");

                text_hud_jump_parachute_part2 = "close";
            }
            else
            {
                //CLOSED
                /*self.hud_parachuteStateIndicator.color = level.color_red;
                self.hud_parachuteStateIndicator setText(level.text_parachuteNotDeployed);*/
                
                self takeWeapon(self getCurrentWeapon());
                
                self.parachuteEnabled = false;
                self detach(level.model_parachute, "tag_belt_back");

                text_hud_jump_parachute_part2 = "open";
            }

            //TODO: Check if should update existing localized string instead.
            text_hud_jump_parachute_part_concatenated = text_hud_jump_parachute_part1 + text_hud_jump_parachute_part2 + text_hud_jump_parachute_part3;
            text_hud_jump_parachute_part_concatenated_localized = makeLocalizedString(text_hud_jump_parachute_part_concatenated);
            self.hud_jump_parachute setText(text_hud_jump_parachute_part_concatenated_localized);
        }
        
        velocity = self getVelocity();
        angles = self getPlayerAngles();
        forwardDirection = anglesToForward(angles);
        backwardDirection = anglesToBackward(angles);
        leftDirection = anglesToLeft(angles);
        rightDirection = anglesToRight(angles);

        if (self.name == "test")
        {
            //printLn("###### [BR] angles[0] = " + angles[0]);
        }
        
        isLookingUp = false;
        isLookingDown = false;
        if(angles[0] < -30)
            isLookingUp = true;
        else if(angles[0] > 30)
            isLookingDown = true;
        
        //APPLY MOTION EFFECTS
        if (self.parachuteEnabled)
        {
            if (goingForward)
            {
                // Reduce risks of crashing when landing if looking too much below.
                if (angles[0] > 20)
                {
                    trace = bulletTrace(self.origin, self.origin - (0, 0, 8192), false, undefined);
                    trace_position_distance = distance(self.origin, trace["position"]);
                    if (trace_position_distance < 1500)
                    {
                        //printLn("###### [BR] Trying prevent land crash with parachute deployed");
                        //AS IDLE
                        newVelocity_x = velocity[0];
                        newVelocity_y = velocity[1];
                        newVelocity_z = velocity[2];
                        newVelocity = maps\mp\_utility::vectorScale((newVelocity_x, newVelocity_y, newVelocity_z), airResistance_parachute_idle);
                        self setVelocity(newVelocity);
                        wait .05;
                        continue;
                    }
                }

                if (isLookingUp) //Prevent acceleration from pushing upward
                {
                    //AS IDLE
                    newVelocity_x = velocity[0];
                    newVelocity_y = velocity[1];
                    newVelocity_z = velocity[2];
                    newVelocity = maps\mp\_utility::vectorScale((newVelocity_x, newVelocity_y, newVelocity_z), airResistance_parachute_idle);
                }
                else if (goingLeft)
                {
                    newVelocity_x = velocity[0] + (forwardDirection[0] + leftDirection[0]) * acceleration_parachute_forwardLeftRight;
                    newVelocity_y = velocity[1] + (forwardDirection[1] + leftDirection[1]) * acceleration_parachute_forwardLeftRight;
                    newVelocity_z = velocity[2] + (forwardDirection[2] + leftDirection[2]) * acceleration_parachute_forwardLeftRight;
                    newVelocity = maps\mp\_utility::vectorScale((newVelocity_x, newVelocity_y, newVelocity_z), airResistance_parachute_forward);
                }
                else if (goingRight)
                {
                    newVelocity_x = velocity[0] + (forwardDirection[0] + rightDirection[0]) * acceleration_parachute_forwardLeftRight;
                    newVelocity_y = velocity[1] + (forwardDirection[1] + rightDirection[1]) * acceleration_parachute_forwardLeftRight;
                    newVelocity_z = velocity[2] + (forwardDirection[2] + rightDirection[2]) * acceleration_parachute_forwardLeftRight;
                    newVelocity = maps\mp\_utility::vectorScale((newVelocity_x, newVelocity_y, newVelocity_z), airResistance_parachute_forward);
                }
                else
                {
                    //JUST FORWARD
                    newVelocity_x = velocity[0] + forwardDirection[0] * acceleration_parachute_forward;
                    newVelocity_y = velocity[1] + forwardDirection[1] * acceleration_parachute_forward;
                    newVelocity_z = velocity[2] + forwardDirection[2] * acceleration_parachute_forward;
                    newVelocity = maps\mp\_utility::vectorScale((newVelocity_x, newVelocity_y, newVelocity_z), airResistance_parachute_forward);
                }
            }
            else if (goingBackward)
            {
                if (isLookingDown) //Prevent acceleration from pushing upward
                {
                    //AS IDLE
                    newVelocity_x = velocity[0];
                    newVelocity_y = velocity[1];
                    newVelocity_z = velocity[2];
                    newVelocity = maps\mp\_utility::vectorScale((newVelocity_x, newVelocity_y, newVelocity_z), airResistance_parachute_idle);
                }
                else if (goingLeft)
                {
                    newVelocity_x = velocity[0] + (backwardDirection[0] + leftDirection[0]) * acceleration_parachute_backwardLeftRight;
                    newVelocity_y = velocity[1] + (backwardDirection[1] + leftDirection[1]) * acceleration_parachute_backwardLeftRight;
                    newVelocity_z = velocity[2] + (backwardDirection[2] + leftDirection[2]) * acceleration_parachute_backwardLeftRight;
                    newVelocity = maps\mp\_utility::vectorScale((newVelocity_x, newVelocity_y, newVelocity_z), airResistance_parachute_forward);
                }
                else if (goingRight)
                {
                    newVelocity_x = velocity[0] + (backwardDirection[0] + rightDirection[0]) * acceleration_parachute_backwardLeftRight;
                    newVelocity_y = velocity[1] + (backwardDirection[1] + rightDirection[1]) * acceleration_parachute_backwardLeftRight;
                    newVelocity_z = velocity[2] + (backwardDirection[2] + rightDirection[2]) * acceleration_parachute_backwardLeftRight;
                    newVelocity = maps\mp\_utility::vectorScale((newVelocity_x, newVelocity_y, newVelocity_z), airResistance_parachute_forward);
                }
                else
                {
                    //JUST BACKWARD
                    newVelocity_x = velocity[0] + backwardDirection[0] * acceleration_parachute_backward;
                    newVelocity_y = velocity[1] + backwardDirection[1] * acceleration_parachute_backward;
                    newVelocity_z = velocity[2] + backwardDirection[2] * acceleration_parachute_backward;
                    newVelocity = maps\mp\_utility::vectorScale((newVelocity_x, newVelocity_y, newVelocity_z), airResistance_parachute_forward);
                }
            }
            else if (goingLeft)
            {
                //JUST LEFT
                newVelocity_x = velocity[0] + leftDirection[0] * acceleration_parachute_onlyLeftRight;
                newVelocity_y = velocity[1] + leftDirection[1] * acceleration_parachute_onlyLeftRight;
                newVelocity_z = velocity[2] + leftDirection[2] * acceleration_parachute_onlyLeftRight;
                newVelocity = maps\mp\_utility::vectorScale((newVelocity_x, newVelocity_y, newVelocity_z), airResistance_parachute_forward);
            }
            else if (goingRight)
            {
                //JUST RIGHT
                newVelocity_x = velocity[0] + rightDirection[0] * acceleration_parachute_onlyLeftRight;
                newVelocity_y = velocity[1] + rightDirection[1] * acceleration_parachute_onlyLeftRight;
                newVelocity_z = velocity[2] + rightDirection[2] * acceleration_parachute_onlyLeftRight;
                newVelocity = maps\mp\_utility::vectorScale((newVelocity_x, newVelocity_y, newVelocity_z), airResistance_parachute_forward);
            }
            else
            {
                //IDLE
                newVelocity_x = velocity[0];
                newVelocity_y = velocity[1];
                newVelocity_z = velocity[2];
                newVelocity = maps\mp\_utility::vectorScale((newVelocity_x, newVelocity_y, newVelocity_z), airResistance_parachute_idle);
            }
        }
        else //PARACHUTE DISABLED
        {
            if (goingForward)
            {
                if (isLookingUp) //Prevent acceleration from pushing upward
                {
                    //AS IDLE
                    newVelocity_x = velocity[0];
                    newVelocity_y = velocity[1];
                    newVelocity_z = velocity[2];
                    newVelocity = maps\mp\_utility::vectorScale((newVelocity_x, newVelocity_y, newVelocity_z), airResistance_skydive_idle);
                }
                else if (goingLeft)
                {
                    newVelocity_x = velocity[0] + (forwardDirection[0] + leftDirection[0]) * acceleration_skydive_forwardLeftRight;
                    newVelocity_y = velocity[1] + (forwardDirection[1] + leftDirection[1]) * acceleration_skydive_forwardLeftRight;
                    newVelocity_z = velocity[2] + (forwardDirection[2] + leftDirection[2]) * acceleration_skydive_forwardLeftRight;
                    newVelocity = maps\mp\_utility::vectorScale((newVelocity_x, newVelocity_y, newVelocity_z), airResistance_skydive_forward);
                }
                else if (goingRight)
                {
                    newVelocity_x = velocity[0] + (forwardDirection[0] + rightDirection[0]) * acceleration_skydive_forwardLeftRight;
                    newVelocity_y = velocity[1] + (forwardDirection[1] + rightDirection[1]) * acceleration_skydive_forwardLeftRight;
                    newVelocity_z = velocity[2] + (forwardDirection[2] + rightDirection[2]) * acceleration_skydive_forwardLeftRight;
                    newVelocity = maps\mp\_utility::vectorScale((newVelocity_x, newVelocity_y, newVelocity_z), airResistance_skydive_forward);
                }
                else
                {
                    //JUST FORWARD
                    newVelocity_x = velocity[0] + forwardDirection[0] * acceleration_skydive_forward;
                    newVelocity_y = velocity[1] + forwardDirection[1] * acceleration_skydive_forward;
                    newVelocity_z = velocity[2] + forwardDirection[2] * acceleration_skydive_forward;
                    newVelocity = maps\mp\_utility::vectorScale((newVelocity_x, newVelocity_y, newVelocity_z), airResistance_skydive_forward);
                }
            }
            else if (goingLeft)
            {
                //JUST LEFT
                newVelocity_x = velocity[0] + leftDirection[0] * acceleration_skydive_onlyLeftRight;
                newVelocity_y = velocity[1] + leftDirection[1] * acceleration_skydive_onlyLeftRight;
                newVelocity_z = velocity[2] + leftDirection[2] * acceleration_skydive_onlyLeftRight;
                newVelocity = maps\mp\_utility::vectorScale((newVelocity_x, newVelocity_y, newVelocity_z), airResistance_skydive_forward);
            }
            else if (goingRight)
            {
                //JUST RIGHT
                newVelocity_x = velocity[0] + rightDirection[0] * acceleration_skydive_onlyLeftRight;
                newVelocity_y = velocity[1] + rightDirection[1] * acceleration_skydive_onlyLeftRight;
                newVelocity_z = velocity[2] + rightDirection[2] * acceleration_skydive_onlyLeftRight;
                newVelocity = maps\mp\_utility::vectorScale((newVelocity_x, newVelocity_y, newVelocity_z), airResistance_skydive_forward);
            }
            else
            {
                //IDLE
                newVelocity_x = velocity[0];
                newVelocity_y = velocity[1];
                newVelocity_z = velocity[2];
                newVelocity = maps\mp\_utility::vectorScale((newVelocity_x, newVelocity_y, newVelocity_z), airResistance_skydive_idle);
            }
        }
        
        self setVelocity(newVelocity);
        
        wait .05;
    }
}
checkLanded()
{
    self endon("death");
    self endon("spawned_spectator");
    
    for(;;)
    {
        if (self isOnGround())
        {
            self notify("landed");

            if(isDefined(self.hud_jump_parachute))
                self.hud_jump_parachute destroy();
            //self.hud_parachuteStateIndicator destroy();

            //Check landed under map
            if (self.origin[2] < -600)
            {
                self suicide();
                return;
            }

            if (self.parachuteEnabled)
            {
                self detach(level.model_parachute, "tag_belt_back");
                self takeWeapon(self getCurrentWeapon());
                self.parachuteEnabled = false;
            }
            
            wait .25;
            loadout();
            self giveWeapon(self.pers["weapon"]);
            self giveMaxAmmo(self.pers["weapon"]);
            self switchToWeapon(self.pers["weapon"]);

            break;
        }
        wait .05;
    }
}
//SKYDIVE FUNCTIONS END

updateNumLivingPlayers()
{
    wait .05;
    for(;;)
    {
        alivePlayers = 0;
        players = getEntArray("player", "classname");
        for (i = 0; i < players.size; i++)
        {
            player = players[i];
            if (isAlive(player) && player.sessionstate != "spectator")
                alivePlayers += 1;
        }
        level.hud_numLivingPlayers setValue(alivePlayers);

        wait .5; //for resource saving
        wait .05;
    }
}

checkVictoryRoyale(playerEntity)
{
    if (!level.battleStarted || level.battleOver)
        return;
    if (level.checkingVictoryRoyale)
        return;
    level.checkingVictoryRoyale = true;

    delayBeforeEndmap = 4;

    alivePlayers = [];
    players = getEntArray("player", "classname");
    for (i = 0; i < players.size; i++)
    {
        player = players[i];
        if(isAlive(player) && player.sessionstate == "playing")
            alivePlayers[alivePlayers.size] = player;
        if(alivePlayers.size > 1)
            break;
    }

    if (alivePlayers.size == 1)
    {
        level.battleOver = true;

        winner = alivePlayers[0];
        winner.hud_victoryRoyale = newClientHudElem(winner);
        winner.hud_victoryRoyale.alignX = "center";
        winner.hud_victoryRoyale.alignY = "middle";
        winner.hud_victoryRoyale.x = 320;
        winner.hud_victoryRoyale.y = 100;
        winner.hud_victoryRoyale.color = (0.26, 1, 0.35);
        winner.hud_victoryRoyale.fontScale = 1.5;
        winner.hud_victoryRoyale.font = "bigfixed";
        winner.hud_victoryRoyale setText(&"YOU WIN!");

        level.winnerEntityNumber = winner getEntityNumber();
        level.winnerName = winner.name;

        // Slow motion effect
        setCvar("timescale", "0.5");
        waited = 0;
        wait_before_slowmotion = 0.25;
        wait wait_before_slowmotion;
        waited += wait_before_slowmotion;
        for(x = .5; x < 1; x+= .05)
        {
            wait_during_slowmotion = 0.1 / x;
            wait wait_during_slowmotion;
            waited += wait_during_slowmotion;
            setCvar("timescale", x);
            //printLn("###### [BR] wait_during_slowmotion: " + wait_during_slowmotion);
        }
        setCvar("timescale", "1");

        wait delayBeforeEndmap;
        waited += delayBeforeEndmap;
        
        endMap(waited, playerEntity);
    }
    else if (alivePlayers.size == 0)
    {
        level.battleOver = true;

        level.hud_victoryRoyale = newHudElem();
        level.hud_victoryRoyale.alignX = "center";
        level.hud_victoryRoyale.alignY = "middle";
        level.hud_victoryRoyale.x = 320;
        level.hud_victoryRoyale.y = 100;
        level.hud_victoryRoyale.color = level.color_red;
        level.hud_victoryRoyale.fontScale = 1.5;
        level.hud_victoryRoyale.font = "bigfixed";
        level.hud_victoryRoyale setText(&"NO ONE SURVIVED!");

        level.noWinner = true;
        wait delayBeforeEndmap;
        endMap(delayBeforeEndmap);
    }

    level.checkingVictoryRoyale = false;
}

endMap(timeWaitedAfterDeath, playerEntity)
{
    if (!level.noWinner)
    {
        if(isDefined(playerEntity)) //TODO: Try to display disconnected player's camera
            level setupFinalKillcam(timeWaitedAfterDeath, playerEntity);
    }

    game["state"] = "intermission";
    level notify("intermission");

    players = getEntArray("player", "classname");
    for(i = 0; i < players.size; i++)
    {
        player = players[i];

        player closeMenu();
        player setClientCvar("g_scriptMainMenu", "main");
        if(level.noWinner)
            player setClientCvar("cg_objectiveText", "No one survived!");
        else
            player setClientCvar("cg_objectiveText", &"MPSCRIPT_WINS", level.winnerName);
        
        player spawnIntermission();
    }
    wait 5;
    exitLevel(false);
}

showDamageFeedback()
{
    self endon("spawned");

    if(isDefined(self.hitBlip))
        self.hitBlip destroy();

    self.hitBlip = newClientHudElem(self);
    self.hitBlip.alignX = "center";
    self.hitBlip.alignY = "middle";
    self.hitBlip.x = 320;
    self.hitBlip.y = 240;
    self.hitBlip.alpha = 1;
    self.hitBlip setShader("gfx/hud/damage_feedback.dds", 24, 24);

    self.hitBlip fadeOverTime(1);
    self.hitBlip.alpha = 0;

    wait 0.30;
    if(isDefined(self.hitBlip))
        self.hitBlip destroy();
}

//KILLCAM FUNCTIONS
setupFinalKillcam(timeWaitedAfterDeath, playerEntity)
{
    viewers = 0;
    players = getEntArray("player", "classname");
    for(i = 0; i < players.size; i++)
    {
        player = players[i];

        if (isDefined(player.killcam))
        {
            // Already running killcam, stop it
            player notify("spawned");
            wait .05;
            player.spectatorclient = -1;
            player.archivetime = 0;
        }
        
        desiredDurationBeforeKill = timeWaitedAfterDeath + 1;
        player thread killcamEnd(playerEntity, timeWaitedAfterDeath, desiredDurationBeforeKill);
        viewers++;
    }
    if(viewers)
        level waittill("finalKillcam_ended");
}

// TODO: Merge killcamNormal() and killcamEnd() later if seeing no issues.
killcamNormal(attackerEntity, timeWaitedAfterDeath, totalDurationBeforeKill)
{
    self endon("spawned");

    if (!isPlayer(attackerEntity))
    {
        printLn("###### [BR] killcam: !isPlayer(attackerEntity)");
        attackerEntity = self;
    }
    
    self.sessionstate = "spectator";
    self.spectatorclient = attackerEntity getEntityNumber();
    self.archivetime = timeWaitedAfterDeath + totalDurationBeforeKill;

    self.killcam = true;

    if (!isDefined(self.kc_topbar))
    {
        self.kc_topbar = newClientHudElem(self);
        self.kc_topbar.archived = false;
        self.kc_topbar.x = 0;
        self.kc_topbar.y = 0;
        self.kc_topbar.alpha = 0.5;
        self.kc_topbar setShader("black", 640, 112);
    }
    if (!isDefined(self.kc_bottombar))
    {
        self.kc_bottombar = newClientHudElem(self);
        self.kc_bottombar.archived = false;
        self.kc_bottombar.x = 0;
        self.kc_bottombar.y = 368;
        self.kc_bottombar.alpha = 0.5;
        self.kc_bottombar setShader("black", 640, 112);
    }
    if (!isDefined(self.kc_title))
    {
        self.kc_title = newClientHudElem(self);
        self.kc_title.archived = false;
        self.kc_title.x = 320;
        self.kc_title.y = 40;
        self.kc_title.alignX = "center";
        self.kc_title.alignY = "middle";
        self.kc_title.sort = 1; // force to draw after the bars
        self.kc_title.fontScale = 2.5;
    }
    self.kc_title setText(&"MPSCRIPT_KILLCAM");
    if (!isDefined(self.kc_skiptext))
    {
        self.kc_skiptext = newClientHudElem(self);
        self.kc_skiptext.archived = false;
        self.kc_skiptext.x = 320;
        self.kc_skiptext.y = 70;
        self.kc_skiptext.alignX = "center";
        self.kc_skiptext.alignY = "middle";
        self.kc_skiptext.sort = 1; // force to draw after the bars
    }
    self.kc_skiptext setText(&"MPSCRIPT_PRESS_ACTIVATE_TO_SKIP");
    if (!isdefined(self.kc_timer))
    {
        self.kc_timer = newClientHudElem(self);
        self.kc_timer.archived = false;
        self.kc_timer.x = 320;
        self.kc_timer.y = 435;
        self.kc_timer.alignX = "center";
        self.kc_timer.alignY = "middle";
        self.kc_timer.fontScale = 2;
        self.kc_timer.sort = 1;
    }
    self.kc_timer setTenthsTimer(totalDurationBeforeKill);

    self thread waitSkipKillcamButton();
    self thread waitKillcamTime();
    self waittill("end_killcam");
    self removeKillcamElements();

    self.spectatorclient = -1;
    self.archivetime = 0;
    self.killcam = undefined;

    currentorigin = self.origin;
    currentangles = self getPlayerAngles();
    self thread spawnSpectator(currentorigin + (0, 0, 60), currentangles, true);
}
killcamEnd(attackerEntity, timeWaitedAfterDeath, totalDurationBeforeKill)
{
    self.sessionstate = "spectator";
    self.spectatorclient = attackerEntity getEntityNumber();
    self.archivetime = timeWaitedAfterDeath + totalDurationBeforeKill;

    if (!isDefined(self.kc_topbar))
    {
        self.kc_topbar = newClientHudElem(self);
        self.kc_topbar.archived = false;
        self.kc_topbar.x = 0;
        self.kc_topbar.y = 0;
        self.kc_topbar.alpha = 0.5;
        self.kc_topbar setShader("black", 640, 112);
    }
    if (!isDefined(self.kc_bottombar))
    {
        self.kc_bottombar = newClientHudElem(self);
        self.kc_bottombar.archived = false;
        self.kc_bottombar.x = 0;
        self.kc_bottombar.y = 368;
        self.kc_bottombar.alpha = 0.5;
        self.kc_bottombar setShader("black", 640, 112);
    }
    if (!isDefined(self.kc_title))
    {
        self.kc_title = newClientHudElem(self);
        self.kc_title.archived = false;
        self.kc_title.x = 320;
        self.kc_title.y = 40;
        self.kc_title.alignX = "center";
        self.kc_title.alignY = "middle";
        self.kc_title.sort = 1; // force to draw after the bars
        self.kc_title.fontScale = 2.5;
    }
    self.kc_title setText(&"MPSCRIPT_KILLCAM");

    if (!isdefined(self.kc_timer))
    {
        self.kc_timer = newClientHudElem(self);
        self.kc_timer.archived = false;
        self.kc_timer.x = 320;
        self.kc_timer.y = 435;
        self.kc_timer.alignX = "center";
        self.kc_timer.alignY = "middle";
        self.kc_timer.fontScale = 2;
        self.kc_timer.sort = 1;
    }
    self.kc_timer setTenthsTimer(totalDurationBeforeKill);
    
    wait (self.archivetime);

    self.spectatorclient = -1;
    self.archivetime = 0;

    level notify("finalKillcam_ended");
}

waitKillcamTime()
{
    self endon("end_killcam");
    wait (self.archivetime - 0.05);
    self notify("end_killcam");
}
waitSkipKillcamButton()
{
    self endon("end_killcam");
    while(self useButtonPressed())
        wait .05;
    while(!(self useButtonPressed()))
        wait .05;
    self notify("end_killcam");	
}
removeKillcamElements()
{
    if(isDefined(self.kc_topbar))
        self.kc_topbar destroy();
    if(isDefined(self.kc_bottombar))
        self.kc_bottombar destroy();
    if(isDefined(self.kc_title))
        self.kc_title destroy();
    if(isDefined(self.kc_skiptext))
        self.kc_skiptext destroy();
    if(isdefined(self.kc_timer))
        self.kc_timer destroy();
}
//KILLCAM FUNCTIONS END

//VSAY
quickcommands(response)
{
    if(!isDefined(self.pers["camouflage"]) || isDefined(self.spamdelay))
        return;

    self.spamdelay = true;

    switch(self.pers["camouflage"])
    {
    case "american":
        switch(response)		
        {
        case "1":
            soundalias = "american_follow_me";
            saytext = &"QUICKMESSAGE_FOLLOW_ME";
            break;
        case "2":
            soundalias = "american_move_in";
            saytext = &"QUICKMESSAGE_MOVE_IN";
            break;
        case "3":
            soundalias = "american_fall_back";
            saytext = &"QUICKMESSAGE_FALL_BACK";
            break;
        case "4":
            soundalias = "american_suppressing_fire";
            saytext = &"QUICKMESSAGE_SUPPRESSING_FIRE";
            break;
        case "5":
            soundalias = "american_attack_left_flank";
            saytext = &"QUICKMESSAGE_SQUAD_ATTACK_LEFT_FLANK";
            break;
        case "6":
            soundalias = "american_attack_right_flank";
            saytext = &"QUICKMESSAGE_SQUAD_ATTACK_RIGHT_FLANK";
            break;
        case "7":
            soundalias = "american_hold_position";
            saytext = &"QUICKMESSAGE_SQUAD_HOLD_THIS_POSITION";
            break;
        case "8":
            temp = randomInt(2);
            if(temp)
            {
                soundalias = "american_regroup";
                saytext = &"QUICKMESSAGE_SQUAD_REGROUP";
            }
            else
            {
                soundalias = "american_stick_together";
                saytext = &"QUICKMESSAGE_SQUAD_STICK_TOGETHER";
            }
            break;
        }
        break;

    case "british":
        switch(response)		
        {
        case "1":
            soundalias = "british_follow_me";
            saytext = &"QUICKMESSAGE_FOLLOW_ME";
            break;
        case "2":
            soundalias = "british_move_in";
            saytext = &"QUICKMESSAGE_MOVE_IN";
            break;
        case "3":
            soundalias = "british_fall_back";
            saytext = &"QUICKMESSAGE_FALL_BACK";
            break;
        case "4":
            soundalias = "british_suppressing_fire";
            saytext = &"QUICKMESSAGE_SUPPRESSING_FIRE";
            break;
        case "5":
            soundalias = "british_attack_left_flank";
            saytext = &"QUICKMESSAGE_SQUAD_ATTACK_LEFT_FLANK";
            break;
        case "6":
            soundalias = "british_attack_right_flank";
            saytext = &"QUICKMESSAGE_SQUAD_ATTACK_RIGHT_FLANK";
            break;
        case "7":
            soundalias = "british_hold_position";
            saytext = &"QUICKMESSAGE_SQUAD_HOLD_THIS_POSITION";
            break;
        case "8":
            temp = randomInt(2);
            if(temp)
            {
                soundalias = "british_regroup";
                saytext = &"QUICKMESSAGE_SQUAD_REGROUP";
            }
            else
            {
                soundalias = "british_stick_together";
                saytext = &"QUICKMESSAGE_SQUAD_STICK_TOGETHER";
            }
            break;
        }
        break;

    case "russian":
        switch(response)		
        {
        case "1":
            soundalias = "russian_follow_me";
            saytext = &"QUICKMESSAGE_FOLLOW_ME";
            break;
        case "2":
            soundalias = "russian_move_in";
            saytext = &"QUICKMESSAGE_MOVE_IN";
            break;
        case "3":
            soundalias = "russian_fall_back";
            saytext = &"QUICKMESSAGE_FALL_BACK";
            break;
        case "4":
            soundalias = "russian_suppressing_fire";
            saytext = &"QUICKMESSAGE_SUPPRESSING_FIRE";
            break;
        case "5":
            soundalias = "russian_attack_left_flank";
            saytext = &"QUICKMESSAGE_SQUAD_ATTACK_LEFT_FLANK";
            break;
        case "6":
            soundalias = "russian_attack_right_flank";
            saytext = &"QUICKMESSAGE_SQUAD_ATTACK_RIGHT_FLANK";
            break;
        case "7":
            soundalias = "russian_hold_position";
            saytext = &"QUICKMESSAGE_SQUAD_HOLD_THIS_POSITION";
            break;
        case "8":
            soundalias = "russian_regroup";
            saytext = &"QUICKMESSAGE_SQUAD_REGROUP";
            break;
        }
        break;

    case "german":
        switch(response)		
        {
        case "1":
            soundalias = "german_follow_me";
            saytext = &"QUICKMESSAGE_FOLLOW_ME";
            break;
        case "2":
            soundalias = "german_move_in";
            saytext = &"QUICKMESSAGE_MOVE_IN";
            break;
        case "3":
            soundalias = "german_fall_back";
            saytext = &"QUICKMESSAGE_FALL_BACK";
            break;
        case "4":
            soundalias = "german_suppressing_fire";
            saytext = &"QUICKMESSAGE_SUPPRESSING_FIRE";
            break;
        case "5":
            soundalias = "german_attack_left_flank";
            saytext = &"QUICKMESSAGE_SQUAD_ATTACK_LEFT_FLANK";
            break;
        case "6":
            soundalias = "german_attack_right_flank";
            saytext = &"QUICKMESSAGE_SQUAD_ATTACK_RIGHT_FLANK";
            break;
        case "7":
            soundalias = "german_hold_position";
            saytext = &"QUICKMESSAGE_SQUAD_HOLD_THIS_POSITION";
            break;
        case "8":
            soundalias = "german_regroup";
            saytext = &"QUICKMESSAGE_SQUAD_REGROUP";
            break;
        }
        break;
    }

    self doQuickMessage(soundalias, saytext);

    wait level.quickChatDelay;
    self.spamdelay = undefined;
}
quickstatements(response)
{
    if(!isDefined(self.pers["camouflage"]) || isDefined(self.spamdelay))
        return;

    self.spamdelay = true;
    
    switch(self.pers["camouflage"])
    {
    case "american":
        switch(response)		
        {
        case "1":
            soundalias = "american_enemy_spotted";
            saytext = &"QUICKMESSAGE_ENEMY_SPOTTED";
            break;
        case "2":
            soundalias = "american_enemy_down";
            saytext = &"QUICKMESSAGE_ENEMY_DOWN";
            break;
        case "3":
            soundalias = "american_in_position";
            saytext = &"QUICKMESSAGE_IM_IN_POSITION";
            break;
        case "4":
            soundalias = "american_area_secure";
            saytext = &"QUICKMESSAGE_AREA_SECURE";
            break;
        case "5":
            soundalias = "american_grenade";
            saytext = &"QUICKMESSAGE_GRENADE";
            break;
        case "6":
            soundalias = "american_sniper";
            saytext = &"QUICKMESSAGE_SNIPER";
            break;
        case "7":
            soundalias = "american_need_reinforcements";
            saytext = &"QUICKMESSAGE_NEED_REINFORCEMENTS";
            break;
        case "8":
            soundalias = "american_hold_fire";
            saytext = &"QUICKMESSAGE_HOLD_YOUR_FIRE";
            break;
        }
        break;

    case "british":
        switch(response)		
        {
        case "1":
            soundalias = "british_enemy_spotted";
            saytext = &"QUICKMESSAGE_ENEMY_SPOTTED";
            break;
        case "2":
            soundalias = "british_enemy_down";
            saytext = &"QUICKMESSAGE_ENEMY_DOWN";
            break;
        case "3":
            soundalias = "british_in_position";
            saytext = &"QUICKMESSAGE_IM_IN_POSITION";
            break;
        case "4":
            soundalias = "british_area_secure";
            saytext = &"QUICKMESSAGE_AREA_SECURE";
            break;
        case "5":
            soundalias = "british_grenade";
            saytext = &"QUICKMESSAGE_GRENADE";
            break;
        case "6":
            soundalias = "british_sniper";
            saytext = &"QUICKMESSAGE_SNIPER";
            break;
        case "7":
            soundalias = "british_need_reinforcements";
            saytext = &"QUICKMESSAGE_NEED_REINFORCEMENTS";
            break;
        case "8":
            soundalias = "british_hold_fire";
            saytext = &"QUICKMESSAGE_HOLD_YOUR_FIRE";
            break;
        }
        break;

    case "russian":
        switch(response)		
        {
        case "1":
            soundalias = "russian_enemy_spotted";
            saytext = &"QUICKMESSAGE_ENEMY_SPOTTED";
            break;
        case "2":
            soundalias = "russian_enemy_down";
            saytext = &"QUICKMESSAGE_ENEMY_DOWN";
            break;
        case "3":
            soundalias = "russian_in_position";
            saytext = &"QUICKMESSAGE_IM_IN_POSITION";
            break;
        case "4":
            soundalias = "russian_area_secure";
            saytext = &"QUICKMESSAGE_AREA_SECURE";
            break;
        case "5":
            soundalias = "russian_grenade";
            saytext = &"QUICKMESSAGE_GRENADE";
            break;
        case "6":
            soundalias = "russian_sniper";
            saytext = &"QUICKMESSAGE_SNIPER";
            break;
        case "7":
            soundalias = "russian_need_reinforcements";
            saytext = &"QUICKMESSAGE_NEED_REINFORCEMENTS";
            break;
        case "8":
            soundalias = "russian_hold_fire";
            saytext = &"QUICKMESSAGE_HOLD_YOUR_FIRE";
            break;
        }
        break;
    
    case "german":
        switch(response)		
        {
        case "1":
            soundalias = "german_enemy_spotted";
            saytext = &"QUICKMESSAGE_ENEMY_SPOTTED";
            break;
        case "2":
            soundalias = "german_enemy_down";
            saytext = &"QUICKMESSAGE_ENEMY_DOWN";
            break;
        case "3":
            soundalias = "german_in_position";
            saytext = &"QUICKMESSAGE_IM_IN_POSITION";
            break;
        case "4":
            soundalias = "german_area_secure";
            saytext = &"QUICKMESSAGE_AREA_SECURE";
            break;
        case "5":
            soundalias = "german_grenade";
            saytext = &"QUICKMESSAGE_GRENADE";
            break;
        case "6":
            soundalias = "german_sniper";
            saytext = &"QUICKMESSAGE_SNIPER";
            break;
        case "7":
            soundalias = "german_need_reinforcements";
            saytext = &"QUICKMESSAGE_NEED_REINFORCEMENTS";
            break;
        case "8":
            soundalias = "german_hold_fire";
            saytext = &"QUICKMESSAGE_HOLD_YOUR_FIRE";
            break;
        }
        break;
    }

    self doQuickMessage(soundalias, saytext);

    wait level.quickChatDelay;
    self.spamdelay = undefined;
}
quickresponses(response)
{
    if(!isDefined(self.pers["camouflage"]) || isDefined(self.spamdelay))
        return;

    self.spamdelay = true;

    switch(self.pers["camouflage"])
    {
    case "american":
        switch(response)		
        {
        case "1":
            soundalias = "american_yes_sir";
            saytext = &"QUICKMESSAGE_YES_SIR";
            break;
        case "2":
            soundalias = "american_no_sir";
            saytext = &"QUICKMESSAGE_NO_SIR";
            break;
        case "3":
            soundalias = "american_on_my_way";
            saytext = &"QUICKMESSAGE_ON_MY_WAY";
            break;
        case "4":
            soundalias = "american_sorry";
            saytext = &"QUICKMESSAGE_SORRY";
            break;
        case "5":
            soundalias = "american_great_shot";
            saytext = &"QUICKMESSAGE_GREAT_SHOT";
            break;
        case "6":
            soundalias = "american_took_long_enough";
            saytext = &"QUICKMESSAGE_TOOK_LONG_ENOUGH";
            break;
        case "7":
            temp = randomInt(3);
            if(temp == 0)
            {
                soundalias = "american_youre_crazy";
                saytext = &"QUICKMESSAGE_YOURE_CRAZY";
            }
            else if(temp == 1)
            {
                soundalias = "american_you_outta_your_mind";
                saytext = &"QUICKMESSAGE_YOU_OUTTA_YOUR_MIND";
            }
            else
            {
                soundalias = "american_youre_nuts";
                saytext = &"QUICKMESSAGE_YOURE_NUTS";
            }
            break;
        }
        break;

    case "british":
        switch(response)		
        {
        case "1":
            soundalias = "british_yes_sir";
            saytext = &"QUICKMESSAGE_YES_SIR";
            break;
        case "2":
            soundalias = "british_no_sir";
            saytext = &"QUICKMESSAGE_NO_SIR";
            break;
        case "3":
            soundalias = "british_on_my_way";
            saytext = &"QUICKMESSAGE_ON_MY_WAY";
            break;
        case "4":
            soundalias = "british_sorry";
            saytext = &"QUICKMESSAGE_SORRY";
            break;
        case "5":
            soundalias = "british_great_shot";
            saytext = &"QUICKMESSAGE_GREAT_SHOT";
            break;
        case "6":
            soundalias = "british_took_long_enough";
            saytext = &"QUICKMESSAGE_TOOK_LONG_ENOUGH";
            break;
        case "7":
            soundalias = "british_youre_crazy";
            saytext = &"QUICKMESSAGE_YOURE_CRAZY";
            break;
        }
        break;

    case "russian":
        switch(response)		
        {
        case "1":
            soundalias = "russian_yes_sir";
            saytext = &"QUICKMESSAGE_YES_SIR";
            break;
        case "2":
            soundalias = "russian_no_sir";
            saytext = &"QUICKMESSAGE_NO_SIR";
            break;
        case "3":
            soundalias = "russian_on_my_way";
            saytext = &"QUICKMESSAGE_ON_MY_WAY";
            break;
        case "4":
            soundalias = "russian_sorry";
            saytext = &"QUICKMESSAGE_SORRY";
            break;
        case "5":
            soundalias = "russian_great_shot";
            saytext = &"QUICKMESSAGE_GREAT_SHOT";
            break;
        case "6":
            soundalias = "russian_took_long_enough";
            saytext = &"QUICKMESSAGE_TOOK_LONG_ENOUGH";
            break;
        case "7":
            soundalias = "russian_youre_crazy";
            saytext = &"QUICKMESSAGE_YOURE_CRAZY";
            break;
        }
        break;
    
    case "german":
        switch(response)		
        {
        case "1":
            soundalias = "german_yes_sir";
            saytext = &"QUICKMESSAGE_YES_SIR";
            break;
        case "2":
            soundalias = "german_no_sir";
            saytext = &"QUICKMESSAGE_NO_SIR";
            break;
        case "3":
            soundalias = "german_on_my_way";
            saytext = &"QUICKMESSAGE_ON_MY_WAY";
            break;
        case "4":
            soundalias = "german_sorry";
            saytext = &"QUICKMESSAGE_SORRY";
            break;
        case "5":
            soundalias = "german_great_shot";
            saytext = &"QUICKMESSAGE_GREAT_SHOT";
            break;
        case "6":
            soundalias = "german_took_long_enough";
            saytext = &"QUICKMESSAGE_TOOK_YOU_LONG_ENOUGH";
            break;
        case "7":
            soundalias = "german_are_you_crazy";
            saytext = &"QUICKMESSAGE_ARE_YOU_CRAZY";
            break;
        }
        break;
    }

    self doQuickMessage(soundalias, saytext);

    wait level.quickChatDelay;
    self.spamdelay = undefined;
}
doQuickMessage(soundalias, saytext)
{
    if(self.sessionstate != "playing")
        return;

    self playSound(soundalias);
    self sayAll(saytext);
}
//VSAY END

//UTILS
model()
{
    self detachAll();
    [[game[self.pers["camouflage"] + "_model"] ]]();
}

isBoltWeapon(sWeapon)
{
    switch(sWeapon)
    {
        case "enfield_mp":
        case "kar98k_mp":
        case "kar98k_sniper_mp":
        case "mosin_nagant_mp":
        case "mosin_nagant_sniper_mp":
        case "springfield_mp":
        return true;
    }
    return false;
}
isSecondaryWeapon(sWeapon)
{
    switch(sWeapon)
    {
        case "colt_mp":
        case "luger_mp":
        return true;
    }
    return false;
}
loadout()
{
    switch(self.pers["camouflage"])
    {
    case "american":
        self giveWeapon("colt_mp");
        self giveMaxAmmo("colt_mp");
        self giveWeapon("fraggrenade_mp");
        self giveMaxAmmo("fraggrenade_mp");
        break;

    case "british":
        self giveWeapon("colt_mp");
        self giveMaxAmmo("colt_mp");
        self giveWeapon("mk1britishfrag_mp");
        self giveMaxAmmo("mk1britishfrag_mp");
        break;

    case "russian":
        self giveWeapon("luger_mp");
        self giveMaxAmmo("luger_mp");
        self giveWeapon("rgd-33russianfrag_mp");
        self giveMaxAmmo("rgd-33russianfrag_mp");
        break;
        
    case "german":
        self giveWeapon("luger_mp");
        self giveMaxAmmo("luger_mp");
        self giveWeapon("stielhandgranate_mp");
        self giveMaxAmmo("stielhandgranate_mp");
        break;
    }
}

dropHealth()
{
    if(isDefined(level.healthqueue[level.healthqueuecurrent]))
        level.healthqueue[level.healthqueuecurrent] delete();
    
    level.healthqueue[level.healthqueuecurrent] = spawn("item_health", self.origin + (0, 0, 1));
    level.healthqueue[level.healthqueuecurrent].angles = (0, randomint(360), 0);

    level.healthqueuecurrent++;
    
    if(level.healthqueuecurrent >= 16)
        level.healthqueuecurrent = 0;
}

anglesToLeft(angles)
{
    rightDirection = anglesToRight(angles);
    leftDirection = maps\mp\_utility::vectorScale(rightDirection, -1);
    return leftDirection;
}
anglesToBackward(angles)
{
    forwardDirection = anglesToForward(angles);
    backwardDirection = maps\mp\_utility::vectorScale(forwardDirection, -1);
    return backwardDirection;
}
//UTILS END