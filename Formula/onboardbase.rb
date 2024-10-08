class Onboardbase < Formula
    desc "Everything you need to get started with Onboardbase"
    homepage "https://docs.onboardbase.com"
    url "https://files.onboardbase.com/cli-artifacts/onboardbase-v8.9.6/onboardbase-v8.9.6.tar.gz"
    sha256 "c196fe8367343e7161ca26dd872e5807c7db9492"
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
