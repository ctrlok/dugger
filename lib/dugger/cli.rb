require "thor"
require "dugger"

require "pry"

module DuggerSubcommands
  class Create < Thor
    desc "role COOKBOOK", "create fight cookbook and role"
    def role
      puts "TODO: create wrapper"
    end
    desc "cookbook COOKBOOK", "create not role cookbook"
    def cookbook
      puts "TODO: create cookbook"
    end
  end
end

class Dugger
  class CLI < Thor
    class_option :verbose, :type => :boolean, :aliases => "-v"
    class_option :debug, :type => :boolean, :aliases => "-d"

    desc "show COOKBOOK", "Show cookbooks and it depends"
    option :deep, :desc => "Show depends of depends (of depends)"
    def show(*cookbooks)
      opt = options.dup
      opt[:cookbooks] = cookbooks
      Dugger.show(opt)
    end

    desc "create", "Create cookbook"
    subcommand 'create', DuggerSubcommands::Create

    desc "upload COOKBOOK", "Upload cookbook to chef server"
    def upload
      puts "TODO: upload"
    end

    desc "start COOKBOOK", "Start working with chef cookbook"
    def start
      puts "TODO: start"
    end

    desc "test", "Test cookbooks"
    def test
      puts "Test cookbooks"
    end

    desc "upgrade COOKBOOK", "Upgrade cookbook (and dependencies)"
    def upgrade
      puts "TODO: upgrade"
    end

    desc "inspect", "Deep inspect cookbook, nodes and dependencies"
    def inspect
      puts "TODO: inspect"
    end

    desc "version", "Show dugger version"
    def version
      puts Dugger::VERSION 
    end

  end
end