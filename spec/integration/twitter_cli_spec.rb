RSpec.describe "`app twitter_cli` command", type: :cli do
  it "executes `app help twitter_cli` command successfully" do
    output = `./exe/app help twitter_cli`
    expected_output = <<-OUT
Usage:
  app twitter_cli

Options:
  -h, [--help], [--no-help]  # Display usage information
  -t, [--tweet=TWEET]        # Your tweet

Command description...
    OUT

    expect(output).to eq(expected_output)
  end
end
