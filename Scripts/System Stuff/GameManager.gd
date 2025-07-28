class_name GameManager
extends Node

var peer = ENetMultiplayerPeer.new()

@export var player_scene: PackedScene
@export var networkNode: Node

static var playerControls : AbsPlayerController

# Called when the node enters the scene tree for the first time.
func _ready():
	playerControls = $"../../SceneStuff/PlayerControls"
	peer.create_server(7000)
	multiplayer.multiplayer_peer = peer
	multiplayer.peer_connected.connect(_add_player)
	_add_player()


func _add_player(id = 1) :
	var player = player_scene.instantiate()
	#assign player to playercontrols
	$"../../SceneStuff/PlayerControls".mainPlayer = player
	#var rng = RandomNumberGenerator.new()
	#player.position.x = rng.randf_range(-10.0, 10.0)
	player.name = str(id)
	networkNode.add_child(player)
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
