module Errors
  class TypeError < StandardError
    def initialize(msg = 'Wrong type of variables')
      super
    end
  end

  class EmptyError < StandardError
    def initialize(msg = 'Some variable is empty')
      super
    end
  end

  class SignError < StandardError
    def initialize(msg = 'The number should be positive.')
      super
    end
  end

  class ClassError < StandardError
    def initialize(msg = "Your data doesn't belong to accessible entities.
You can add only Author, Book, Reader or Order")
      super
    end
  end
end