Spree::Address.class_eval do
  attr_accessible :tax_code

  validate  :check_tax_code

 private
  def check_tax_code
    if !country.nil? && country.name == "Italy"
      if tax_code.blank?
        errors.add(:tax_code, "Codice Fiscale mancante")
      elsif tax_code.length != 16 && tax_code.length != 11
        errors.add(:tax_code, "Codice Fiscale non valido")
      end
    end
  end
end
