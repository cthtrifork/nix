{
  config,
  lib,
  pkgs,
  ...
}: {
  systemd.services.setupuser = let
    script = lib.getExe (pkgs.writeShellApplication {
      name = "setupuser";
      runtimeInputs = [pkgs.ssh-import-id pkgs.openssh];
      text = ''
        ssh-import-id gh:cthtrifork
        ssh-import-id gh:caspertdk
        touch ~/.zshrc
      '';
    });
  in {
    description = "Import SSH key from GitHub";
    wantedBy = ["multi-user.target"];
    serviceConfig = {
      User = "caspertdk";
      Type = "oneshot";
      ExecStart = "${script}";
    };
  };
}
