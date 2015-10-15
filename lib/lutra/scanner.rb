require 'lutra/note'

module Lutra
  class Scanner
    attr_reader :formatter

    def initialize(formatter = Formatters::Default.new)
      @formatter = formatter
    end

    def scan_file(path, tags, comments)
      notes = extract(File.open(path), path, tags, comments)

      formatter.display(notes)
    end

  private

    def extract(source, path, tags, comments)
      regexp = compile_regexp(comments, tags)
      notes  = []

      source.each_with_index do |line, i|
        if result = regexp.match(line)
          notes << Note.new(result[:tag], result[:comment], result[:text], i + 1, path)
        end
      end

      notes
    end

    def compile_regexp(comments, tags)
      /(?<comment>#{comments.join('|')})\s*(?<tag>#{tags.join('|')})[\s|\:]*(?<text>.*)/
    end
  end
end
