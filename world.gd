extends Node2D

var mat

var season = 1
var place = 2

var anaglyph = true

func _ready():
	mat = $sprite.get_material()
	load_anaglyph()
	load_panorama()
	pass

var speed = Vector2(48 / 3.4, 0) * 3

func _input(event):
	if event.is_action("ui_left"):
		position += speed
	if event.is_action("ui_right"):
		position -= speed
	if event.is_action_pressed("ui_page_up"):
		season += 1
		load_panorama()
	if event.is_action_pressed("ui_page_down"):
		season -=1
		load_panorama()
	if event.is_action_pressed("ui_up"):
		place += 1
		load_panorama()
	if event.is_action_pressed("ui_down"):
		place -=1
		load_panorama()
	if event.is_action_pressed("ui_home"):
		anaglyph = !anaglyph
		load_anaglyph()
	pass

func load_anaglyph():
	mat.set_shader_param("anaglyph", anaglyph)
	pass

func load_panorama():
	var season_string = "%03d" % season
	var place_string = "%03d" % place

	# ~/.local/share/godot/app_userdata/village_test/
	var base = "user://001_pictures/2021_" + season_string + "_" + place_string + "_"
	var left_picture = base + "l.jpg"
	var right_picture = base + "r.jpg"
	print("Loading: " + left_picture)
	print("Loading: " + right_picture)
	mat.set_shader_param("left_camera", load_jpg(left_picture))
	mat.set_shader_param("right_camera", load_jpg(right_picture))
	pass

func load_jpg(file):
	var jpg_file = File.new()
	jpg_file.open(file, File.READ)
	var bytes = jpg_file.get_buffer(jpg_file.get_len())
	var img = Image.new()
	var data = img.load_jpg_from_buffer(bytes)
	var imgtex = ImageTexture.new()
	imgtex.create_from_image(img)
	jpg_file.close()
	return imgtex
