module Lutra
  module Formatters
    class Default < Lutra::Formatters::Base
      def prepare
        @notes.map(&:source)
      end
    end
  end
end
