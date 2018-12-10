class AddColumnsToHikes < ActiveRecord::Migration[5.2]
  def change
    add_column :hikes, :trailhead, :string
    add_column :hikes, :summary, :text
    add_column :hikes, :stars, :string
    add_column :hikes, :maxEl, :integer
    add_column :hikes, :location, :string
    add_column :hikes, :image, :text
    add_column :hikes, :difficulty, :string
    add_column :hikes, :ascent, :integer
    add_column :hikes, :high, :integer
  end
end
