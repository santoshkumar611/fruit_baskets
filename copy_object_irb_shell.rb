# code in first IRB shell
class Apple

  attr_reader :variety, :origin, :history
  def initialize(**args)
    @variety = args[:variety]
    @origin = args[:origin]
    @history = args[:history]
  end
end

apple = Apple.new(variety: 'Honeycrisp', origin: 'Minnesota', history: 'Introduction to Market: 1991')

File.open("apple_object_data.txt", "w") do |f|
  f.write Marshal.dump(apple)
end



# code in second IRB shell
class Apple

  attr_reader :variety, :origin, :history
  def initialize(**args)
    @variety = args[:variety]
    @origin = args[:origin]
    @history = args[:history]
  end
end

apple_obj_string = File.read("apple_object_data.txt")
apple = Marshal.load(apple_obj_string)

