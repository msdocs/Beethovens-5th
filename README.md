Generating Beethoven's 5th Symphony using Matlab
===================

----------
Authors:
Mahmoud Saleh:@msdocs
Leslie Daniel:    @lesdaniel
Abdulaziz Alsaedi
Mathew Warshaw: @M_WARSH

[TOC]


Making of Beethoven's 5th Symphony  in MATLAB
-------------
###About
The Team generated a portion Beethoven's 5th Symphony in Matlab  
 all notes portions of the song.
 > **Note:**

> - The song currently does not contain rests however the notes that are played are correct.

We First had to find the notes in Beethoven's 5th. Here are the Beethoven's 5th beginning notes.  

![Notes of Beethoven's 5th Beginning](https://upload.wikimedia.org/score/g/i/giz6k40oiwxynv3oc2172trek9m53bv/giz6k40o.png)
 : [Source](https://en.wikipedia.org/wiki/Symphony_No._5_%28Beethoven%29)

Translates to:

    [G G G E♭] [rest]  [G G G E♭] [rest] [F F F] [rest]  [D G G G]

----------

Next we had to find the frequencies for every note in
The notes that we'll be using for Beethoven's Fifth are in the octave containing frequencies from 220 Hz to 440 Hz
[Source](http://csserver.evansville.edu/~richardson/courses/EE310_LinearSystems_And_DSPI/fall2012/labs/lab04/lab04_music.pdf)

![Piano Notes Octave ](https://www.uberchord.com/wp-content/uploads/2015/06/Piano-Keyboard-Octave.png)
-------
Note        | Frequency (Hz)
------------|--------------
A		 	| 220
A# B♭   	| 220 * 2^(1/12)
B			| 220 * 2^(2/12)
C			| 220 * 2^(3/12)
C# D♭		| 220 * 2^(4/12)
D			| 220 * 2^(5/12)
D# E♭		| 220 * 2^(6/12)
E			| 220 * 2^(7/12)
F			| 220 * 2^(8/12)
F# G♭		| 220 * 2^(9/12)
G			| 220 * 2^(10/12)
G# A♭		| 220 * 2^(11/12)


----------
Credits
Special thanks to @bvagts for decoding the music notes 
