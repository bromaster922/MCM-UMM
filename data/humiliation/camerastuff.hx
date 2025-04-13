//using an hx so ender can SHUT THE FUCK UP

var centered = false;
var moving = false;

var blackBox:FlxSprite;
var whiteBox:FlxSprite;

var barBottom:FlxSprite;
var barTop:FlxSprite;
var camCinematics:FlxCamera;

var jellyfish:FlxSprite;
var bloomShader;

function onCreate() {
	jellyfish = new FlxSprite(200, 0);
	jellyfish.frames = Paths.getSparrowAtlas("characters/Humiliation/Jellyfish");
	jellyfish.animation.addByPrefix("bop","crowd",24);
	jellyfish.animation.play("bop");
	jellyfish.scale.set(1.5, 1.5);
	jellyfish.antialiasing = true;
	jellyfish.visible = false;
	insert(1, jellyfish);

	camCinematics = new FlxCamera();
	camCinematics.bgColor = FlxColor.TRANSPARENT;

	FlxG.cameras.remove(camHUD, false);
	FlxG.cameras.add(camCinematics, false);
	FlxG.cameras.add(camHUD, false);

	blackBox = new FlxSprite(-1000, -1000).makeGraphic(5000, 5000, FlxColor.BLACK);
	add(blackBox);

	barBottom = new FlxSprite(0, FlxG.height).makeGraphic(FlxG.width*2, FlxG.height, FlxColor.BLACK);
	barBottom.cameras = [camCinematics];
	barBottom.screenCenter();
	barBottom.y = FlxG.height;
	add(barBottom);

	barTop = new FlxSprite(0, -FlxG.height).makeGraphic(FlxG.width*2, FlxG.height, FlxColor.BLACK);
	barTop.cameras = [camCinematics];
	barTop.screenCenter();
	barTop.y = -FlxG.height;
	add(barTop);

	whiteBox = new FlxSprite(-1000, -1000).makeGraphic(5000, 5000, FlxColor.WHITE);
	whiteBox.alpha = 0.0001;
	whiteBox.cameras [camCinematics];
	add(whiteBox);
	camGame.scroll.x = 0;
	camGame.scroll.y = 100;

	bloomShader = game.createRuntimeShader('bloom');
	bloomShader.setFloat('dim', 1);
	bloomShader.setFloat('Size', 10);
	if (game.shadersEnabled) camGame._filters = [new ShaderFilter(bloomShader)];
}

function onSongStart() {
	FlxTween.tween(blackBox, {alpha:0}, 17, {ease: FlxEase.sineInOut});
	camGame.scroll.x = 10;
	camGame.scroll.y = -425;
	camGame.zoom = 3;
}
var glowIntens = 1;
function onStepHit() {
	switch (curStep) {
	case 16: 
		FlxTween.tween(camGame, {zoom:defaultCamZoom}, 17, {ease: FlxEase.sineInOut});
	case 64: 
		FlxTween.tween(camGame.scroll, {y: 100}, 9, {ease: FlxEase.sineInOut});
	case 120: 
		fadeIn();
	case 128: 
		cinematicBars(true);
		fadeOut();
	case 252:
		game.defaultCamZoom += 0.1;
	case 256:
		cinematicBars(false);
		fadeOut();
		game.defaultCamZoom -= 0.1;
	case 512:
		game.defaultCamZoom += 0.2;
		cinematicBars(true);
		moving = true;
	case 640:
		centered = false;
		moving = false;
		FlxTween.tween(camGame.scroll, {x:0, y: 100}, 1.18, {ease: FlxEase.sineInOut});
		FlxTween.tween(camGame, {zoom:0.6}, 1.18, {ease: FlxEase.sineInOut});
	case 644:
		game.defaultCamZoom = 0.6;
		centered = true;
		cinematicBars(false);
		fadeOut();
	case 768:
		game.defaultCamZoom += 0.2;
		cinematicBars(true);
	case 784:
		game.defaultCamZoom += 0.1;
		centered = false;
		moving = true;
		camGame.scroll.x -= 100;
		fadeOut();
	case 904:
		FlxTween.tween(camGame.scroll, {x:0, y: 100}, 1.2, {ease: FlxEase.sineInOut});
		FlxTween.tween(camGame, {zoom:0.7}, 1.1, {ease: FlxEase.sineInOut});
	case 912:
		game.defaultCamZoom = 0.6;
		cinematicBars(false);
		centered = true;
		moving = false;
	case 1032:
		game.defaultCamZoom += 0.2;
		cinematicBars(true);
	case 1040:
		game.defaultCamZoom -= 0.3;
		cinematicBars(false);
		centered = false;
		camGame.scroll.y -= 200;
		fadeOut();
		jellyfish.visible = true;
		camGame.angle = 1;
		FlxTween.tween(camGame, {angle: -1}, (Conductor.stepCrochet / 1000) * 8, {ease: FlxEase.sineInOut, type: FlxTween.PINGPONG});
		camHUD.angle = 2;
		FlxTween.tween(camHUD, {angle: -2}, (Conductor.stepCrochet / 1000) * 8, {ease: FlxEase.sineInOut, type: FlxTween.PINGPONG});
		camHUD.x = -15;
		FlxTween.tween(camHUD, {x: 15}, (Conductor.stepCrochet / 1000) * 8, {startDelay: (Conductor.stepCrochet / 1000) * 2, ease: FlxEase.sineInOut, type: FlxTween.PINGPONG});
	case 1168:
		fadeOut();
		FlxTween.tween(camGame, {zoom:0.4}, 6.8, {ease: FlxEase.sineInOut});
		game.defaultCamZoom = 0.4;
		FlxTween.cancelTweensOf(camHUD);
		FlxTween.cancelTweensOf(camGame);
		camGame.angle = 0;
		camHUD.angle = 0;
		camHUD.x = 0;
	case 1216:
		camGame.visible = false;
		camHUD.visible = false;
	}
}

function onBeatHit() {
	if (curBeat > 259 && curBeat < 292) {
		if (curBeat % 4 == 0) glowIntens = 0.7;
		if (curBeat % 4 == 2) {
			glowIntens = 0.5;
			camGame.zoom += 0.05;
			camHUD.zoom += 0.05;
		}
	}
}

function onUpdate(elapsed) {
	if (centered && !moving) {
		camGame.scroll.x = 0;
		camGame.scroll.y = 100;
	}
	if (moving) {
		game.cameraSpeed = 1;
	} else {
		game.cameraSpeed = 0;
	}
	camCinematics.zoom = camHUD.zoom;

	glowIntens = FlxMath.lerp(glowIntens, 1, elapsed);
	bloomShader.setFloat('dim', glowIntens);
}

function cinematicBars(doit:Bool) {
	if (doit) {
		FlxTween.tween(barBottom, {y: FlxG.height / 1.25}, 0.5, {ease: FlxEase.sineOut});
		FlxTween.tween(barTop, {y: -FlxG.height / 1.25}, 0.5, {ease: FlxEase.sineOut});
	}
	if (!doit) {
		FlxTween.tween(barBottom, {y: FlxG.height}, 0.5, {ease: FlxEase.sineOut});
		FlxTween.tween(barTop, {y: -FlxG.height}, 0.5, {ease: FlxEase.sineOut});
	}
}

function fadeIn() {
	whiteBox.alpha = 0;
	FlxTween.tween(whiteBox, {alpha: 1}, 1.21);
}
function fadeOut() {
	whiteBox.alpha = 1;
	FlxTween.tween(whiteBox, {alpha: 0}, 1.21);
}
	