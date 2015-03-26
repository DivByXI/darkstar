-----------------------------------
--
-- Zone: Konschtat_Highlands (108)
--
-----------------------------------
package.loaded["scripts/zones/Konschtat_Highlands/TextIDs"] = nil;
package.loaded["scripts/globals/chocobo_digging"] = nil;
-----------------------------------

require("scripts/zones/Konschtat_Highlands/TextIDs");
require("scripts/globals/zone");
require("scripts/globals/icanheararainbow");
require("scripts/globals/chocobo_digging");

-----------------------------------
-- Chocobo Digging vars
-----------------------------------
local itemMap = {
                    -- itemid, abundance, requirement
                    { 847, 13, DIGREQ_NONE },
                    { 880, 165, DIGREQ_NONE },
                    { 690, 68, DIGREQ_NONE },
                    { 864, 80, DIGREQ_NONE },
                    { 768, 90, DIGREQ_NONE },
                    { 869, 63, DIGREQ_NONE },
                    { 749, 14, DIGREQ_NONE },
                    { 17296, 214, DIGREQ_NONE },
                    { 844, 14, DIGREQ_NONE },
                    { 868, 45, DIGREQ_NONE },
                    { 642, 71, DIGREQ_NONE },
                    { 4096, 100, DIGREQ_NONE },
                    { 4097, 100, DIGREQ_NONE },
                    { 4098, 100, DIGREQ_NONE },
                    { 4099, 100, DIGREQ_NONE },
                    { 4100, 100, DIGREQ_NONE },
                    { 4101, 100, DIGREQ_NONE },
                    { 4102, 100, DIGREQ_NONE },
                    { 4103, 100, DIGREQ_NONE },
                    { 4099, 147, DIGREQ_BURROW },
                    { 4100, 147, DIGREQ_BURROW },
                    { 845, 28, DIGREQ_BORE },
                    { 842, 27, DIGREQ_BORE },
                    { 843, 23, DIGREQ_BORE },
                    { 1845, 22, DIGREQ_BORE },
                    { 838, 19, DIGREQ_BORE },
					{ 4570, 10, DIGREQ_MODIFIER },
                    { 4487, 11, DIGREQ_MODIFIER },
                    { 4409, 12, DIGREQ_MODIFIER },
                    { 1188, 10, DIGREQ_MODIFIER },
                    { 4532, 12, DIGREQ_MODIFIER },
                };

local messageArray = { DIG_THROW_AWAY, FIND_NOTHING, ITEM_OBTAINED };

-----------------------------------
-- onChocoboDig
-----------------------------------
function onChocoboDig(player, precheck)

    -- Let's get the weather of the zone

    local weather = player:getWeather();

    if (weather ~= nil) then
      if (weather >= 0 and weather <= 4) then
        zoneWeather = "WEATHER_NONE";
      elseif (weather > 4 and weather % 2 ~= 0) then -- If the weather is 5, 7, 9, 11, 13, 15, 17 or 19, checking for odd values
        zoneWeather = "WEATHER_DOUBLE";
      else
        zoneWeather = "WEATHER_SINGLE";
      end
    else
      zoneWeather = "WEATHER_NONE";
    end
    
    return chocoboDig(player, itemMap, precheck, messageArray, zoneWeather);
end;

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
    local manuals = {17220165,17220166};

    SetFieldManual(manuals);
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn( player, prevZone)
    local cs = -1;

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos( 521.922, 28.361, 747.85, 45);
    end

    if (triggerLightCutscene(player)) then -- Quest: I Can Hear A Rainbow
        cs = 0x0068;
    end

    return cs;
end;

-----------------------------------
-- onConquestUpdate
-----------------------------------

function onConquestUpdate(zone, updatetype)
    local players = zone:getPlayers();

    for name, player in pairs(players) do
        conquestUpdate(zone, player, updatetype, CONQUEST_BASE);
    end
end;

-----------------------------------
-- onRegionEnter
-----------------------------------

function onRegionEnter( player, region)
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate( player, csid, option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 0x0068) then
        lightCutsceneUpdate(player); -- Quest: I Can Hear A Rainbow
    end
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish( player, csid, option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 0x0068) then
        lightCutsceneFinish(player); -- Quest: I Can Hear A Rainbow
    end
end;