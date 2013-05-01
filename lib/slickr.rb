require "fileutils"
require "pathname"
require "thor"
require "active_support/all"

require "slickr/version"
require "slickr/actions/generate"
require "slickr/generators/base"
require "slickr/generators/project"
require "slickr/generators/component"
require "slickr/generators/entity"
require "slickr/generators/renderer"
require "slickr/generators/system"
require "slickr/entity_manager"
require "slickr/entity"
require "slickr/behavior"
require "slickr/reactor"
require "slickr/renderer"
require "slickr/cli"

module Slickr
  class SlickrError < StandardError; end
  class NotImplementedError < SlickrError; end
end
