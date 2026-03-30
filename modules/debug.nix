{
  partitionedAttrs = {
    allSystems = "dev";
    debug = "dev";
  };

  partitions.dev.module.debug = true;
}
