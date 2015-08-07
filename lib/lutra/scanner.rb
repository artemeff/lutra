require 'lutra/note'

module Lutra
  class Scanner
    attr_accessor :tags, :comments
    attr_reader :notes

    def initialize(tags: Lutra::TAGS, comments: Lutra::COMMENTS)
      raise EmptyTagListError if tags.empty?
      raise EmptyCommentListError if comments.empty?

      @tags, @comments = tags, comments
      @notes = []
    end

    def scan_file(path)
      extract(File.open(path), path)
    end

  private

    def extract(source, path)
      regexp = compile_regexp(@comments, @tags)

      source.each_with_index do |line, i|
        if result = regexp.match(line)
          @notes << Note.new(result[:tag], result[:comment], result[:text], i + 1, path)
        end
      end
    end

    def compile_regexp(comments, tags)
      /(?<comment>#{comments.join('|')})\s*(?<tag>#{tags.join('|')})[\s|\:]*(?<text>.*)/
    end
  end
end
