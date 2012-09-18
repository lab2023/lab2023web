class CreateOpenSources < ActiveRecord::Migration
  def change
    create_table :open_sources do |t|
      t.string :name
      t.string :repostory_url
      t.string :twitter_username
      t.string :facebook_page

      t.timestamps
    end
  end
end
