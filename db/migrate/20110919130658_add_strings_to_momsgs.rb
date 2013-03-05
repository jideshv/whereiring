class AddStringsToMomsgs < ActiveRecord::Migration
  def change
    add_column :momsgs, :from, :string
    add_column :momsgs, :to, :string
    add_column :momsgs, :api_id, :string
  end
end
