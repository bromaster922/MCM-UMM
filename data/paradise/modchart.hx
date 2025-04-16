import flixel.math.FlxMath;

var bouncy = false;
//var tween:FlxTween = false;
var defSX = 0;
var defSY = 0;
var defY = 0;
var timer = 0;
var wavy = false;

function onCreatePost() {
	defSX = game.playerStrums.members[0].scale.x;
	defSY = game.playerStrums.members[0].scale.y;
	defY = game.playerStrums.members[0].y;
	//tween = FlxTween.tween(camHUD, {y:0}, 0.25, {type:FlxTween.ONESHOT, ease:FlxEase.quadOut});
}


function onUpdate(elapsed) {
	timer += elapsed * 120;
	if (wavy) {
		for (strum in game.playerStrums.members)
			strum.y = defY + Math.sin((timer / 50) + strum.ID * 200) * 20;
		for (strum in game.opponentStrums.members)
			strum.y = defY + Math.sin((timer / 50) + strum.ID * 200) * 20;
	}
	if (!wavy) {
		for (strum in game.playerStrums.members)
			strum.y = FlxMath.lerp(strum.y, defY, 0.025);
		for (strum in game.opponentStrums.members)
			strum.y = FlxMath.lerp(strum.y, defY, 0.025);
	}
	
	camGame.y = camHUD.y / 2;
}

function onBeatHit() {
	if (bouncy) bounce();

	//the specific beats for the bouncy parts
	if (curBeat > 63 && curBeat < 128 || curBeat > 158 && curBeat < 192 ||curBeat > 291 && curBeat < 355 || curBeat > 387 && curBeat < 420) {
		bouncy = true;
	} else {
		bouncy = false;
	}
	//the specific beats for the wavy parts
	if (curBeat > 127 && curBeat < 288) {
		wavy = true;
	} else {
		wavy = false;
	}

	if (curBeat == 56) {
		//camFollowChars = false;
		FlxTween.tween(camGame.scroll, {x: dad.x + (dad.width/3), y: dad.y + (dad.height/14)}, (Conductor.stepCrochet / 1000) * 32, {ease: FlxEase.quartInOut});
		FlxTween.num(0.6, 0.7, 2, {ease:FlxEase.quartInOut}, updateZoom);
		//trace(defaultCamZoom);
	}
	if (curBeat == 64) {
		//camFollowChars = true;
		game.defaultCamZoom = 0.6;
	}
}

function bounce() {
	for (strum in game.playerStrums.members) {
		strum.scale.x = defSX + 0.1;
		strum.scale.y = defSY - 0.1;
		FlxTween.tween(strum.scale, {x:defSX, y:defSY}, (Conductor.stepCrochet / 1000) * 3.8, {type:FlxTween.ONESHOT, ease:FlxEase.quadOut});
	}
	for (strum in game.opponentStrums.members) {
		strum.scale.x = defSX + 0.1;
		strum.scale.y = defSY - 0.1;
		FlxTween.tween(strum.scale, {x:defSX, y:defSY}, (Conductor.stepCrochet / 1000) * 3.8, {type:FlxTween.ONESHOT, ease:FlxEase.quadOut});
	}
	camHUD.y = 0;
	FlxTween.tween(camHUD, {y:-10}, (Conductor.stepCrochet / 1000) * 2, {type:FlxTween.ONESHOT, ease:FlxEase.quadOut, onComplete:fall});
}

function fall(tween:FlxTween) {
	FlxTween.tween(camHUD, {y:0}, (Conductor.stepCrochet / 1000) * 1.8, {type:FlxTween.ONESHOT, ease:FlxEase.quadIn});
}

function updateZoom(value:Float) {
	game.defaultCamZoom = value;
}

function getMid(val, size) {
	result = value + (size/2);
	return result;
}