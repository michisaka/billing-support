class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :furigana

      t.timestamps
    end
    add_index :customers, :name
    add_index :customers, :furigana
  end
end
