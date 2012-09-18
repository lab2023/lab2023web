class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.string :website
      t.string :owner
      t.string :twitter_username
      t.string :facebook_page

      t.timestamps
    end
  end
end
