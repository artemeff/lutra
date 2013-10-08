module Lutra
  module Formatters
    class Base
      def initialize(options = {})
        @options = options
      end

      def display(notes)
        raise NotImplementedError
      end
    end
  end
end
