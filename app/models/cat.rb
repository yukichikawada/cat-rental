class Cat < ApplicationRecord
  COLORS = ["black", "white", "orange", "grey", "blue"]
  validates :color, inclusion: { in: COLORS, message: "%{value} Not a valid color"}
  validates :color, :name, :birthdate, :sex, :description, presence: true
  validates :sex, inclusion: { in: %w(M F), message: "%{value} has to be M or F" }

  def age
    year = Time.now.strftime("%Y").to_i
    birth = self.birthdate.year

    year - birth
  end

  


end
