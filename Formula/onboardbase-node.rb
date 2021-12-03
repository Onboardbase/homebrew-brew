class OnboardbaseNode < Formula
    desc "node.js dependency for onboardbase"
    homepage "https://docs.onboardbase.com"
    url "https://nodejs.org/download/release/v16.11.1/node-v16.11.1-darwin-x64.tar.xz"
    version "16.11.1"
    sha256 "ca25f6ebb10713cd545998bbc9d3715511e321d304b376574f3dd4ce9b70f75e"
    keg_only "onboardbase-node is only used by Onboardbase CLI, which explicitly requires from Cellar"
  
    def install
      bin.install buildpath/"bin/node"
    end
  
    def test
      output = system bin/"node", "version"
      assert output.strip == "v#{version}"
    end
  end