require "tofixmedo/version"

module Tofixmedo
  class Scan
    def initialize(path, options = [])
      @path = path
      @options = options
      @todos = []
      @fixme = []
    end

    def begin
      Dir.foreach(@path) do |item|
        if File.directory?(item)
          Tofixmedo::Scan.new(item).begin unless ['.','..'].include? item
        else
            scan_file(item)
        end
      end

      puts "Your TODOS ARE: \n"
      @todos.each { |todo| puts todo }

      puts "Your FIXMES ARE: \n"
      @fixme.each { |fixme| puts fixme }
    end

    def scan_file(file)
      abs_path = File.absolute_path("#{@path}/#{file}")

      File.open(abs_path) do |f|
        f.each_line do |line|
          if line.include? '# TODO'
            @todos << "#{abs_path} \n        #{line}"
          end

          if line.include? '# FIXME'
            @fixme << "#{abs_path} \n        #{line}"
          end
        end
      end
    end

  end
end
