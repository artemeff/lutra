module Lutra
  module Formatters
    class Default < Lutra::Formatters::Base
      def display(notes)
        indent = notes.map(&:line).flatten.max.to_s.size

        notes.group_by { |n| n.file }.each do |file, notes|
          puts "#{format_path(file)}:"
          notes.each do |note|
            puts " * #{prepare(note, indent)}"
          end
          puts
        end
      end

      def prepare(note, indent)
        s =  "[#{note[:line].to_s.rjust(indent)}] "
        s << "[#{note[:tag]}] " if @options[:display_tags]
        s << note[:text][0..@options[:text_size]].strip.chomp
        s << "..." if note[:text].size > @options[:text_size]
        s
      end

    private

      def format_path(file)
        file.gsub('../', '').gsub('./', '')
      end
    end
  end
end
