extends Node2D

func _ready() -> void:
  pass

func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
 EventBus.send_event("Hello from event emitter!")
