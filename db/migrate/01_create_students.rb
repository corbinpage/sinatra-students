class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string  :name
      t.text    :bio
      t.string  :profile_image
      t.string  :background_image
      t.string  :quote
      t.string  :work
      t.string  :work_title
      t.string  :education
      t.string  :twitter
      t.string  :linkedin
      t.string  :github
      
      t.timestamps
    end
  end
end
    #social_media  = parse_social_media(student_page)
      # student.twitter = social_media[0]
      # student.linkedin = social_media[1]
      # student.github = social_media[2]