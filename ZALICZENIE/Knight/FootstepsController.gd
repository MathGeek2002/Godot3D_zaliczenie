extends AudioStreamPlayer


export(AudioStreamMP3) var footstep0
export(AudioStreamMP3) var footstep1
export(AudioStreamMP3) var footstep2
export(AudioStreamMP3) var footstep3
export(AudioStreamMP3) var footstep4


var footsteps = [AudioStreamMP3]

func _ready():
	footsteps = [footstep0, footstep1, footstep2, footstep3, footstep4]


func play_footstep():
	self.stream = footsteps[randi() % footsteps.size()]
	play()
