extends Node

func generate_combination(digits):
	var combination = []
	var i = 1
	for i in range(digits):
		randomize()
		combination.append(randi() % 10)
		i+=1
	return combination
