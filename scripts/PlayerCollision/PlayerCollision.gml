function PlayerCollision(){
	var _collision = false;
	
	// Horizontal Tiles
	if (tilemap_get_at_pixel(collisionMap, x + hSpeed, y)) {
		
		/* 
		 * If moving right, snap to right side of current tile.
		 * Else if moving left, snap to left side of current tile.
		 */
		if (sign(hSpeed) == 1) {
			x += TILE_SIZE - 1 - (x mod TILE_SIZE); 
		} else {
			x -= x mod TILE_SIZE;
		}
		
		hSpeed = 0;
		_collision = true;
	}
	
	// Horizontal move commit
	x += hSpeed;
	
	// Vertical Tiles
	if (tilemap_get_at_pixel(collisionMap, x, y + vSpeed)) {
		
		/* 
		 * If moving down, snap to bottom side of current tile.
		 * Else if moving up, snap to top side of current tile.
		 */
		if (sign(vSpeed) == 1) {
			y += TILE_SIZE - 1 - (y mod TILE_SIZE);
		} else {
			y -= y mod TILE_SIZE;
		}
		
		vSpeed = 0;
		_collision = true;
	}
	
	// Vertical move commit
	y += vSpeed;
	
	return _collision;
}