module Lutra
  module Formatters
    class Default < Lutra::Formatters::Base
      def display(notes)
        indent = notes.map(&:line).flatten.max.to_s.size

        notes.group_by { |n| n.file }.each do |file, notes|
          puts "#{file[2..-1]}:"
          notes.each do |note|
            puts " * #{prepare(note, indent)}"
          end
          puts
        end
      end

      def prepare(note, indent)
        s =  "[#{note.line.to_s.rjust(indent)}] "
        s << "[#{note.tag}] " if @options[:display_tags]
        s << note.text
      end
    end
  end
end
