class AddDescriptionToOpenSource < ActiveRecord::Migration
  def change
    add_column :open_sources, :description, :text
  end
end
