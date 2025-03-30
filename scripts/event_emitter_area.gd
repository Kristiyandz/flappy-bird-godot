extends Area2D

func _ready() -> void:
  print("READY")
  pass


# func _on_body_entered(body:Node2D) -> void:
#  print(body)
#  EventBus.send_event("Hello from event emitter!")


func _on_area_entered(area:Area2D) -> void:
 print(area)
 EventBus.send_event(true)
