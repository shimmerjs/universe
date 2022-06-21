{
  # helps deal with explorer font size
  "window.zoomLevel" = 2;
  "editor.fontSize" = 10;

  "workbench.colorTheme" = "Ayu Light";

  "editor" = {
    "tabSize" = 2;
    "rulers" = [ 80 120 ];
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
  # python language settings
  "[python]" = {
    "editor.formatOnSave" = true;
  };
  "[json]" = {
    "editor.formatOnSave" = true;
    "editor.defaultFormatter" = "vscode.json-languange-features";
  };
  # python (the extension) settings, dis is dumb as hell
  "python" = {
    "linting" = {
      "lintOnSave" = true;
      "pylintPath" = "~/.nix-profile/bin/pylint";
    };
    "formatting" = {
      "autopep8Path" = "~/.nix-profile/bin/autopep8";
    };
  };
  # starlark language settings
  "[starlark]" = {
    "editor.tabSize" = 4;
    "editor.formatOnSave" = true;
  };
  # bazel extension settings
  "bazel" = {
    "buildifierFixOnFormat" = true;
  };
  # go language settings
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
  # go extension settings
  "go" = {
    "useLanguageServer" = true;
  };
  "gopls" = {
    "deepCompletion" = true;
    "completeUnimported" = true;
    "ui.diagnostic.experimentalDiagnosticsDelay" = "250ms";
  };

  "rewrap.wrappingColumn" = 80;

  "files.autoSave" = true;

  "prettier.requireConfig" = true;

  "workbench.activityBar.visible" = false;
  "workbench.editor.closeOnFileDelete" = true;
  "workbench.editor.enablePreview" = false;
  "workbench.editor.highlightModifiedTabs" = true;
  "workbench.editor.openPositioning" = "last";

  "window.closeWhenEmpty" = true;
  "window.nativeTabs" = true;

  # dont automatically expand tree for active files, good for big repos
  "explorer.autoReveal" = false;

  "editor.minimap.enabled" = false;

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
