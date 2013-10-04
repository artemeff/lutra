module Lutra
  class Formatter
    def initialize(notes)
      @notes = notes
    end

    def print
      raise NotImplementedError
    end
  end
end
