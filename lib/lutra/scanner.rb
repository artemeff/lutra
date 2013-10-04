module Lutra
  class Scanner
    attr_accessor :tags
    attr_reader :notes

    def initialize(tags = nil, comments = nil)
      @tags = tags || TAGS.dup
      @comments = comments || COMM.dup
      @notes = []
    end

    def scan(source)
      check_tags
      extract(source.split("\n")) and self
    end

    def scan_file(path)
      check_tags
      extract(File.open(path), path) and self
    end

  private

    def extract(source, path = nil)
      rxp = regexp
      source.each_with_index do |line, i|
        if rxp =~ line
          raw = { tag: $1, source: line, line: i + 1, file: path }
          @notes << Note.new(raw)
        end
      end
    end

    def check_tags
      raise EmptyTagListError if @tags.empty?
    end

    def regexp
      /(#{@comments.join('|')})\s*(?<tag>#{@tags.join('|')})\s*(?<text>.*)/
    end
  end
end
