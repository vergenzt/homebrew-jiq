class Jiq < Formula
  desc "jid on jq - interactive JSON query tool using jq expressions"
  homepage "https://github.com/fiatjaf/jiq"
  url "https://github.com/fiatjaf/jiq/archive/refs/tags/0.7.1.zip"
  sha256 "2c358cb1744c9e99e97a48c8de006ed92a641688dfb27c216f5e0e5ffc377c97"
  license "MIT"

  depends_on "go" => :build
  depends_on "jq"

  def install
    system "go", "build", *std_go_args
  end

  test do
    # todo: use pty module to run a basic test?
  end
end
