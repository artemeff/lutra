module Lutra
  class DefaultFormatter < Lutra::Formatter
    def print
      @tags
    end
  end
end
