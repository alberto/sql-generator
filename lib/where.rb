require 'sql_helper'

module SQL
  class Where
    def initialize(clause, previous)
      @filter = Filter.new(clause)
      @previous = previous
    end

    def or(clause)
      Or.new(clause, self)
    end

    def to_s
      "#{@previous} WHERE (#{@filter})"
    end
  end

  class Or
    def initialize(clause, previous)
      @filter = Filter.new(clause)
      @previous = previous
    end

    def to_s
      "#{@previous} OR (#{@filter})"
    end
  end

  class Filter
    include SQLHelper

    def initialize(clause)
      @clause = clause
    end

    def to_s
      pairs(@clause).join(" AND ")
    end
  end
end
