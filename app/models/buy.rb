class Buy < ActiveRecord::Base
  validates :uname, :presence => true
  validates :address, :presence => true
  validates :pass, :presence => true, :confirmation => true, :uniqueness => true
  validates :pass_confirmation, :presence => true
  validates :emailid, :presence => true
  validates :phone, :presence => true, :length => { :is => 10 }, :numericality => true
end
