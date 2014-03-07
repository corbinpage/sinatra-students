class Student < ActiveRecord::Base

  before_create :create_slug
  before_save :update_profile_pic_url
  before_save :update_background_pic_url


  def create_slug
    self.slug = self.name.downcase.gsub(" ","-").gsub("ä","a").gsub("ö","o").gsub("'","")
  end

  def change_name(name)
    self.name=name
    self.create_slug
  end

  def update_profile_pic_url
    profile_pic_base = "http://students.flatironschool.com"
    if self.profile_image && self.profile_image.match(/..\/img/)
      revised_url = self.profile_image.gsub("..","")
      self.profile_image = profile_pic_base + revised_url
    end
  end

  def update_background_pic_url
    background_pic_base = "http://students.flatironschool.com"
    if self.background_image == "no image"
      self.background_image = "http://joaniesoskin.jpg.to/" #hardhoding Joan as an exception
    elsif self.background_image && self.background_image.match(/..\/img/)
      revised_url = self.background_image.gsub("..","")
      self.background_image = background_pic_base + revised_url
    end
  end
end
