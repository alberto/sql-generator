require 'sql_helper'

module SQL
  def self.update(table)
    Update.new(table)
  end

  class Update
    def initialize(table)
      @table = table
    end

    def set(values)
      Set.new(values, self)
    end

    def to_s
      "UPDATE #{@table}"
    end
  end

  class Set
    include SQLHelper

    def initialize(values, previous)
      @values, @previous = values, previous
    end

    def to_s
      "#{@previous} SET (#{values})"
    end

    def where(clause)
      Where.new(clause, self)
    end

    private
    def values
      pairs(@values).join(', ')
    end
  end
end
