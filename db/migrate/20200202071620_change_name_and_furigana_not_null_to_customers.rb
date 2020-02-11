class ChangeNameAndFuriganaNotNullToCustomers < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:customers, :name, false)
    change_column_null(:customers, :furigana, false)
  end
end
