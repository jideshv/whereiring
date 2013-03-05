class AddDetailsToMomsgs < ActiveRecord::Migration
  def change
    add_column :momsgs, :api_id, :integer
    add_column :momsgs, :to, :integer
    add_column :momsgs, :timestamp, :datetime
    add_column :momsgs, :text, :string
    add_column :momsgs, :charset, :string
    add_column :momsgs, :udh, :string
    add_column :momsgs, :moMsgId, :string
  end
end
