# 20.09.2012
# Lauris Vāvere
# MA-1 Datori, SIA

define (require, exports, module) ->
  
  ide = require 'core/ide'  
  ext = require 'core/ext'
  noderunner = require 'ext/noderunner/noderunner'
  fs = require "ext/filesystem/filesystem"

  PATH_TO_COFFEE = 'node_modules/coffee-script/bin/coffee'

  # enable/disable control
  enabled = yes

  # event sink
  afterFileSave = (e) ->
    if enabled
      path = e.node.getAttribute("path")
      match = path.match(/\/src\/[^/]+\.coffee$/)
      compile(path) if match

  # cofffescript compile
  compile = (path) ->
    virtualCoffee = ide.davPrefix + "/" + PATH_TO_COFFEE
    fs.exists virtualCoffee, (exists) ->
      if exists
        realPath = path.slice(ide.davPrefix.length + 1).replace("//", "/")
        noderunner.run(PATH_TO_COFFEE,  ['-cbo', 'lib', realPath], false)

  # export cloud9 plugin 
  module.exports = ext.register 'ext/instantcoffee/instantcoffee',
    name: 'InstantCoffee'
    dev: 'Lauris Vāvere'
    type: ext.GENERAL
    alone: yes
    hook: ->
      ide.addEventListener 'afterfilesave', afterFileSave
    init: ->
    enable: ->
      enabled = yes
    disable: ->
      enabled = no
    destroy: ->
      ide.removeEventListener 'afterfilesave', afterFileSave



