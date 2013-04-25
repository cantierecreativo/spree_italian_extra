class AddTaxCodeToSpreeAddresses < ActiveRecord::Migration
  def change
    add_column :spree_addresses, :tax_code, :string
  end
end
