class CreateLoginpages < ActiveRecord::Migration
  def change
    create_table :loginpages do |t|
      t.string :username
      t.string :password

      t.timestamps
    end
  end
end
