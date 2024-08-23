extends Node

var gestureSet : Array

var earlyAbandoning : bool = true
var lowerBounding : bool = true

signal classified_gesture(gestureName : StringName)

#Construct LUT
var maxCoords : int = 1024
var LUTSize : int = 64
var LUTScale : int = maxCoords / LUTSize


func _init() -> void:
	var dir = DirAccess.open("res://gestures")
	if dir:
		dir.list_dir_begin()
		var name = dir.get_next()
		while name != "":
			var rName = "res://gestures/" + str(name)
			gestureSet.append(ResourceLoader.load(rName))
			name = dir.get_next()

func classify(candidate : Gest):
	var minDistance : float = INF
	var gestureClass : StringName = "";
	for template : Gest in gestureSet:
		var dist : float = greedy_cloud_match(candidate, template, minDistance)
		if dist < minDistance:
			minDistance = dist
			gestureClass = template.gestureName
	prints("recognized gesture:", gestureClass)
	classified_gesture.emit(gestureClass)
	return gestureClass

func greedy_cloud_match(gesture1 : Gest, gesture2 : Gest, minSoFar : float):
	var n : int = gesture1.pointsInt.size()
	var eps : float = 0.5
	var step : int = floor(pow(n, 1.0 - eps))
	
	if lowerBounding:
		var LB1 : Array = compute_lower_bound(gesture1, gesture2, gesture2.LUT, step)
		var LB2 : Array = compute_lower_bound(gesture2, gesture1, gesture1.LUT, step)
		
		var indexLB : int = 0
		for i in range(0, n, step):
			if LB1[indexLB] < minSoFar:
				minSoFar = min(minSoFar, cloud_distance(gesture1.pointsInt, gesture2.pointsInt, i, minSoFar))
			if LB2[indexLB] < minSoFar:
				minSoFar = min(minSoFar, cloud_distance(gesture2.pointsInt, gesture1.pointsInt, i, minSoFar))
			indexLB += 1
	else:
		for i in range(0, n, step):
			minSoFar = min(minSoFar, cloud_distance(gesture1.pointsInt, gesture2.pointsInt, i, minSoFar))
			minSoFar = min(minSoFar, cloud_distance(gesture2.pointsInt, gesture1.pointsInt, i, minSoFar))
	
	return minSoFar

func compute_lower_bound(gesture1 : Gest, gesture2 : Gest, LUT, step : int):
	var n : int = gesture1.points.size()
	var LB : Array[float]
	LB.resize(n / step + 1)
	var SAT : Array[float]
	SAT.resize(n)
	
	LB[0] = 0
	
	for i in range(0, n):
		#print(gesture1.pointsInt[i])
		var index : int = LUT[Vector2(int(gesture1.pointsInt[i].x / LUTScale), int(gesture1.pointsInt[i].y / LUTScale) )]
		var dist : float = sq_euclidean_distance(gesture1.points[i], gesture2.points[index])
		if (i == 0):
			SAT[i] = dist
		else:
			SAT[i] = SAT[i-1] + dist
		LB[0] += (n-i) * dist
	
	var indexLB = 1
	
	for j in range(step, n, step):
		LB[indexLB] = LB[0] + j * SAT[n - 1] - n * SAT[j - 1]
		indexLB += 1
	pass
	return LB


func cloud_distance(points1 : Array, points2 : Array, startIndex : int, minSoFar : float): 
	var n : int = points1.size()
	var indexesNotMatched : Array
	indexesNotMatched.resize(n)
	for j in range(0, n):
		indexesNotMatched[j] = j
	
	var sum : float = 0
	var i : int = startIndex
	var weight : int = n
	var indexNotMatched : int = 0
	
	while weight > 0:
		var index : int = -1
		var minDistance : float = INF
		for j in range(indexNotMatched, n):
			var dist : float = sq_euclidean_distance(points1[i], points2[indexesNotMatched[j]])
			if dist < minDistance:
				minDistance = dist
				index = j
		indexesNotMatched[index] = indexesNotMatched[indexNotMatched]
		sum += weight * minDistance
		weight -= 1
		
		if earlyAbandoning:
			if sum >= minSoFar:
				return sum
		
		i = (i + 1) % n
		indexNotMatched += 1
	
	return sum

func euclidean_distance(a : Vector3, b : Vector3):
	return float(sqrt(sq_euclidean_distance(a, b)))

func sq_euclidean_distance(a : Vector3, b : Vector3):
	var z : float = pow((a.x-b.x),2) + pow((a.y-b.y), 2)
	return z
