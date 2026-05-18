{ pkgs ? import <nixpkgs> {} }:

let
  mkdocs-meta-descriptions-plugin = pkgs.python313Packages.buildPythonPackage rec {
    pname = "mkdocs-meta-descriptions-plugin";
    version = "4.1.0";
    format = "wheel";

    src = pkgs.fetchurl {
      url = "https://files.pythonhosted.org/packages/94/54/da9ea958a070aac4bc1bed682f55aa090eff3130af5f59ad83014b2191b3/mkdocs_meta_descriptions_plugin-4.1.0-py3-none-any.whl";
      sha256 = "045qwsas972nkzga7cwidy8sqsvncba5py3y5pw8mr89vv0hgyz1";
    };

    propagatedBuildInputs = with pkgs.python313Packages; [
      beautifulsoup4
      packaging
      mkdocs
      pymdown-extensions
    ];

    doCheck = false;
  };

  mkdocs-video = pkgs.python313Packages.buildPythonPackage rec {
    pname = "mkdocs-video";
    version = "1.5.0";
    format = "wheel";

    src = pkgs.fetchurl {
      url = "https://files.pythonhosted.org/packages/cc/3a/b51e305eca21cdd58f4eb06973099ba0ea679b1f437a92a49f8fc576310e/mkdocs_video-1.5.0-py3-none-any.whl";
      sha256 = "b35613d4dacbac2dfa94d8c2600383cda14ad99a1fa1542b5fc4e9c6d19e9fe1";
    };

    propagatedBuildInputs = with pkgs.python313Packages; [
      beautifulsoup4
      packaging
      mkdocs
      lxml
    ];

    doCheck = false;
  };

  mkdocs-open-in-new-tab = pkgs.python313Packages.buildPythonPackage rec {
    pname = "mkdocs-open-in-new-tab";
    version = "1.0.8";
    format = "wheel";

    src = pkgs.fetchurl {
      url = "https://files.pythonhosted.org/packages/21/94/44f3c868495481c868d08eea065c82803f1affd8553d3383b782f497613c/mkdocs_open_in_new_tab-1.0.8-py3-none-any.whl";
      sha256 = "051d767a4467b12d89827e1fea0ec660b05b027c726317fe4fceee5456e36ad2";
    };

    propagatedBuildInputs = with pkgs.python313Packages; [
      beautifulsoup4
      packaging
      mkdocs
    ];

    doCheck = false;
  };
in

pkgs.mkShell {
  packages = [
    pkgs.git
    (pkgs.python313.withPackages (ps: with ps; [
      mkdocs
      mkdocs-material
      mkdocs-git-authors-plugin
      mkdocs-git-revision-date-localized-plugin
      mkdocs-git-committers-plugin-2
      mkdocs-markmap
      mkdocs-glightbox
      mkdocs-awesome-nav
      mkdocstrings
      mkdocs-autorefs
      mkdocs-minify-plugin
      pymdown-extensions
      mkdocs-meta-descriptions-plugin
      mkdocs-video
      mkdocs-open-in-new-tab
    ]))
  ];
}