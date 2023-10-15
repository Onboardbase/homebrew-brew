class Onboardbase < Formula
    desc "Everything you need to get started with Onboardbase"
    homepage "https://docs.onboardbase.com"
    url "https://onboardbase-cli.fra1.digitaloceanspaces.com/onboardbase-v7.0.2/onboardbase-v7.0.2.tar.gz"
    sha256 "b5430175ed7adeed040971b795665a4d4f569d15b839291bced6955a72c9903e"
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