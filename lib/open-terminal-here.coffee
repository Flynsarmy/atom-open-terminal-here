exec = require("child_process").exec
path = require('path')

module.exports =
  configDefaults: {
    app: 'Terminal.app'
    args: ''
  },
  activate: ->
    atom.workspaceView.command "open-terminal-here:open", (event) =>
      @open()

  open: ->
    filepath = atom.workspaceView.find('.tree-view .selected')?.view()?.getPath?()
    if filepath
      dirpath = path.dirname(filepath)
      app = atom.config.get('open-terminal-here.app')
      args = atom.config.get('open-terminal-here.args')
      exec "open -a #{app} #{args} #{dirpath}" if dirpath?