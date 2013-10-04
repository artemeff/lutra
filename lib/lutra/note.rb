module Lutra
  class Note
    attr_reader :tag, :source, :line, :file

    def initialize(data)
      @tag    = data[:tag]
      @line   = data[:line]
      @file   = data[:file]
      @source = data[:source]
    end

    def text
      extract[:text]
    end

  private

    def extract
      @source =~ /(#{@tag})\s(.*)/
      { tag: $1, text: $2 }
    end
  end
end
