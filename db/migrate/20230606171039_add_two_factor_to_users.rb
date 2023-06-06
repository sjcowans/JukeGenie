class AddTwoFactorToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :two_factor, :integer, default: 0
  end
end
