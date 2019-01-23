# Stereo-Mix-Visualization-LED-Strip

This Project is itended to help little programmers (like me) at making there LED Strip flash to music currently playing on a PC. I know there are lots of improvements to make to this code, but it works. And thats all I want.

If you changed the Com Port and the Baudrate, so it works with your Arduino, you should see this:
https://i.imgur.com/33MzPso.png

This is the pretty basic interface. First of all you need to enable the Communication to your Arduino by pressing the Button.
If your Stereomix is setup correctly and checked as the standard device it should work now.

The modified color visualizes the RGB values that are send to your Arduino. You can adjust it by playing around with the decrease rate. A higher decrease Rate means that its more truly to the Music playing. A lower decrease rate protects your eyes from flashing colors.
I recommend a value round about 20.

On the left side you can change what colors are flashing for which frequencies.

"Display Frequencies" kinda explains itself.

If it's not working check if your Stereo Mix is showing you feedback when you're playing audio:
<blockquote class="imgur-embed-pub" lang="en" data-id="2jNLP6q"><a href="//imgur.com/2jNLP6q"></a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>
