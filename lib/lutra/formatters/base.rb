module Lutra
  module Formatters
    class Base
      attr_reader :options

      def initialize(options = {})
        @options = default_options.merge(options)
      end

      def display(notes)
        raise NotImplementedError
      end

    private

      def default_options
        {
          display_tags: true,
          text_size: 55
        }
      end
    end
  end
end
