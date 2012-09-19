define (require, exports, module) ->
  
  ide = require 'core/ide'  
  ext = require 'core/ext'

  PATH_TO_COFFEE = 'node_modules/coffee-script/bin/coffee'

  module.exports = ext.register 'ext/coffeescript/coffeescript',
    name: 'Coffeescript'
    dev: 'Lauris Vāvere'
    type: ext.GENERAL
    alone: yes
    hook: ->
      ide.addEventListener 'afterfilesave', (e) ->
        node = e.node
        path = node.getAttribute("path")
        match = path.match(/.coffee$/)
        if match
          compile(path)

      compile = (path) ->
        alert 'compile #{ path } ...'

    init: ->
      
    show: ->
      
    enable: ->
        
    disable: ->
        
    destroy: ->


