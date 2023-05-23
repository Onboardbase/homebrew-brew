class Onboardbase < Formula
    desc "Everything you need to get started with Onboardbase"
    homepage "https://docs.onboardbase.com"
    url "https://onboardbase-cli.fra1.digitaloceanspaces.com/onboardbase-v5.0.7/onboardbase-v5.0.7.tar.gz"
    sha256 "532db4f77a6b040cdcb76b7004c572287ca6c7f1fc62f2f6c6a10e4b93c002a8"
    depends_on "onboardbase/brew/onboardbase-node" => "12.21.0"
  
    def install
      inreplace "bin/onboardbase", /^CLIENT_HOME=/, "export ONBOARDBASE_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
      inreplace "bin/onboardbase", "\"$DIR/node\"", Formula["onboardbase-node"].opt_bin/"node"
      libexec.install Dir["*"]
      bin.install_symlink libexec/"bin/onboardbase"
  
    end
  
    test do
      system bin/"onboardbase", "version"
    end
  end