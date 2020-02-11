class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string :name, null: false
      t.string :furigana, null: false
      t.integer :customer_id, null: false

      t.timestamps
    end
    add_index :students, :name
    add_index :students, :furigana
    add_foreign_key :students, :customers
  end
end
