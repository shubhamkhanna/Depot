class CreateBuys < ActiveRecord::Migration
  def change
    create_table :buys do |t|
      t.string :uname
      t.string :address
      t.string :pass
      t.string :emailid
      t.string :phone

      t.timestamps
    end
  end
end
