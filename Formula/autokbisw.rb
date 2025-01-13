class Autokbisw < Formula
  desc "Automatic keyboard input language switching for macOS"
  homepage "https://github.com/kimdane/autokbisw"
  version "2.0.2"
  url "https://github.com/kimdane/autokbisw/archive/refs/tags/2.0.2.tar.gz"
  sha256 "6ba5a3dfc57bf7046b82b2d6936a71d7e887cfea87ad35bb472149970f2d47bd"
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
