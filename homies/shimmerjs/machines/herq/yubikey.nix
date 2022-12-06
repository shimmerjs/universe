{ pkgs, ... }:
{
  security.pam.services.gdm.yubicoAuth = true;

  environment.systemPackages = with pkgs; [
    yubikey-personalization
    yubikey-personalization-gui
    yubioath-flutter
    yubico-pam
  ];

  security.pam.yubico = {
    enable = true;
    debug = true;
    mode = "challenge-response";
  };
}
