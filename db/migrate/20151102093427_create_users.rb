class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :location
      t.string :user_image

      t.timestamps null: false
    end
  end
end
