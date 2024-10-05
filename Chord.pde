Table chordTable; // variable for the file notes.csv
Chord[] chords; // array for holding the chords.

class Chord
{
    // master volume
    float volume = 0.2;
    
    String name; // name of the chord
    String label; // name of the chord without major/minor at the end
    String keyboard;
    
    // frequencies to be drawn from the file notes.csv 
    float rootFreq;
    float thirdFreq;
    float fifthFreq;
    
    //oscillators to play the 3 frequencies making up the triad of each chord.
    SinOsc root;
    SinOsc third;
    SinOsc fifth;
    
    boolean isPlaying;
    
    Chord(String _name, float _root, float _third, float _fifth) // constructor. Runs everytime "new Chord()" is called
    {
        name = _name;
        rootFreq = _root;
        thirdFreq = _third;
        fifthFreq = _fifth;
        root = new SinOsc(main);
        third = new SinOsc(main);
        fifth = new SinOsc(main);
    }
    
    void play() // activates all of the oscilators for the specific chord.
    {
        root.play(rootFreq, volume);
        third.play(thirdFreq, volume);
        fifth.play(fifthFreq, volume);
        isPlaying = true;
    }
    void lift() // stops the chord from playing.
    {
        root.stop();
        third.stop();
        fifth.stop();
        isPlaying = false;
    }
}

/*
void loadChords takes a .csv file and reads it row for row.

it gets the header of each row and reads iteratively through to get the variables needed
*/
int e = 0; // iterator for loadChords
void loadChords()
{
    chordTable = loadTable("notes.csv", "header");
    chords = new Chord[chordTable.getRowCount()];
    
    for (TableRow row : chordTable.rows())
    {
        String _name = row.getString("name");
        float _root = row.getFloat("root");
        float _third = row.getFloat("third");
        float _fifth = row.getFloat("fifth");
        String _label = row.getString("label");
        String _key = row.getString("key");
        // the loaded variables from the .csv is used in the constructor for each Chord instance
        chords[e] = new Chord(_name, _root, _third, _fifth);
        chords[e].label = _label;
        chords[e].keyboard = _key;
        e++;
    }
}
