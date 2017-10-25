require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/user'
require './lib/joke'

class UserTest < Minitest::Test
  def test_it_exists
    sal = User.new("Sal")

    assert_instance_of User, sal
  end

  def test_it_has_a_name
    sal = User.new("Sal")

    assert_equal "Sal", sal.name
  end

  def test_it_can_have_another_name
    ali = User.new("Ali")

    assert_equal "Ali", ali.name
  end

  def test_user_has_no_jokes
    sal = User.new("Sal")

    assert_equal [], sal.jokes
  end

  def test_user_can_learn_jokes
    sal = User.new("Sal")
    joke = Joke.new({id: 1,
               question: "Why did the strawberry cross the road?",
                 answer: "Because his mother was in a jam."})
    sal.learn(joke)

    assert_instance_of Joke, sal.jokes.first
    assert_equal 1, sal.jokes.count
  end

  def test_user_can_tell_jokes_to_other_user
   sal = User.new("Sal")
   ali = User.new("Ali")
   joke = Joke.new({id: 1,
              question: "Why did the strawberry cross the road?",
                answer: "Because his mother was in a jam."})
   sal.learn(joke)
   sal.tell(ali, joke)

   assert_equal 1, ali.jokes.count
  end

  def test_the_users_can_perform_routines
    josh = User.new("Josh")
    iliana = User.new("Iliana")
    joke_1 = Joke.new({id: 1,
                 question: "Why did the strawberry cross the road?",
                   answer: "Because his mother was in a jam."})
    joke_2 = Joke.new({id: 2,
                 question: "How do you keep a lion from charging?",
                   answer: "Take away its credit cards."})
    iliana.learn(joke_1)
    iliana.learn(joke_2)
    iliana.perform_routine_for(josh)

    assert_instance_of Joke, josh.jokes.first
    assert_equal 2, josh.jokes.count
  end

  def test_the_user_can_learn_a_routine
    casey = User.new("Casey")
    casey.learn_routine

    assert_equal 100, casey.jokes.count
  end

end
