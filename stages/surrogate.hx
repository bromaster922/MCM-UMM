var didTheHiding = false; //it kept interfering with the camera script :(

function onCreatePost() {
	game.defaultCamZoom = 1.0;
	game.camGame.zoom = 1.0;
}

function onEvent(n, v1, v2) {
	debugPrint(n);
	if (n == "CNE-Camera Movement") {
		debugPrint("oh yeah!!!!!!!!!!!!!!!!!");
		debugPrint("THE VALUE IS: " + v1);
		if (v1 == "0") {
			game.defaultCamZoom = 1.0;
		}
		if (v1 == "1") {
			game.defaultCamZoom = 0.65;
		}
		if (v1 == "2") {
			game.defaultCamZoom = 0.8;
		}
	}
}

function onUpdatePost() {
	if (!didTheHiding) {
		game.modchartSprites["SurroEffect"].alpha = 0.00001;
		game.modchartSprites["SurroClone1"].alpha = 0.00001;
		game.modchartSprites["SurroClone2"].alpha = 0.00001;
		game.modchartSprites["SurroClone3"].alpha = 0.00001;
		game.modchartSprites["SurroClone4"].alpha = 0.00001;
		game.modchartSprites["SurroClone5"].alpha = 0.00001;
		gf.alpha = 0;
		
		didTheHiding = true;
	}
}