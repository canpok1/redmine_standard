class CreateFoos < ActiveRecord::Migration
  def change
    create_table :foos do |t|

      t.integer :project_id

      t.string :subject

      t.text :description


    end

  end
end
