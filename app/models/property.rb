class Property < ActiveRecord::Base
  belongs_to :user
  has_one :location, dependent: :destroy
  accepts_nested_attributes_for :location, :allow_destroy => true
  
    def anual_income
      return self.currentrent*12
    end
    
    def anual_yield
      return (self.anual_income / self.cost) * 100
    end
end
