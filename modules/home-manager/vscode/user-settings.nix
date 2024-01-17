{
  # Go settings
  # language settings, not to be confused with plugins that have the same name
  "[go]" = {
    "codeActionsOnSaveTimeout" = 3000;
    # Optional: Disable snippets, as they conflict with completion ranking.
    "snippetSuggestions" = "none";
  };
  "[go.mod]" = {
    "editor" = {
      "formatOnSave" = "explicit";
      "codeActionsOnSave" = {
        "source" = {
          "organizeImports" = "explicit";
        };
      };
    };
  };

  # Typescript settings
  "[typescript]" = {
    "editor.defaultFormatter" = "esbenp.prettier-vscode";
    "editor.formatOnSave" = "always";
    "editor.codeActionsOnSave" = {
      "source.fixAll.tslint" = "explicit";
      "source.organizeImports" = "explicit";
    };
    "updateImportsOnFileMove.enabled" = "always";
  };
  "[html]" = {
    "editor.formatOnSave" = "explicit";
    "editor.defaultFormatter" = "esbenp.prettier-vscode";
  };
  "[css]" = {
    "editor.formatOnSave" = "explicit";
    "editor.defaultFormatter" = "esbenp.prettier-vscode";
  };
  "[javascript]" = {
    "updateImportsOnFileMove.enabled" = "always";
  };
  "[markdown]" = {
    "editor.tabSize" = 2;
    "editor.formatOnSave" = "explicit";
    "editor.defaultFormatter" = "fcrespo82.markdown-table-formatter";
  };
  "[nix]" = {
    "editor.defaultFormatter" = "jnoortheen.nix-ide";
    "editor.formatOnSave" = "explicit";
  };
  "[python]" = {
    "editor.formatOnSave" = "explicit";
  };
  "[json]" = {
    "editor.defaultFormatter" = "vscode.json-language-features";
    "editor.formatOnSave" = "explicit";
  };
  "[starlark]" = {
    "editor.tabSize" = 4;
    "editor.formatOnSave" = "explicit";
  };

  # Extension settings
  "python" = {
    "linting" = {
      "lintOnSave" = "explicit";
      "pylintPath" = "~/.nix-profile/bin/pylint";
    };
    "formatting" = {
      "autopep8Path" = "~/.nix-profile/bin/autopep8";
    };
  };

  "bazel" = {
    "buildifierFixOnFormat" = "explicit";
  };

  "go" = {
    "lintOnSave" = "package";
    "useLanguageServer" = true;
  };
  "gopls" = {
    "ui.semanticTokens" = true;
    "ui.completion.completionBudget" = "10ms";
    "deepCompletion" = true;
    "completeUnimported" = true;
  };

  "D2" = {
    "updateOnSave" = "explicit";
    "previewTheme" = "Terminal";
  };

  "prettier.requireConfig" = false;

  # File settings
  "files" = {
    # Improve general performance
    "watcherExclude" = {
      "**/.git/objects/**" = true;
      "**/.git/subtree-cache/**" = true;
      "**/bazel-*/*/**" = true;
      "**/node_modules/**" = true;
    };
  };

  # Editor settings
  # Helps deal with explorer font size
  "window.zoomLevel" = 2.0;

  # color theme
  "workbench.colorTheme" = "Everforest Light";

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
    "folding" = false;
    "foldingHighlight" = false;
    "lightbulb.enabled" = false;
  };

  # IDK THIS SETTING JUST STUPID
  "terminal.integrated.enablePersistentSessions" = false;

  "files.autoSave" = true;

  "workbench.activityBar.location" = "hidden";
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
