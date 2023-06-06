{
  # language settings, not to be confused with plugins that have the same name
  "[go]" = {
    "codeActionsOnSaveTimeout" = 3000;
    # Optional: Disable snippets, as they conflict with completion ranking.
    "snippetSuggestions" = "none";
  };
  "[go.mod]" = {
    "editor" = {
      "formatOnSave" = true;
      "codeActionsOnSave" = {
        "source" = {
          "organizeImports" = true;
        };
      };
    };
  };
  "[typescript]" = {
    "editor.defaultFormatter" = "esbenp.prettier-vscode";
    "editor.formatOnSave" = true;
    "editor.codeActionsOnSave" = {
      "source.fixAll.tslint" = true;
      "source.organizeImports" = true;
    };
    "updateImportsOnFileMove.enabled" = "always";
  };
  "[html]" = {
    "editor.formatOnSave" = true;
    "editor.defaultFormatter" = "esbenp.prettier-vscode";
  };
  "[css]" = {
    "editor.formatOnSave" = true;
    "editor.defaultFormatter" = "esbenp.prettier-vscode";
  };
  "[javascript]" = {
    "updateImportsOnFileMove.enabled" = "always";
  };
  "[markdown]" = {
    "editor.tabSize" = 4;
    "editor.formatOnSave" = true;
    "editor.defaultFormatter" = "fcrespo82.markdown-table-formatter";
  };
  "[nix]" = {
    "editor.defaultFormatter" = "jnoortheen.nix-ide";
    "editor.formatOnSave" = true;
  };
  "[python]" = {
    "editor.formatOnSave" = true;
  };
  "[json]" = {
    "editor.formatOnSave" = true;
    "editor.defaultFormatter" = "esbenp.prettier-vscode";
  };
  "[starlark]" = {
    "editor.tabSize" = 4;
    "editor.formatOnSave" = true;
  };

  # extension settings
  "python" = {
    "linting" = {
      "lintOnSave" = true;
      "pylintPath" = "~/.nix-profile/bin/pylint";
    };
    "formatting" = {
      "autopep8Path" = "~/.nix-profile/bin/autopep8";
    };
  };
  "bazel" = {
    "buildifierFixOnFormat" = true;
  };
  "go" = {
    "useLanguageServer" = true;
  };
  "gopls" = {
    "deepCompletion" = true;
    "completeUnimported" = true;
  };
  "D2" = {
    "updateOnSave" = true;
    "previewTheme" = "Terminal";
  };
  "rewrap.wrappingColumn" = 80;
  "prettier.requireConfig" = false;

  # editor settings
  # helps deal with explorer font size
  "window.zoomLevel" = 1.5;

  # color theme
  "workbench.colorTheme" = "Ayu Light";

  "editor" = {
    "tabSize" = 2;
    "fontSize" = 12;
    # vertical guides for line length
    "rulers" = [ 80 120 ];
    "minimap" = {
      "enabled" = false;
    };
    "bracketPairColorization" = {
      "enabled" = false;
    };
  };

  # IDK THIS SETTING JUST STUPID
  "terminal.integrated.enablePersistentSessions" = false;

  "files.autoSave" = true;

  "workbench.activityBar.visible" = false;
  "workbench.editor.closeOnFileDelete" = true;
  "workbench.editor.enablePreview" = false;
  "workbench.editor.highlightModifiedTabs" = true;
  "workbench.editor.openPositioning" = "last";

  "window.closeWhenEmpty" = true;
  "window.nativeTabs" = true;

  # dont automatically expand tree for active files, good for big repos
  "explorer.autoReveal" = false;

  "workbench.editor.closeEmtpyGroups" = false;

  # everything is read-only, so we dont want vscode attempting to udpate 
  # anything on its own
  "extensions.autoCheckUpdates" = false;
  "extensions.autoUpdate" = false;
  "extensions.ignoreRecommendations" = true;
  "extensions.showRecommendationsOnlyOnDemand" = true;

  "update.mode" = "none";
  "update.channel" = "none";

  # bye felicia
  "telemetry.enableCrashReporter" = false;
  "telemetry.enableTelemetry" = false;
}
