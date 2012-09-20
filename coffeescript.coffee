define (require, exports, module) ->
  
  ide = require 'core/ide'  
  ext = require 'core/ext'
  noderunner = require 'ext/noderunner/noderunner'

  PATH_TO_COFFEE = 'node_modules/coffee-script/bin/coffee'

  enabled = yes
  compile = (path) ->
    realPath = path.slice(ide.davPrefix.length + 1).replace("//", "/")
    noderunner.run(PATH_TO_COFFEE,  ['-cb', realPath], false)

  module.exports = ext.register 'ext/coffeescript/coffeescript',
    # Cloud9 
    name: 'InstantCoffee'
    dev: 'Lauris Vāvere'
    type: ext.GENERAL
    alone: yes
    hook: ->
      console.log 'hook'
      ide.addEventListener 'afterfilesave', @afterFileSave
    init: ->
    enable: ->
      enabled = yes
    disable: ->
      enabled = no
    destroy: ->
      ide.removeEventListener 'afterfilesave', @afterFileSave
    # Instant Coffee
    afterFileSave: (e) ->
      if enabled      
        path = e.node.getAttribute("path")
        match = path.match(/.coffee$/)
        compile(path) if match



