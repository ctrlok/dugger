module Ridley
  module Chef
    class Cookbook
      class Metadata
        def version=(version)
          @version = version
        end
        def render
          self.to_hash.map do |key,value|
            if value.is_a? String
              if key == "long_description"
                value = "IO.read(File.join(File.dirname(__FILE__), 'README.md'))"
              else
                value = "\'#{value}\'"
              end
              [key.ljust(20), value].join("")
            else
              key = "depends" if key == "dependencies"
              value.map do |k,v|
                [key.ljust(20), "\'#{k}\', ", "\'#{v}\'"].join("")
              end
            end
          end
        end
      end
    end
  end
end