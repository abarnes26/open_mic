require 'pry'
require 'csv'

class Joke

  attr_reader :id, :question, :answer

  def initialize(question_answer)
    @id = question_answer[:id]
    @question = question_answer[:question]
    @answer = question_answer[:answer]
  end

end
