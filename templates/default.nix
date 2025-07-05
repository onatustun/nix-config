{
  flake.templates = {
    empty = {
      path = ./empty;
      description = "empty";
    };

    java = {
      path = ./java;
      description = "java";
    };

    node = {
      path = ./node;
      description = "node";
    };

    typst = {
      path = ./typst;
      description = "typst";
    };
  };
}
