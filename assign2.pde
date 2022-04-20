int x = 400;
int y = 200;
int fstx = 5;
int fsty = 5;
int secx = 5;
int secy = 5;
int trdx = 5;
int trdy = 5;
boolean alive = true;
int life = 2;
int p1x, p2x , p3x , p4x;
int p1y, p2y , p3y , p4y;
int count = 0;

void setup() {
	size(640, 480, P2D);
	// Enter Your Setup Code Here
	photo1 = loadImage("bg.jpg");
	photo2 = loadImage("cabbage.png");
	photo3 = loadImage("gameover.jpg");
	photo4 = loadImage("groundhogDown.png");
	photo5 = loadImage("groundhogldle.png");
	photo6 = loadImage("groundhogLeft.png");
	photo7 = loadImage("groundhogRight.png");
	photo8 = loadImage("life.png");
	photo9 = loadImage("restartHovered.png");
	photo10 = loadImage("restartNormal.png");
	photo11 = loadImage("soil.png");
	photo12 = loadImage("soldier.png");
	photo13 = loadImage("startHovered.png");
	photo14 = loadImage("startNormal.png");
	photo15 = loadImage("title.jpg");

	float theta = random(-60,60) *PI/180;
	secx = ( int )( speed * cos(theta) );
	secy = ( int )( speed * sin(theta) );
	
	
}

void keyPressed(){
	if (key == CODED) {
    	if (keyCode == DOWN) { 	
			y = y - p1y;
		} 
		else if (keyCode == RIGHT) {
			x = x + p1x;
    	}
		else if (keyCode == LEFT) {
			x = x - p1x;
    	}
	x = 400;
	y = 200;
	float theta = random(-60,60) *PI/180;
	
	fstx = ( int )( speed * cos(theta));
	fsty = ( int )( speed * sin(theta));
	alive = true;
}

void keyReleased(){

}

void mousePressed()
{
  switch(count){
  case 0:  
   
    p1x = mouseX;
    p1y = mouseY;
    count++;
    
  
   break;
  case 1 : 
   
    p2x = mouseX;
    p2y = p1y;
    count++;
    
  
  break;
  case 2 : 
   
    p3x = mouseX;
    p3y = mouseY;
    count++;
      
  
  break;
  
  case 3 : 
   
    p4x = mouseX;
    p4y = p3y;
    count++;
    
  
  break;
  default:
  count=0;
   break;
  
  }
  
}
void draw() {
	image(photo1, 0, 0);
	image(photo2, 0, 0);
	
	// Switch Game State
	if (count ==0){
		circle(mouseX,mouseY,5); 
    }
    else if (count ==1){
    	line(p1x,p1y,mouseX,p1y);  
  	}
  	else if (count ==2){
    	line(p1x,p1y,p2x,p2y);
    	line(p2x,p2y,mouseX,mouseY);
  	}
	else if (count ==3){
    	line(p1x,p1y,p2x,p2y);
    	line(p2x,p2y,p3x,p3y);
    	line(p3x,p3y,mouseX,p3y);
  	}
	else if (count ==4){
    	quad(p1x,p1y,p2x,p2y,p3x,p3y,p4x,p4y);
  	}
		// Game Start
		x = x + fstx;
		y = y + fsty;

		
		// Game Run
		if ( x< 40 ){
			fstx= -fstx;
			}
		if ( x > 780){
			fstx=0;
			fsty=0;

			if (alive) {
				life = life -1;
			}
			alive = false;
		}
		if( x == x +trdx && y == y+trdy){
			if (alive) {
				life = life + 1;
			}
			alive = true;
		}
		if (x > 640 && y > (mouseY -50) && y < (mouseY +50)){
			fstx=-fstx; 
		}
		if (y > 480 || y< 0 ){
			fsty= -fsty
		}
		// Game Lose
		if ( life <= 0){
			textSize(50);
			fill(255,0,0);
			text("Game Over", 300, 200); 
}
mouseButton();
}


