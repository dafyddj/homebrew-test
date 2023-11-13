class Texttest < Formula
  include Language::Python::Virtualenv

  desc "A tool for text-based Approval Testing"
  homepage "https://www.texttest.org/"
  url "https://files.pythonhosted.org/packages/38/22/5b8dbde7193989dccdaf2386f36f335fa83966846f0f17673f9da3b4d6cb/TextTest-4.3.0.tar.gz"
  sha256 "a183885ec7cb2b6389eb98bf80e84571d93cfa3aeb5e043a6a8c0d0738e39cb4"
  license "LGPL-2.1-or-later"

  depends_on "python"
  depends_on "adwaita-icon-theme"
  depends_on "gtk+3"

  resource "psutil" do
    url "https://files.pythonhosted.org/packages/2d/01/beb7331fc6c8d1c49dd051e3611379bfe379e915c808e1301506027fce9d/psutil-5.9.6.tar.gz"
    sha256 "e4b92ddcd7dd4cdd3f900180ea1e104932c7bce234fb88976e2a3b296441225a"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    (testpath/"testsuite.test").write <<~EOS
      Test1
    EOS

    (testpath/"config.test").write <<~EOS
      executable:/bin/echo
      filename_convention_scheme:standard
    EOS

    mkdir "Test1"

    (testpath/"Test1/options.test").write <<~EOS
      Success!
    EOS

    (testpath/"Test1/stdout.test").write <<~EOS
      Success!
    EOS

    File.write(testpath/"Test1/stderr.test", "")

    output = shell_output("#{bin}/texttest -d #{testpath} -b -a test")
    assert_match "S: TEST test-case Test1 succeeded", output
  end
end
