class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :token
      t.string :role
      t.string :spotify_id
      t.integer :email_confirmed, default: 0
      t.string :confirm_token

      t.timestamps
    end
  end
end
