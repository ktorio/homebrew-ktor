class Ktor < Formula
  desc "CLI tool that creates porjects with ktor framework setup"
  homepage "https://github.com/Ololoshechkin/ktor"
  url "https://files.pkg.jetbrains.space/public/p/ktor-cli-tool/mac-release/ktor-0.0.1.tar.gz"
  sha256 "ae9dece43df9a9ee5527cdf9ad2c9d3fb2cbaa347a741f2f900cb641b92ea739"
  license ""

  # https://youtrack.jetbrains.com/issue/KTOR-4570/Support-ARM-target-in-Ktor-client-with-KotlinNative-and-Curl
  depends_on arch: :x86_64

  uses_from_macos "curl"
  uses_from_macos "unzip"

  on_linux do
    depends_on "curl"
  end

  def install
    bin.install "ktor"
  end

  test do
    system "ktor", "generate", "projectName"
    assert_predicate Pathname.new("projectName/build.gradle.kts"), :exist?
    assert_predicate Pathname.new("projectName/src/main/kotlin/com/example/Application.kt"), :exist?
  end
end
