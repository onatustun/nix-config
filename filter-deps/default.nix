let
  inherit (builtins)
    filter
    attrNames
    substring
    stringLength
    ;

  filterAttrs = pred: set: removeAttrs set (filter (name: !pred name set.${name}) (attrNames set));
  hasPrefix = pref: str: substring 0 (stringLength pref) str == pref;
in
{
  __functor = _: filterAttrs (input: _: !hasPrefix "dep_" input);
}
