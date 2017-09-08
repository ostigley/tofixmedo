require "tofixmedo/version"

module Tofixmedo
  class Scan
    def initialize(path, options = [])
      @path = path
      @options = options
    end

    def begin
      Dir.foreach(@path) do |item|
        puts "#{item} is a director? #{File.directory? item}"
      end
    end
  end
end
