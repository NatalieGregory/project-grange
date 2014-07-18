class CreatePosting < ActiveRecord::Migration
  def up
    create_table :posting do |t|
      t.string :name
      t.string :email
      t.string :username
      t.string :encrypted_password
    end
  end
  def down
    drop_table :posting
  end
end
