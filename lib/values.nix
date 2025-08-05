_: self: _: let
  inherit (self) merge;
in {
  merge = let
    inherit (self) mkMerge;
  in
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
