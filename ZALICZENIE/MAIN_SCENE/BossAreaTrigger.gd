extends Area


var isBattleBegined = false

func _on_BossArea_body_entered(body):
	
	
	if body.is_in_group("player") and not isBattleBegined:
		
		isBattleBegined = true
		
		GlobalSignals.emit_signal("onBossBattleStart")
