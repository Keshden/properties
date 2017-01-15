class Users < ActiveRecord::Migration[5.0]
  def change
    t.string :username
    t.string :password
    t.string :adminClearanceLevel
    
  end
end
