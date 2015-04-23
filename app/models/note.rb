class Note < ActiveRecord::Base
  attr_accessible :title, :body, :type, :users_id, :note_type
  attr_accessor :note_type

  before_save :note_type

  def note_type
    self.type = "Text"
  end

end
