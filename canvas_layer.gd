extends CanvasLayer
# en gros c'est un manager pour les labels de l'écran
@onready var label_key: Label = $VBoxContainer/LabelKey

var maxKey=0 #le nombre de clées en tout
var nbKey=0 #le nombre de clées qu'a le joueur

func addKey():
	maxKey+=1
func removeKey():
	maxKey-=1
func gotKey():
	nbKey+=1
	label_key.text="You have "+str(nbKey)+"/"+str(maxKey)+" keys"
	if nbKey==maxKey:
		label_key.text+="\nGo to the door!"
		%Player.hasAllKey=true
	
