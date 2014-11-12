module ApplicationHelper
  def title(value)
    unless value.nil?
      @title = "#{value} | Retifyt"      
    end
  end
end
