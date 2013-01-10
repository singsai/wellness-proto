module Assignable
  def assign( attrs = {} )
    attrs.each do | k , v |
      meth = "#{ k }=".to_sym
      send meth , v rescue nil
    end
  end
end
