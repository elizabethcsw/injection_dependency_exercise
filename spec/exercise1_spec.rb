require 'ex1'

describe '#tests' do

  describe Note do
    let(:formatter_class) { double :formatter_class, new: formatter_double}
    let(:formatter_double) { double :formatter_double} #, format: "Title: This\nis great"}
    subject { described_class.new("Liz","is great", formatter_double)}

    it 'displays the title and body' do
      expect(formatter_double).to receive(:format).with(subject)
      subject.display
    end
  end

  describe Greeter do
    let(:kernel_double) {double :kernel}

    subject { described_class.new(kernel_double) }

    it 'greets' do
      allow(kernel_double).to receive(:gets){"Liz"}
      expect {subject.greet}.to output("What is your name?\nHello, Liz\n").to_stdout
    end
  end

  describe Diary do
    context "initializes with an empty array"

    let(:entry_double) {double :entry}
    let(:entry_class_double) {double :entry_class, new: entry_double}

    it 'initilizes an empty diary' do
      expect(subject.entries).to eq []
    end

    it 'adds an entry' do
      subject.add("Thanks","I am fine", entry_class_double)
      expect(subject.entries).to include entry_double
    end
  end

  describe SayHelloToMyLittleFriend do
    context '#run'
      let(:message_double){double :message}
      let(:email_double){double :email}
      let(:email_class_double){double :email_class, new: email_double}

      it 'runs' do
        allow(email_double).to receive(:message).with("friend@example.com","HELLO!").and_return(message_double)
        allow(message_double).to receive(:send).and_return("Email to: friend@example.com, HELLO!")
        # allow(email_double).to receive_message_chain(:message, :send).and_return("Email to: friend@example.com, HELLO!")

        expect { subject.run(email_class_double) }.to output("Email to: friend@example.com, HELLO!\n").to_stdout
      end
  end
end
























=begin Kay's demonstration

describe Greeter do
  it 'greets you' do
    double_kernel = double :kernel
    subject = Greeter.new(double_kernel)
    allow(double_kernel).to receive(:gets).with(1).and_return("Liz\n")
    allow(double_kernel).to receive(:gets).with(2).and_return("Hard\n")
    #or try this:
    allow(double_kernel).to receive(:gets).and_return("Liz\n", "Hard\n")
    expect { subject.greet }.to output("What is your name?\nHello, Liz\n")
  end
end
class Greeter
  def initialize(kernel = Kernel)
    @kernel = kernel
  end
  def greet
    puts "What is your name?"
    first_name = @kernel.gets(1).chomp
    last_name = @kernel.gets(2).chomp
    puts "Hello, #{name}"
  end
end

=end
