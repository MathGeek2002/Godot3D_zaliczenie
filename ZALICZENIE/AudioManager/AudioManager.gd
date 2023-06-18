extends Node

var isPlaying = false

func _ready():
	
	GlobalSignals.connect("onBossBattleStart",self, "play_boss_battle_music")
	GlobalSignals.connect("onBossDie", self, "turn_off_boss_battle_music")
	
func play_boss_battle_music():
	
	if isPlaying:
		return
	
	$BossBattleMusic.play()
	
func turn_off_boss_battle_music():
	$BossBattleMusic.stop()
