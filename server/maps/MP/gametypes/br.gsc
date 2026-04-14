main()
{
    level.callbackStartGameType = ::Callback_StartGameType;
    level.callbackPlayerConnect = ::Callback_PlayerConnect;
    level.callbackPlayerDisconnect = ::Callback_PlayerDisconnect;
    level.callbackPlayerDamage = ::Callback_PlayerDamage;
    level.callbackPlayerKilled = ::Callback_PlayerKilled;
    maps\mp\gametypes\_callbacksetup::SetupCallbacks();
    
    level.expFogStruct = spawnStruct();
    level.expFogStruct.density = 0.000025;
    level.expFogStruct.red = 255/255;
    level.expFogStruct.green = 255/255;
    level.expFogStruct.blue = 255/255;
    transitionTime = 0;
    setExpFog(
        level.expFogStruct.density,
        level.expFogStruct.red,
        level.expFogStruct.green,
        level.expFogStruct.blue,
        transitionTime);
        
    ambientPlay("ambient_mp_depot");
    game["layoutimage"] = "zh_elusive";

    level.objectiveText = "Be the last survivor.";
    level.maxClients = getCvarInt("sv_maxclients");
    level.text_waitingPlayers = &"WAITING FOR PLAYERS";
    level.text_zoneIsShrinking = &"Zone is shrinking ";
    level.text_zoneWillShrink = &"Zone shrinks in ";

    level.minPlayers = 10;
    if(getCvarInt("br_minPlayers"))
        level.minPlayers = getCvarInt("br_minPlayers");
    
    level.startBattleCountdown = 10;
    if(getCvarInt("br_startBattleCountdown"))
        level.startBattleCountdown = getCvarInt("br_startBattleCountdown");
    
    level.quickChatDelay = 2;
    if(getCvarFloat("br_quickChatDelay"))
        level.quickChatDelay = getCvarFloat("br_quickChatDelay");
    
    level.instantKill_bolt = false;
    if(getCvarInt("br_instantkill_bolt"))
        level.instantKill_bolt = true;
    
    level.instantKill_pistol = false;
    if(getCvarInt("br_instantkill_pistol"))
        level.instantKill_pistol = true;
    
    level.instantKill_melee = false;
    if(getCvarInt("br_instantkill_melee"))
        level.instantKill_melee = true;
    
    level.hitmarker = false;
    if(getCvarInt("br_hitmarker"))
        level.hitmarker = true;
    
    level.staticZoneDuration = 60;
    if(getCvarInt("br_staticZoneDuration"))
        level.staticZoneDuration = getCvarInt("br_staticZoneDuration");
    
    level.crateOpeningDuration = 2.5;
    if(getCvarFloat("br_crateOpeningDuration"))
        level.crateOpeningDuration = getCvarFloat("br_crateOpeningDuration");
    level.crateOpeningBarSize = 288;
    
    // Model paths
    level.model_zone = "xmodel/playerhead_default"; // TODO: Use a custom model instead
    level.model_plane = "xmodel/vehicle_german_condor";
    level.model_parachute = "xmodel/bx_parachute";
    
    // Weapon names
    // TODO: Check if can show hands/parachute handles without using a weapon file
    level.parachute_deployed_hands = "br_parachute_mp"; // Weapon file used to indicate parachute deployment
    level.startWeapon = "knife_mp";

    zoneOriginStart = (0, 0, -700);
    level.zone = spawn("script_model", zoneOriginStart);
    level.zoneStatic = spawn("script_model", zoneOriginStart);
    level.zoneStatic.life = 10000; // ms
    level.zone.angles = (-90, 0, 0); //DEPENDS ON MODELS TAG
    level.zone.modelTag = "bip01 spine2";
    level.zone.objectiveNum = 0;
    
    index = 0;
    level.zone.modes = [];
    // Store file path for debugging, will call loadFx using it.
    level.zone.modes[index]["filePath"] = "fx/zone-start.efx";
    level.zone.modes[index]["startSize"] = 15000;

    index++;
    level.zone.modes[index]["filePath"] = "fx/zone-start_1.efx";
    level.zone.modes[index]["life"] = 10000;
    level.zone.modes[index]["startSize"] = level.zone.modes[index-1]["startSize"];
    level.zone.modes[index]["endSize"] = 12000;

    index++;
    level.zone.modes[index]["filePath"] = "fx/zone1.efx";
    level.zone.modes[index]["startSize"] = level.zone.modes[index-1]["endSize"];

    index++;
    level.zone.modes[index]["filePath"] = "fx/zone1_2.efx";
    level.zone.modes[index]["life"] = 15000;
    level.zone.modes[index]["startSize"] = level.zone.modes[index-1]["startSize"];
    level.zone.modes[index]["endSize"] = 9000;

    index++;
    level.zone.modes[index]["filePath"] = "fx/zone2.efx";
    level.zone.modes[index]["startSize"] = level.zone.modes[index-1]["endSize"];

    index++;
    level.zone.modes[index]["filePath"] = "fx/zone2_3.efx";
    level.zone.modes[index]["life"] = 15000;
    level.zone.modes[index]["startSize"] = level.zone.modes[index-1]["startSize"];
    level.zone.modes[index]["endSize"] = 6500;

    index++;
    level.zone.modes[index]["filePath"] = "fx/zone3.efx";
    level.zone.modes[index]["startSize"] = level.zone.modes[index-1]["endSize"];

    index++;
    level.zone.modes[index]["filePath"] = "fx/zone3_4.efx";
    level.zone.modes[index]["life"] = 15000;
    level.zone.modes[index]["startSize"] = level.zone.modes[index-1]["startSize"];
    level.zone.modes[index]["endSize"] = 4250;

    index++;
    level.zone.modes[index]["filePath"] = "fx/zone4.efx";
    level.zone.modes[index]["startSize"] = level.zone.modes[index-1]["endSize"];

    index++;
    level.zone.modes[index]["filePath"] = "fx/zone4_5.efx";
    level.zone.modes[index]["life"] = 15000;
    level.zone.modes[index]["startSize"] = level.zone.modes[index-1]["startSize"];
    level.zone.modes[index]["endSize"] = 2000;

    index++;
    level.zone.modes[index]["filePath"] = "fx/zone5.efx";
    level.zone.modes[index]["startSize"] = level.zone.modes[index-1]["endSize"];

    index++;
    level.zone.modes[index]["filePath"] = "fx/zone5_6.efx";
    level.zone.modes[index]["life"] = 15000;
    level.zone.modes[index]["startSize"] = level.zone.modes[index-1]["startSize"];
    level.zone.modes[index]["endSize"] = 800;

    index++;
    level.zone.modes[index]["filePath"] = "fx/zone6.efx";
    level.zone.modes[index]["startSize"] = level.zone.modes[index-1]["endSize"];

    index++;
    level.zone.modes[index]["filePath"] = "fx/zone6_end.efx";
    level.zone.modes[index]["life"] = 15000;
    level.zone.modes[index]["startSize"] = level.zone.modes[index-1]["startSize"];
    level.zone.modes[index]["endSize"] = 0;
    
    for(i = 0; i < level.zone.modes.size; i++)
        level.zone.modes[i]["fxId"] = loadFx(level.zone.modes[i]["filePath"]);
    
    level.camouflages = [];
    level.camouflages[level.camouflages.size] = "american";
    level.camouflages[level.camouflages.size] = "british";
    level.camouflages[level.camouflages.size] = "german";
    level.camouflages[level.camouflages.size] = "russian";

    level.crate_efxId = loadFx("fx/crate_weapons.efx");

    level.zone.active = false;
    level.startingBattle = false;
    level.battleStarted = false;
    level.battleOver = false;
    level.checkingVictoryRoyale = false;
    level.noWinner = false;

    level.prefix_trigger_crate = "trigger_crate_";
    level.prefix_script_model_crate = "script_model_crate_";

    level.color_red = (1, 0, 0);
    level.color_white = (1, 1, 1);

    setArchive(true);

    if(!isDefined(game["state"]))
        game["state"] = "playing";
}

