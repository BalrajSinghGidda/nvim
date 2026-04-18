{ config, pkgs, ... }:

{
  vim = {
    options = {
      number = true;
      relativenumber = true;
    };

    lsp = {
      enable = true;
      servers = {
        pyright.enable = true;
      };
    };

    treesitter.enable = true;
  };
}
