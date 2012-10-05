class RenameMailToTeams < ActiveRecord::Migration
  def up
    rename_column :teams, :mail, :email
  end

  def down
    rename_column :teams, :email, :mail
  end
end
