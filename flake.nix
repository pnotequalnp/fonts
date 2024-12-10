{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: 
  let
    pkgs = import nixpkgs { system = "x86_64-linux"; };
    iosevka = pkgs.iosevka.override { privateBuildPlan = "${./iosevka.toml}"; set = "Arc"; };
  in {
    packages.x86_64-linux = {
      inherit iosevka;
    };
  };
}
