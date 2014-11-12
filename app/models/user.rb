class User < ActiveRecord::Base
  
  
  has_one :location, dependent: :destroy
  has_one :profile, dependent: :destroy
  has_many :properties, dependent: :destroy

  
  #before_save :create_profile, :create_property, :create_location
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
         #, :confirmable, :trackable, :validatable
         
  # Pagination
  paginates_per 100
  
  # Validations
  # :email
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  
  def self.paged(page_number)
    order(admin: :desc, email: :asc).page page_number
  end
  
  def self.search_and_order(search, page_number)
    if search
      where("email LIKE ?", "%#{search.downcase}%").order(
      admin: :desc, email: :asc
      ).page page_number
    else
      order(admin: :desc, email: :asc).page page_number
    end
  end
  
  def self.last_signups(count)
    order(created_at: :desc).limit(count).select("id","email","created_at")
  end
  
  def self.last_signins(count)
    order(last_sign_in_at: 
    :desc).limit(count).select("id","email","last_sign_in_at")
  end
  
  def self.users_count
    where("admin = ? AND locked = ?",false,false).count
  end
    def create_profile
    self.build_profile() if self.profile.nil?
   end     
    def create_location
    self.build_location() if self.profile.nil?
   end      
       def create_property
    self.properties.build() if self.profile.nil?
   end       
end
