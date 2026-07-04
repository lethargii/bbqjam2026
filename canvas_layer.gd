extends CanvasLayer
# en gros c'est un manager pour les labels de l'écran

var maxKey=0 #le nombre de clées en tout
var nbKey=0 #le nombre de clées qu'a le joueur

func addKey():
	maxKey+=1
func gotKey():
	nbKey+=1
	$Label.text="You have "+str(nbKey)+"/"+str(maxKey)+" keys"
	if nbKey==maxKey:
		$Label.text+="\nYou can now open the door"
	
