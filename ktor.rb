# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Ktor < Formula
  desc "CLI tool that creates porjects with ktor framework setup"
  homepage "https://github.com/Ololoshechkin/ktor-cli-binary"
  url "https://github.com/Ololoshechkin/ktor-cli-binary/archive/refs/tags/2.0.0-eap-1.zip"
  sha256 "9b65b1e411ec6dbfecf4b819540e3abc537fcba2f742fa40048316d5d94dd944"
  license ""

  # https://youtrack.jetbrains.com/issue/KTOR-4570/Support-ARM-target-in-Ktor-client-with-KotlinNative-and-Curl
  depends_on arch: :x86_64

  uses_from_macos "curl"
  uses_from_macos "unzip"

  on_linux do
    depends_on "curl"
  end

  def install
    system "./configure", *std_configure_args, "--disable-silent-rules"
    bin.install "ktor" => "ktor"
  end

  test do
    system "ktor", "generate", "projectName"
    assert_predicate Pathname.new("projectName/build.gradle.kts"), :exist?
    assert_predicate Pathname.new("projectName/src/main/kotlin/com/example/Application.kt"), :exist?
  end
end
