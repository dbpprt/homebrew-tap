#!/usr/bin/env ruby
# frozen_string_literal: true

version = ARGV.fetch(0)
sha256 = ARGV.fetch(1)
abort "version must be a v-prefixed semantic version" unless version.match?(/\Av\d+\.\d+\.\d+(?:[-+][0-9A-Za-z.-]+)?\z/)
abort "sha256 must contain 64 lowercase hexadecimal characters" unless sha256.match?(/\A[0-9a-f]{64}\z/)

cask_path = File.expand_path("../Casks/dieter-app.rb", __dir__)
cask = File.read(cask_path)
cask.sub!(/^  version ".*"$/, "  version \"#{version.delete_prefix("v")}\"")
cask.sub!(/^  sha256 ".*"$/, "  sha256 \"#{sha256}\"")
File.write(cask_path, cask)
