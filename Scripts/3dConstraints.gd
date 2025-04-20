
var frontConstraints = []
var backConstraints = []
var leftConstraints = []
var rightConstraints = []
var upConstraints = []
var downConstraints = []
var globalConstraints = []

var constraints = {"front" : frontConstraints,
					"back" : backConstraints,
					"left" : leftConstraints,
					"right" : rightConstraints,
					"up" : upConstraints,
					"down" : downConstraints,
					"global" : globalConstraints}

func _init(front, back, left, right, up, down, global):
	frontConstraints = front
	backConstraints = back
	leftConstraints = left
	rightConstraints = right
	upConstraints = up
	downConstraints = down
	globalConstraints = global
	constraints["front"] = frontConstraints
	constraints["back"] = backConstraints
	constraints["left"] = leftConstraints
	constraints["right"] = rightConstraints
	constraints["up"] = upConstraints
	constraints["down"] = downConstraints
	constraints["global"] = globalConstraints
