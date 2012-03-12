doctype 5
html ->
  head ->
    title 'notebook.js demo'
    script src: "/lib/jquery-1.7.1.js" 
    script src: "/lib/underscore.js" 
    script src: "/lib/backbone.js" 
    script src: "/lib/backbone.localStorage.js"
    script src: "/lib/showdown.js"
    script src: "/ace/build/src/ace.js"
    script src: "/ace/build/src/mode-javascript.js"
    script src: "/ace/build/src/mode-markdown.js"
    script src: "/src/engine.js" 
    script src: "/src/notebook.js" 
    script src: "/src/views.js" 
    
    if true
      link href: 'http://fonts.googleapis.com/css?family=Anonymous+Pro:400,700', rel: 'stylesheet', type: 'text/css'
      script type: 'text/x-mathjax-config'
        "MathJax.Hub.Config({messageStyle: 'none', skipStartupTypeset: true, tex2jax: {inlineMath: [['$','$'], ['\\(','\\)']]}});"
      script src: "http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"

    link rel: 'stylesheet', href: '/css/base.css'
    link rel: 'stylesheet', href: '/css/skeleton.css'
    link rel: 'stylesheet', href: '/css/layout.css'
    link rel: 'stylesheet', href: '/css/notebook.css'

  body ->
    
    div '.container', ->
      div '#navbar', ->
        div '#logo', -> 'notebook.js'
        div '#title', -> ''
      
    script type: "text/template", id: "cell-edit-template", ->
      div '.cell', id: "[[= id ]]", ->

        # the cell type indicator
        # we enclose in a tooltip div to avoid rotating the tooltip
        div 'tooltip', tooltip: 'Click to change cell type', ->
          a 'type', -> '[[= type ]]'
        
        # the cell spawner
        div 'spawn-above', tabindex: '[[= position ]]a'

        # the fold button, tooltip outside to avoid rotating tooltip
        div 'fold-control tooltip', tooltip: 'Click to fold input', ->
          div 'fold-button', -> '>'

        # the input in a container we use to control sizing
        div 'ace-container', ->
          div class: "cell-input", style: "top:0;bottom:0;left:0;right:0;", id: "input-[[= id ]]", ->
      
        hr -> ''

        div 'cell-output', tabindex: "[[= position ]]c", ->
          '[[= output ]]'

        # status controls in left margin
        div 'status-bar', -> 
          div 'tooltip', tooltip: 'Evaluate', -> 
            img 'evaluate', src: '/img/play.png'
          div 'tooltip', tooltip: 'Interrupt', ->
            img 'interrupt tooltip', src: '/img/ajax-loader.gif', tooltip: 'Interrupt'

    script type: "text/template", id: 'cell-view-template', -> 
      div '.cell', id: "[[= id ]]", ->
        # FIXME: mixing of underscore logic in this coffeekup template is not pretty
        # we need two fake divs here to get the text output
        # must be better way
        div "[[ if (type != 'markdown') { ]]" 
        pre class: "cell-input", -> "[[= input ]]"
        hr -> ''
        div "[[ } ]]"

        div class: "cell-output", -> "[[= output ]]"
        div class: 'spawn-above'

    script type: "text/template", id: "index-template", ->
      div id: "notebook", class: "sixteen columns", -> 
        div 'cell', ->
          h1 -> "Welcome to notebook.js"

    script type: "text/template", id: "notebook-template", ->
      div id: 'notebook', class: "twelve columns", ->
        ul class: "cells"
        div id: 'spawner', tabindex: "1000000000"

