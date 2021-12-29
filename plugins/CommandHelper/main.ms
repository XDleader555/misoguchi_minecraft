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

# Echo out a server greeting to the console
# console('Welcome to this server, which is running CommandHelper! (Change this message in plugins/CommandHelper/main.ms)');

# Bind an event to the player join, and tell ops hello.
# We send in @server_name, so we can use it inside the event handler
bind('player_join', null, null, @event, @server_name) {
	# Check if the player has build permissions
	if(!has_permission($player, 'commandhelper.motd')) {
		msg(color('DARK_RED').'==-------------------------------------------------==');
		msg(color('PLAIN_WHITE').'Welcome '.color('GOLD').player());
		msg(color('PLAIN_WHITE').'You are currently '.color('RED').color('BOLD').'NOT WHITELISTED');
		msg(color('PLAIN_WHITE').'Your actions will be limited until you are whitelisted');
		die(color('DARK_RED').'==-------------------------------------------------==');
	}
}
