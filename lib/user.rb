class User
  attr_reader :name, :jokes

  def initialize(name)
    @name = name
    @jokes = []
  end

  def learn(joke)
    unless @jokes.include?(joke)
    @jokes << joke
    end
  end

  def tell(user, joke)
    user.jokes << joke
  end

  def perform_routine_for(user)
    @jokes.map do |joke|
      tell(user, joke)
    end
  end

  def learn_routine(file = "./jokes.csv")
    jokes = CSV.open file, headers: true
    jokes.map do |joke|
      unless @jokes.include?(joke)
      @jokes << joke
      end
    end
  end
end
