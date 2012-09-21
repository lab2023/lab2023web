class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :avatar
      t.text :description
      t.string :mail
      t.string :github_username
      t.string :twitter_username
      t.string :facebook_username

      t.timestamps
    end
  end
end
