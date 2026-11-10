{
  inputs = {
    nixpkgs.url = "https://channels.nixos.org/nixos-unstable/nixexprs.tar.zst";
    nix-flatpak.url = "github:gmodena/nix-flatpak/latest";
  };

  outputs =
    {
      self,
      nixpkgs,
      nix-flatpak,
      ...
    }@inputs:
    {
      nixosConfigurations.uzi = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };

        modules = [
          nix-flatpak.nixosModules.nix-flatpak
          ./configuration.nix
        ];
      };
    };
}
