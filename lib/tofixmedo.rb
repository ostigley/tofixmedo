require "tofixmedo/version"

module Tofixmedo
  class Scan
    def initialize(path, options = [])
      @path = path
      @options = options
      @todos = []
    end

    def begin
      Dir.foreach(@path) do |item|
        if File.directory?(item)
          # Tofixmedo::Scan.new(item).begin
        else
            scan_file(item)
        end
      end

      @todos.each { |todo| puts todo }
    end

    def scan_file(file)
      abs_path = File.absolute_path("#{@path}/#{file}")

      File.open(abs_path) do |f|
        f.each_line do |line|
          @todos << "#{abs_path}, #{line}"
        end
      end
    end

  end
end
