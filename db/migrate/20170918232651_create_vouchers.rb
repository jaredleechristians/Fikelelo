class CreateVouchers < ActiveRecord::Migration[5.1]
  def change
    create_table :vouchers do |t|
      t.string :voucher_code
      t.string :voucher_type
      t.float :voucher_value
      t.float :voucher_value_remaining
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
