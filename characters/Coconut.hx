function opponentNoteHit(event) {
	if (dad.curCharacter == "coconut" || dad.curCharacter == "Coconut") {
		if (event.isSustainNote) {
			dad.animation.curAnim.curFrame += 4;
		}
	}
}
