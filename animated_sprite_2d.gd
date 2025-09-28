extends CharacterBody2D

const GRAVITY: int = 4200
const JUMP_SPEED: int = -1800

# Called every physics frame
func _physics_process(delta):
	# Apply gravity
	velocity.y += GRAVITY * delta

	if is_on_floor():
		if not false:
			$AnimatedSprite2D.play("idle")
		else:
			$RunCol.disabled = false  # Enable collision
			# Jump
			if Input.is_action_just_pressed("ui_accept"):
				velocity.y = JUMP_SPEED
				$AnimatedSprite2D.play("jump")  # Play jump animation
				# $JumpSound.play()  # Uncomment if you have a jump sound
			# Duck
			elif Input.is_action_pressed("ui_down"):
				$AnimatedSprite2D.play("duck")
				$RunCol.disabled = true  # Disable collision to duck under obstacles
			# Run
			else:
				$AnimatedSprite2D.play("run")
	else:
		# In-air animation
		$AnimatedSprite2D.play("jump")
	
	# Move the player and handle collisions
	move_and_slide()
