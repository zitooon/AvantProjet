class CreateReferences < ActiveRecord::Migration
  def self.up
    create_table :references do |t|
      t.integer :client_id
      t.string :title
      t.string :comment
      t.string :little_comment
      t.string :owner
      t.string :date
      t.string :summary
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :references
  end
end
