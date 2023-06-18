extends ProgressBar



func _ready():
	
	GlobalSignals.connect("onBossValueChange",self, "changeFillAmount")
	GlobalSignals.connect("onBossBattleStart",self, "show_boss_health")
	GlobalSignals.connect("onBossDie", self, "hide_boss_health")
	
	value = 100
	visible = false
	
func changeFillAmount(newValue):
	value = newValue

func show_boss_health():
	visible = true
	
func hide_boss_health():
	visible = false
