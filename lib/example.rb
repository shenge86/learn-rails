class Example < Object 
  # create class Example which inherits from class Object
  # note in Ruby all classes inherit from Object class so we didn't need to write this explicitly
  
  # attributes are convenient way to push data to an object and pull it out later
  # use attr_accessor directive to say we want to enable access to honorific, name, and date attributes
  # if we use attr_accessor to make attributes, we can use attribute names as methods. e.g.
  # ex = Example.new('Daniel',nil)
  # my_name = ex.name
  # note that a symbol is shown by using a colon. symbols are immutable; the values can't be changed.
  
  attr_accessor :honorific
  attr_accessor :name
  attr_accessor :date
  
  # overrides default method of parent Object class which returns objects' class name and object id
  # use an at (@) sign to show a variable is an instance variable -- it can be used by any method after class is instantiated.
  def to_s
    @name
  end
  
  # the new method of Object class calls the initialize method automatically
  # if initialize method is not defined, the new method still works
  # Example.new(name,date)
  # question mark indicates method will return a boolean value
  # exclamation character indicates method is 'dangerous'
  def initialize(name,date)
    @name = name
    @date = date.nil? ? Date.today : date
=begin
    if date.nil?
@date = Date.today
else
@date = date
end
=end
  end
  
  # ||= is used for conditional assignment. Assign value to variable if no value has been previously assigned.
  def titled_name
    @honorific ||= 'Esteemed'
    titled_name = "#{@honorific} #{@name}"
  end
  
  def december_birthdays
    born_in_december = []
    famous_birthdays.each do |name, date|
      if date.month == 12
        born_in_december << name
      end
    end
    born_in_december
  end
  
  private
  
  def famous_birthdays
    birthdays = {
      'Ludwig van Beethoven' => Date.new(1770,12,16),
      'Dave Brubeck' => Date.new(1920,12,6),
      'Buddy Holly' => Date.new(1936,9,7),
      'Keith Richards' => Date.new(1943,12,18)
      }
  end
  
  # method chaining is entirely possible.
  # String class has methods reverse and upcase. We can write
  # 'foobar'.reverse.upcase which will give 'RABOOF'
  
end