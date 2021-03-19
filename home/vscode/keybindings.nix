[
  # these bindings remap the window zoom actions to editor zoom, this gets 
  # around the issue where your settings are read-only when managed via nix,
  # and the default cmd+= and cmd+- for zooming the window attempt to update
  # those values
  { key = "cmd+="; command = "editor.action.fontZoomIn"; }
  { key = "cmd+-"; command = "editor.action.fontZoomOut"; }

  # these bindings were originally re-written from vscode-sublime-blah-blah plugin
  # so that they would be the same on Linux + OSX.

  { key = "cmd+y"; command = "redo"; when = "editorTextFocus && !editorReadonly"; }
  { key = "cmd+w"; command = "workbench.action.closeActiveEditor"; }

  # open 
  { key = "cmd+p"; command = "workbench.action.quickOpenPreviousEditor"; }
  { key = "cmd+t"; command = "workbench.action.quickOpen"; }

  # select active editor
  { key = "cmd+1"; command = "workbench.action.openEditorAtIndex1"; }
  { key = "cmd+2"; command = "workbench.action.openEditorAtIndex2"; }
  { key = "cmd+3"; command = "workbench.action.openEditorAtIndex3"; }
  { key = "cmd+4"; command = "workbench.action.openEditorAtIndex4"; }
  { key = "cmd+5"; command = "workbench.action.openEditorAtIndex5"; }
  { key = "cmd+6"; command = "workbench.action.openEditorAtIndex6"; }
  { key = "cmd+7"; command = "workbench.action.openEditorAtIndex7"; }
  { key = "cmd+8"; command = "workbench.action.openEditorAtIndex8"; }
  { key = "cmd+9"; command = "workbench.action.openEditorAtIndex9"; }
  { key = "shift+cmd+["; command = "workbench.action.previousEditor"; }
  { key = "shift+cmd+]"; command = "workbench.action.nextEditor"; }
  # editor groups
  { key = "cmd+shift+1"; command = "workbench.action.focusFirstEditorGroup"; when = "editorFocus"; }
  { key = "cmd+shift+2"; command = "workbench.action.focusSecondEditorGroup"; when = "editorFocus"; }
  { key = "cmd+shift+3"; command = "workbench.action.focusThirdEditorGroup"; when = "editorFocus"; }

  # sidebar
  { key = "cmd+b"; command = "workbench.action.toggleSidebarVisibility"; }

  # cursor movement, these are mostly OSX defaults i want on Linux
  { key = "cmd+left"; command = "cursorHome"; when = "textInputFocus"; }
  { key = "cmd+shift+left"; command = "cursorHomeSelect"; when = "textInputFocus"; }
  { key = "cmd+right"; command = "cursorEnd"; when = "textInputFocus"; }
  { key = "cmd+shift+right"; command = "cursorEndSelect"; when = "textInputFocus"; }
  # multicursor
  { key = "ctrl+shift+up"; command = "editor.action.insertCursorAbove"; when = "editorTextFocus"; }
  { key = "ctrl+shift+down"; command = "editor.action.insertCursorBelow"; when = "editorTextFocus"; }

  # lines
  # default on OSX
  { key = "cmd+/"; command = "editor.action.commentLine"; when = "editorTextFocus && !editorReadonly"; }
  { key = "cmd+l"; command = "expandLineSelection"; when = "editorFocus"; }
  { key = "cmd+shift+l"; command = "editor.action.insertCursorAtEndOfEachLineSelected"; when = "editorTextFocus"; }
  { key = "cmd+j"; command = "editor.action.joinLines"; when = "editorTextFocus"; }

  # random shit leftover from converting the sublime bindings that i dont 
  # remember using and dont feel like culling at the moment
  { key = "cmd+ctrl+g"; command = "editor.action.selectHighlights"; when = "editorFocus"; }
  { key = "cmd+shift+r"; command = "workbench.action.showAllSymbols"; }
  { key = "cmd+shift+d"; command = "editor.action.copyLinesDownAction"; when = "editorFocus"; }
  { key = "cmd+d"; command = "editor.action.addSelectionToNextFindMatch"; when = "editorFocus"; }
  { key = "cmd+r"; command = "workbench.action.gotoSymbol"; }
  { key = "cmd+alt+down"; command = "editor.action.goToDeclaration"; }
  { key = "cmd+g"; command = "editor.action.nextMatchFindAction"; when = "editorTextFocus"; }
  { key = "cmd+k cmd+up"; command = "workbench.action.splitEditor"; }
  { key = "alt+cmd+1"; command = "workbench.action.joinTwoGroups"; }
  { key = "alt+cmd+2"; command = "workbench.action.splitEditor"; }
  { key = "alt+cmd+8"; command = "workbench.action.toggleEditorGroupLayout"; }
  { key = "cmd+k cmd+down"; command = "workbench.action.closeActiveEditor"; }
  { key = "alt+cmd+["; command = "editor.fold"; when = "editorFocus"; }
  { key = "cmd+alt+]"; command = "editor.unfold"; when = "editorFocus"; }
  { key = "cmd+k cmd+0"; command = "editor.unfoldAll"; when = "editorFocus"; }
  { key = "cmd+alt+f"; command = "editor.action.startFindReplaceAction"; }
  { key = "cmd+k cmd+u"; command = "editor.action.transformToUppercase"; when = "editorTextFocus"; }
  { key = "cmd+k cmd+l"; command = "editor.action.transformToLowercase"; when = "editorTextFocus"; }
  { key = "cmd+k a"; command = "workbench.action.showErrorsWarnings"; }
  { key = "cmd+k n"; command = "editor.action.marker.next"; when = "editorFocus"; }
  { key = "cmd+k p"; command = "editor.action.marker.prev"; when = "editorFocus"; }
  { key = "alt+cmd+s"; command = "workbench.action.files.saveAll"; }
  { key = "cmd+shift+space"; command = "editor.action.smartSelect.grow"; when = "editorTextFocus"; }
  { key = "ctrl+alt+up"; command = "scrollLineUp"; when = "editorTextFocus"; }
  { key = "ctrl+alt+down"; command = "scrollLineDown"; when = "editorTextFocus"; }
  { key = "ctrl+-"; command = "workbench.action.navigateBack"; }
  { key = "ctrl+shift+-"; command = "workbench.action.navigateForward"; }
  { key = "ctrl+cmd+up"; command = "editor.action.moveLinesUpAction"; when = "editorTextFocus"; }
  { key = "ctrl+cmd+down"; command = "editor.action.moveLinesDownAction"; when = "editorTextFocus"; }
  { key = "ctrl+m"; command = "editor.action.jumpToBracket"; when = "editorFocus"; }
  { key = "ctrl+shift+pageup"; command = "cursorColumnSelectPageUp"; when = "editorTextFocus"; }
  { key = "ctrl+shift+pagedown"; command = "cursorColumnSelectPageDown"; when = "editorTextFocus"; }
]
