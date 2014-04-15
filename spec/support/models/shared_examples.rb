shared_examples "not valid tax code" do
  it "should not be valid" do
    address.valid?
    address.errors.messages[:tax_code].should include Spree.t(:invalid_tax_code)
  end
end

shared_examples "empty tax code" do
  it "should not be valid" do
    address.valid?
    address.errors.messages[:tax_code].should include Spree.t(:missing_tax_code)
  end
end

shared_examples "valid tax code" do
  it "should be valid" do
    address.should be_valid
  end
end
