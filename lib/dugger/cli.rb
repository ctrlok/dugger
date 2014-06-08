require "thor"
require "dugger"

class Dugger
  class CLI < Thor
    desc "show", "Show cookbooks and it depends"
    options :deep, :desc => "Show depends of depends (of depends)"
    def show
      puts "TODO: list"
    end
  end
end