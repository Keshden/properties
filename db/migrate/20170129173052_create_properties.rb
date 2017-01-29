class CreateProperties < ActiveRecord::Migration[5.0]
  def change
    create_table :properties do |t|
      t.string :name
      t.float :acres
      t.float :cost
      t.text :address
      t.float :sqFootage
      t.timestamps
    end
  end
end
