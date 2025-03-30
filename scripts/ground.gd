extends Area2D

@export var speed = 10
@onready var tilemap_layer: TileMapLayer = $TileMapLayer
@onready var collision_shape: CollisionShape2D = $CollisionShape2D

func _ready() -> void:
	EventBus.connect("add_tile", _ground_detected, 0)

func _process(delta: float) -> void:
	position.x -= speed * delta

func _ground_detected(_event_data):
	# Assume tilemap_layer is your TileMap node
	# Determine the rightmost column currently in use.
	var used_cells = tilemap_layer.get_used_cells()  # returns an array of Vector2i for occupied cells
	print(used_cells)
	var max_x = -10000  # start with a very low number
	for cell in used_cells:
			if cell.x > max_x:
					max_x = cell.x

	# Now add a new cell one column to the right, at row 0 for instance.
	var new_cell = Vector2i(max_x + 1, 1)
	var tile_id = 0              # Make sure this is the tile you want
	var atlas_region = Vector2i(0, 5)  # Use the correct region from your atlas, if applicable
	var flip_flags = 0
	var leftmost_cell = used_cells[0]

	tilemap_layer.set_cell(new_cell, tile_id, atlas_region, flip_flags)
	tilemap_layer.set_cell(leftmost_cell, -1, Vector2i.ZERO, 0)
	collision_shape.position.x += 16 # move the collision by 16px to the right to trigger the collision
