extends Node

# Tracks if any player is blocked
var any_player_blocked: bool = false
var blocked_players_count: int = 0  # Tracks how many players are currently blocked

# Resets the blocked state
func reset_blocked_state():
	any_player_blocked = false
	blocked_players_count = 0

# Marks a player as blocked
func set_any_player_blocked(value: bool):
	if value:
		blocked_players_count += 1
		any_player_blocked = true

# Reports a player as unblocked
func report_player_unblocked():
	blocked_players_count = max(blocked_players_count - 1, 0)
	if blocked_players_count == 0:
		any_player_blocked = false

# Gets the blocked state
func is_any_player_blocked() -> bool:
	return any_player_blocked
