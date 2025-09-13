{
  isServer,
  pkgs,
  ...
}: {
  boot = {
    kernelPackages =
      if isServer
      then pkgs.linuxPackages_latest
      else pkgs.linuxKernel.packages.linux_zen;

    kernel.sysctl = {
      "kernel.sysrq" = 0;
      "kernel.kptr_restrict" = 2;
      "net.core.bpf_jit_enable" = false;
      "kernel.ftrace_enabled" = false;
      "kernel.dmesg_restrict" = 1;
      "fs.protected_fifos" = 2;
      "fs.protected_regular" = 2;
      "fs.suid_dumpable" = 0;
      "kernel.perf_event_paranoid" = 3;
      "kernel.unprvileged_bpf_disabled" = 1;
    };

    kernelParams = [
      "randomize_kstack_offset=on"
      "vsyscall=none"
      "slab_nomerge"
      "module.sig_enforce=1"
      "lockdown=confidentiality"
      "page_poison=1"
      "page_alloc.shuffle=1"
      "sysrq_always_enabled=0"
      "rootflags=noatime"
      "lsm=landlock,lockdown,yama,integrity,apparmor,bpf,tomoyo,selinux"
      "fbcon=nodefer"
    ];

    blacklistedKernelModules = [
      "af_802154"
      "appletalk"
      "atm"
      "ax25"
      "can"
      "dccp"
      "decnet"
      "econet"
      "ipx"
      "n-hdlc"
      "netrom"
      "p8022"
      "p8023"
      "psnap"
      "rds"
      "rose"
      "sctp"
      "tipc"
      "x25"
      "adfs"
      "affs"
      "befs"
      "bfs"
      "cifs"
      "cramfs"
      "efs"
      "erofs"
      "exofs"
      "f2fs"
      "freevxfs"
      "gfs2"
      "hfs"
      "hfsplus"
      "hpfs"
      "jffs2"
      "jfs"
      "ksmbd"
      "minix"
      "nfs"
      "nfsv3"
      "nfsv4"
      "nilfs2"
      "omfs"
      "qnx4"
      "qnx6"
      "squashfs"
      "sysv"
      "udf"
      "vivid"
      "firewire-core"
      "thunderbolt"
    ];
  };
}
