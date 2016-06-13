class Request < ActiveRecord::Base

  attr_accessible :done

  validates :name, presence: {message: "Must enter a name" }

  validates :email, presence: true

  validates :department, presence: true

  validates :message, presence: true

  def self.search(search)
    where("name ILIKE ? OR email ILIKE ? OR department ILIKE ? OR message ILIKE ?", "%#{search}", "%#{search}", "%#{search}", "%#{search}")
  end


end
