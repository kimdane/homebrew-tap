class Autokbisw < Formula
  desc "Automatic keyboard input language switching for macOS"
  homepage "https://github.com/kimdane/autokbisw"
  version "2.0.2"
  url "https://github.com/kimdane/autokbisw/archive/refs/tags/2.0.2.tar.gz"
  sha256 "d60156feab7573185b4c2e71a0d9699d04e3ff4f4d46de8593acb35d7fdf78ac"
  depends_on :xcode

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/autokbisw"
  end

  service do
    run [bin/"autokbisw"]
    keep_alive true
    log_path var/"log/autokbisw.log"
    error_log_path var/"log/autokbisw.log"
  end

  test do
    system bin/"autokbisw", "--help"
  end
end
