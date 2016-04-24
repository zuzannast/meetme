class Movie
  def initialize(title, showtimes)
    @title = title
    @showtimes = showtimes
  end

  def to_h
    hash = {}
    instance_variables.each {|var| hash[var.to_s.delete("@")] = instance_variable_get(var) }
    hash
  end
end
