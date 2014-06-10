require "formatador"
class Formatador
  def self.display_line(string = '', indent)
    @indent = indent
    if string.is_a? String
      display(string)
      new_line unless string =~ /^.*(\s|\t)$/
    else
      display_lines(string)
    end
    nil
  end
  def self.display_lines(lines = [])
    for line in [*lines]
      display_line(line) unless line.empty?
    end
    nil
  end
end

class Dugger
  class Log

    module ClassMethods
      def out(message, indent)
        Formatador.display_line message, indent
      end
    end

    module Logger
      include Dugger::Log::ClassMethods
      def to_chat(message)
      end
      def log(message, indent=0)
        out(message, indent)
      end
      def vlog(message, indent=0)
        out(message, indent) if (Dugger::CLI.method_options[:verbose] || Dugger::CLI.method_options[:debug])
      end
      def dlog(message, indent=0)
        out(message, indent) if Dugger::CLI.method_options[:debug]
      end
      def elog(message, indent=0)
        out("[red]#{message}[/]", indent)
      end
      def wlog(message, indent=0)
        out("[yellow]#{message}[/]", indent)
      end
    end
  end
end