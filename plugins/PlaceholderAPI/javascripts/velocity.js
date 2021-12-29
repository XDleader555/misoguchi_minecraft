var player = BukkitPlayer;
var key = "%player_velocity%.pos"

function velocity() {
  var newPos = {
    x: player.getLocation().getX(),
    y: player.getLocation().getY(),
    z: player.getLocation().getZ(),
    t: Date.now()
  };

  var oldPos = Data.get(key);
  Data.set(key, newPos);

  dx = newPos.x - oldPos.x;
  dy = newPos.y - oldPos.y;
  dz = newPos.z - oldPos.z;
  dt = newPos.t - oldPos.t;

  return Math.sqrt(dx*dx + dy*dy + dz*dz) / dt * 1000
}

velocity();