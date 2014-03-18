Spree::Address.class_eval do

  validate :check_tax_code

  def check_tax_code
    if !country.nil? && country.name == "Italy"
      if tax_code.blank?
        errors.add(:tax_code, Spree.t(:missing_tax_code))
      elsif tax_code.length != 16 && tax_code.length != 11
        errors.add(:tax_code, Spree.t(:invalid_tax_code))
      end
    end
  end
end
