function goodNoteHit(event) {
	if (boyfriend.curCharacter == "berryfriend" || boyfriend.curCharacter == "Berryfriend") {
		if (event.isSustainNote) {
			boyfriend.animation.curAnim.curFrame += 4;
		}
	}
}
