require 'pry'

class Word
  attr_accessor :word
  attr_reader :word_id
  @@words = {}
  @@total_words = 0
  def initialize(attributes)
    @word = attributes.fetch(:word)
    @word_id = word_id || @@total_words += 1
  end
  def self.all
    @@words.values
  end
  def self.find(id)
    @@words[id]
  end
  def save
    @@words[self.word_id] = self
  end
  def definition
    Definition.find_by_word(self.word_id)
  end
end
