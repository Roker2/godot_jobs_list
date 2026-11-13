@tool
extends Node
class_name AllJobsList

## All jobs list class
##
## It reads jobs from .json file and parse it to ready-to-use objects

## Reread jobs list from JSON
@export_tool_button("Refresh") var refresh_action = refresh

## It writes modified jobs list to JSON file
@export_tool_button("Save") var save_action = save

## Path to JSON file with jobs list
@export_file("*.json") var json_path: String

## Parsed jobs list from JSON file. You can modify it and click "Save"
@export var all_jobs: Array[Job] = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_load_jobs_from_json()


func refresh() -> void:
	_load_jobs_from_json()


func save() -> void:
	var data_to_save := []
	for job: Job in all_jobs:
		data_to_save.append({
			"job_name": job.job_name,
			"job_description": job.job_description,
			"required_energy": job.required_energy,
			"required_time": job.required_time,
			"properties": job.properties
		})
	var json_string = JSON.stringify(data_to_save, "\t")
	var file := FileAccess.open(json_path, FileAccess.WRITE)
	if file == null:
		push_error(error_string(FileAccess.get_open_error()))
		all_jobs = []
		return
	file.store_string(json_string)
	file.close()


func _load_jobs_from_json() -> void:
	if json_path.is_empty():
		push_warning("JSON path is empty")
		all_jobs = []
		return
	
	var file := FileAccess.open(json_path, FileAccess.READ)
	if file == null:
		push_error(error_string(FileAccess.get_open_error()))
		all_jobs = []
		file.close()
		return
		
	var json = JSON.new()
	var error := json.parse(file.get_as_text())
	if error != OK:
		push_error("Failed to parse the json: " + json_path)
		all_jobs = []
		file.close()
		return
	
	var data_received = json.data
	if typeof(data_received) == TYPE_ARRAY:
		var jobs: Array[Job] = []
		for dict: Dictionary in data_received:
			jobs.append(Job.create_from_dict(dict))
		all_jobs = jobs
	else:
		push_error("Expected JSON array")
		all_jobs = []
	file.close()
	
