final int GAME_START = 0;
final int GAME_RUN = 1;
final int GAME_OVER = 2;
final int enemyOne=3;
final int enemyTwo=4;
final int enemyThree=5;


int[]enmX1={-80,-150,-220,-290,-360};
int enmY1;

int[]enmX2={-80,-120,-160,-200,-240};
int enmY2s=floor(random(0,200)); 
int[]enmY2={enmY2s,enmY2s+50,enmY2s+100,enmY2s+150,enmY2s+200};

int[]enmX3={-360,-290,-290,-220,-220,-150,-150,-80};
int enmY3s=floor(random(0,200));
int[]enmY3={enmY3s+100,enmY3s+50,enmY3s+150,enmY3s,enmY3s+50,enmY3s+200,enmY3s+50,enmY3s+100};

PImage Imgx,Imgy,Imgz,Imgu,Imga,Imgb,Imgst1,Imgst2,ed1,ed2;

float speed = 7;
float fighterX,fighterY;//fighter

boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;

int hp = 40;
int enemyY,treasureX,treasureY;
int enemyX = 0;
int backOneX = 0; // the x location of bg1
int backTwoX = -640; // the x location of bg2

int gameState;
int enemyState;

void setup () {
size(640, 480) ;
Imgst1 =loadImage("img/start1.png");
Imgst2 =loadImage("img/start2.png");
Imgx = loadImage("img/fighter.png");
Imgy = loadImage("img/hp.png");
Imgz = loadImage("img/treasure.png");
Imgu = loadImage("img/enemy.png");
Imga = loadImage("img/bg1.png");
Imgb = loadImage("img/bg2.png");
ed1 = loadImage("img/end1.png");
ed2 = loadImage("img/end2.png");
  
fighterX = 580;
fighterY = 240;
treasureX = int(random(580));
treasureY = int(random(430));
enemyY = floor(random(30,430));


gameState = GAME_START;
enemyState=enemyOne;
  
}


