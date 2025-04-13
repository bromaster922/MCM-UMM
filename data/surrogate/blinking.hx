var eyelid1 = new FlxSprite().loadGraphic(Paths.image("stages/surrogate/eyelid"));
var eyelid2 = new FlxSprite().loadGraphic(Paths.image("stages/surrogate/eyelid"));
var eyeTween:FlxTween = FlxTween.num();

var eyes:FlxCamera;

var eyePos = 720;

var blinkTimer:FlxTimer = new FlxTimer();

var eyeTween:FlxTween = FlxTween.num();

function onCreatePost() {
	eyes = new FlxCamera();
	eyes.bgColor = FlxColor.TRANSPARENT;
	FlxG.cameras.add(eyes, false);
	
	for (eyelids in [eyelid1, eyelid2]) {
	eyelids.cameras = [eyes];
	eyelids.scale.set(2, 1);
	eyelids.updateHitbox();
	add(eyelids);
	}

	eyelid2.flipY = true;
}

function onUpdate(elapsed) {
	eyelid1.y = -eyePos;
	eyelid2.y = eyePos;
}

function onBeatHit() {
	if (curBeat == 140) blink();
}

function blink() {
	eyeTween.cancel();
	eyeTween = FlxTween.num(720, 0, (Conductor.stepCrochet / 1000) * 16, {ease: FlxEase.circIn}, (val:Float) -> {eyePos = val;});
	blinkTimer.start((Conductor.stepCrochet / 1000) * 16, () -> {
		//if (eyePos >= 400) blinkAvoid(); else
		//if (eyePos < 400) blinkFail();
		blinkFail();
	});
}

function blinkFail() {
	eyeTween.cancel();
	eyeTween = FlxTween.num(0, 720, 0.2, {ease: FlxEase.quartOut}, (val:Float) -> {eyePos = val;});
}