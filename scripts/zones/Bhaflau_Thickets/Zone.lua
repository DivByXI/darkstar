-----------------------------------
--
-- Zone: Bhaflau_Thickets (52)
--
-----------------------------------
package.loaded["scripts/zones/Bhaflau_Thickets/TextIDs"] = nil;
package.loaded["scripts/globals/chocobo_digging"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/zone");
require("scripts/zones/Bhaflau_Thickets/TextIDs");
require("scripts/globals/chocobo_digging");

-----------------------------------
-- Chocobo Digging vars
-----------------------------------
local itemMap = {
                    -- itemid, abundance, requirement
                    { 770, 50, DIGREQ_NONE },
                    { 2150, 60, DIGREQ_NONE },
                    { 622, 197, DIGREQ_NONE },
                    { 2155, 23, DIGREQ_NONE },
                    { 739, 5, DIGREQ_NONE },
                    { 17296, 133, DIGREQ_NONE },
                    { 703, 69, DIGREQ_NONE },
                    { 2213, 135, DIGREQ_NONE },
                    { 838, 21, DIGREQ_NONE },
                    { 4096, 100, DIGREQ_NONE },
                    { 4097, 100, DIGREQ_NONE },
                    { 4098, 100, DIGREQ_NONE },
                    { 4099, 100, DIGREQ_NONE },
                    { 4100, 100, DIGREQ_NONE },
                    { 4101, 100, DIGREQ_NONE },
                    { 4102, 100, DIGREQ_NONE },
                    { 4103, 100, DIGREQ_NONE },
                    { 1255, 10, DIGREQ_NONE },
                    { 1256, 10, DIGREQ_NONE },
                    { 1257, 10, DIGREQ_NONE },
                    { 1258, 10, DIGREQ_NONE },
                    { 1259, 10, DIGREQ_NONE },
                    { 1260, 10, DIGREQ_NONE },
                    { 1261, 10, DIGREQ_NONE },
                    { 1262, 10, DIGREQ_NONE },
                    { 688, 144, DIGREQ_BURROW },
                    { 702, 14, DIGREQ_BURROW },
                    { 690, 23, DIGREQ_BURROW },
                    { 1446, 3, DIGREQ_BURROW },
                    { 700, 14, DIGREQ_BURROW },
                    { 699, 37, DIGREQ_BURROW },
                    { 701, 28, DIGREQ_BURROW },
                    { 696, 23, DIGREQ_BURROW },
                    { 678, 9, DIGREQ_BORE },
                    { 645, 3, DIGREQ_BORE },
                    { 768, 193, DIGREQ_BORE },
                    { 737, 22, DIGREQ_BORE },
                    { 2475, 3, DIGREQ_BORE },
                    { 738, 3, DIGREQ_BORE },
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

    -- Harvestman
    SetRespawnTime(16990252, 900, 10800);

end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
    local cs = -1;
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(-100,-13.5,-479.514,60);
    end
    return cs;
end;

-----------------------------------
-- afterZoneIn
-----------------------------------

function afterZoneIn(player)
    player:entityVisualPacket("1pb1");
    player:entityVisualPacket("2pb1");
end;

-----------------------------------
-- onRegionEnter
-----------------------------------

function onRegionEnter(player,region)
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;