require 'pry'

class Definition
  attr_accessor :definition
  attr_reader :definition_id, :word_id
  @@definitions = {}
  @@total_definitions = 0
  def initialize(attributes)
    @definition = attributes.fetch(:definition)
    @word_id = attributes.fetch(:word_id)
    @definition_id = definition_id || @@total_definitions += 1
  end
  def self.all
    @@definitions.values
  end
  def self.find(id)
    @@definitions[id]
  end
  def self.find_by_word(word_id)
    definitions = []
    @@definitions.values.each do |definition|
      if definition.word_id == word_id
        definitions.push(definition)
      end
    end
    definitions
  end
  def self.remove(id)
    @@definitions.delete(id)
  end
  def self.update(id, new_definition)
    @@definitions[id].definition = new_definition
  end
  def save
    @@definitions[self.definition_id] = self
  end
end
