class AddPositionToPortfols < ActiveRecord::Migration[5.2]
  def change
    add_column :portfols, :position, :integer
  end
end