void draw() {

switch (gameState){
 case GAME_START:
 image(Imgst2,0,0);
 if (mouseX>210 && mouseX<430 && mouseY > 380 && mouseY < 425){
        if (mousePressed){
          gameState = GAME_RUN;
        }else{
         image(Imgst1,0,0);
        }
         }
         break;

 case GAME_OVER:
  enemyY = int(random(30,460));
 image(ed2,0,0);
  if(mouseX >= width/3 && mouseX <= 2*width/3 && mouseY >=315 && mouseY <=350) {
  if(mousePressed) {
  gameState = GAME_RUN;
  enemyState =enemyOne;
  fighterX = 580;
  fighterY = 240;
  hp = 40;
  treasureX = int(random(580));
  treasureY = int(random(430));
  enmX1[0] =-80; enmX1[1]=-150;enmX1[2] =-220;enmX1[3] =-290;enmX1[4]=-360; 
  enmY1 = floor(random(80,300));
} else {
   image(ed1,0,0);
        }
}
break;
   
 case GAME_RUN:
  //background
 image(Imga, backOneX, 0);
 image(Imgb, backTwoX, 0);
 backOneX++;backTwoX++;
 if(backOneX>640){backOneX=-640;backOneX++;}
 if(backTwoX>640){backTwoX=-640;backTwoX++;}
 
 //hp
 fill(#FF0000); //red
 rect(16,10,hp,20); //hp
 image(Imgy,10,10); //hp box
 
 //location
 image(Imgx, fighterX, fighterY); //fighter
 image(Imgz, treasureX, treasureY); //treasure

 switch(enemyState){
 case enemyOne:
 for(int i=0; i<enmX1.length; i++){
 image(Imgu,enmX1[i],enmY1); // enemy
 enmX1[i]+=5; //spead
 if(i==0){if(fighterX-61<=enmX1[i] && fighterX+61>=enmX1[i] && fighterY-61<=enmY1 &&fighterY+61>=enmY1){enmX1[i]=1000;hp-=40; if(hp<0){hp=0;}}}
 if(i==1){if(fighterX-61<=enmX1[i] && fighterX+61>=enmX1[i] && fighterY-61<=enmY1 &&fighterY+61>=enmY1){enmX1[i]=1000;hp-=40; if(hp<0){hp=0;}}}
 if(i==2){if(fighterX-61<=enmX1[i] && fighterX+61>=enmX1[i] && fighterY-61<=enmY1 &&fighterY+61>=enmY1){enmX1[i]=1000;hp-=40; if(hp<0){hp=0;}}}
 if(i==3){if(fighterX-61<=enmX1[i] && fighterX+61>=enmX1[i] && fighterY-61<=enmY1 &&fighterY+61>=enmY1){enmX1[i]=1000;hp-=40; if(hp<0){hp=0;}}}
 if(i==4){if(fighterX-61<=enmX1[i] && fighterX+61>=enmX1[i] && fighterY-61<=enmY1 &&fighterY+61>=enmY1){enmX1[i]=1000;hp-=40; if(hp<0){hp=0;}}}
 if(enmX1[0]>1600){
 enemyState=enemyTwo;
 enmX2[0]=-80; enmX2[1]=-150; enmX2[2]=-220;enmX2[3]=-290; enmX2[4]=-350;
 enmY2[0]=enmY2s; enmY2[1]=enmY2s+50; enmY2[2]=enmY2s+100; enmY2[3]=enmY2s+150; enmY2[4]=enmY2s+200; 
 enmY1=floor(random(30,130));
 }
 if(hp<=0){
     gameState=GAME_OVER;
   }
 }
 break;
 
 case enemyTwo:
 for(int j=0; j<enmX2.length; j++){
 image(Imgu,enmX2[j],enmY2[j]); // enemy
 enmX2[j]+=5; //spead
 if(j==0){if(fighterX-61<=enmX2[j] && fighterX+61>=enmX2[j] && fighterY-61<=enmY2[j] &&fighterY+61>=enmY2[j]){enmX2[j]=1000;hp-=40; if(hp<0){hp=0;}}}
 if(j==1){if(fighterX-61<=enmX2[j] && fighterX+61>=enmX2[j] && fighterY-61<=enmY2[j] &&fighterY+61>=enmY2[j]){enmX2[j]=1000;hp-=40; if(hp<0){hp=0;}}}
 if(j==2){if(fighterX-61<=enmX2[j] && fighterX+61>=enmX2[j] && fighterY-61<=enmY2[j] &&fighterY+61>=enmY2[j]){enmX2[j]=1000;hp-=40; if(hp<0){hp=0;}}}
 if(j==3){if(fighterX-61<=enmX2[j] && fighterX+61>=enmX2[j] && fighterY-61<=enmY2[j] &&fighterY+61>=enmY2[j]){enmX2[j]=1000;hp-=40; if(hp<0){hp=0;}}}
 if(j==4){if(fighterX-61<=enmX2[j] && fighterX+61>=enmX2[j] && fighterY-61<=enmY2[j] &&fighterY+61>=enmY2[j]){enmX2[j]=1000;hp-=40; if(hp<0){hp=0;}}}
 if(enmX2[0]>1600){
 enemyState=enemyThree;
 enmX3[0]=-360;
 enmX3[1]=-290;enmX3[2]=-290;
 enmX3[3]=-220;enmX3[4]=-220;
 enmX3[5]=-150;enmX3[6]=-150;
 enmX3[7]=-80;
 
 enmY3s=floor(random(150,220));
 enmY3[0]=enmY3s+100;
 enmY3[1]=enmY3s+50;enmY3[2]=enmY3s+150;
 enmY3[3]=enmY3s;enmY3[4]=enmY3s+200;
 enmY3[5]=enmY3s+50;enmY3[6]=enmY3s+150;
 enmY3[7]=enmY3s+100;
 }
 if(hp<=0){
     gameState=GAME_OVER;
   }
 }
 break;
 
 case enemyThree:
 image(Imgu,enmX3[0],enmY3[0]);
 image(Imgu,enmX3[1],enmY3[1]);image(Imgu,enmX3[2],enmY3[2]);
 image(Imgu,enmX3[3],enmY3[3]);image(Imgu,enmX3[4],enmY3[4]);
 image(Imgu,enmX3[5],enmY3[5]);image(Imgu,enmX3[6],enmY3[6]);
 image(Imgu,enmX3[7],enmY3[7]);
 
 for(int k=0; k<8; k++){
 enmX3[k]+=5;
 if(k==0){if(fighterX-61<=enmX3[k] && fighterX+61>=enmX3[k] && fighterY-61<=enmY3[k] &&fighterY+61>=enmY3[k]){enmX3[k]=1000;hp-=40; if(hp<0){hp=0;}}}
 if(k==1){if(fighterX-61<=enmX3[k] && fighterX+61>=enmX3[k] && fighterY-61<=enmY3[k] &&fighterY+61>=enmY3[k]){enmX3[k]=1000;hp-=40; if(hp<0){hp=0;}}}
 if(k==2){if(fighterX-61<=enmX3[k] && fighterX+61>=enmX3[k] && fighterY-61<=enmY3[k] &&fighterY+61>=enmY3[k]){enmX3[k]=1000;hp-=40; if(hp<0){hp=0;}}}
 if(k==3){if(fighterX-61<=enmX3[k] && fighterX+61>=enmX3[k] && fighterY-61<=enmY3[k] &&fighterY+61>=enmY3[k]){enmX3[k]=1000;hp-=40; if(hp<0){hp=0;}}}
 if(k==4){if(fighterX-61<=enmX3[k] && fighterX+61>=enmX3[k] && fighterY-61<=enmY3[k] &&fighterY+61>=enmY3[k]){enmX3[k]=1000;hp-=40; if(hp<0){hp=0;}}}
 if(k==5){if(fighterX-61<=enmX3[k] && fighterX+61>=enmX3[k] && fighterY-61<=enmY3[k] &&fighterY+61>=enmY3[k]){enmX3[k]=1000;hp-=40; if(hp<0){hp=0;}}}
 if(k==6){if(fighterX-61<=enmX3[k] && fighterX+61>=enmX3[k] && fighterY-61<=enmY3[k] &&fighterY+61>=enmY3[k]){enmX3[k]=1000;hp-=40; if(hp<0){hp=0;}}}
 if(k==7){if(fighterX-61<=enmX3[k] && fighterX+61>=enmX3[k] && fighterY-61<=enmY3[k] &&fighterY+61>=enmY3[k]){enmX3[k]=1000;hp-=40; if(hp<0){hp=0;}}}

 if(enmX3[7]>1600){
 enemyState=enemyOne;
 enmX1[0]=-80;enmX1[1]=-150;enmX1[2]=-220;enmX1[3]=-290;enmX1[4]=-350;
 enmY1=floor(random(80,300));
 }
 if(hp<=0){
     gameState=GAME_OVER;
   }
 }
 break;
 }
 
 
 /*//bump
 if ((enemyY+30.5)>=(fighterY+25.5)){
   enemyY-=3;}
 if ((enemyY+30.5)<=(fighterY+25.5)){enemyY+=3;}*/
 
 
 if(treasureX+41>=fighterX && treasureX<=fighterX+51 && treasureY+41>=fighterY && treasureY<=fighterY+51){
   treasureX=int(random(580));
   treasureY=int(random(430));
   hp+=20;
 }
   if(hp>=200){
     hp=200;
   }

 
/*//location
 image(Imgx, fighterX, fighterY); //fighter
 image(Imgz, treasureX, treasureY); //treasure
 image(Imgu,enemyX,enemyY); // enemy*/

 
/* if(enemyX+61>=fighterX && enemyX<=fighterX+51 && enemyY+61>=fighterY && enemyY<=fighterY+51){
   hp-=40;
   enemyX=0;
   enemyY=int(random(30,460));
   if(hp<=0){
     gameState=GAME_OVER;
   }
   }
 */
 if(hp<=0){hp=0;}
 
break;
}
 
  //speed of Keyboard
   if (upPressed) {
    fighterY -= speed;
  }
  if (downPressed) {
    fighterY += speed;
  }
  if (leftPressed) {
    fighterX -= speed;
  }
  if (rightPressed) {
    fighterX += speed;
  }
  
  //Border
  if (fighterX > 589) {
    fighterX = 589;
  }
  if(fighterX < 0){
    fighterX = 0;
  }
  if (fighterY > 429) {
    fighterY = 429;
  }
  if (fighterY < 0) {
    fighterY = 0;
  }
  
}
void keyPressed(){
if (key == CODED) { 
    switch (keyCode) {
      case UP:
        upPressed = true;
        break;
      case DOWN:
        downPressed = true;
        break;
      case LEFT:
        leftPressed = true;
        break;
      case RIGHT:
        rightPressed = true;
        break;
 }
  }
   } 
 

void keyReleased(){
  if (key == CODED) {
    switch (keyCode) {
      case UP:
        upPressed = false;
        break;
      case DOWN:
        downPressed = false;
        break;
      case LEFT:
        leftPressed = false;
        break;
      case RIGHT:
        rightPressed = false;
        break;
    }
  }
}
