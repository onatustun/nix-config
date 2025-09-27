self: let
  inherit (self) mkMerge;
in {
  merge =
    mkMerge []
    // {
      __functor = self: next:
        self
        // {
          contents =
            self.contents
            ++ [next];
        };
    };

  mkLiteral = value: {
    _type = "literal";
    inherit value;
  };
}
