require 'sql_helper'

module SQL
  def self.select(columns = ["*"])
    Select.new columns
  end

  class Select
    include SQLHelper

    def initialize(columns)
      @columns = columns
    end

    def from(table)
      From.new(table, self)
    end

    def to_s
      query = "SELECT #{values(@columns)}"
    end
  end
end
