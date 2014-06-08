require "formatador"
class Formatador
  def display_line(string = '', indent)
    @indent = indent
    if string.is_a? String
      display(string)
      new_line unless string =~ /\A.*(\s|\t)\Z/
    else
      display_lines(string)
    end
    nil
  end
  def display_lines(lines = [])
    for line in [*lines]
      display_line(line) unless line.empty?
    end
    nil
  end
end

class Dugger
  class Log
    module ClassMethods
      def out(message, intend)
        binding.pry 
      end
    end

    module Logger
      include Dugger::Log::ClassMethods
      def to_chat(message)
      end
      def log(message, indend=0)
        out(message, intend)
      end
      def vlog(message, indent=0)
        out(message, intend) if (opt[:verbose] || opt[:debug])
      end
      def dlog(message, indent=0)
        out(message, intend) if opt[:debug]
      end
      def elog(message, indent=0)
        out("[red]#{message}[/]", intend)
      end
      def wlog(message, indent=0)
        out("[yellow]#{message}[/]", intend)
      end
    end
  end
end