//// Callbacks
Callback_StartGameType()
{
    // View Map menu
    if(!isDefined(game["layoutimage"]))
        game["layoutimage"] = "default";
    layoutname = "levelshots/layouts/hud@layout_" + game["layoutimage"];
    precacheShader(layoutname);
    setCvar("scr_layoutimage", layoutname);
    makeCvarServerInfo("scr_layoutimage", "");

    // Menus
    game["menu_camouflage"] = "camouflage";
    game["menu_viewmap"] = "viewmap";
    game["menu_quickcommands"] = "quickCommands";
    game["menu_quickstatements"] = "quickStatements";
    game["menu_quickresponses"] = "quickResponses";
    precacheMenu(game["menu_camouflage"]);
    precacheMenu(game["menu_viewmap"]);
    precacheMenu(game["menu_quickcommands"]);
    precacheMenu(game["menu_quickstatements"]);
    precacheMenu(game["menu_quickresponses"]);

    // Shaders
    precacheShader("black");
    precacheShader("white");
    precacheShader("hudScoreboard_mp");
    precacheShader("gfx/hud/hud@mpflag_none.tga");
    precacheShader("gfx/hud/hud@mpflag_spectator.tga");
    precacheShader("gfx/hud/damage_feedback.dds");
    precacheShader("gfx/hud/zone_center.dds");
    precacheShader("gfx/hud/icon_soldier.dds");

    // Status icons
    precacheStatusIcon("gfx/hud/hud@status_dead.tga");
    precacheStatusIcon("gfx/hud/hud@status_connecting.tga");

    // Models
    precacheModel(level.model_zone);
    precacheModel(level.model_plane);
    precacheModel(level.model_parachute);

    // Character models
    mptype\american_airborne::precache();
    mptype\british_airborne::precache();
    mptype\british_commando::precache();
    mptype\german_fallschirmjagercamo::precache();
    mptype\german_fallschirmjagergrey::precache();
    mptype\german_kriegsmarine::precache();
    mptype\german_waffen::precache();
    mptype\german_wehrmacht::precache();
    mptype\russian_conscript::precache();
    mptype\russian_veteran::precache();
    
    // Weapons
    precacheItem("fg42_mp");
    precacheItem("panzerfaust_mp");
    precacheItem("enfield_mp");
    precacheItem("m1carbine_mp");
    precacheItem("m1garand_mp");
    precacheItem("thompson_mp");
    precacheItem("bar_mp");
    precacheItem("springfield_mp");
    precacheItem("sten_mp");
    precacheItem("bren_mp");
    precacheItem("mosin_nagant_mp");
    precacheItem("ppsh_mp");
    precacheItem("mosin_nagant_sniper_mp");
    precacheItem("kar98k_mp");
    precacheItem("mp40_mp");
    precacheItem("mp44_mp");
    precacheItem("kar98k_sniper_mp");
    // Pistols
    precacheItem("colt_mp");
    precacheItem("luger_mp");
    // Grenades
    precacheItem("fraggrenade_mp");
    precacheItem("stielhandgranate_mp");
    precacheItem("mk1britishfrag_mp");
    precacheItem("rgd-33russianfrag_mp");
    // Items
    precacheItem("item_health");
    precacheItem("item_health_large");
    // Custom
    precacheItem(level.startWeapon);
    precacheItem(level.parachute_deployed_hands);
    
    maps\mp\gametypes\_teams::initGlobalCvars();

    setClientNameMode("auto_change");

    objective_add(level.zone.objectiveNum, "current", level.zone.origin, "gfx/hud/zone_center.dds");
    objective_onEntity(level.zone.objectiveNum, level.zone);
    objective_team(level.zone.objectiveNum, "none");
    level.zone setModel(level.model_zone);
    level.zoneStatic setModel(level.model_zone);
    
    thread manageZoneLifecycle();
    thread checkBattleReady();
    thread addBotClients();

    // Calling getEnt for crates before starting battle for faster debugging
    crates_load();

    mapCredit = newHudElem();
    mapCredit.x = 1;
    mapCredit.y = 480 - 7;
    mapCredit.fontScale = 0.6;
    mapCredit setText(&"Map by zilch (modified)");

    initDB();
}
Callback_PlayerConnect()
{
    self.statusicon = "gfx/hud/hud@status_connecting.tga";
    self waittill("begin");

    thread updatePlayersCountTable();

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
                    
                if(response == "autoassign")
                    response = level.camouflages[randomInt(level.camouflages.size)];
                    
                self.fights = true;
                
                self.pers["camouflage"] = response;
                model();
                
                // Spawn if not spawned already
                if (self.sessionstate == "spectator")
                {
                    // Don't spawn if plane started flying
                    //TODO: Link to plane if it's still flying
                    if (!level.battleStarted)
                    {
                        spawnPlayer();
                    }
                }

                break;

            case "spectator":
                
                self.fights = false;
                if (isDefined(self.pers["camouflage"]))
                {
                    self.pers["camouflage"] = undefined;
                    self.sessionteam = "spectator";
                    self setClientCvar("g_scriptMainMenu", game["menu_camouflage"]);
                    spawnSpectator();
                }
                break;
            
            case "viewmap":
                self openMenu(game["menu_viewmap"]);
                break;
            }
        }
        else if(menu == game["menu_quickcommands"])
            quickCommands(response);
        else if(menu == game["menu_quickstatements"])
            quickStatements(response);
        else if(menu == game["menu_quickresponses"])
            quickResponses(response);
    }
}
Callback_PlayerDisconnect()
{
    //printLnBR("Callback_PlayerDisconnect");

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
                    iDamage = self.health;
            }
            else if (isSecondaryWeapon(sWeapon))
            {
                if(level.instantKill_pistol)
                    iDamage = self.health;
            }
        }
        else if (sMeansOfDeath == "MOD_MELEE")
        {
            if(level.instantKill_melee)
                iDamage = self.health;
        }

        if(eAttacker != self && level.hitmarker)
            eAttacker thread showHitMarker();
    }

    if(!level.battleStarted)
        return;
    
    if(self playerWillDie(iDamage))
        self dropWeapons();

    // Apply the damage to the player
    self finishPlayerDamage(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, sWeapon, vPoint, vDir, sHitLoc);
}
Callback_PlayerKilled(eInflictor, eAttacker, iDamage, sMeansOfDeath, sWeapon, vDir, sHitLoc)
{
    self endon("spawned");

    if(self.sessionteam == "spectator")
        return;

    if(sHitLoc == "head" && sMeansOfDeath != "MOD_MELEE")
        sMeansOfDeath = "MOD_HEAD_SHOT";
    obituary(self, eAttacker, sWeapon, sMeansOfDeath);
    
    self notify("death");

    self.sessionstate = "dead";

    if (eAttacker == level.zone || eAttacker == level.zoneStatic)
    {
        //printLnBR("Callback_PlayerKilled: eAttacker is zone");
        level thread checkVictoryRoyale(self);
    }
    else if (sMeansOfDeath == "MOD_FALLING")
    {
        //printLnBR("Callback_PlayerKilled: MOD_FALLING");
        level thread checkVictoryRoyale(self);
    }
    else
    {
        level thread checkVictoryRoyale(eAttacker);
    }

    self.statusicon = "gfx/hud/hud@status_dead.tga";
    self.deaths = 1;
    
    doKillcam = false;
    
    if (isPlayer(eAttacker))
    {
        if (eAttacker != self)
        {
            if (!level.battleOver)
            {
                doKillcam = true;
            }
            eAttacker.score++;

            thread updateTopKillsTable(eAttacker.score, eAttacker.name);
        }
    }
    body = self cloneplayer();

    timeToWaitAfterDeath = 2; // Delay the player becoming a spectator
    wait timeToWaitAfterDeath;
    totalDurationBeforeKill = timeToWaitAfterDeath + 3;
    
    if (doKillcam)
    {
        self thread killcamNormal(eAttacker, timeToWaitAfterDeath, totalDurationBeforeKill);
    }
    else
    {
        currentorigin = self.origin;
        currentangles = self getPlayerAngles();
        self thread spawnSpectator(currentorigin + (0, 0, 60), currentangles, true);
    }
}
////

