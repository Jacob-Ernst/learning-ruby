begin
  gem 'minitest', '>= 5.0.0'
  require 'minitest/autorun'
  require 'minitest/pride'
  require_relative 'hello_world'
rescue Gem::LoadError => e
  puts "\nMissing Dependency:\n#{e.backtrace.first} #{e.message}"
  puts 'Minitest 5.0 gem must be installed for the Ruby track.'
rescue LoadError => e
  puts "\nError:\n#{e.backtrace.first} #{e.message}"
  exit 1
end

class TestHelloWorld < Minitest::Test
  def test_say_hello
    assert_equal 'Hello World!', HelloWorld.hello
  end

  def test_say_hello_to_bill
    skip
    assert_equal 'Hello Bill!', HelloWorld.hello('Bill')
  end

  # Bonus Challenges!
  def test_say_something_else
    skip
    assert_equal "Kon'nichiwa Bill!", HelloWorld.say_something(phrase: "Kon'nichiwa", friend: 'Bill')
  end
end
