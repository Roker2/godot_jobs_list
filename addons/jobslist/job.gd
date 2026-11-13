extends Resource
class_name Job

## Job class.
##
## Describe job characteristics.

## Job name, how it calls.
@export var job_name: String

## Job description.
@export var job_description: String

## How much it will cost for player.
@export var required_energy: int

## How much time it requires for player.
@export var required_time: int

## Additional custom properties.
@export var properties: Dictionary


# Convert the class object to Dictionary.
func to_dict() -> Dictionary:
	return {
		"job_name": job_name,
		"job_description": job_description,
		"required_energy": required_energy,
		"required_time": required_time,
		"properties": properties
	}


# Create the class object from Dictionary.
static func create_from_dict(data: Dictionary) -> Job:
	var job := Job.new()
	job.job_name = data.get("job_name")
	job.job_description = data.get("job_description")
	job.required_energy = data.get("required_energy")
	job.required_time = data.get("required_time")
	var raw_properties = data.get("properties", {})
	if raw_properties is Dictionary:
		job.properties = raw_properties
	else:
		job.properties = {}
	return job
