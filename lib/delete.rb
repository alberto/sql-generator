require 'from'

module SQL
  def self.delete
    Delete.new
  end

  class Delete
    def from(table)
      From.new(table, self)
    end

    def to_s
      query = "DELETE"
    end
  end
end
