require_relative './nameable'
require_relative './capitalize_decorator'
require_relative './trimmer_decorator'
class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id, :rentals

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals = []
    super()
  end

  def correct_name
    @name
  end

  def can_use_services?
    if of_age? || @parent_permission
      true
    else
      false
    end
  end

  private

  def of_age?
    @age >= 18
  end
end

person = Person.new(22, 'meshu')
puts person.correct_name
capitalize_decorator = CapitalizeDecorator.new(person)

puts capitalize_decorator.correct_name

trimmer_decorator = TrimmerDecorator.new(capitalize_decorator)
puts trimmer_decorator.correct_name
