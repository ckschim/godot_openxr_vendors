extends Node3D

var xr_interface : XRInterface = null
var scene_capture: OpenXRFbSceneCaptureExtensionWrapper = null

# Called when the node enters the scene tree for the first time.
func _ready():
	xr_interface = XRServer.find_interface("OpenXR")
	if xr_interface and xr_interface.is_initialized():
		var vp: Viewport = get_viewport()
		vp.use_xr = true
		
	scene_capture = OpenXRFbSceneCaptureExtensionWrapper.get_singleton()
	scene_capture.connect("scene_capture_completed", _on_scene_capture_completed)


func _on_scene_capture_completed():
	print("Scene Capture completed")


func _on_left_hand_button_pressed(name):
	if name == "menu_button" and scene_capture:
		print("Triggering scene capture")
		scene_capture.request_scene_capture()
