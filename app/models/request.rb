class Request < ActiveRecord::Base


  validates :name, presence: {message: "Must enter a name" }

  validates :email, presence: true

  validates :department, presence: true

  validates :message, presence: true

  def self.search(search)
    where("name ILIKE :word OR email ILIKE :word OR department ILIKE :word OR message ILIKE :word", {word: "%#{search}%"})
  end


end
