extends StaticBody2D

@onready var player = $"../../player"

# Called every frame. 'delta' is the elapsed time since the previous frame.

func _on_collider_body_entered(body):
	if body == player:
		pass

