class RemoveDetailsFromMomsgs < ActiveRecord::Migration
  def up
    remove_column :momsgs, :message
  end

  def down
    add_column :momsgs, :message, :string
  end
end
