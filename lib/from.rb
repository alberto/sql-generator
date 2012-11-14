require 'where'

module SQL
  class From
    def initialize(table, previous)
      @table = table
      @previous = previous
    end

    def to_s
      "#{@previous} FROM #{@table}"
    end

    def where(clause)
      Where.new(clause, self)
    end
  end
end
