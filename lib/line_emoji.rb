# frozen_string_literal: true

require "json"
require "line_emoji/version"

module LineEmoji
  JSON_FILEPATH = File.expand_path('../../data/line_emoji.json', __FILE__)

  class << self
    def items
      @items ||= JSON.parse(File.read(JSON_FILEPATH)).map { |obj| Item.new(obj) }
    end

    def encode(text)
      items.each { |item| text = item.encode(text) }
      text
    end
  end

  class Item
    attr_reader :code, :aliases, :unicode

    def initialize(obj)
      @code = obj['code']
      @aliases = obj['aliases']
      @unicode = obj['unicode']
    end

    def emoji_statements
      @emoji_statements ||= ([code] + aliases).map { |statement| "(#{statement})" }
    end

    def unicode_chr
      @unicode_chr ||= unicode.hex.chr('UTF-8')
    end

    def encode(text)
      emoji_statements.each { |statement| text = text.gsub(statement, unicode_chr) }
      text
    end
  end
end
