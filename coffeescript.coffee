define (require, exports, module) ->
  
  ide = require 'core/ide'  
  ext = require 'core/ext'
  noderunner = require 'ext/noderunner/noderunner'

  PATH_TO_COFFEE = 'node_modules/coffee-script/bin/coffee'

  module.exports = ext.register 'ext/coffeescript/coffeescript',
    name: 'Coffeescript'
    dev: 'Lauris Vāvere'
    type: ext.GENERAL
    alone: yes

    hook: ->
      console.log 'hook'
      ide.addEventListener 'afterfilesave', (e) ->
        path = e.node.getAttribute("path")
        match = path.match(/.coffee$/)
        if match
          compile(path)

      compile = (path) ->
        realPath = path.slice(ide.davPrefix.length + 1).replace("//", "/")
        noderunner.run(PATH_TO_COFFEE,  ['-cb', realPath], false)

    init: ->
      console.log 'init'
    show: ->
      console.log 'show'
    enable: ->
      console.log 'enable'
    disable: ->
      console.log 'disable'
    destroy: ->
      console.log 'destroy'


