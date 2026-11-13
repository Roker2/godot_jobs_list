extends TextEdit

# Just local jobs.
@export var local_jobs: LocalJobsList


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for job: Job in local_jobs.available_jobs:
		text += job.job_name + "\n"
