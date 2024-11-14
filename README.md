## Autohotkey Shortcuts for Autodesk Fusion

Let's face it: Autodesk is **_never_** going to let us choose which hotkeys we want.

This script is simple. You assign a method to a key, then define the method further below.

**It's important to use the built in method "fusion.runShortcut("shortcutname")", otherwise the scripts will run while you don't have Fusion focused (ie: Outlook, Word, Terminal, etc..).**

There are a few basic examples that I've assured work (as of 14 Nov 2024).

- The first one I've provided - mouse button 4 will trigger the "look at" function. There's about a half second delay.
- The second one - mouse button 5 will trigger the "Zoom" function, so you can zoom in on a component.

If you need to add your own custom items, I've provided some custom functions to make life easier. Follow the syntax of the provided examples. There are descriptions for each functions as well.
The basic workflow is as follows:
1. Create a new method within the FusionShortcuts class
2. Add steps for how you would manually trigger it in that same method.
3. Finally, bind the key to the helper method: fusion.runShortcut("yourcustomthinghere") 
