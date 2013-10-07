module Lutra
  module Formatters
    class Base
      def initialize(notes)
        @notes = notes
      end

      def prepare
        raise NotImplementedError
      end
    end
  end
end
