extends AnimationTree

export(String) var time_scale_property

func deactivate():
	set(time_scale_property, 0)	
