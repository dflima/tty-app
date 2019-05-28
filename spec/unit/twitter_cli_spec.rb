require 'app/commands/twitter_cli'

RSpec.describe App::Commands::TwitterCli do
  it "executes `twitter_cli` command successfully" do
    output = StringIO.new
    options = {}
    command = App::Commands::TwitterCli.new(options)

    command.execute(output: output)

    expect(output.string).to eq("OK\n")
  end
end
