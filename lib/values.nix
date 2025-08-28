self: let
  inherit (self) merge mkMerge;
in {
  merge =
    mkMerge []
    // {
      __functor = self: next:
        self
        // {contents = self.contents ++ [next];};
    };

  enabled = merge {enable = true;};
  disabled = merge {enable = false;};

  mkLiteral = value: {
    _type = "literal";
    inherit value;
  };
}
