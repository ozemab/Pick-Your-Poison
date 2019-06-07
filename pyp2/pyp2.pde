//import sound library and create sound files 
//import processing.sound.*;
//SoundFile arcademusic;
//SoundFile coininsert;

//create image of fortune teller
PImage fortuneteller;

//create image of coin
PImage coin;

//create string for text on button 
String ic = "Insert Coin";

String[] fortunes = {"Love is evading you" , "Not even God can save you" , "Who you seek is not seeking you" , 
"Be careful what you eat " , "You will die poorly dressed" , "Your problem just got bigger" , 
"Try again later " , "Your nightmares will become reality" , "Get ready for diarrhea " , 
"Failure is inevitable" , "Happiness is not attainable" , "You’re getting uglier" ,
"Caution can’t counter death" , "Watch out for bird shit" , "Vacation? Forget about it" ,
"Watch your step" , "Shit is about to get weird" , "You’re next" , 
"Beware of heights" , "Use protection" , "Unemployment is looming" , "Your greatest fear will manifest"
, "Go to the doctor, trust me" , "Hurt will happen soon" , "Hope is futile" , "It isn’t all in your head"
, "You’re not safe from disaster" , "Death comes in threes" , "Don’t expect a happy ending" , 
"Better watch your spending" , "You can’t fix it, stop trying" , "You will never know peace" , 
"Danger ahead" , "Next year is going to suck" , "Your enemies are closer than you think"
, "Your goals will not be met" , "With age will come obesity" ,  "I hope you can swim" ,
"You will die a painful death" , "Your neighbors won’t hear your screams" , "ERROR" , "You’ll be lonely forever"
, "Children are not in your future" , "Famine will ravage the earth" , "Your life is an empty void" ,
"See you in hell" , "You’ll suffer in the afterlife" , "You will contract a rare disease" , 
"Everyone hates you" , "Your life is going nowhere" , "Get ready to go bald" , "Someone close will betray you"
, "Someone is plotting your murder" , "Your career trajectory looks bleak" , "No one cares about your aspirations"
, "The end is near" , "Your soulmate does not exist" , "Death follows you" , "You will lose everything you love"
, "Your secrets will be exposed" , "Your lies will be discovered" , "Things repressed will resurface" 
, "You're being watched" , "All of your memories will be lost" , "Prepare for a fall from grace" , 
"There’s a monster within you" , "You can’t fix stupid" , "Shut up and pay attention" , "The world pities you"
, "Your luck just ran out" , "Kiss your sanity goodbye" , "There’s no way out" , "You’ve made a mess of things"
, "Watch your back" , "Your faith will be tested" , "You’re an embarrassment" , "They don’t want you to win"
, "You can’t change their mind" , "You’re caught in a rat race" , "Reality is about to smack you" , 
"Everything you believe is wrong" , "Your efforts are useless" , "You will make a huge mistake" , "You’re about to ruin everything"
, "It’s a trap" , "You’ll never figure it out" , "The universe is conspiring against you" ,
"The worst is yet to come" , "You’re about to get some bad news" , "You’ll soon be forgotten" ,
"Don’t fall asleep" , "Your work will never be finished" , "Progress is an illusion" , "Be careful not to choke"
, "People are talking about you" , "You have nothing to celebrate" , "Watch out for falling objects" , "Chaos is about to ensue" ,
"You will face a major injury"};


//color variables for flashing button 
float r;
float g;
float b;

//location + size variables for insert coin button 
float rectX = 122;
float rectY = 500;
float rectW = 125;
float rectH = 60;

//variable for coin movement
float cxLoc = 400;

//boolean variable controlling coin movement 
Boolean coinmove = false;

//boolean variable controlling coin insert sound
Boolean coininthere = false;

//variable for index of fortunes in string array
int index ;

//variable to create glowing on screen
PGraphics pg;


void setup () {
  noStroke();
  size (500, 700);

//load background music sound file and put into a loop
//arcademusic = new SoundFile(this, "arcademusic.mp3");
//arcademusic.loop();

//load coin insert sound
//coininsert = new SoundFile(this, "coinsound.mp3");

  //load font for sketch, Silom
  PFont fttext = createFont("Silom", 1);
  textFont(fttext);

  //load image of coin into processing window
  coin = loadImage("Coin.png"); 

  //load image of fortune teller into processing window
  fortuneteller = loadImage("FortuneTeller.png");

  //function to create glowing screen
  pg = createGraphics(223, 154);
} 


void draw () {
  //display dark purple background
  background (39, 23, 115);

  //button function: if button is pressed coin appears on screen and is inserted into the machine
  //once coin is inserted into the machine a random fortune from the array of strings will appear on the screen 
  pushMatrix();

  //when coinmove happens (is true) coin appears and is inserted into machine
  if (coinmove) {
    cxLoc = cxLoc - 1.5;
    image (coin, cxLoc, 195);
  }


  if (mousePressed) {
    if (mouseX > rectX && mouseX < rectX + rectW && mouseY > rectY && mouseY < rectY + rectH) {
      //when button is pressed coinmove = true
      coinmove = true;
      //each time button is pressed the location of the coin is reset to 400
      cxLoc = 400;
      //when button is pressed coininthere is set back to false 
      coininthere = false;
      //each time button is pressed it returns a random fortune from the array of strings
      index = int(random(fortunes.length));
    }
  }
  popMatrix();

  //display image of fortune teller in processing window
  image (fortuneteller, width/15, height/25);

  //display off screen for machine
  rect (77.3, 180.3, 218.5, 149.5);
  fill (20);

  //color variables for flashing button   
  r = random (255);
  g = random (150, 300);
  b = random (255);  

  //display insert coin button: flashing yellow rectangle
  fill (255, g, 50);
  rect(rectX, rectY, rectW, rectH);

  //display black text for insert coin button 
  fill (0);
  textSize(15);
  textAlign(BASELINE);
  text(ic, 137, 535.5);


  if (cxLoc <= 215) {
    //when the coin location reaches <= 215 it's true so coininsert sound will play
    if (coininthere == false) {
     //coininsert.play();
    }
    coininthere = true;

    //once coin is inserted glowing screen graphic is created which makes screen come on and machine glow
    pg.beginDraw();
    fill(255);
    rect(77.3, 180.3, 223.5, 154.5);
    filter(BLUR, 300);
    noStroke();
    fill(67, 138, 255);
    rect (77.3, 180.3, 218.5, 149.5);
    pg.endDraw();

//once coin is inserted redraw fortune teller machine, off screen, and button 
    if (coininthere = true) {
      //display image of fortune teller in processing window
      image (fortuneteller, width/15, height/25);

      //display off screen for machine
       rect (77.3, 180.3, 218.5, 149.5);
       fill (20);
      
      //once the coin reaches a certain point behind the machine a random fortune is displayed on the screen and the coin stops moving 
      textSize (20);
      textAlign(CENTER, CENTER);
      text ((fortunes[index]), 81, 185, 210, 140);
      cxLoc = 215;
    }
      //display insert coin button: flashing yellow rectangle
       fill (255, g, 50);
       rect(rectX, rectY, rectW, rectH);

       //display black text for insert coin button 
       fill (0);
       textSize(15);
       textAlign(BASELINE);
       text(ic, 137, 535.5);
    }
  }
