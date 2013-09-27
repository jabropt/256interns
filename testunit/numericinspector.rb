class NumericInspector
 
  def is_negative(v)
    v <= 0
  end
 
  def is_integer(v)
    v.is_a?(Integer)
  end
 
end
