require "dugger/import"

class Dugger
  def self.show(opt)
    init(opt)
    require "dugger/show"
    Dugger::Commands::Show.show(@opt)
  end

  private
  def self.init(opt)
    @opt = opt
  end

end