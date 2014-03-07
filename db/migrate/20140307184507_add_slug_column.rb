class AddSlugColumn < ActiveRecord::Migration
  def change
  	add_column :students, :slug, :string
  end
end
