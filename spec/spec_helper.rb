$: << File.expand_path("../../lib", __FILE__)
require "rspec"
require "slickr"
require "fakefs/safe"
require "fakefs/spec_helpers"

RSpec.configure do |c|
  c.include FakeFS::SpecHelpers
end
