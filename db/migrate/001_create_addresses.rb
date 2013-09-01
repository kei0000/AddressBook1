class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.column :title, :string
      t.column :tel, :string
      t.column :open_hours, :string
      t.column :memo, :text
      t.timestamps
    end
  end

  def self.down
    drop_table :addresses
  end
end