//// Stats
initDB()
{
    if (getCvar("br_dbDirPath") == "")
	{
		printLnBR("br_dbDirPath cvar is empty, aborting DB init");
		return;
	}
    
    dbFilePath = getCvar("br_dbDirPath") + "/stats.db";
	
	level.statsDB = sqlite_open(dbFilePath); // DB file will get created if doesn't exist

	// Create "peak players" table if doesn't exist
	query_create = "CREATE TABLE IF NOT EXISTS player_counts (timestamp INTEGER, count INTEGER);";
	sqlite_query(level.statsDB, query_create);
    // Delete entries older than 7 days
	query_delete = "DELETE FROM player_counts WHERE timestamp < strftime('%s', 'now', '-7 days')";
	sqlite_query(level.statsDB, query_delete);
    
    // Create "top players" table if doesn't exist
    query_create = "CREATE TABLE IF NOT EXISTS player_best_kills (name TEXT PRIMARY KEY, best_kills INTEGER, last_update INTEGER);";
	sqlite_query(level.statsDB, query_create);

	async_sqlite_initialize();
	thread async_sqlite_checkdone_loop(); // For the callback functions of async queries to get called

    // Init top kills HUD
    topKillsRetrieve();
}

async_sqlite_checkdone_loop()
{
	for (;;)
	{
		async_sqlite_checkdone();
		wait .05;
	}
}

playersCountQueryCallback(rows, arg)
{
	if (arg == "update")
	{
		// Retrieve max simultaneously connected players in the past 7 days
		query_select = "SELECT timestamp, count FROM player_counts WHERE timestamp >= strftime('%s', 'now', '-7 days') ORDER BY count DESC LIMIT 1";
		async_sqlite_create_query(level.statsDB, query_select, ::playersCountQueryCallback, "retrieve");
	}
	else if (arg == "retrieve")
	{
		if (rows.size)
		{
			past7daysMax = rows[0][1];
			past7daysTimestamp = (int)rows[0][0];
			dayMonth = strftime(past7daysTimestamp, "utc", "%d/%m %Z");

            if (!isDefined(level.hud_statsMaxPlayers))
            {
                level.hud_statsMaxPlayers = newHudElem();
                level.hud_statsMaxPlayers.x = 640 / 2;
                level.hud_statsMaxPlayers.y = 480 - 8;
                level.hud_statsMaxPlayers.alignX = "center";
                level.hud_statsMaxPlayers.alignY = "middle";
                level.hud_statsMaxPlayers.fontScale = 0.75;
            }
            hudText = "Peak players (last 7 days): ^2" + past7daysMax + "^7 (" + dayMonth + ")";
            hudText_localized = makeLocalizedString(hudText);
            level.hud_statsMaxPlayers setText(hudText_localized);
		}
	}
}

updatePlayersCountTable()
{
	if(!isDefined(level.statsDB))
        return;
        
	wait .05;
	playersCount = getEntArray("player", "classname").size;
	query_insert = "INSERT INTO player_counts (timestamp, count) VALUES (strftime('%s','now'), " + playersCount + ")";
	async_sqlite_create_query(level.statsDB, query_insert, ::playersCountQueryCallback, "update");
}

topKillsRetrieve()
{
    query_select = "SELECT name, best_kills FROM player_best_kills ORDER BY best_kills DESC, last_update ASC LIMIT 3;";
    async_sqlite_create_query(level.statsDB, query_select, ::topKillsQueryCallback, "retrieve");
}

topKillsQueryCallback(rows, arg)
{
    if (arg == "update")
    {
        topKillsRetrieve();
    }
    else if (arg == "retrieve")
    {
        // TODO: If multiple players have same kill record, group them together
        if (rows.size)
		{
            hudText = "Kill records: ";

            for (i = 0; i < rows.size; i++)
            {
                name = rows[i][0];
                kills = rows[i][1];
                
                hudText += "^2" + kills + " ^7(" + name + "^7)";

                if(i < rows.size - 1)
                    hudText += " || ";
            }
            
            if (!isDefined(level.hud_statsTopPlayers))
            {
                level.hud_statsTopPlayers = newHudElem();
                level.hud_statsTopPlayers.x = 2;
                level.hud_statsTopPlayers.y = 1;
                level.hud_statsTopPlayers.fontScale = 0.9;
            }
            hudText_localized = makeLocalizedString(hudText);
            level.hud_statsTopPlayers setText(hudText_localized);
        }
    }
}

updateTopKillsTable(score, name)
{
    if(!isDefined(level.statsDB))
        return;

    name = sqlite_escape_string(name);
    
    query_insert =
    "INSERT INTO player_best_kills (name, best_kills, last_update)"
    +" VALUES ('" + name + "', " + score + ", strftime('%s', 'now'))"
    +" ON CONFLICT(name) DO UPDATE SET"
    +" best_kills = excluded.best_kills, last_update = strftime('%s', 'now')"
    +" WHERE excluded.best_kills > best_kills;";
    async_sqlite_create_query(level.statsDB, query_insert, ::topKillsQueryCallback, "update");
}
////

//// Spawn
spawnSpectator(origin, angles, died)
{
    //printLnBR("spawnSpectator");

    self notify("spawned");
    self notify("spawned_spectator");

    resetTimeout();

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
        spawnpoints = getEntArray(spawnpointname, "classname");
        spawnpoint = maps\mp\gametypes\_spawnlogic::getSpawnpoint_Random(spawnpoints);

        if(isDefined(spawnpoint))
            self spawn(spawnpoint.origin, spawnpoint.angles);
        else
            maps\mp\_utility::error("NO " + spawnpointname + " SPAWNPOINTS IN MAP");
    }

    self setClientCvar("cg_objectiveText", level.objectiveText);
}
spawnPlayer(origin, angles)
{
    self notify("spawned");

    resetTimeout();

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
    self.score = 0;
    self.deaths = 0;

    model();

    if (!self.inPlane)
    {
        self giveWeapon(level.startWeapon);
        pistol = self getWeaponSlotWeapon("pistol");
        self setSpawnWeapon(pistol);
    }
    
    self setClientCvar("cg_objectiveText", level.objectiveText);
}
spawnIntermission()
{
    //printLnBR("spawnIntermission");

    self notify("spawned");
    
    resetTimeout();

    self.sessionstate = "intermission";
    self.spectatorclient = -1;
    self.archivetime = 0;

    spawnpointname = "mp_deathmatch_intermission";
    spawnpoints = getEntArray(spawnpointname, "classname");
    spawnpoint = maps\mp\gametypes\_spawnlogic::getSpawnpoint_Random(spawnpoints);

    if(isDefined(spawnpoint))
        self spawn(spawnpoint.origin, spawnpoint.angles);
    else
        maps\mp\_utility::error("NO " + spawnpointname + " SPAWNPOINTS IN MAP");
}
////

