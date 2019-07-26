require 'pry'

class Word
  @@words = {}
  @@total_words = 0
  def initialize(attributes)
    @word = attributes.fetch(:word)
    @word_id = @@total_words += 1
  end
end
