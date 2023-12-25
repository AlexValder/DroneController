extends Node

var player_turn := true


func _ready() -> void:
    Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
    switch_player_drone(false)


func _input(event: InputEvent) -> void:
    if event.is_action_released("action"):
        switch_player_drone(player_turn)


func switch_player_drone(turn: bool) -> void:
    var player := get_tree().get_nodes_in_group("player")[0] as Player
    var drone := get_tree().get_nodes_in_group("drone")[0] as Drone

    player_turn = !turn

    player.set_physics_process(player_turn)
    player.set_process_input(player_turn)
    player.set_process_unhandled_input(player_turn)
    player.current_view = player_turn

    drone.set_physics_process(turn)
    drone.set_process_input(turn)
    drone.set_process_unhandled_input(turn)
    drone.current_view = turn
