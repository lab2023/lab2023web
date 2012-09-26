class AddSlugToOpenSources < ActiveRecord::Migration
  def change
    add_column :open_sources, :slug, :string
    add_index :open_sources, :slug
  end
end