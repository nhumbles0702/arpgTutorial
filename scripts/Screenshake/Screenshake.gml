function Screenshake(magnitude, frames){
	with (global.iCamera) {
		if (magnitude > shakeRemain) {
			shakeMagnitude = magnitude;
			shakeRemain = magnitude;
			shakeLength = frames;
		}
	}
}