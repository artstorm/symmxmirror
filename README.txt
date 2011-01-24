--------------------------------------------------------------------------------
 SymmXMirror - README

 SymmXMirror automatically corrects symmetry errors in an object by
 selecting the -x side, flatten it, delete it and then mirror the +x side.

 Website:      http://www.artstorm.net/plugins/symmxmirror/
 Project:      http://code.google.com/p/js-lightwave-lscripts/
 Feeds:        http://code.google.com/p/js-lightwave-lscripts/feeds
 
 Contents:
 
 * Installation
 * Usage
 * Source Code
 * Changelog
 * Credits

--------------------------------------------------------------------------------
 Installation
 
 General installation steps:

 * Copy the JS_SymmXMirror.lsc to LightWave's plug-in folder.
 * If "Autoscan Plugins"
   is enabled, just restart LightWave and it's installed.
 * Else locate the "Add Plugins" button in LightWave and add it manually.

--------------------------------------------------------------------------------
 Usage

 I'd suggest to add the tool to a convenient spot in your modeler's menu.
 Then all you have to do is press the button to let the plugin do it's
 "magic" when the symmetry gets messed up in an object.

--------------------------------------------------------------------------------
 Source Code
 
 Download the source code:
 
   http://code.google.com/p/js-lightwave-lscripts/source/checkout

 You can check out the latest trunk or any previous tagged version via svn
 or explore the repository directly in your browser.
 
 Note that the default checkout path includes all my available LScripts, you
 might want to browse the repository first to get the path to the specific
 script's trunk or tag to download if you don't want to get them all.
 
--------------------------------------------------------------------------------
 Changelog

 * v1.1 - 4 Jul 2008:
   * Added a Progress Monitor when processing with dense high polycount meshes.
   * The script can now be aborted while the progress monitor runs by pressing ESC.
 * v1.01 - 28 Jun 2008:
   * Changed the internal name of SymmXMirror to include the prefix JS_.
 * v1.0 - 17 Feb 2008:
   * Release of version 1.0.

--------------------------------------------------------------------------------
 Credits

 Johan Steen, http://www.artstorm.net/
 * Original author
 
 