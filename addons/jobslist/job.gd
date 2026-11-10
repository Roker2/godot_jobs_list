extends Resource
class_name Job

## Job class
##
## Describe job characteristics

## Job name, how it calls
@export var job_name: String

## Job description
@export var job_description: String

## How much it will cost for player
@export var required_energy: int

## How much time it requires for player
@export var required_time: int

## Additional custom properties
@export var properties: Dictionary

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func to_dict() -> Dictionary:
	return {
		"job_name": job_name,
		"job_description": job_description,
		"required_energy": required_energy,
		"required_time": required_time,
		"properties": properties
	}


static func create_from_dict(data: Dictionary) -> Job:
	var job := Job.new()
	job.job_name = data.get("job_name")
	job.job_description = data.get("job_description")
	job.required_energy = data.get("required_energy")
	job.required_time = data.get("required_time")
	job.properties = data.get("properties")
	return job
