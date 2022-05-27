class Onboardbase < Formula
    desc "Everything you need to get started with Onboardbase"
    homepage "https://docs.onboardbase.com"
    url "https://onboardbase-cli.fra1.digitaloceanspaces.com/onboardbase-v1.7.1/onboardbase-v1.7.1.tar.gz"
    sha256 "1162f7d58e09823a26ddec10a59349ea92d843c91301d6c26b0b125ff6a3b5b6"
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