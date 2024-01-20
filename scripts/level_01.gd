extends Node2D


func _on_dead_zone_body_entered(body):
    print("entered dead zone: ", body)
    get_tree().reload_current_scene()
