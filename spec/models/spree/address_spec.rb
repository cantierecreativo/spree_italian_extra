require 'spec_helper'

describe Spree::Address do

  subject { Spree::Address }

  context "tax code validation" do

    context "when address is not in Italy" do
      let(:state) { stub_model(Spree::State, :name => 'maryland', :abbr => 'md') }
      let(:country) { mock_model(Spree::Country, :states => [state], :states_required => true) }
      let(:address) { build(:address, :country => country, :state_id => state.id, :state_name => state.name) }

      before do
        country.states.stub :find_all_by_name_or_abbr => [state]
      end

      it "should not check tax code" do
        address.should be_valid
      end
    end

    context "when address is in Italy" do
      let(:country) { mock_model(Spree::Country, :name => "Italy", :states_required => false) }
      let(:address) { build(:address, :country => country) }

      it "should check tax code" do
        address.should_not be_valid
      end

      context "when tax code is empty" do
        it_behaves_like "empty tax code"
      end

      context "when tax code is too short" do
        before { address.tax_code = "CLCMN" }

        it_behaves_like "not valid tax code"
      end

      context "when tax code is too long" do
        before { address.tax_code = "CLCMNA66H23G765MM" }

        it_behaves_like "not valid tax code"
      end

      context "when tax code is 11-char long" do
        before { address.tax_code = "CLCMNA66H23" }

        it_behaves_like "valid tax code"
      end

      context "when tax code is 16-char long" do
        before { address.tax_code = "CLCMNA66H23G765M" }

        it_behaves_like "valid tax code"
      end
    end
  end
end
