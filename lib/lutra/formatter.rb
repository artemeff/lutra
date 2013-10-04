module Lutra
  class Formatter
    def initialize(tags)
      @tags = tags
    end

    def print
      raise NotImplementedError
    end
  end
end
