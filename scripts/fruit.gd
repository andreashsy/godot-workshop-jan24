class_name Fruit
extends Area2D

enum FRUITS {
    Apple,
    Banana,
    Melon
}

const FRUIT_NAMES = ["apple", "banana", "melon"]

@export var fruit: FRUITS
@export var points: int = 3

@onready var animated_sprite_2d = $AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
    var anim = FRUIT_NAMES[fruit]
    animated_sprite_2d.play(anim)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass


func _on_body_entered(body):
    animated_sprite_2d.play("collected")
    await animated_sprite_2d.animation_finished
    queue_free()
