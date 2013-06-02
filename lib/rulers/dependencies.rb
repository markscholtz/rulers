module Rulers
  class AutoLoadError < LoadError
  end
end

class Object

  def self.const_missing(c)
    return nil if @calling_const_missing

    @calling_const_missing = true

    require Rulers.to_underscore(c.to_s)
    Object.const_get(c)
  rescue LoadError => e
    raise Rulers::AutoLoadError, e
  ensure
    @calling_const_missing = false
  end
end
