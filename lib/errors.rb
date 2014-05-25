# encoding: utf-8

module Errors
  class Standard < StandardError; end

  class NotAFile < Standard
    def message
      "To nie jest plik."
    end
  end

  class BadCallArgumentsNumber < Standard
    def message
      "Zła ilość argumentów wywołania."
    end
  end
end