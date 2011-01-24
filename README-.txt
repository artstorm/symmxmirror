SymmXMirror 1.1
===============
LightWave Modeler LScript by Johan Steen.


Description
===========
SymmXMirror automatically corrects symmetry errors in an object by
selecting the -x side, flatten it, delete it and then mirror the +x side.

This is an automation of a technique by William 'Proton' Vaughan.

It's been available for some years as the plugin PMirror.p, but as
PMirror is only availble for win32, and I just entered the win64 era, 
I wrote this LScript version so I got a working tool under LightWave x64.
This should also work with MacOS Universal Binary.



Usage
=====
My advise is to add the tool to a convenient spot in your modeler's menu.
Then all you have to do is press the button to let the plugin do it's
"magic" when the symmetry gets messed up in an object.


Parameters
==========
* None


Installation
============
* Copy the JS_SymmXMirror.lsc to LightWave's plug-in folder.
* If "Autoscan Plugins" is enabled, just restart LightWave and it's installed.

* Else locate the "Add Plugins" button in LightWave and add it manually.


Author
======
This tool is written by Johan Steen.
Contact me through http://www.artstorm.net/


History
=======
v1.1 - 4 Jul 2008:
  * Added a Progress Monitor when processing with dense high polycount meshes.
  * The script can now be aborted while the progress monitor runs by pressing ESC.
v1.01 - 28 Jun 2008:
  * Changed the internal name of SymmXMirror to include the prefix JS_.
v1.0 - 17 Feb 2008:
  * Release of version 1.0.


Disclaimer / Legal Stuff
========================
SymmXMirror is freeware. 
Please do not distribute or re-post this 
tool without the author's permission.

SymmXMirror is provided "as is" without 
warranty of any kind, either express or implied,
no liability for consequential damages.

By installing and or using this software
you agree to the terms above.

Copyright © 2008 Johan Steen.