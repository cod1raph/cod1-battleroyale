# CoD 1.1 Battle Royale gametype

Some features are:
- Shrinking zone
- Skydive from plane
- Last kill slow motion

---
---

## Setup notes

Your server needs to run iw1x-server, see [this tutorial](https://github.com/cod1raph/cod1-tutorials/blob/main/Setup%20iw1x-server.md).

You will have to create 3 pk3 files:
- One containing the content of the `assets` folder
- One containing the content of the `gametype` folder, except `br.cfg`
- One containing the content of the `map` folder

See this tutorial about managing pk3 files: [Manage pk3 files](https://github.com/cod1raph/cod1-tutorials/blob/main/Manage%20pk3%20files.md).

`br.cfg` should be put in your main folder, and you should add `exec br.cfg` in your usual cfg file.

Only the assets and map pk3 should be downloaded by the client.  
The gametype pk3 should have priority over the assets pk3, because they both contain a `br.gsc` file.

g_gametype: `br`  
mapname: `zh_elusive`

---
---
---

### References
- https://github.com/cato-a/CoDaM_MiscMod
- [Killtube](https://killtube.org/)
- https://www.ibuddie.at/libcod/index.html
- https://github.com/BraXi/CoD1_Zombies_1.2_Mod/blob/master/client/xmodel/bx_parachute
- https://gitlab.com/kazam0180/cod1-battleroyale/-/blob/main/client/weapons/mp/br_parachute_mp
- https://vcodmods.com/maps/zh_elusive-battle-royal-template-
- https://github.com/thegoog1337
- https://github.com/hBrutal
