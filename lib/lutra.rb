require 'lutra/note'
require 'lutra/scanner'
require 'lutra/formatter'
require 'lutra/formatters/default'
require 'lutra/version'

module Lutra
  TAGS = %w[TODO FIXME OPTIMIZE]
  COMM = %w[# % ; // --]

  # errors
  class NotImplementedError < Exception; end
  class EmptyTagListError < Exception; end
end
