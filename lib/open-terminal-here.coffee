exec = require("child_process").exec
path = require('path')

module.exports =
  activate: ->
    atom.workspaceView.command "open-terminal-here:open", (event) =>
      @open()

  open: ->
    filepath = atom.workspaceView.find('.tree-view .selected')?.view()?.getPath?()
    if filepath
      dirpath = path.dirname(filepath)
      exec "open -a Terminal.app #{dirpath}" if dirpath?