class Author
  attr_accessor :name, :bio

  def initialize(name, bio = '')
    @name = name
    @bio = bio
  end
end
