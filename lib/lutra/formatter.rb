require 'lutra/formatter_entry'

module Lutra
  class Formatter
    attr_reader :formatters, :current

    def initialize(options = {})
      @options = options
      @current = :default
      @formatters = [default_formatter]
    end

    def get(name)
      @formatters.find do |f|
        f.name == name || f.short == name
      end
    end

    def set(name)
      if get(name)
        @current = name
      else
        raise FormatterNotFound
      end
    end

    def add(name, short_name, class_name)
      if formatter?(class_name)
        @formatters << FormatterEntry.new(name, short_name, class_name)
      end
    end

    def display(notes)
      get(@current).class_name.new(@options).display(notes)
    end

  private

    def formatter?(class_name)
      class_name.new.respond_to?(:display)
    end

    def default_formatter
      FormatterEntry.new(:default, :d, Lutra::Formatters::Default)
    end
  end
end
