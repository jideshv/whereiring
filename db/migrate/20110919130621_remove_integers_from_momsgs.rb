class RemoveIntegersFromMomsgs < ActiveRecord::Migration
  def up
    remove_column :momsgs, :from
    remove_column :momsgs, :to
    remove_column :momsgs, :api_id
  end

  def down
    add_column :momsgs, :api_id, :integer
    add_column :momsgs, :to, :integer
    add_column :momsgs, :from, :integer
  end
end
