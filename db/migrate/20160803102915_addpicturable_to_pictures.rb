class AddpicturableToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :picturable_type, :string
    add_column :pictures, :picturable_id, :integer
  end
end
