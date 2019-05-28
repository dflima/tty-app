RSpec.describe "`app insult` command", type: :cli do
  it "executes `app help insult` command successfully" do
    output = `./exe/app help insult`
    expected_output = <<-OUT
Usage:
  app insult

Options:
  -h, [--help], [--no-help]  # Display usage information
  -n, [--name=NAME]          # Name of who you want to insult

Command description...
    OUT

    expect(output).to eq(expected_output)
  end
end
