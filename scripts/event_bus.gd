extends Node

signal add_tile(event_data)

func send_event(data):
    emit_signal("add_tile", data)
