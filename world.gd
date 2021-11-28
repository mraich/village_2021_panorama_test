extends Node2D

func _ready():
	# var image_left = Image.new()
	# image_left.load('res://2021_002_033_001_l.jpg')

	# var dimension_left = image_left.get_used_rect()
	# var size_left = dimension_left.size
	# var mask_left = generate_img(size_left.x, size_left.y, Color.red)

	# var image = Image.new()
	# image.create(size_left.x, size_left.y, false, Image.FORMAT_RGB8)
	# image.blit_rect_mask(image_left, mask_left, dimension_left, Vector2(0, 0))
	# image.blit_rect(image_left, dimension_left, Vector2(0, 0))

	# var texture = ImageTexture.new()
	# texture.create_from_image(image)
	# $sprite.set_texture(texture)
	pass
	
func generate_img(x, y, color: Color):
	var img = Image.new()
	img.create(x, y, false, Image.FORMAT_RGB8)
	img.fill(color)
	return img
