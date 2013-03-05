class CreateAxp12students < ActiveRecord::Migration
  def change
    create_table :axp12students do |t|
      t.string :name
      t.string :mobile

      t.timestamps
    end
  end
end
