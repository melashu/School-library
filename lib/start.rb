require_relative './app'
class Start
  def initialize
    @app = App.new
  end
  def run 
    puts 'Welcome to school library app!'
    choices = 1
    until choices.eql? 7
      puts 'Please choose an optional by enter in a number:'
      puts '1 - List all books'
      puts '2 - List all people'
      puts '3 - Create a person'
      puts '4 - Create a book'
      puts '5 - Create a rental'
      puts '6 - List all rentals for a given person id'
      puts '7 - Exit'
      choices = gets.chomp.to_i
      break if choices == 7
      options(choices)
    end
  end
  def options(choices)
    case choices
    when 1
      @app.list_all_book
    when 2
      @app.list_all_people
    when 3
      create_person
    when 4
      puts @app.create_book
    when 5
      @app.create_rental
    when 6
      @app.list_all_rental
    end
  end
  def create_person
    print 'Do you wants to create a studnet (1) or a teacher (2)? [Input the number] '
    option = gets.chomp
    case option
    when '1'
      @app.create_student
    when '2'
      @app.create_teacher
    end
  end
end