import processing.sound.*;
import processing.core.*; // included because the PApplet is needed for the SinOsc class.

int sWidth = 2048, sHeight = 1080; // screen dimensions

color bgColor = #261106;
color highlightColor = #d5bf90;
PFont coolFont;

int gridSize = sWidth / 18; // 9 buttons vertically + spacing

boolean[] keyHeldDown; // array for holding the keys currently held down.
/*
the native keyboard input system in processing cannot in an easy way be set to handle multiple inputs at the same time.
Therefore this method is employed. This allows for as many keys as required to be triggered at the same time.
*/

String bigLabel = "Peter's Omnichord";

// necessary for instantiating SinOsc in Chord class, as it requires a parent.
PApplet main;


// void settings is included to be able to set the width and height of the window with variables.
// this means that width and height can be referenced everywhere because they are global variables.
void settings() 
{
    //fullScreen();
    width = sWidth; 
    height = sHeight;
}

void setup()
{
    coolFont = createFont("bamfi.ttf", 50);
    textFont(coolFont);
    main = new PApplet(); // again... just for SinOsc class
    loadChords();
    makeButtons();
    keyHeldDown = new boolean[255]; // array for holding the keys that are held down.
}

void draw()
{
    background(bgColor);
    textSize(50);
    text(bigLabel, gridSize * 2, gridSize * 3);
    textSize(20);
    displayLabels();
    keyboardInput(); // activate keyboard input
    
    // set labels for major row and minor row
    text("Major", gridSize/2, upperRowPos+gridSize/3);
    text("Minor", gridSize/2, lowerRowPos+gridSize/3);
    displayButtons();
    
    activateChords(); // the buttons will trigger the corresponding chord.
}

void keyPressed()
{
    keyHeldDown[keyCode] = true;
}

void keyReleased()
{
    keyHeldDown[keyCode] = false;
}
