module Lutra
  class Scanner
    attr_accessor :tags, :comments
    attr_reader :notes

    def initialize(tags = nil, comments = nil)
      @tags     = tags || Lutra::TAGS
      @comments = comments || Lutra::COMM
      @notes    = []

      check_tags and check_comments
    end

    def scan_file(path)
      extract(File.open(path), path)
    end

  private

    def extract(source, path)
      rxp = regexp
      source.each_with_index do |line, i|
        if r = rxp.match(line)
          @notes << Note.new(r[:tag], r[:text], i + 1, path)
        end
      end
    end

    def check_tags
      raise EmptyTagListError if @tags.empty?
    end

    def check_comments
      raise EmptyCommentListError if @comments.empty?
    end

    def regexp
      /(#{@comments.join('|')})\s*(?<tag>#{@tags.join('|')})[\s|\:]*(?<text>.*)/
    end
  end
end
