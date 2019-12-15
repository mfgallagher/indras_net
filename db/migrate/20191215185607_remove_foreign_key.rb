class RemoveForeignKey < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :answers, :questions
    remove_foreign_key :answers, :users
  end
end
