extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal door_opened
var isNearDoor = false
onready var doorTiles: TileMap = get_node("DoorSprite")
onready var doorCollision: TileMap = get_node("DoorCollision")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if isNearDoor:
		if Input.is_action_just_pressed("Interact"):
			emit_signal("door_opened")
			#TODO: (AUDIO) Play Door sounds here
			get_node("DoorArea/DoorCollision").queue_free()
			doorTiles.set_cell(0, 0, 1)
			#Enable this if the door isn't refreshing 
			#doorTiles.update_dirty_quadrants()
		#else:
			#The door won't do anything.
	
func _on_DoorArea_body_entered(_body):
	isNearDoor = true


func _on_DoorArea_body_exited(_body):
	isNearDoor = false
