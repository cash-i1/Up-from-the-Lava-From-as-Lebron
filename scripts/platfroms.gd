extends Node2D

@onready var animation = $platform7/AnimationPlayer
# Called when the node enters the scene tree for the first time.
func _ready():
	animation.play("move")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
