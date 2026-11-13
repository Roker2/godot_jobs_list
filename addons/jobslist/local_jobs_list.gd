extends Node
class_name LocalJobsList

## Local jobs list class
##
## It generates number of jobs, just picks rundom jobs from source.

## Source of all jobs
@export var jobs_source: AllJobsList

## Number of chosen jobs
@export var number_of_jobs: int

var available_jobs: Array[Job] = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var indecies := []
	var filtered_jobs := _get_filtered_jobs()
	var all_jobs_size := filtered_jobs.size()
	var clamped_jobs_size := mini(all_jobs_size, number_of_jobs)

	if clamped_jobs_size == 0:
		return

	for i in range(clamped_jobs_size):
		var index: int
		var job: Job
		while true:
			index = randi_range(0, all_jobs_size - 1)
			if !indecies.has(index):
				job = filtered_jobs.get(index)
				break
		indecies.append(index)
		available_jobs.append(job)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


# Filter, which can be overrided in subclass.
func _filter(job: Job) -> bool:
	return true


# Just run all jobs via filter.
func _get_filtered_jobs() -> Array[Job]:
	var filtered_jobs: Array[Job] = []
	for job in jobs_source.all_jobs:
		if _filter(job):
			filtered_jobs.append(job)
	return filtered_jobs
