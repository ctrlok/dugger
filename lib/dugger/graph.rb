class Dugger
  def self.add_cookbook(hash)
    # @@cookbook = {"apt" => object }
    @@stack ||= []
    @@cookbooks ||= {}
    if @@cookbooks[hash[:name]]
      cookbook = @@cookbooks[hash[:name]]
    else
      cookbook = Dugger::Cookbook.new(hash)
      @@cookbooks[hash[:name]] = cookbook
    end
    for depend in hash[:depends]
      if @@cookbooks[depend[:name]]
        vlog "#{depend[:name]} already added to cookbooks graph"
        depend_cookbook = @@cookbooks[depend[:name]]
        unless depend_cookbook.versions.include? depend[:version]
          depend_cookbook.add_version(depend[:version])
          vlog "Add #{depend[:version]} to this cookbook"
        end
      else
        depend_cookbook = Dugger::Cookbook.new(depend)
        @@cookbooks[depend[:name]] = depend_cookbook
        @@stack.push(depend_cookbook)
      end
      depend_cookbook.add_parrent(depend[:version], cookbook, hash[:version])
      cookbook.add_depend(hash[:version], depend_cookbook, depend[:version])
    end
  end
  class Cookbook
    attr_accessor :versions, :name, :depends, :parrents
    def initialize(cookbook = {})
      @versions ||= Array.new
      @depends ||= Hash.new
      @parrents ||= Hash.new
      @name = cookbook[:name]
      @versions.push(cookbook[:version])
      vlog "\nInitialize new cookbook #{@name}-#{cookbook[:version]}, with depends:"
      vlog "\n #{cookbook[:depends]}", 1 
    end
    def add_version(version)
      @versions.push(version)
    end
    def add_parrent(version, cookbook = nil, cookbook_version = nil)
      @parrents[version] ||= Array.new 
      @parrents[version].push({:cookbook => cookbook, :version => cookbook_version})
    end
    def add_depend(version, cookbook = nil, cookbook_version = nil)
      @depends[version] ||= Array.new
      @depends[version].push({:cookbook => cookbook, :version => cookbook_version})
    end


  end
end