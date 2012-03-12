Running
=======

You can serve the notebook with 'python -m SimpleHTTPServer', then visit http://localhost:8000


Developing
==========

Requirements
------------

npm packages: coffeecup, stylus and coffee-script

you need to fetch ace with git submodule init && git submodule update

Compilation
-----------

Use the watch flag and background the process to build automatically...

Compile template: 
  
  coffeecup -w index.coffee &

Compile model: 

  coffeescript -c -w ./src &

Compile css
  
  stylus -w css/ &
  

TODO: 
=====

Frontend
--------

Now:

* detect whether content changed when evaluating (short circuit) - could do on isDirty except when
new loaded notebook 
* Skip null output/ show null output placeholder
* Set inital focus
* Better isScrolled logic
* Mathjax ready global 
* Highlighter for view mode
* Center notepad
* Defocus ajax should empty selection
* consistent selection color input and output
* firefox postMessage print


Someday: 
* Table of contents filter  http://www.jankoatwarpspeed.com/examples/table-of-contents/demo2.html
* Same shortcuts on output as input (ctrl-c ctrl-fold ctrl-m)
* Page Down
* Document name
* Insert cell scroll
* Focus ace line where clicked
* Drag cell to reorder
* ace/virtual_renderer.js without scrollbar layers
* Holding keydown focus properly 
* CTRL-fold
* toolbar jump to running indicator
* toolbar rerun all cells
* Startup indicator
* Tooltip styling


CSS stuff http://css-tricks.com/different-transitions-for-hover-on-hover-off/

