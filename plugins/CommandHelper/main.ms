######################################################
#
#   Sample Main file. This file is run when the server
#   starts up, or the plugin is reloaded. It can be used
#   as an opportunity to register events or do other things
#   when the server initially starts. Variables defined here
#   will go out of scope, so you can't assign something and
#   then use it in a command, for instance.
#
######################################################

@server_name = 'MisoguchiMC';
@whitelist_permission = 'essentials.motd';

# Echo out a server greeting to the console
# console('Welcome to this server, which is running CommandHelper! (Change this message in plugins/CommandHelper/main.ms)');

# Bind an event to the player join, and tell ops hello.
# We send in @server_name, so we can use it inside the event handler
bind('player_join', null, null, @event, @server_name, @whitelist_permission) {
	# Check if the player has build permissions
	if(!has_permission(player(), @whitelist_permission)) {
		msg(color('DARK_RED').'==-------------------------------------------------==');
		msg(color('PLAIN_WHITE').'Welcome '.color('GOLD').player());
		msg(color('PLAIN_WHITE').'You are currently '.color('RED').color('BOLD').'NOT WHITELISTED');
		msg(color('PLAIN_WHITE').'Your actions will be limited until you are whitelisted');
		die(color('DARK_RED').'==-------------------------------------------------==');
	}
}

# afk players who enter a bed
bind('player_enter_bed', null, null, @event) {
	if(@event['result'] == 'OK') {
		runas(player(), /afk);
		msg("yeet");
	}
}

# Protect certain entitites
bind('entity_damage', null, null, @event) {
	if(@event['id'] == 'c88f325e-4dc9-48fe-904b-1f2552503d4f') {
		#cancel(@event);
		# Use the following for protection instead: /data merge entity UUID {Invulnerable: 1}

		# Send a message to the player who hit the entitiy
		if(length(@event['damager']) <= 16) {
			tmsg(@event['damager'], '&9Immortal Object.');
		}
	}
}


# Prevent guests from dealing damage
bind('entity_damage', null, array(cause: 'ENTITY_ATTACK', 'PROJECTILE'), @event, @whitelist_permission) {
	if(length(@event['damager']) <= 16) {
		if(!has_permission(@event['damager'], @whitelist_permission)) {
			cancel(@event);
			msg(color('DARK_RED').'You are not permitted to deal damage.');
		}
	}
}

bind('player_chat', null, null, @event) {
	if(string_contains_ic(@event['message'], 'frick')) {
		cancel(@event);
		pkick(player(), "This is a Christian minecraft server!");
		runas('~console', '/say '.player().' has been kicked for saying the unthinkable');
	}
}

// bind('player_interact_at_entity', null, null, @event) {
// 	console(@event);
// }