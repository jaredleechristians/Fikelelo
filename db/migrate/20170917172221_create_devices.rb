class CreateDevices < ActiveRecord::Migration[5.1]
  def change
    create_table :devices do |t|
      t.string :name
      t.string :token
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
