require 'lutra/scanner'
require 'lutra/formatters/base'
require 'lutra/formatters/default'

module Lutra
  TAGS = %w[TODO FIXME OPTIMIZE]
  COMMENTS = %w[# % ; // --]

  NotImplementedError = Class.new(StandardError)
  EmptyTagListError = Class.new(StandardError)
  EmptyCommentListError = Class.new(StandardError)
end
