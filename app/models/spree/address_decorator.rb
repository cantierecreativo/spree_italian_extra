Spree::Address.class_eval do
  attr_accessible :tax_code

  validates :tax_code, :presence => true

  def check_tax_code
    if tax_code.length != 16 || tax_code.length != 11
      errors.add(:tax_code, "Codice Fiscale non valido")
    end
  end
end
