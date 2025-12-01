# Zsh configuration
{ pkgs, config, ... }: {

  programs.zsh = {
    enable = true;
    autosuggestion = {
      enable = true;
    };
    syntaxHighlighting = {
      enable = true;
    };
  };

  programs.zsh.oh-my-zsh = {
    enable = true;
    theme = "agnoster";
    plugins = [ "git" ];

  };

}
