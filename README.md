# CoD 1.1 Battle Royale gametype

Some features are:
- Shrinking zone
- Skydiving
- Weapon crates
- Last kill slow motion

---
---

## Setup notes

Your server needs to run [iw1x-server](https://github.com/cod1raph/iw1x-server-r), see [this tutorial](https://github.com/cod1raph/cod1-tutorials/blob/main/Setup%20iw1x-server.md).  
Ensure to use the latest release when updating the gametype from this repo.

You will have to create 5 pk3 files:
- One containing the content of `client/other`
- One containing the content of `client/weapons`
- One containing the content of `client/zone`
- One containing the content of `server`, except `br.cfg`
- One containing the content of `common/map` , except `source`

See this tutorial about managing pk3 files: [Manage pk3 files](https://github.com/cod1raph/cod1-tutorials/blob/main/Manage%20pk3%20files.md).

`br.cfg` should be put in your main folder, and you should add `exec br.cfg` in your usual cfg file.

All the pk3 files should be downloaded by the client, except the server pk3.  
The server pk3 should have priority over the pk3 made using files fom `client/other`, because they both contain a `br.gsc` file.

Use `fs_game` and put all the pk3 in the directory to avoid conflicts with other servers that would use the same gametype.

g_gametype: `br`  
mapname: `zh_elusive`

---
---
---

### References
- https://github.com/cato-a/CoDaM_MiscMod
- [Killtube](https://killtube.org/)
- https://www.ibuddie.at/libcod/index.html
- https://github.com/BraXi/CoD1_Zombies_1.2_Mod/tree/master/client
- https://gitlab.com/kazam0180/cod1-battleroyale/-/blob/main/client/weapons/mp/br_parachute_mp
- https://vcodmods.com/maps/zh_elusive-battle-royal-template-
- [CoD1 Radiant Tutorials by TheGoog](https://www.youtube.com/playlist?list=PLb5ihZo7ved010imAmoZxa5C5946Oi-9z)
- [CoDRadiant Beginner Tutorials by zilch (Oct 24, 2024)](https://www.youtube.com/@hcliz/videos)
- https://github.com/thegoog1337
- https://github.com/hBrutal
