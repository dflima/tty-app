# frozen_string_literal: true

require_relative '../command'

module App
  module Commands
    class Insult < App::Command
      def initialize(options)
        @options = options

        @first_adjectives = ["artless", "bawdy", "beslubbering", "bootless", "churlish"]
        @second_adjectives = ["base-court", "bat-fowling", "beef-witted", "beetle-headed", "boil-brained"]
        @nouns = ["apple-john", "baggage", "barnacle", "bladder", "boar-pig"]
      end

      def execute(input: $stdin, output: $stdout)
        # Command logic goes here ...
        message = insult

        if @options[:name]
          message.prepend sprintf("%s, thou ", @options[:name])
        end

        output.puts message
      end

      def insult()
        sprintf(
          "%s %s %s!",
          @first_adjectives.sample,
          @second_adjectives.sample,
          @nouns.sample
        )
      end
    end
  end
end
