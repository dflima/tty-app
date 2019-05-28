# frozen_string_literal: true

require_relative '../command'
require 'twitter'

module App
  module Commands
    class TwitterCli < App::Command
      def initialize(options)
        @options = options
      end

      def execute(input: $stdin, output: $stdout)
        # Command logic goes here ...
        client = Twitter::REST::Client.new do |config|
          config.consumer_key           = ENV['TWITTER_CONSUMER_KEY']
          config.consumer_secret        = ENV['TWITTER_CONSUMER_SECRET']
          config.access_token           = ENV['TWITTER_ACCESS_TOKEN']
          config.access_token_secret    = ENV['TWITTER_ACCESS_SECRET']
        end

        if @options[:tweet]
          response = client.update @options[:tweet]
          output.puts "Your tweet: #{response.uri}"
        end

        output.puts "OK"
      end
    end
  end
end
