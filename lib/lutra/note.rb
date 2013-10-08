module Lutra
  class Note < Struct.new(:tag, :text, :line, :file)
    # ...
  end
end
