{
  services.openssh.settings = {
    AuthenticationMethods = "publickey keyboard-interactive:pam";
    PasswordAuthentication = false;
  };

  programs.ssh.startAgent = false;
}
