class Location < ActiveRecord::Base
  belongs_to :user
  belongs_to :property
  validates_format_of :postcode, :multiline => true, :with =>  /^([A-PR-UWYZ]([0-9]{1,2}|([A-HK-Y][0-9]|[A-HK-Y][0-9]([0-9]|[ABEHMNPRV-Y]))|[0-9][A-HJKS-UW])\s?[0-9][ABD-HJLNP-UW-Z]{2}|(GIR\ 0AA)|(SAN\ TA1)|(BFPO\ (C\/O\ )?[0-9]{1,4})|((ASCN|BBND|[BFS]IQQ|PCRN|STHL|TDCU|TKCA)\ 1ZZ))$$/i, :message => "invalid postcode", :on => :create
  geocoded_by :to_s
  after_validation :geocode
  
  def to_s
    "#{postcode}" + " GB"
  end
end
