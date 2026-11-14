extends CharacterBody2D

@onready var sprite: AnimatedSprite2D = $Sprite
#@onready var jump_sfx: AudioStreamPlayer = %"Jump SFX"
#@onready var bounce_sfx: AudioStreamPlayer = %"Bounce SFX"

const jump_velocity = -933.3
const max_speed = 500
const acceleration = 300
const friction = 100
const min_speed = 150

const gravity = 2500

var last_output = "Placeholder String"

var direction = 0
var jumping = false
var bouncing = false
var trick_bounce = false
var falling = false
var sprite_offset_check = false
var spindash_press = 0
var facing = 1

func _physics_process(delta: float) -> void:
	if !is_on_floor():
		velocity += get_gravity() * delta
	
	direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = move_toward(velocity.x, direction * max_speed, acceleration * delta)
	elif abs(velocity.x) > min_speed:
		velocity.x = direction * min_speed
	else:
		velocity.x = move_toward(velocity.x, 0, friction * delta)
		
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y = jump_velocity
			sprite.play("jump")
			jumping = true
			#jump_sfx.play()
			
	if Input.is_action_just_released("jump") and velocity.y < 0:
		velocity.y *= 0.5
		
	move_and_slide()
		
	if is_on_floor():
		if jumping:
			jumping = false
		if falling:
			falling = false
	
	if facing == 1:
		sprite.flip_h = false
	elif facing == -1:
		sprite.flip_h = true
	
	if is_on_floor():
		if velocity.x < -10 and direction < 0:
			facing = -1
			sprite.flip_h = true
		elif velocity.x > 10 and direction > 0:
			facing = 1
			sprite.flip_h = false
	if !is_on_floor():
		if direction < 0:
			facing = -1
			sprite.flip_h = true
		elif direction > 0:
			facing = 1
			sprite.flip_h = false
	
func _on_sprite_frame_changed() -> void:
	if !sprite:
		return # safety check
