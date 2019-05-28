require 'app/commands/insult'

RSpec.describe App::Commands::Insult do
  it "executes `insult` command successfully" do
    output = StringIO.new
    options = {}
    command = App::Commands::Insult.new(options)

    command.execute(output: output)

    expect(output.string.split.size).to eq(3)
  end
end
