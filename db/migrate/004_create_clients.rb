class CreateClients < ActiveRecord::Migration
  def self.up
    create_table :clients do |t|
      t.string :name
      t.string :comment
      t.integer :category_id
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :clients
  end
end
