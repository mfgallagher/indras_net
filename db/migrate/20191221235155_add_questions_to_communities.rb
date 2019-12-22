class AddQuestionsToCommunities < ActiveRecord::Migration[6.0]
  def change
    add_reference :questions, :community, foreign_key: true
    add_reference :answers, :community, foreign_key: true
  end
end
