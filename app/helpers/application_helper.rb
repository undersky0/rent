module ApplicationHelper
  def title(value)
    unless value.nil?
      @title = "#{value} | Rentify"      
    end
  end
end
