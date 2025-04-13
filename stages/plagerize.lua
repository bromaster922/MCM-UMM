function onCreate()
	makeLuaSprite('sky', 'stages/plagerize/sunset', -1000, -350);
	scaleObject('sky', 1.2, 1.2)
	setScrollFactor('sky', 0.2, 0.4)

	makeLuaSprite('sun', 'stages/plagerize/sun', -600, -350);
	scaleObject('sun', 1.2, 1.2)
	setScrollFactor('sun', 0.45, 0.45)

	makeLuaSprite('volcano', 'stages/plagerize/volcano', -1100, 1900);
	scaleObject('volcano', 1.1, 1.1)
	setScrollFactor('volcano', 0.5, 0.5)

	makeLuaSprite('sand1', 'stages/plagerize/sand1', -800, -50);
	scaleObject('sand1', 1.1, 1.1)
	setScrollFactor('sand1', 0.6, 0.6)

	makeLuaSprite('treegroup1', 'stages/plagerize/treeGroup1', -1100, 900);
	scaleObject('treegroup1', 1.1, 1.1)
	setScrollFactor('treegroup1', 0.75, 0.75)
	setProperty('treegroup1.angle', 180)

	makeLuaSprite('treegroup2', 'stages/plagerize/treeGroup2', -200, 900);
	scaleObject('treegroup2', 1.1, 1.1)
	setScrollFactor('treegroup2', 0.65, 0.65)
	setProperty('treegroup2.angle', 180)

	makeLuaSprite('treegroup3', 'stages/plagerize/treeGroup3', 600, 850);
	scaleObject('treegroup3', 1.1, 1.1)
	setScrollFactor('treegroup3', 0.75, 0.75)
	setProperty('treegroup3.angle', -180)

	makeLuaSprite('tree2', 'stages/plagerize/tree2', -1200, -200);
	scaleObject('tree2', 1.1, 1.1)
	setScrollFactor('tree2', 0.9, 0.9)

	makeLuaSprite('sand2', 'stages/plagerize/sand2', -1200, -200);
	scaleObject('sand2', 1.1, 1.1)
	setScrollFactor('sand2', 1, 1)

	makeLuaSprite('treefg', 'stages/plagerize/treeFg', -1215, 0);
	scaleObject('treefg', 1.1, 1.1)
	setScrollFactor('treefg', 1.2, 1.2)

	addLuaSprite('sky', false)
	addLuaSprite('sun', false)
	addLuaSprite('volcano', false)
	addLuaSprite('sand1', false)
	addLuaSprite('treegroup2', false)
	addLuaSprite('treegroup1', false)
	addLuaSprite('treegroup3', false)
	addLuaSprite('tree2', false)
	addLuaSprite('sand2', false)
	addLuaSprite('treefg', true)
end

function onStepHit() 
	if (curStep == 256) then
		doTweenY("thesand", "sand1", -400, 1, "elasticOut")
	end
	if (curStep == 259) then
		doTweenY("thevolcano", "volcano", -100, 1.6, "elasticOut")
	end
	if (curStep == 264) then
		doTweenY("thetree1", "treegroup1", -100, 1, "elasticOut")
		doTweenAngle("thetree1a", "treegroup1", 0, 1, "elasticOut")
	end
	if (curStep == 266) then
		doTweenY("thetree3", "treegroup3", -50, 0.7, "backOut")
		doTweenAngle("thetree3a", "treegroup3", 0, 0.7, "backOut")
	end
	if (curStep == 270) then
		doTweenY("thetree2", "treegroup2", -100, 1.9, "elasticOut")
		doTweenAngle("thetree2a", "treegroup2", 0, 1.9, "elasticOut")
	end
end