class AddCountclicksToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :countclick, :integer, default: 0
  end
end
