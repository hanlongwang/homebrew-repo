class Tg < Formula
  include Language::Python::Virtualenv

  desc "Terminal telegram client"
  homepage "https://github.com/paul-nameless/tg"
  url "https://github.com/hanlongwang/tg/archive/refs/tags/v0.1.tar.gz"
  sha256 "7737d128296feb16f1a5193aff9c3e4bac7152f75a7d43108fbafd5e95f9a78a"
  license "Unlicense"

  depends_on "python"
  depends_on "tdlib"

  resource "python-telegram-patched" do
    url "https://github.com/paul-nameless/python-telegram/archive/refs/tags/0.15.0-patched.tar.gz"
    sha256 "0602cf9d9dc2c932576104ee3d088a2299058583a2fcfb339b2aa8188eede0c3"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    require "pty"

    PTY.spawn(bin/"tg") do |r, w, _pid|
      assert_match "Enter your phone", r.gets
      w.close
      r.close
    end
  end
end
