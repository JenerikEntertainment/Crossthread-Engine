extends Control

@export var saveLoadMenu : Control
@export var fileList : ItemList

@onready var playersParent : Node = get_parent().get_parent()

var newFileButtonIndex : int = 0

var saveFileList = []
var saveFileListNames = []

var saveMode = false

# Called when the node enters the scene tree for the first time.
func _ready():
	closeSaveLoadMenu()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func openSaveLoadMenu() :
	saveLoadMenu.show()
	saveLoadMenu.set_process(true)
	add_child(saveLoadMenu)
	
	
func openSaveMenu() :
	saveMode = true
	openSaveLoadMenu()
	saveLoadMenu.get_child(1).text = "Choose file to save"
	
	fileList.clear()
	
	newFileButtonIndex = fileList.add_item("New Save Game (+)")
	
	loadSavedFilesToList()
	
func openLoadMenu() :
	saveMode = false
	openSaveLoadMenu()
	saveLoadMenu.get_child(1).text = "Choose file to load"
	
	fileList.clear()
	loadSavedFilesToList()
	
func closeSaveLoadMenu() :
	saveLoadMenu.hide()
	saveLoadMenu.set_process(false)
	#saveLoadMenu.queue_free()
	
func closeWholeMenu() :
	closeSaveLoadMenu()
	%SaveDataUI.visible = false
	%SaveDataUI	.set_process(false)
	get_tree().paused = false


func loadSavedFilesToList() :
	#print(OS.get_data_dir())
	DirAccess.make_dir_absolute("user://saves")
	
	var savesDir = DirAccess.open("user://saves")
	
	savesDir.list_dir_begin()
	
	var fileName = savesDir.get_next()
	
	saveFileListNames.clear()
	saveFileList.clear()
	
	#iterate through the file list with I
	while fileName != "" :
		var file = FileAccess.open("user://saves/" + fileName, FileAccess.READ)
		saveFileList.push_back(file.get_var())
		file.close()
		
		saveFileListNames.push_back(fileName) #separate array keeps track of file names to tie them to list index numbers
		fileList.add_item(fileName)
		
		fileName = savesDir.get_next()
		
	
	#print(saveFileList.size())
	savesDir.list_dir_end()
	
func createNewSaveFile(index) :
	var saveData = {}
	
	for playerChild in GameUtil.get_all_children(playersParent) :
		if playerChild.has_method("OnSave") :
			saveData = playerChild.OnSave(saveData)
	
	var fileName = str("save_game_", index,".dat")
	
	if(index < saveFileListNames.size()) :
		fileName = saveFileListNames[index]
	
	var file = FileAccess.open("user://saves/"+fileName, FileAccess.WRITE)
	
	file.store_var(saveData)
	file.close()
	
	print("Game Saved")

func loadSavedData(loadedData) :
	for playerChild in GameUtil.get_all_children(playersParent) :
		if playerChild.has_method("OnLoad") :
			playerChild.OnLoad(loadedData)

func _on_file_list_item_clicked(index, at_position, mouse_button_index):
	if not saveMode :
		var loadedData = saveFileList[index]
		loadSavedData(loadedData)
	else :
		if index == 0 :
			createNewSaveFile(saveFileList.size())
		else :
			createNewSaveFile(index-1)
	
	hide()
	set_process(false)
	await get_tree().create_timer(0.1).timeout
	closeSaveLoadMenu()
	get_tree().paused = false
