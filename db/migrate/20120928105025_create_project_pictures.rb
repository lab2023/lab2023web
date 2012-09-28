class CreateProjectPictures < ActiveRecord::Migration
  def change
    create_table :project_pictures do |t|
      t.references :project
      t.has_attached_file :image

      t.timestamps
    end
    add_index :project_pictures, :project_id
  end
end
