extends TextEdit

@export var local_jobs: LocalJobsList


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for job: Job in local_jobs.available_jobs:
		text += job.job_name + "\n"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
