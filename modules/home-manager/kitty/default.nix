{
  programs.kitty = {
    enable = true;
    settings = {
      # dont update unless its via nix
      update_check_interval = 0;

      # editor
      editor = "code --wait";

      # osx behavior
      macos_quit_when_last_window_closed = "yes";

      # style
      tab_bar_margin_width = "5.0";
      tab_bar_style = "powerline";

      window_border_width = "0.75pt";

      macos_thicken_font = "0.40";
      macos_show_window_title_in = "none";
      macos_colorspace = "default";

      font_size = "16.0";

      # BELL DING DING DING
      enable_audio_bell = "no";

      # clicking links
      allow_hyperlinks = "yes";
      open_url_modifiers = "cmd";

      # scrollback
      scrollback_lines = 50000;
      scrollback_pager = "fzf --ansi --no-bold";

      # sessions
      startup_session = "sessions/default.conf";

      enabled_layouts = "fat:bias=70;full_size=1,tall:bias=70;full_size=1";

      # clipboard control, enable reading from clipboard
      clipboard_control = "write-clipboard read-clipboard write-primary read-primary";
    };
    keybindings = {
      # tabs
      "cmd+shift+right" = "next_tab";
      "cmd+shift+left" = "previous_tab";
      "cmd+shift+w" = "close_tab";
      "cmd+shift+1" = "goto_tab 1";
      "cmd+shift+2" = "goto_tab 2";
      "cmd+shift+3" = "goto_tab 3";
      "cmd+shift+4" = "goto_tab 4";
      "cmd+shift+5" = "goto_tab 5";
      "cmd+shift+6" = "goto_tab 6";

      # window management
      "cmd+s" = "new_window_with_cwd";
      "cmd+right" = "next_window";
      "cmd+left" = "previous_window";
      "cmd+w" = "close_window";
      "cmd+1" = "first_window";
      "cmd+2" = "second_window";
      "cmd+3" = "third_window";
      "cmd+4" = "fourth_window";
      "cmd+5" = "fifth_window";
      "cmd+6" = "sixth_window";

      # layouts
      "cmd+shift+l" = "next_layout";

      # font sizes
      "cmd+equal" = "change_font_size current + 2.0";
      "cmd+shift+equal" = "change_font_size all + 2.0";
      "cmd+minus" = "change_font_size current - 2.0";
      "cmd+shift+minus" = "change_font_size all - 2.0";

      # https://sw.kovidgoyal.net/kitty/#the-scrollback-buffer
      "cmd+shift+h" = "show_scrollback";

      # reset terminal
      "cmd+k" = "clear_terminal clear active";
      "ctrl+k" = "clear + terminal scroll active";
    };
    extraConfig = ''
      include themes/everforest_light_medium.conf
    '';
  };
  # wire up static kitty assets not managed by home-manager/nix
  home.file.".config/kitty/themes" = {
    recursive = true;
    source = ./themes;
  };
  home.file.".config/kitty/sessions" = {
    recursive = true;
    source = ./sessions;
  };
}
