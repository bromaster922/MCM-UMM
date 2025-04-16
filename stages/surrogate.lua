phase2 = false
function onCreate()
	--debugPrint('my balls itch')
	makeLuaSprite('bg', 'stages/surrogate/outside', -120, 120)
	scaleObject('bg', 0.7, 0.7)
	addLuaSprite('bg', false)
	makeLuaSprite('inside', 'stages/surrogate/inside', -100, 120)
	scaleObject('inside', 1.4, 1.4)
	addLuaSprite('inside', false)
	makeLuaSprite('boat', 'stages/surrogate/boat', 0, 310)
	scaleObject('boat', 0.8, 0.8)
	addLuaSprite('boat', false)
	setProperty('camZooming', true)
end

function onCreatePost() 
	setObjectOrder('dadGroup', 2)
	if not getProperty('dad.Custom') then
	characterRezise('dad', 1.3)
	else
	--getCharacterY('dad', setCharacterY('dad', 850 - getProperty('dad.height')))
	--characterRezise('dad', 0.8)
	end
	if getProperty('boyfriend.Custom') then
	getCharacterY('boyfriend', setCharacterY('boyfriend', 1100 - getProperty('boyfriend.height')))
	end
	characterRezise('boyfriend', 2)
end

function onUpdate(elapsed)
	--debugPrint(mustHitSection)
	if not mustHitSection then
		if not phase2 then
		--setProperty('camFollow.x', 500)
		--setProperty('camFollow.y', 700)
		setProperty('defaultCamZoom', 1.1)
		else
		--setProperty('camFollow.x', 950)
		--setProperty('camFollow.y', 700)
		setProperty('defaultCamZoom', 0.9)
		end
	end
	if mustHitSection then
		--setProperty('camFollow.x', 1200)
		--setProperty('camFollow.y', 900)
		setProperty('defaultCamZoom', 0.7)
	end
end

function onBeatHit()
	if curBeat == 144 then
		setObjectOrder('dadGroup', 3)
		phase2 = true
		getCharacterX('dad', setCharacterX('dad', 700))
		getCharacterY('dad', setCharacterY('dad', 480))
		if not getProperty('dad.custom') then
			setProperty('dad.y', getProperty('dad.y') - 140)
		else
			characterRezise('dad', 0.9)
		end
	end
end

