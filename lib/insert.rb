require 'sql_helper'

module SQL
  def self.insert
    Insert.new
  end

  class Insert
    def into(table)
      Into.new(table, self)
    end

    def to_s
      "INSERT"
    end
  end

  class Into
    def initialize(table, previous)
      @table = table
      @previous = previous
    end

    def values(values)
      @values = Values.new(values, self)
    end

    def to_s
      "#{@previous} INTO #{@table}"
    end
  end

  class Values
    include SQLHelper

    def initialize(values, previous)
      @keys = values.keys
      @values = values.values
      @previous = previous
    end

    def to_s
      "#{@previous} #{values(@keys)} VALUES #{values(@values)}"
    end
  end
end
