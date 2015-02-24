class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :note
      t.datetime :due_date

      t.timestamps null: false
    end
  end
end
