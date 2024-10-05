// this whole page takes care of keyboard input.
// it works by setting a boolean in an array to true or false.
// this allows better control of when a key is pressed and when it is released.

void keyboardInput()
{
    // top row MAJOR
    if (keyHeldDown['Q']) buttons[0].isPressed = true;
    else buttons[0].isPressed = false;
   
    if (keyHeldDown['W']) buttons[1].isPressed = true;
    else buttons[1].isPressed = false;
    
    if (keyHeldDown['E']) buttons[2].isPressed = true;
    else buttons[2].isPressed = false;
    
    if (keyHeldDown['R']) buttons[3].isPressed = true;
    else buttons[3].isPressed = false;

    if (keyHeldDown['T']) buttons[4].isPressed = true;
    else buttons[4].isPressed = false;
    
    if (keyHeldDown['Y']) buttons[5].isPressed = true;
    else buttons[5].isPressed = false;
    
    if (keyHeldDown['U']) buttons[6].isPressed = true;
    else buttons[6].isPressed = false;
    
    if (keyHeldDown['I']) buttons[7].isPressed = true;
    else buttons[7].isPressed = false;
    
    if (keyHeldDown['O']) buttons[8].isPressed = true;
    else buttons[8].isPressed = false;
    
    // bottom row MINOR
    
    if (keyHeldDown['A']) buttons[9].isPressed = true;
    else buttons[9].isPressed = false;
   
    if (keyHeldDown['S']) buttons[10].isPressed = true;
    else buttons[10].isPressed = false;
    
    if (keyHeldDown['D']) buttons[11].isPressed = true;
    else buttons[11].isPressed = false;
    
    if (keyHeldDown['F']) buttons[12].isPressed = true;
    else buttons[12].isPressed = false;

    if (keyHeldDown['G']) buttons[13].isPressed = true;
    else buttons[13].isPressed = false;
    
    if (keyHeldDown['H']) buttons[14].isPressed = true;
    else buttons[14].isPressed = false;
    
    if (keyHeldDown['J']) buttons[15].isPressed = true;
    else buttons[15].isPressed = false;
    
    if (keyHeldDown['K']) buttons[16].isPressed = true;
    else buttons[16].isPressed = false;
    
    if (keyHeldDown['L']) buttons[17].isPressed = true;
    else buttons[17].isPressed = false;
}
