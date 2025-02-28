{ config, pkgs, ... }: {
  programs.ruff = {
    enable = true;

    settings = {
      preview = true;
      line-length = 100;

      format = {
        quote-style = "single";
        docstring-code-format = false;
      };

      lint = {
        select = [
          "AIR"
          "ERA"
          "FAST"
          "YTT"
          "ANN"
          "ASYNC"
          "S"
          "FBT"
          "B"
          "A"
          "COM"
          "C4"
          "DTZ"
          "T10"
          "DJ"
          "EM"
          "EXE"
          "FIX"
          "INT"
          "ISC"
          "ICN"
          "LOG"
          "G"
          "INP"
          "PIE"
          "T20"
          "PYI"
          "PT"
          "Q"
          "RSE"
          "RET"
          "SLF"
          "SIM"
          "SLOT"
          "TID"
          "TD"
          "TC"
          "ARG"
          "PTH"
          "FLY"
          "I"
          "C90"
          "NPY"
          "N"
          "E"
          "W"
          "F"
          "PL"
          "UP"
          "FURB"
          "RUF"
          "TRY"
        ];

        ignore = [
          "A005"
          "ISC001"
          "ISC003"
        ];

        per-file-ignores = { "*/tests/*.py" = [ "S101" ]; };

        flake8-quotes = {
          inline-quotes = "single";
        };
      };
    };
  };
}