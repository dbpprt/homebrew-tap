#!/usr/bin/env ruby
# frozen_string_literal: true

version = ARGV.fetch(0)
sha256 = ARGV.fetch(1)
abort "version must be a v-prefixed semantic version" unless version.match?(/\Av\d+\.\d+\.\d+(?:[-+][0-9A-Za-z.-]+)?\z/)
abort "sha256 must contain 64 lowercase hexadecimal characters" unless sha256.match?(/\A[0-9a-f]{64}\z/)

formula_path = File.expand_path("../Formula/dieter.rb", __dir__)
formula = File.read(formula_path)
formula.sub!(/^  version ".*"$/, "  version \"#{version.delete_prefix("v")}\"")
formula.sub!(%r{^  url ".*"$}, "  url \"https://github.com/dbpprt/homebrew-tap/releases/download/#{version}/dieter-darwin-arm64.tar.gz\"")
formula.sub!(/^  sha256 ".*"$/, "  sha256 \"#{sha256}\"")
File.write(formula_path, formula)
