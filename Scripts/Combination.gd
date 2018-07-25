extends Node

func generate_combination(digits):
	var combination = []
	for i in range(digits):  # not using the index
		randomize()
		combination.append(randi() % 10)

	return combination

# signed_off