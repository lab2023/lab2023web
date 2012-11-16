class RenameRepostoryUrlToRepositoryUrlInOpenSources < ActiveRecord::Migration
  def up
    rename_column :open_sources, :repostory_url, :repository_url
  end

  def down
  end
end
