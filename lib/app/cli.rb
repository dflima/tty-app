# frozen_string_literal: true

require 'thor'

module App
  # Handle the application command line parsing
  # and the dispatch to various command objects
  #
  # @api public
  class CLI < Thor
    # Error raised by this runner
    Error = Class.new(StandardError)

    desc 'version', 'app version'
    def version
      require_relative 'version'
      puts "v#{App::VERSION}"
    end
    map %w(--version -v) => :version

    desc 'twitter_cli', 'Command description...'
    method_option :help, aliases: '-h', type: :boolean,
                         desc: 'Display usage information'
    method_option :tweet, aliases: '-t', type: :string,
                         desc: 'Your tweet'
    def twitter_cli(*)
      if options[:help]
        invoke :help, ['twitter_cli']
      else
        require_relative 'commands/twitter_cli'
        App::Commands::TwitterCli.new(options).execute
      end
    end

    desc 'insult', 'Command description...'
    method_option :help, aliases: '-h', type: :boolean,
                         desc: 'Display usage information'
    method_option :name, aliases: '-n', type: :string,
                         desc: 'Name of who you want to insult'
    def insult(*)
      if options[:help]
        invoke :help, ['insult']
      else
        require_relative 'commands/insult'
        App::Commands::Insult.new(options).execute
      end
    end
  end
end
