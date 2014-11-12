class Profile < ActiveRecord::Base
  belongs_to :user
  validates :firstname, :lastname, presence: true
  validates_format_of :phone, :with => /(\+*\d{1,})*([ |\(])*(\d{3})[^\d]*(\d{3})[^\d]*(\d{4})/
end
