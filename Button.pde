// y positions
int upperRowPos = gridSize * 6;
int lowerRowPos = gridSize * 7;
int labelRowPos = gridSize * 5;
int indent = gridSize * 2;

Button[] buttons; // array for holding buttons

class Button
{
    String label;
    PShape body;
    Chord chord; // every button has a corresponding chord
    
    // positions and dimensions
    float xpos, ypos;
    float bWidth = gridSize / 2;
    float bHeight = gridSize / 2;

    // colors
    color tint = #fffde8;
    color pressTint = #FFF79C;
    color currentTint;

    boolean isPressed;
    
    
    Button(Chord _chord, float _x, float _y) // every button has a corresponding chord and position
    {
        chord = _chord;
        label = _chord.name.toString();
        
        xpos = _x;
        ypos = _y;
        //initial state is not pressed
        isPressed = false;
    }
    
    void display()
    {
        // if button is pressed, one color. if not another color
        if (isPressed)
        {
            currentTint = pressTint;
        }
        else currentTint = tint;

        body = createShape(RECT, xpos, ypos, bWidth, bHeight, 10);
        
        fill(currentTint);
        shape(body);
    }
    
}
void activateChords()
{
    for (int i = 0; i< buttons.length; i++)
    {
        if (buttons[i].isPressed)
        {
            println(buttons[i].label + " is Playing");
            buttons[i].chord.play();
        }
        else buttons[i].chord.lift();
    }
}

void displayLabels()
{
    /*
    make the labels drawn from file notes.csv
    */
    for (int i = 0; i < 9; i++) // display the chord titles above the buttons
    {
        fill(buttons[0].tint);
        textSize(30);
        text(chords[i].label, buttons[i].xpos, labelRowPos);
    }
    for (Button b : buttons) // display the key to be pressed on the keyboard
    {
        text(b.chord.keyboard, b.xpos, b.ypos);
    }
}


void makeButtons()
{
    buttons = new Button[chordTable.getRowCount()]; // one button for each chord
    int e = 0; // iterator variable
    for (int i = 0; i< buttons.length ; i++)
    {
        if (i < buttons.length / 2) // place first half of buttons on top row
        {
            buttons[i] = new Button(chords[i], i*gridSize + indent, upperRowPos);
        }
        else // place second half of buttons on lower row
        {
            buttons[i] = new Button(chords[i], e * gridSize + indent, lowerRowPos);
            e++;
        }  
        
    }
}

void displayButtons() // takes the function button.display and runs it for all the buttons.
{
    for (Button b : buttons) b.display();
}
