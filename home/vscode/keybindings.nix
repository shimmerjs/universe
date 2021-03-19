[
  # these bindings remap the window zoom actions to editor zoom, this gets 
  # around the issue where your settings are read-only when managed via nix,
  # and the default cmd+= and cmd+- for zooming the window attempt to update
  # those values
  {
    key = "cmd+=";
    command = "editor.action.fontZoomIn";
  }
  {
    key = "cmd+-";
    command = "editor.action.fontZoomOut";
  }
]
