# frozen_string_literal: true

module HexletCode
  class PlaneStringToHtmlConverter
    attr_reader :stack, :tags, :previous_tag, :result

    BODY = :body

    def self.convert(name)
      new(name).convert
    end

    def initialize(plane_string)
      @stack = []
      @tags = plane_string.scan(/<[^>]+>|[^<]+/)
      @previous_tag = nil
      @result = ''
    end

    def convert
      fill_result!
      result.strip
    end

    private

    def fill_result!
      tags.each do |tag|
        tag_name = tag.scan(%r{(?<=<|/)\w+}).first&.to_sym || BODY
        if HexletCode::Tag::VOID_ELEMENTS_NAMES.include?(tag_name)
          add_void_element(tag, tag_name)
        elsif tag_name == BODY
          add_body(tag)
        else
          add_paired_element(tag, tag_name)
        end
      end
    end

    def indented_row(tag)
      %(#{'  ' * stack.count}#{tag}\n)
    end

    def row(tag)
      %(#{tag}\n)
    end

    def add_void_element(tag, tag_name)
      @result += indented_row(tag)
      @previous_tag = tag_name
    end

    def add_paired_element(tag, tag_name)
      if closing_tag?(tag)
        stack.pop
        return @result = result.strip + row(tag) if previous_tag == tag_name

        @result += indented_row(tag)
      else
        @result += indented_row(tag)
        stack << tag_name
      end
      @previous_tag = tag_name
    end

    def add_body(tag)
      @result = result.strip + row(tag)
    end

    def closing_tag?(tag)
      tag[1] == '/'
    end
  end
end
