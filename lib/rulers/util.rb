module Rulers

  def self.to_underscore(string)
    string.gsub(/::/, "/").
      gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
      gsub(/([a-z\d])([A-Z])/,'\1_\2').
      tr("-", "_").
      downcase
  end

  def self.paths(prefix)
    puts $LOAD_PATH.count
    puts prefix
    $LOAD_PATH.each do |p|
      puts p
    end
    3.times { puts "" }
  end
end
