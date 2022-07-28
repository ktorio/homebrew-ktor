class Ktor < Formula
  desc "CLI tool that creates porjects with ktor framework setup"
  homepage "https://github.com/Ololoshechkin/ktor"
  url "https://packages.jetbrains.team/files/p/ktor/ktor-cli-tool/mac-releases/ktor"
  sha256 "f62d9e52311d1e631035476c54a1828751749a14e902254926f57d76b36d5520"
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
