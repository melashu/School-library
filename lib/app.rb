require_relative './book'
require_relative './student'
require_relative './class_room'
require_relative './teacher'
require_relative './rental'
class App
  def initialize
    @books = []
    @persons = []
    @rentals = []
  end

  def list_all_book
    puts 'No record yet!' if @books.empty?

    @books.each do |book|
      puts "Title: \"#{book.title}\", Author: #{book.author}"
    end
    puts
  end

  def list_all_people
    puts 'No record yet!' if @persons.empty?
    @persons.each do |person|
      title = person.is_a?(Student) ? '[Student]' : '[Teacher]'
      puts "#{title} Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    puts
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    puts 'Successfully created'
    puts
  end

  def create_student
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission [Y/N]:'
    permission = gets.chomp
    room = Classroom.new('A')
    student = Student.new(room, age, name, parent_permission: permission)
    @persons << student
    puts 'Student created successfully'
    puts
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    special = gets.chomp
    teacher = Teacher.new(special, age, name)
    @persons << teacher
    puts 'Teacher created successfully'
    puts
  end

  def create_person
    print 'Do you wants to create a studnet (1) or a teacher (2)? [Input the number] '
    option = gets.chomp
    case option
    when '1'
      create_student
    when '2'
      create_teacher
    end
  end

  def create_rental(_msg = '')
    if @books.empty?
      puts 'Sorry there are no books!'
    elsif @persons.empty?
      puts 'Sorry there are no person!'
    else
      book = book_rental
      person = person_rental
      print 'Date: '
      date = gets.chomp
      rental = Rental.new(date, person, book)
      @rentals << rental
      puts 'Rental created successfully'
      puts
    end
  end

  def person_rental(msg = '')
    puts "#{msg} "
    puts 'Select a person from the following list by number (not id)'
    @persons.each_with_index do |person, index|
      title = person.is_a?(Student) ? '[Student]' : '[Teacher]'
      puts "#{index}) #{title} Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_option = gets.chomp.to_i
    if person_option >= @books.size || person_option.negative?
      person_rental("Please select from 0 to #{@persons.size - 1}")
    end
    @persons[person_option]
  end

  def book_rental(msg = '')
    puts "#{msg} "
    puts 'Select a books from the following list by number'
    @books.each_with_index do |book, index|
      puts %(#{index} Title: "#{book.title}", Author:#{book.author})
    end
    book_option = gets.chomp.to_i
    book_rental("Please select from 0 to #{@persons.size - 1}") if book_option >= @books.size || book_option.negative?
    @books[book_option]
  end

  def list_all_rental
    print 'ID of person: '
    id = gets.chomp.to_i
    print 'No ' if @rentals.empty?
    print 'Rentals: '
    puts
    @rentals.each do |rental|
      puts %(Date: #{rental.date}, Book "#{rental.book.title}" by #{rental.person.name}) if rental.person.id.eql? id
    end
    puts
  end
end
