{
  flake.modules = {
    nixos = {
      quickshell = {self, ...}: {
        imports = [self.modules.nixos.quickshell'];
        home-manager.sharedModules = [self.modules.homeManager.quickshell];
      };

      quickshell' = {quickshell, ...}: {
        nixpkgs.overlays = [quickshell.overlays.default];
        qt.enable = true;
      };
    };

    homeManager.quickshell = {
      config,
      inputs',
      pkgs,
      lib,
      ...
    }: {
      xdg.configFile = {
        "quickshell/Divider.qml" = {
          enable = true;
          source = ./Divider.qml;
        };

        "quickshell/StatusBar.qml" = {
          enable = true;
          source = ./StatusBar.qml;
        };

        "quickshell/SystemStats.qml" = {
          enable = true;
          source = ./SystemStats.qml;
        };

        "quickshell/Workspaces.qml" = {
          enable = true;
          source = ./Workspaces.qml;
        };

        "quickshell/shell.qml" = {
          enable = true;

          text = ''
            pragma ComponentBehavior: Bound

            import Quickshell
            import QtQuick
            import QtQuick.Layouts

            ShellRoot {
                id: root

                property color base00: "${config.stylix.base16Scheme.base00}"
                property color base05: "${config.stylix.base16Scheme.base05}"
                property color base0D: "${config.stylix.base16Scheme.base0D}"
                property string fontFamily: "${config.stylix.fonts.monospace.name}"
                property int fontSize: ${toString config.stylix.fonts.sizes.terminal}

                SystemStats {
                    id: sysStats
                }

                Variants {
                    model: Quickshell.screens

                    delegate: Component {
                        PanelWindow {
                            property var modelData
                            screen: modelData

                            anchors {
                                bottom: true
                                left: true
                                right: true
                            }

                            implicitHeight: 25
                            color: "transparent"

                            margins {
                                left: 256
                                right: 256
                            }

                            Rectangle {
                                anchors.fill: parent
                                color: "transparent"

                                RowLayout {
                                    anchors.fill: parent
                                    spacing: 8

                                    Workspaces {
                                        activeColor: root.base0D
                                        inactiveColor: "transparent"
                                        textColor: root.base0D
                                        activeTextColor: root.base00
                                        fontSize: root.fontSize
                                        fontFamily: root.fontFamily
                                    }

                                    Item {
                                        Layout.fillWidth: true
                                    }

                                    StatusBar {
                                        stats: sysStats
                                        textColor: root.base05
                                        fontSize: root.fontSize
                                        fontFamily: root.fontFamily
                                    }
                                }
                            }
                        }
                    }
                }
            }
          '';
        };
      };

      home = {
        packages = [
          inputs'.quickshell.packages.default
          pkgs.kdePackages.kirigami.unwrapped
          pkgs.kdePackages.qtdeclarative
        ];

        sessionVariables = {
          QMLLS_BUILD_DIRS = lib.strings.concatStringsSep ":" [
            "${inputs'.quickshell.packages.default}/lib/qt-6/qml"
            "${pkgs.kdePackages.kirigami.unwrapped}/lib/qt-6/qml"
            "${pkgs.kdePackages.qtdeclarative}/lib/qt-6/qml"
          ];

          QML_IMPORT_PATH = "$PWD/src";
          QML2_IMPORT_PATH = config.home.sessionVariables.QMLLS_BUILD_DIRS;
        };
      };

      programs = {
        nushell.environmentVariables = {inherit (config.home.sessionVariables) QMLLS_BUILD_DIRS QML_IMPORT_PATH QML2_IMPORT_PATH;};

        helix.languages.language = [
          {
            name = "qml";

            language-servers = [
              "qmlls"
              "uwu-colors"
            ];

            indent = {
              tab-width = 2;
              unit = "  ";
            };
          }
        ];
      };
    };
  };
}
