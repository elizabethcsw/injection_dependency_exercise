class Note
  def initialize(title, body, formatter = NoteFormatter.new)
    @title = title
    @body = body
    @formatter = formatter
  end

  def display
    @formatter.format(self)
  end

  attr_reader :title, :body
end

class NoteFormatter
  def format(note)
    "Title: #{note.title}\n#{note.body}"
  end
end

class Greeter
  def initialize(kernel = Kernel)
    @kernel = kernel
  end

  def greet
    puts "What is your name?"
    name = @kernel.gets.chomp
    puts "Hello, #{name}"
  end
end

class Diary
  attr_reader :entries

  def initialize(entries =[])
    @entries = entries
  end

  def add(title, body, entry = Entry)
    @entries << entry.new(title, body)
  end

  def index
    titles = @entries.map do |entry|
      entry.title
    end
    titles.join("\n")
  end
end

class Entry
  def initialize(title, body)
    @title = title
    @body = body
  end

  attr_reader :title, :body
end

# diary=Diary.new
# diary.add("Hi","how are you?")
# diary.add("Thanks","I am fine")

class EmailClient
  def message(to, body, message = Message)
    @message = message.new(to, body)
  end
end

class Message

  def initialize(to, body)
    @to = to
    @body = body
  end

  def send
    "Email to: #{@to}, #{@body}"
  end
end

class SayHelloToMyLittleFriend
  def run(email = EmailClient)
    @new_message = email.new.message("friend@example.com","HELLO!")
    puts @new_message.send
  end
end

# test=SayHelloToMyLittleFriend.new
# test.run
