class Theater
  def initialize(where, movies)
    @where = where
    @movies = movies
  end

  def to_h
    hash = {}
    instance_variables.each {|var| hash[var.to_s.delete("@")] = instance_variable_get(var) }
    hash
  end
end
