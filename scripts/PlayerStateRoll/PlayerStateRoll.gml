function PlayerStateRoll(){
	// Movement
	hSpeed = lengthdir_x(speedRoll, direction);
	vSpeed = lengthdir_y(speedRoll, direction);
	
	moveDistanceRemaining = max(0, moveDistanceRemaining - speedRoll);

	var _collided = PlayerCollision();

	// Update Sprite
	sprite_index = spriteRoll;
	var _totalFrames = sprite_get_number(sprite_index) / 4;

	var _percentageThroughRoll = 1 - moveDistanceRemaining / distanceRoll;
	image_index = (CARDINAL_DIR * _totalFrames) + min((_percentageThroughRoll * _totalFrames), _totalFrames - 1);
	
	// Change State
	if (moveDistanceRemaining <= 0) {
		state = PlayerStateFree;
	}
	
	if (_collided) {
		state = PlayerStateFree;
		Screenshake(4, 15);
	}
}