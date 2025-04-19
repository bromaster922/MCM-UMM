var customCam = false;

if (!customCam) {

var beatInterval = 4;
var beatZoomAmt = 1;
var zoomSpd = 1;

var targetX = 0;
var targetY = 0;
var moveAmt = 12;

var curChar;

function onCreatePost() {
	curChar = game.dad;
}

function onUpdate(elapsed) {
	game.camGame.zoom = FlxMath.lerp(game.camGame.zoom, game.defaultCamZoom, 0.02 * (elapsed * 120) * zoomSpd);
	game.camHUD.zoom = FlxMath.lerp(game.camHUD.zoom, 1, 0.02 * (elapsed * 120) * zoomSpd);

	game.camGame.scroll.x += targetX;
	game.camGame.scroll.y += targetY;
	game.camZooming = false;
	if (curChar.animation.curAnim.name == "idle") {
		targetX = targetY = 0;
	}
	if (curChar.animation.curAnim.name == "singLEFT") {
		targetX = -moveAmt / 100;
		targetY = 0;
	}
	if (curChar.animation.curAnim.name == "singRIGHT") {
		targetX = moveAmt / 100;
		targetY = 0;
	}
	if (curChar.animation.curAnim.name == "singUP") {
		targetX = 0;
		targetY = -moveAmt / 100;
	}
	if (curChar.animation.curAnim.name == "singDOWN") {
		targetX = 0;
		targetY = moveAmt / 100;
	}
}

function onBeatHit() {
	if (curBeat % beatInterval == 0) {
		game.camGame.zoom += 0.015 * beatZoomAmt;
		game.camHUD.zoom += 0.03 * beatZoomAmt;
	}
}

function onEvent(n, v1, v2) {
	if (n == "CNE-Camera Movement") {
		if (v1 == "0") {
			curChar = game.dad;
		}
		if (v1 == "1") {
			curChar = game.boyfriend;
		}
	}
}

}