class Jiq < Formula
  desc "Jid on jq"
  homepage "https://github.com/fiatjaf/jiq"
  url "https://github.com/fiatjaf/jiq.git",
      tag: "v0.7.2",
      revision: "5dec899436617c8f30cb1526dc76108dc8486cbf"
  head "https://github.com/fiatjaf/jiq.git", branch: "master"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    ENV["GO111MODULE"] = "on"

    src = buildpath/"src/github.com/fiatjaf/jiq"
    src.install buildpath.children
    src.cd do
      system "go", "build", "-o", bin/"jiq", "cmd/jiq/jiq.go"
      prefix.install_metafiles
    end
  end

  test do
    assert_match "jiq version v#{version}", shell_output("#{bin}/jiq --version")
  end
end
