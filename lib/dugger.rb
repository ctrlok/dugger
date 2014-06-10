require "dugger/import"
require "dugger/graph"

class Dugger
  def self.show(opt)
    init(opt)
    require "dugger/show"
    apache = {:depends => [{:name => "apt",  :version => "1.0.1"},{:name => "common", :version => "1.2.1"}], :version => "1.1.1", :name => "apache"}
    Dugger.add_cookbook(apache)
    Dugger::Commands::Show.show(@opt)
  end

  private
  def self.init(opt)
    @opt = opt
    Dugger::CLI.option(:verbose) if opt["verbose"]
    Dugger::CLI.option(:debug) if opt["debug"]
  end

end