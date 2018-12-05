class CreateHikes < ActiveRecord::Migration[5.2]
  def change
    create_table :hikes do |t|
      t.string :hikename
      t.text :comments
      t.text :tips

      t.timestamps
    end
  end
end
