require "tofixmedo/version"

module Tofixmedo
  class Scan
    @@todos = []
    @@fixme = []

    def initialize(path, options = [], print_result = true)
      @path = path
      @options = options
      @paths = Dir["#{path}/*"]
      @print = print_result
    end

    def begin
      @paths.each do |item|
        if File.directory?(item)
          Tofixmedo::Scan.new(item, @options, false).begin
        else
          scan_file(item)
        end
      end

      if @print
        puts "You have #{@@todos.length} TODOS: \n"
        @@todos.each { |todo| puts todo }

        puts "You have #{@@fixme.length} FIXMES: \n"
        @@fixme.each { |fixme| puts fixme }
      end

    end

    def scan_file(file)
      open_and_read(file)
    end

    def open_and_read(file)
      File.open(file) do |f|
        f.each_line do |line|
          if line.include? '# TODO'
            @@todos << "#{file} \n        #{line}"
          end

          if line.include? '# FIXME'
            @@fixme << "#{file} \n        #{line}"
          end
        end
      end
    end

  end
end