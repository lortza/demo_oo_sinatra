# Classes do NOT have access to the sessions hash

class NameSaver

  attr_accessor :names

  def initialize(existing_names)
    if existing_names == nil
      @names = ['alex']
    else
      @names = JSON.parse( existing_names )
    end
  end

  def add_name(new_name)
    @names << new_name
  end

end