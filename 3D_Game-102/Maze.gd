extends Node
# Creat a Maze

# F: Floor
# W: Wall
# P: Player
# G: Goal
# D: Dummy

var rng = RandomNumberGenerator.new()
var Temp


func _ready():
	pass


func maze_C(MZ_x, MZ_y):
	rng.randomize()
	var h = MZ_x
	var w = MZ_y
	if w < 9:
		w = 9
	if h < 9:
		h = 9
	if w % 2 == 0:
		w = w - 1
	if h % 2 == 0:
		h = h - 1
	var maze = []
	for y in range(h):
		maze.append([])
		maze[y] = []
		for x in range(w):
			maze[y].append([])
			maze[y][x] = "D"
	for y in range(h):
		for x in range(w):
			if (y == 0 or y == h - 1 or x == 0 or x == w - 1):
				maze[y][x] = "W"
			elif (y % 2 == 0 and x % 2 == 0):
				maze[y][x] = "W"
			else:
				maze[y][x] = "F"

	for y in range(2, h - 2, 2):
		for x in range(2, w - 2, 2):
			var n
			if (y == 2):
				if (maze[y][x - 1] == "W"):
					n = rng.randi_range(0, 3)
				else:
					n = rng.randi_range(0, 4)
			else:
				if (maze[y][x - 1] == "W"):
					n = rng.randi_range(1, 3)
				else:
					n = rng.randi_range(1, 4)

			match n:
				0:
					maze[y - 1][x] = "W"
				1:
					maze[y][x + 1] = "W"
				2:
					maze[y + 1][x] = "W"
				_:
					maze[y][x - 1] = "W"

	maze[0][1] = "G"
	maze[h - 1][w - 2] = "P"

	return maze


func maze_D(MZ_x, MZ_y):
	rng.randomize()
	var h = MZ_x
	var w = MZ_y
	if w < 9:
		w = 9
	if h < 9:
		h = 9
	if w % 2 == 0:
		w = w - 1
	if h % 2 == 0:
		h = h - 1
	var maze = []
	var moves = []
	for y in range(h):
		maze.append([])
		maze[y] = []
		for x in range(w):
			maze[y].append([])
			maze[y][x] = "W"
	var posX = 1
	var posY = 1
	maze[posX][posY] = "F"
	moves.append(posY + posY * w)
	while (moves.size()):
		var possibleDirections = ""
		if((posX + 2 > 0) and (posX + 2 < h - 1) and (maze[posX + 2][posY] == "W")):
			possibleDirections += "S"
		if((posX - 2 > 0) and (posX - 2 < h - 1) and (maze[posX - 2][posY] == "W")):
			possibleDirections += "N"
		if((posY - 2 > 0) and (posY - 2 < w - 1) and (maze[posX][posY - 2] == "W")):
			possibleDirections += "W"
		if((posY + 2 > 0) and (posY + 2 < w - 1) and (maze[posX][posY + 2] == "W")):
			possibleDirections += "E"
		if(possibleDirections.length() ):
			var move = rng.randi_range(0, possibleDirections.length() - 1)
			match possibleDirections[move]:
				"N":
					maze[posX - 2][posY] = "F"
					maze[posX - 1][posY] = "F"
					posX -= 2;
				"S":
					maze[posX + 2][posY] = "F"
					maze[posX + 1][posY] = "F"
					posX += 2;
				"W":
					maze[posX][posY - 2] = "F";
					maze[posX][posY - 1] = "F";
					posY -= 2;
				"E":
					maze[posX][posY + 2] = "F"
					maze[posX][posY + 1] = "F"
					posY += 2;
			moves.append(posY + posX * w)
		else:
			var back = moves[-1]
			Temp = moves.resize(moves.size() - 1)
			posX = floor(back / w)
			posY = int(back) % int(w)

	maze[h - 1][w - 2] = "P"
	maze[0][1] = "G"

	return maze

