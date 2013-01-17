class Kountry < ActiveRecord::Base
  def self.all_with_first_as(first)
    kountries = Kountry.all         

    target_record = kountries.delete_at(first)      
    # if options[:second]
    #   second_target = countries.delete_at(options[:second]) 
    # end
                
    kountries.unshift(target_record)                    
    #countries.unshift(second_target) 
  end  
end