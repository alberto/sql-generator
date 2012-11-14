module SQLHelper
  def values(values)
    "(#{values.join(', ')})"
  end

  def pairs(pairs)
    pairs.map { |k,v| "#{k}=#{v}"}
  end
end
