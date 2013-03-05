class CreateMomsgs < ActiveRecord::Migration
  def change
    create_table :momsgs do |t|
      t.integer :from
      t.string :message

      t.timestamps
    end
  end
end
