Spree::Address.class_eval do
  attr_accessible :tax_code

  validates :tax_code, :presence => true
end
