extends Node

var symbols := "1234567890abcdefqw.rt@yu*iopAsBgC)D[E]FhERRYHGDl^VXC&zsDFxvnmSC,:!#aSD$%(FW{}-+=$@#)_%@#+%_@#$*()(%%$%)"

var last_time := 0.0

func pick_random_symbol(percentage: float) -> String:
	randomize()
	var size = int(symbols.length() * percentage)
	if size == 0:
		return symbols[0]
	return symbols[randi() % size]


func pick_random_string(percentage: float, length: int) -> String:
	var res = ""
	for i in range(length):
		res += pick_random_symbol(percentage)
	return res
