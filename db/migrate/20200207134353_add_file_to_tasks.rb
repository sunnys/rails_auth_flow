class AddFileToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :file, :string
  end
end
