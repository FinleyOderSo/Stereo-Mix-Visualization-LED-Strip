# Stereo-Mix-Visualization-LED-Strip

This Project is itended to make your LED Strip flash to music currently playing on a PC. I know there are lots of improvements to make to this code, but it works. And thats all I want.

In the Arduino IDE:
You may have to change a lot when you're using a different LED Type.
Also adjust the pins and the amount of LED's. Aswell as the Baudrate.

In Processing:
If you changed the com port and the Baudrate, so it works with your Arduino, you should see this:
https://i.imgur.com/33MzPso.png

This is the pretty basic interface. First of all you need to enable the Communication to your Arduino by pressing the Button.
If your Stereomix is setup correctly and checked as the standard device it should work without problems.

The modified color visualizes the RGB values that are send to your Arduino. You can adjust it by playing around with the decrease rate. A higher decrease Rate means that its more truly to the Music playing. A lower decrease rate protects your eyes from flashing colors.
I recommend a value round about 20.

On the left side you can change what colors are flashing for which frequencies.

"Display Frequencies" kinda explains itself.



If it's not working, check if your Stereo Mix is showing you feedback when you're playing audio:
https://i.imgur.com/2jNLP6q.png

When everything is good with your Stereo Mix, check if the Baudrates you selected in processing and on your Arduino are the same.
if you only see a gray or white Frame maybe you selected the wrong com port (just try all from 0-10) or you maybe didn't download the Font.

When it's still not working though, I would have to google for the problem as well.

But when it is working, you can export the program out of processing so you can run it alone. And don't forget to drag and drop the Fonts folder to the exported program's folder. Processing won't do that for you.
