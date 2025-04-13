function opponentNoteHit(event) {
	if (dad.curCharacter == "SquidClone2") {
		//debugPrint(event.nextNote.isSustainNote);
		if (!event.nextNote.isSustainNote) {
			dad.animation.curAnim.curFrame += 2;
		}
		if (event.isSustainNote) {
			dad.animation.curAnim.curFrame += 3;
		}
	}
}

function onUpdate(elapsed) {
	if (dad.curCharacter == "SquidClone2") {
		if (dad.animation.curAnim.curFrame > dad.animation.curAnim.numFrames - 2) {
			dad.playAnim("idle", true);
		}
	}
}