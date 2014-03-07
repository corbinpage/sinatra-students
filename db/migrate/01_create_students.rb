class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string  :name
      t.text    :bio
      t.string  :profile_pic

      t.timestamps
    end
  end
end
