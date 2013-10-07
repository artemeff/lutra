module Lutra
  class Formatter
    attr_reader :formatters, :current

    def initialize
      @current = :default
      @formatters = [
        { name: :default, short: :d, class: Lutra::Formatters::Default }
      ]
    end

    def get(name)
      @formatters.select do |f|
        f[:name] == name || f[:short] == name
      end.first
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
        @formatters << { name: name, short: short_name, class: class_name }
      end
    end

    def prepare(notes)
      get(@current)[:class].new(notes).prepare
    end

  private

    def formatter?(class_name)
      class_name.new([]).respond_to?(:prepare)
    end
  end
end
