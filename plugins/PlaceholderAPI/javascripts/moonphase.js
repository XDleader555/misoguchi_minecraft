var player = BukkitPlayer;

phases = [
  "Full Moon",
  "Waning Gibbous",
  "Third Quarter",
  "Waning Crescent",
  "New Moon",
  "Waxing Crescent",
  "First Quarter",
  "Waxing Gibbous"
]

function moonphase() {
  slimeChunk = player.getLocation().getChunk().isSlimeChunk()
  return phases[Math.floor(player.getWorld().getFullTime()/24000%8)] + (slimeChunk ? "&2" : "&f") + " ☽&f"
}

moonphase();