checkBattleReady()
{
    //printLnBR("checkBattleReady");

    level endon("battle_start");

    fontScale_playerCount = 1.2;

    level.hud_waitingBackground = newHudElem();
    level.hud_waitingBackground.alignX = "center";
    level.hud_waitingBackground.x = 320;
    level.hud_waitingBackground.y = 20;
    level.hud_waitingBackground.alpha = 0.6;
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
                    // Player is connected
                    if(player.fights)
                        numberOfReadyPlayers[numberOfReadyPlayers.size] = player;
                }
            }
        }
        level.hud_playersReady setValue(numberOfReadyPlayers.size);

        if (numberOfReadyPlayers.size > 0) // At least 1 ready player
        {
            if (numberOfReadyPlayers.size < level.minPlayers) // Min players not reached yet
            {
                if (level.startingBattle) // Lost required players count, reset
                {
                    level notify("battle_cancel");
                    level.startingBattle = false;

                    // Reset HUD
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
            else if (numberOfReadyPlayers.size >= level.minPlayers) // Min players reached, start countdown
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
    //printLnBR("startBattle");

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

    level.hud_numLivingPlayersCount = newHudElem();
    level.hud_numLivingPlayersCount.alignX = "right";
    level.hud_numLivingPlayersCount.x = 640 - 15;
    level.hud_numLivingPlayersCount.y = 80;
    level.hud_numLivingPlayersCount.fontScale = 1.3;
    
    level.hud_numLivingPlayersIcon = newHudElem();
    level.hud_numLivingPlayersIcon.y = level.hud_numLivingPlayersCount.y;
    level.hud_numLivingPlayersIcon setShader("gfx/hud/icon_soldier.dds", 16, 16);
    
    thread updateNumLivingPlayers();

    crates_setup();

    // TODO: Randomize plane route
    originPlane = (-1520, 12000, 7000);
    anglesPlane = (0, -90, 0);
    level.plane = spawn("script_model", originPlane);
    level.plane setModel(level.model_plane);
    level.plane.angles = anglesPlane;

    originPlanePov =
        (level.plane.origin[0],
        level.plane.origin[1] + 1100,
        level.plane.origin[2] + 300);
    anglesPlanePov =
        (level.plane.angles[0] + 35,
        level.plane.angles[1],
        level.plane.angles[2]);

    moveDistance = -25000;
    moveDuration = 22;
    level.planePov = spawn("script_origin", originPlanePov);

    // Link players to the plane
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

        player spawnPlayer(originPlanePov, anglesPlanePov);
        player showToPlayer(player); // Make player invisible to others
        player linkTo(level.planePov);
    }

    // Move the plane
    level.plane playLoopSound("in_plane");
    level.plane moveY(moveDistance, moveDuration);
    level.planePov moveY(moveDistance, moveDuration);
    
    delayBeforeDoorOpens = 3;
    hud_doorOpening = newHudElem();
    hud_doorOpening.alignX = "center";
    hud_doorOpening.alignY = "middle";
    hud_doorOpening.x = 320;
    hud_doorOpening.y = 20;
    hud_doorOpening.fontScale = 1.1;
    hud_doorOpening.label = (&"Door opens in ");
    hud_doorOpening setTimer(delayBeforeDoorOpens);

    wait delayBeforeDoorOpens; // Delay door opening

    players = getEntArray("player", "classname");
    for (i = 0; i < players.size; i++)
    {
        player = players[i];
        if(!player.fights)
            continue;
        player thread checkPlayerInZone();
        player thread checkPlayerJumped();
    }

    wait 0.5;
    hud_doorOpening destroy();

    wait moveDuration - (delayBeforeDoorOpens - 0.5) - 4; // Check if everyone jumped few seconds before deleting the plane.
    players = getEntArray("player", "classname");
    for (i = 0; i < players.size; i++)
    {
        player = players[i];
        if(!player.fights)
            continue;
        if(isAlive(player) && !player.jumped)
            player.forceJump = true;
    }

    wait 2.5; // Delay plane ent deletion because it will be used in checkPlayerJumped() // TODO: Cleanup

    level.plane stopLoopSound();
    level.plane delete();
    level.planePov delete();
}

//// Weapon crates
crates_load()
{
    level.weaponCrates_triggers = [];
    level.weaponCrates_models = [];

    entArray = getEntArray();
    for(i = 0; i < entArray.size; i++)
    {
        if (isDefined(entArray[i].targetname))
        {
            if (isSubStr(entArray[i].targetname, level.prefix_trigger_crate))
            {
                /*
                If there is 2 or more entities with same targetname, you will get error:
                - getent used with more than one entity
                Uncomment the below printLn, the last targetname will be the one to fix.
                You could find it in Radiant: Edit > Entity Info
                */
                //printLnBR("getEnt for: " + entArray[i].targetname);
                trigger_crate = getEnt(entArray[i].targetname, "targetname");
                level.weaponCrates_triggers[level.weaponCrates_triggers.size] = trigger_crate;
            }
            else if (isSubStr(entArray[i].targetname, level.prefix_script_model_crate))
            {
                //printLnBR("getEnt for: " + entArray[i].targetname);
                model_crate = getEnt(entArray[i].targetname, "targetname");
                level.weaponCrates_models[level.weaponCrates_models.size] = model_crate;
            }
        }
    }
}
crates_setup()
{
    for(i = 0; i < level.weaponCrates_triggers.size; i++)
        level.weaponCrates_triggers[i] thread crate_trigger_think();
    for(i = 0; i < level.weaponCrates_models.size; i++)
        level.weaponCrates_models[i] thread crate_efx();
}
crate_trigger_think()
{
    for(;;)
    {
        self waittill("trigger", entity);

        if (isPlayer(entity) && entity isOnGround())
        {
            if (!isDefined(entity.triggerIcon))
            {
                entity.triggerIcon = newClientHudElem(entity);
                entity.triggerIcon.alignX = "center";
                entity.triggerIcon.alignY = "middle";
                entity.triggerIcon.x = 320;
                entity.triggerIcon.y = 355;
                entity.triggerIcon.fontScale = 1.4;
                entity.triggerIcon setText(&"Hold ^1[{+activate}] ^7to open");
            }
            
            while(entity isTouching(self) && isAlive(entity) && entity useButtonPressed())
            {
                entity notify("kill_crate_trigger_check");

                if (!isDefined(entity.progressbackground))
                {
                    entity.progressbackground = newClientHudElem(entity);
                    entity.progressbackground.alignX = "center";
                    entity.progressbackground.alignY = "middle";
                    entity.progressbackground.x = 320;
                    entity.progressbackground.y = 385;
                    entity.progressbackground.alpha = 0.5;
                }
                entity.progressbackground setShader("black", (level.crateOpeningBarSize + 4), 12);
                
                if (!isDefined(entity.progressbar))
                {
                    entity.progressbar = newClientHudElem(entity);
                    entity.progressbar.alignX = "left";
                    entity.progressbar.alignY = "middle";
                    entity.progressbar.x = (320 - (level.crateOpeningBarSize / 2.0));
                    entity.progressbar.y = 385;
                }
                entity.progressbar setShader("white", 0, 8);
                entity.progressbar scaleOverTime(level.crateOpeningDuration, level.crateOpeningBarSize, 8);

                entity linkTo(self);
                self.progressTime = 0;

                while(isAlive(entity) && entity useButtonPressed() && (self.progressTime < level.crateOpeningDuration))
                {
                    self.progressTime += 0.05;
                    wait 0.05;
                }

                if (self.progressTime >= level.crateOpeningDuration)
                {
                    entity.triggerIcon destroy();
                    entity.progressbackground destroy();
                    entity.progressbar destroy();

                    // Get the crate script_model
                    trigger_crate_id = getSubStr(self.targetname, level.prefix_trigger_crate.size);
                    modelTargetName = level.prefix_script_model_crate + trigger_crate_id;
                    //printLnBR("getEnt for: " + modelTargetName);
                    entScriptModelCrate = getEnt(modelTargetName, "targetname");
                    entScriptModelCrate notify("crate_efx_stop");
                    
                    self delete(); // Delete the trigger
                    
                    level crate_spawn_stuff(entScriptModelCrate);
                    
                    return;
                }
                else
                {
                    entity.progressbackground destroy();
                    entity.progressbar destroy();
                    entity unlink();
                }

                wait .05;
            }
            
            entity thread crate_trigger_check(self);
        }
    }
}
crate_trigger_check(trigger)
{
    self notify("kill_crate_trigger_check");
    self endon("kill_crate_trigger_check");

    while(isDefined(trigger) && self isTouching(trigger) && isAlive(self))
        wait 0.05;

    if(isDefined(self.triggerIcon))
        self.triggerIcon destroy();
}
crate_efx()
{
    efxLife = 2000;
    entFx = playLoopedFX(level.crate_efxId, msToS(efxLife), self.origin + (0, 0, 20));
    self waittill("crate_efx_stop");
    /*
    The efx will disappear after its life completes,
    using a small life so it doesn't take too long to disappear,
    but not too small to make "blinks" less frequent.
    */
    entFx delete();
}
crate_spawn_stuff(entScriptModelCrate)
{
    //printLnBR("testOrigin origin: " + entScriptModelCrate.origin);
    //printLnBR("testOrigin angles: " + entScriptModelCrate.angles);
    forwardDirection = anglesToForward(entScriptModelCrate.angles);
    rightDirection = anglesToRight(entScriptModelCrate.angles);
    leftDirection = anglesToLeft(entScriptModelCrate.angles);
    forward_right = vectorNormalize(forwardDirection + rightDirection);
    forward_left = vectorNormalize(forwardDirection + leftDirection);
    
    stuff = [];
    stuff[0]["stuff"] = randomPrimary();
    stuff[0]["direction"] = forward_left;
    stuff[1]["stuff"] = randomPrimary();
    stuff[1]["direction"] = forward_right;
    
    switch(randomInt(5))
    {
        case 0:
            stuff[2]["stuff"] = randomSecondary();
        break;
        
        case 1:
            stuff[2]["stuff"] = randomGrenade();
        break;
        
        // More odds for health
        case 2:
        case 3:
        case 4:
            stuff[2]["stuff"] = randomHealth();
        break;
    }
    stuff[2]["direction"] = forwardDirection;
    
    entScriptModelCrate playsound("crate_open");
    
    for(i = 0; i < stuff.size; i++)
    {
        scale = 40; // Higher value = bigger distance from crate.
        origin = entScriptModelCrate.origin + maps\mp\_utility::vectorScale(stuff[i]["direction"], scale);
        spawnedStuff = spawn(stuff[i]["stuff"], origin + (0, 0, 10));
        spawnedStuff.angles = (0, randomInt(360), 0);
    }
}
////

//// Zone
manageZoneLifecycle()
{
    // Not using a single HudElem (.label + setTimer) so the timer doesn't move the text
    level.hud_zoneShrinkAlertTimer = newHudElem();
    level.hud_zoneShrinkAlertTimer.alignX = "right";
    level.hud_zoneShrinkAlertTimer.x = 640 - 15;
    level.hud_zoneShrinkAlertTimer.y = 112;
    level.hud_zoneShrinkAlertTimer.fontScale = 1.1;
    
    level.hud_zoneShrinkAlertText = newHudElem();
    level.hud_zoneShrinkAlertText.alignX = "right";
    level.hud_zoneShrinkAlertText.x = level.hud_zoneShrinkAlertTimer.x - 30;
    level.hud_zoneShrinkAlertText.y = level.hud_zoneShrinkAlertTimer.y;
    level.hud_zoneShrinkAlertText.fontScale = level.hud_zoneShrinkAlertTimer.fontScale;
    
    zoneIndex = 0; // Waiting for players
    thread setupZone(zoneIndex);

    level waittill("battle_start");

    zoneIndex++; // In plane, start zone is shrinking
    thread setupZone(zoneIndex);

    for(;;)
    {
        level waittill("zone_static_started");
        wait level.staticZoneDuration;

        zoneIndex += 2;
        thread setupZone(zoneIndex);
    }
}
setupZone(zoneModeIndex)
{
    /*fxDir = "fx/";
    fxExt = ".efx";
    fxFileName = getSubStr(level.zone.modes[zoneModeIndex]["filePath"], fxDir.size, level.zone.modes[zoneModeIndex]["filePath"].size - fxExt.size);
    debugMessage = "setupZone: " + fxFileName;
    if(isDefined(level.zone.modes[zoneModeIndex]["life"]))
        debugMessage += ", life: " + level.zone.modes[zoneModeIndex]["life"] + "ms";
    printLnBR(debugMessage);*/
    
    if (!isDefined(level.zone.modes[zoneModeIndex]["endSize"])) // Static zone
    {
        level.zone.indexMode = zoneModeIndex;
        level.zone.currentSize = level.zone.modes[zoneModeIndex]["startSize"];
        level thread playZone(level.zone.modes[zoneModeIndex]["fxId"], true);

        if (zoneModeIndex != 0) // Start zone is active, there is no countdown
        {
            level.hud_zoneShrinkAlertText.color = level.color_white;
            level.hud_zoneShrinkAlertTimer.color = level.color_white;
            level.hud_zoneShrinkAlertText setText(level.text_zoneWillShrink);
            level.hud_zoneShrinkAlertTimer setTimer(level.staticZoneDuration);
            
            level notify("zone_static_started");
        }
    }
    else // Shrinking zone
    {
        level.zone.active = false;
        
        level notify("zone_static_stop");
        //printLnBR("zoneStatic flip angle");
        /*
        Before reading this comment, see first explanation in playZone()
        Thought about making the zone go down the map to hide it, but moveTo()/moveZ() didn't want to make the 
        efx go down/through the floor. So now flipping angles[0] to hide the zone under the map.
        To replace the angles, the efx requires "flags relative"
        */
        level.zoneStatic.angles = (0 - level.zone.angles[0], level.zone.angles[1], level.zone.angles[2]);
        
        level.zone.indexMode = zoneModeIndex;
        level.zone.life = level.zone.modes[zoneModeIndex]["life"];
        level.zone.startSize = level.zone.modes[zoneModeIndex]["startSize"];
        level.zone.currentSize = level.zone.startSize;
        level.zone.endSize = level.zone.modes[zoneModeIndex]["endSize"];
        level.zone.nextZoneIndex = level.zone.indexMode + 1;
        level.zone thread playZone(level.zone.modes[zoneModeIndex]["fxId"], false);
        level.zone thread keepZoneSizeVarUpdated();
        
        level.hud_zoneShrinkAlertText.color = level.color_red;
        level.hud_zoneShrinkAlertTimer.color = level.color_red;
        level.hud_zoneShrinkAlertText setText(level.text_zoneIsShrinking);
        level.hud_zoneShrinkAlertTimer setTimer(msToS(level.zone.life));

        if(zoneModeIndex == 1 || level.battleOver)
            return; // No shrink sound alert when in plane or if battle is over
            
        players = getEntArray("player", "classname");
        for(i = 0; i < players.size; i++)
            players[i] playLocalSound("shrink_start");
    }

    level.zone.active = true;
}
playZone(fx, static)
{
    //printLnBR("playZone");
    level endon("zone_static_stop");
    
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
            level.zoneStatic.origin = level.zone.origin; // Set to new moved origin.
            level.zoneStatic.angles = level.zone.angles; // Reset angle to initial value (unhide).
            //printLnBR("playFXOnTag zoneStatic");
            playFXOnTag(fx, level.zoneStatic, level.zone.modelTag);
            wait msToS(level.zoneStatic.life); // Using same life value in efx files for all static zones.
        }
    }
    else
    {
        playFXOnTag(fx, self, self.modelTag);
        moveZone();
        
        if (self.indexMode != self.modes.size - 1)
        {
            wait msToS(self.life);
            // Play next static zone
            self.active = false;
            self thread setupZone(self.nextZoneIndex);
        }
        else
        {
            // Final zone, will shrinks fully, will play nothing after.
            //printLnBR("playZone FINAL");

            wait msToS(self.life);
            // Destroy HUD and zone objective on compass
            objective_delete(level.zone.objectiveNum);
            wait 0.5;
            level.hud_zoneShrinkAlertText destroy();
            level.hud_zoneShrinkAlertTimer destroy();
        }
    }
}
moveZone() // TODO: Ensure never goes out of map
{
    //printLnBR("moveZone");
    
    minX = 300;
    maxX = 1000;
    minY = 550;
    maxY = 1700;
    
    x = randomIntRange(minX, maxX);
    y = randomIntRange(minY, maxY);

    /*printLnBR("x = " + x);
    printLnBR("y = " + y);*/
    
    // One in two chance to be negative
    if(randomInt(2) == 1)
        x = 0 - x;
    if(randomInt(2) == 1)
        y = 0 - y;
        
    /*printLnBR("x = " + x);
    printLnBR("y = " + y);*/
    
    newZoneX = self.origin[0] + x;
    newZoneY = self.origin[1] + y;

    /*printLnBR("newZoneX = " + newZoneX);
    printLnBR("newZoneY = " + newZoneY);*/
    
    destinationOrigin = (newZoneX, newZoneY, self.origin[2]);
    self moveTo(destinationOrigin, msToS(self.life)); // To move, the efx requires "flags relative"
}
keepZoneSizeVarUpdated()
{
    currentTime = getTime();
    startTime = currentTime;
    while(currentTime - startTime < self.life)
    {
        progress = (float)(currentTime - startTime) / self.life;
        currentSize = self.startSize + ((self.endSize - self.startSize) * progress);
        self.currentSize = currentSize;
        wait .05;
        currentTime = getTime();
    }
}
checkPlayerInZone()
{
    self endon("death");
    self endon("spawned_spectator");
    self endon("finalKillcam_start");

    self.inZone = true;

    self.hudInStormAlert = newClientHudElem(self);
    self.hudInStormAlert.x = 640 / 2;
    self.hudInStormAlert.y = 60;
    self.hudInStormAlert.alignX = "center";
    self.hudInStormAlert.alignY = "middle";
    self.hudInStormAlert.color = level.color_red;
    self.hudInStormAlert.fontScale = 1.2;

    for(;;)
    {
        if (level.zone.active)
        {
            // Ignore z for distance check
            selfOriginNoZ = (self.origin[0], self.origin[1], 0);
            zoneOriginNoZ = (level.zone.origin[0], level.zone.origin[1], 0);
            inZone = (distance(selfOriginNoZ, zoneOriginNoZ) < level.zone.currentSize);
            if (inZone && !self.inZone)
            {
                // Entered zone
                self.inZone = true;
                self.hudInStormAlert setText(&"");
                
                // Reset fog
                transitionTime = 0.25;
                self setExpFogForPlayer(
                    level.expFogStruct.density,
                    level.expFogStruct.red,
                    level.expFogStruct.green,
                    level.expFogStruct.blue,
                    transitionTime);
            }
            else if (!inZone)
            {
                if (self.inZone)
                {
                    // Exited zone
                    self.inZone = false;
                    self.hudInStormAlert setText(&"You are in the storm!");
                    
                    density = level.expFogStruct.density * 20;
                    red = 0/255;
                    green = 0/255;
                    blue = 0/255;
                    transitionTime = 0.5;
                    self setExpFogForPlayer(density, red, green, blue, transitionTime);
                }

                if (level.battleOver)
                {
                    wait .05;
                    continue;
                }

                damagePlayer = false;
                if (isDefined(self.lastZoneDamageTime))
                {
                    secondsPassed = msToS(getTime() - self.lastZoneDamageTime);
                    if(secondsPassed > 2)
                        damagePlayer = true;
                }
                else
                {
                    damagePlayer = true;
                }

                if (damagePlayer)
                {
                    iDamage = 5;
                    
                    if(self playerWillDie(iDamage))
                        self dropWeapons();
                        
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
////

//// Skydive
checkPlayerJumped()
{
    self endon("death");
    self endon("spawned_spectator");
    self endon("finalKillcam_start");

    self.hud_jump_parachute = newClientHudElem(self);
    self.hud_jump_parachute.alignX = "center";
    self.hud_jump_parachute.alignY = "middle";
    self.hud_jump_parachute.x = 320;
    self.hud_jump_parachute.y = 40;
    self.hud_jump_parachute.fontScale = 1.2;
    self.hud_jump_parachute setText(&"Press ^1[{+gostand}] ^7to jump");

    for(;;)
    {
        // Force standing
        if(self getStance() != "stand")
            self setStance("stand");
        
        if (self jumpButtonPressed() || isDefined(self.forceJump))
        {
            self.jumped = true;
            
            self.hud_jump_parachute setText(&"");
            
            self.blackScreen = newClientHudElem(self);
            self.blackScreen.alignX = "left";
            self.blackScreen.alignY = "top";
            self.blackScreen.x = 0;
            self.blackScreen.y = 0;
            self.blackScreen.alpha = 0;
            self.blackScreen setShader("black", 640, 480);
            self.blackScreen fadeOverTime(0.25);
            self.blackScreen.alpha = 1;
            wait 0.25;

            anglesBeforeSpawn = self getPlayerAngles();

            wait 0.5;
            
            underPlaneOrigin =
                (level.plane.origin[0],
                level.plane.origin[1] - 700,
                (level.plane.origin[2] - 400));
            
            self spawnPlayer(underPlaneOrigin, anglesBeforeSpawn);
            self.inPlane = false;
            
            self.blackScreen fadeOverTime(0.1);
            self.blackScreen.alpha = 0;
            wait 0.1;
            self.blackScreen destroy();

            self showToPlayer(undefined); // Make player visible to others
            
            self thread checkPlayerDive();

            break;
        }

        wait .05;
    }
}
checkReleasedJumpButton()
{
    self endon("death");
    self endon("spawned_spectator");
    self endon("landed");
    self endon("finalKillcam_start");

    while(self jumpButtonPressed())
        wait .05;
    self.blockParachuteCheck = false;
}
checkPlayerDive()
{
    self endon("death");
    self endon("spawned_spectator");
    self endon("landed");
    self endon("finalKillcam_start");

    self.parachuteEnabled = false;
    self.parachuteDeploymentForced = false;

    thread checkLanded();

    text_hud_jump_parachute_part1 = "Press ^1[{+gostand}] ^7to ";
    text_hud_jump_parachute_part2 = "open";
    text_hud_jump_parachute_part3 = " parachute";
    text_hud_jump_parachute_part_concatenated = text_hud_jump_parachute_part1 + text_hud_jump_parachute_part2 + text_hud_jump_parachute_part3;
    text_hud_jump_parachute_part_concatenated_localized = makeLocalizedString(text_hud_jump_parachute_part_concatenated);
    self.hud_jump_parachute setText(text_hud_jump_parachute_part_concatenated_localized);

    self.blockParachuteCheck = false;

    //PHYSICS VARIABLES
    // Acceleration multiplier (diagonal fall)
    acceleration_skydive_forward = 40;
    acceleration_skydive_onlyLeftRight = 25;
    acceleration_skydive_forwardLeftRight = 35;

    acceleration_parachute_forward = 60;
    acceleration_parachute_onlyLeftRight = 40;
    acceleration_parachute_forwardLeftRight = 50;

    acceleration_parachute_backward = 35;
    acceleration_parachute_backwardLeftRight = 20;

    // Air resistance multiplier (fall slowdown)
    airResistance_skydive_idle = 0.975;
    airResistance_skydive_forward = 0.99;
    airResistance_parachute_idle = 0.85;
    airResistance_parachute_forward = 0.925;

    // Check movements
    for(;;)
    {
        // Force standing // TODO: Make player appear proned/skydiving when parachute is closed
        if(self getStance() != "stand")
            self setStance("stand");

        // Direction keys check
        goingForward = self forwardButtonPressed();
        goingBackward = self backButtonPressed();
        goingLeft = self leftButtonPressed();
        goingRight = self rightButtonPressed();

        if (goingLeft && goingRight)
        {
            // left + right = none
            goingLeft = false;
            goingRight = false;
        }
        if (goingForward && goingBackward)
        {
            // forward + backward = none
            goingForward = false;
            goingBackward = false;
        }

        // Parachute state check
        checkParachute = false;
        if (self jumpButtonPressed() && !self.blockParachuteCheck)
        {
            self.blockParachuteCheck = true;
            thread checkReleasedJumpButton();
            checkParachute = true;
        }
        
        // Force parachute deployment before touching ground/roof
        if (!self.parachuteEnabled && !self.parachuteDeploymentForced)
        {
            trace = bulletTrace(self.origin, self.origin - (0, 0, 8192), false, undefined);
            trace_position_distance = distance(self.origin, trace["position"]);
            //printLnBR("trace_position_distance: " + trace_position_distance);
            if (trace_position_distance < 1200)
            {
                self.parachuteDeploymentForced = true;
                
                self playsound("parachute_open");
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
                // Opened
                self playsound("parachute_open");
                self giveWeapon(level.parachute_deployed_hands);
                self switchToWeapon(level.parachute_deployed_hands);

                self.parachuteEnabled = true;
                self attach(level.model_parachute, "tag_belt_back");

                text_hud_jump_parachute_part2 = "close";
            }
            else
            {
                // Closed
                self takeWeapon(self getCurrentWeapon());
                
                self.parachuteEnabled = false;
                self detach(level.model_parachute, "tag_belt_back");

                text_hud_jump_parachute_part2 = "open";
            }

            // TODO: Check if should update existing localized string instead.
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
            //printLnBR("angles[0] = " + angles[0]);

        }
        
        isLookingUp = false;
        isLookingDown = false;
        if(angles[0] < -30)
            isLookingUp = true;
        else if(angles[0] > 30)
            isLookingDown = true;
        
        // Apply motion effects
        if (self.parachuteEnabled)
        {
            if (goingForward)
            {
                if (isLookingUp) // Prevent acceleration from pushing upward
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
                if (isLookingDown) // Prevent acceleration from pushing upward
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
            
            // Clamp z velocity when parachute is deployed to prevent fall damage death
            maxZVelocity = -700;
            if(newVelocity[2] < maxZVelocity)
                newVelocity = (newVelocity[0], newVelocity[1], maxZVelocity);
        }
        else // Parachute not deployed
        {
            if (goingForward)
            {
                if (isLookingUp) // Prevent acceleration from pushing upward
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
    self endon("finalKillcam_start");
    
    for(;;)
    {
        if (self isOnGround())
        {
            self notify("landed");

            if(isDefined(self.hud_jump_parachute))
                self.hud_jump_parachute destroy();

            // Check landed under map // TODO: Add a trigger death to map instead
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
            
            // If player picked up a weapon when landing, give knife but don't switch to it to let the weapon remain active.
            // calling getCurrentWeapon didn't work for this case (returned parachute even after calling takeWeapon)
            self giveWeapon(level.startWeapon);
            primary = self getWeaponSlotWeapon("primary");
            primaryb = self getWeaponSlotWeapon("primaryb");
            if(primary == "none" && primaryb == "none")
                self switchToWeapon(self getWeaponSlotWeapon("pistol"));
                
            break;
        }

        wait .05;
    }
}
////

updateNumLivingPlayers()
{
    for(;;)
    {
        alivePlayers = 0;
        players = getEntArray("player", "classname");
        for (i = 0; i < players.size; i++)
        {
            player = players[i];
            if(isAlive(player) && player.sessionstate == "playing")
                alivePlayers++;
        }
        
        if(alivePlayers < 10)
            level.hud_numLivingPlayersIcon.x = level.hud_numLivingPlayersCount.x - 28;
        else
            level.hud_numLivingPlayersIcon.x = level.hud_numLivingPlayersCount.x - 36;
            
        level.hud_numLivingPlayersCount setValue(alivePlayers);
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

    delayBeforeEndmap = 2.75;

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
    
    if (alivePlayers.size == 1 || alivePlayers.size == 0)
    {
        hud_battleIsOver = newHudElem();
        hud_battleIsOver.alignX = "center";
        hud_battleIsOver.alignY = "middle";
        hud_battleIsOver.x = 320;
        hud_battleIsOver.y = 35;
        hud_battleIsOver.fontScale = 1.2;
        hud_battleIsOver.font = "bigfixed";
        hud_battleIsOver setText(&"BATTLE IS OVER");
        
        if (alivePlayers.size == 1)
        {
            level.battleOver = true;

            winner = alivePlayers[0];
            winner.hud_victoryRoyale = newClientHudElem(winner);
            winner.hud_victoryRoyale.archived = false;
            winner.hud_victoryRoyale.alignX = "center";
            winner.hud_victoryRoyale.alignY = "middle";
            winner.hud_victoryRoyale.x = 320;
            winner.hud_victoryRoyale.y = 100;
            winner.hud_victoryRoyale.color = (0.26, 1, 0.35);
            winner.hud_victoryRoyale.fontScale = 1.5;
            winner.hud_victoryRoyale.font = "bigfixed";
            winner.hud_victoryRoyale.sort = 2;
            winner.hud_victoryRoyale setText(&"YOU WIN!");
            
            level.winnerName = winner.name;

            // Slow motion effect
            timescale = 0.5;
            setCvar("timescale", timescale);
            waited = 0;
            wait_before_slowmotion = 0.3;
            wait wait_before_slowmotion;
            waited += wait_before_slowmotion;
            for(; timescale < 1; timescale += 0.05)
            {
                wait_during_slowmotion = 0.065 / timescale;
                wait wait_during_slowmotion;

                waited += wait_during_slowmotion;
                //printLnBR("setCvar timescale: " + timescale);
                setCvar("timescale", timescale);
                //printLnBR("wait_during_slowmotion: " + wait_during_slowmotion);
            }
            setCvar("timescale", 1);

            wait delayBeforeEndmap;
            waited += delayBeforeEndmap;
            
            endMap(waited, playerEntity);
        }
        else if (alivePlayers.size == 0)
        {
            level.battleOver = true;

            hud_victoryRoyale = newHudElem();
            hud_victoryRoyale.alignX = "center";
            hud_victoryRoyale.alignY = "middle";
            hud_victoryRoyale.x = 320;
            hud_victoryRoyale.y = 100;
            hud_victoryRoyale.color = level.color_red;
            hud_victoryRoyale.fontScale = 1.5;
            hud_victoryRoyale.font = "bigfixed";
            hud_victoryRoyale setText(&"NO ONE SURVIVED");

            level.noWinner = true;
            wait delayBeforeEndmap;
            endMap(delayBeforeEndmap);
        }
    }
    
    level.checkingVictoryRoyale = false;
}

endMap(timeWaitedAfterDeath, playerEntity)
{
    if (!level.noWinner)
    {
        if(isDefined(playerEntity)) // TODO: Try to display player's camera before he disconnected.
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
            player setClientCvar("cg_objectiveText", &"MPSCRIPT_WINS", level.winnerName + "^7");
        player spawnIntermission();
    }
    wait 3;
    
    /*
    CoD1.1, and maybe above, might have an issue about the server getting stuck on scoreboard after calling exitLevel/map_restart under some circumstances.
    MiscMod seems to have some fix for it, see: https://github.com/cato-a/CoDaM_MiscMod/blob/88d6e7cae513080e30f2599972b67a85fd6e61d1/___CoDaM_MiscMod/codam/miscmod.gsc#L250
    3/25/2026: Trying to stop this issue from occurring
    See IzNoGoD message on Killtube Discord: https://discord.com/channels/429528998868025354/446576898508587009/1486459225357025412
    */
    setCvar("g_gametype", getCvar("g_gametype"));
    setCvar("sv_maprotation", "map " + getCvar("mapname"));
    exitLevel(false);
}

showHitMarker()
{
    self endon("spawned");
    self endon("spawned_spectator");

    if(isDefined(self.hitMarker))
        self.hitMarker destroy();

    self.hitMarker = newClientHudElem(self);
    self.hitMarker.alignX = "center";
    self.hitMarker.alignY = "middle";
    self.hitMarker.x = 320;
    self.hitMarker.y = 240;
    self.hitMarker.alpha = 1;
    self.hitMarker setShader("gfx/hud/damage_feedback.dds", 24, 24);

    self.hitMarker fadeOverTime(1);
    self.hitMarker.alpha = 0;

    wait 0.30;
    if(isDefined(self.hitMarker))
        self.hitMarker destroy();
}

//// Killcam
setupFinalKillcam(timeWaitedAfterDeath, playerEntity)
{
    viewers = 0;
    players = getEntArray("player", "classname");
    for(i = 0; i < players.size; i++)
    {
        player = players[i];

        if (isDefined(player.killcam))
        {
            // Running normal killcam, stop it
            player notify("killcam_stop");
            player.spectatorclient = -1;
            player.archivetime = 0;
            player removeKillcamElements();
        }
        
        desiredDurationBeforeKill = timeWaitedAfterDeath + 1;
        player thread killcamFinal(playerEntity, timeWaitedAfterDeath, desiredDurationBeforeKill);
        viewers++;
    }
    if(viewers)
        level waittill("finalKillcam_ended");
}

// TODO: Merge killcamNormal() and killcamFinal() later if seeing no issues.
killcamNormal(attackerEntity, timeWaitedAfterDeath, totalDurationBeforeKill)
{
    self endon("spawned");
    self endon("killcam_stop");

    if (!isPlayer(attackerEntity))
    {
        //printLnBR("killcam: !isPlayer(attackerEntity)");
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
        self.kc_title.sort = 1;
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
        self.kc_skiptext.sort = 1;
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
killcamFinal(attackerEntity, timeWaitedAfterDeath, totalDurationBeforeKill)
{
    self notify("finalKillcam_start");

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
        self.kc_title.y = 10;
        self.kc_title.alignX = "center";
        self.kc_title.alignY = "middle";
        self.kc_title.sort = 1;
        self.kc_title.fontScale = 1.8;
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
    
    wait self.archivetime;

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
////

//// Quick chat
quickCommands(response)
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
quickStatements(response)
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
quickResponses(response)
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
////

//// Utils
printLnBR(message)
{
    printLn("###### [BR] " + message);
}

model()
{
    self detachAll();
    switch(self.pers["camouflage"])
    {
        case "american":

            mptype\american_airborne::main();

            break;
        
        case "british":
        
            if (randomInt(2) == 0)
            {
                mptype\british_airborne::main();
            }
            else
            {
                mptype\british_commando::main();
            }
            
            break;

        case "german":
        
            randomInt = randomInt(5);
            if (randomInt == 0)
            {
                mptype\german_fallschirmjagercamo::main();
            }
            else if (randomInt == 1)
            {
                mptype\german_fallschirmjagergrey::main();
            }
            else if (randomInt == 2)
            {
                mptype\german_kriegsmarine::main();
            }
            else if (randomInt == 3)
            {
                mptype\german_waffen::main();
            }
            else if (randomInt == 4)
            {
                mptype\german_wehrmacht::main();
            }
        
            break;

        case "russian":

            if (randomInt(2) == 0)
            {
                mptype\russian_conscript::main();
            }
            else
            {
                mptype\russian_veteran::main();
            }
        
            break;
    }
}

randomPrimary()
{
    random = [];
    random[random.size] = "mpweapon_mosinnagant";
    random[random.size] = "mpweapon_mosinnagantsniper";
    random[random.size] = "mpweapon_kar98k";
    random[random.size] = "mpweapon_kar98k_scoped";
    random[random.size] = "mpweapon_enfield";
    random[random.size] = "mpweapon_springfield";
    random[random.size] = "mpweapon_m1carbine";
    random[random.size] = "mpweapon_m1garand";
    random[random.size] = "mpweapon_ppsh";
    random[random.size] = "mpweapon_thompson";
    random[random.size] = "mpweapon_mp40";
    random[random.size] = "mpweapon_sten";
    random[random.size] = "mpweapon_mp44";
    random[random.size] = "mpweapon_bar";
    random[random.size] = "mpweapon_bren";
    random[random.size] = "mpweapon_fg42";
    random[random.size] = "mpweapon_panzerfaust";
    return random[randomInt(random.size)];
}
randomSecondary()
{
    random = [];
    random[random.size] = "mpweapon_colt";
    random[random.size] = "mpweapon_luger";
    return random[randomInt(random.size)];
}
randomGrenade()
{
    random = [];
    random[random.size] = "mpweapon_stielhandgranate";
    random[random.size] = "mpweapon_russiangrenade";
    random[random.size] = "mpweapon_mk1britishfrag";
    random[random.size] = "mpweapon_fraggrenade";
    return random[randomInt(random.size)];
}
randomHealth()
{
    random = [];
    random[random.size] = "item_health";
    random[random.size] = "item_health_large";
    return random[randomInt(random.size)];
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

playerWillDie(damage)
{
    if((self.health - damage) <= 0)
        return true;
    return false;
}

dropWeapons()
{
    // Calling this func in Callback_PlayerKilled seems to late.
    
    primary = self getWeaponSlotWeapon("primary");
    primaryb = self getWeaponSlotWeapon("primaryb");
    pistol = self getWeaponSlotWeapon("pistol");
    grenade = self getWeaponSlotWeapon("grenade");
    
    if(primary != level.parachute_deployed_hands)
        self dropItem(primary);
    self dropItem(primaryb);
    if(pistol != level.startWeapon)
        self dropItem(pistol);
    self dropItem(grenade);
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

msToS(ms)
{
    return ms / 1000.0; // Using ".0" or would lose precision (would always return int if ms was int)
}

addBotClients()
{
    numBots = getCvarInt("br_numBots");
    if (numBots)
    {
        wait getCvarInt("sv_reconnectlimit");
        for(i = 0; i < numBots; i++)
            bot[i] = addTestClient();
    }
}
////