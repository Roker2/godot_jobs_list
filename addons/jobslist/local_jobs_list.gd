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
	var all_jobs_size := jobs_source.all_jobs.size()
	for i in range(number_of_jobs):
		var index := randi_range(0, all_jobs_size - 1)
		while indecies.find(index) != -1:
			index = randi_range(0, all_jobs_size - 1)
		indecies.append(index)
	
	for index in indecies:
		available_jobs.append(jobs_source.all_jobs.get(index))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
