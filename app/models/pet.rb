class Pet < ActiveRecord::Base
  belongs_to :owner

  def by_name=(owner)
    self.owner = Owner.find_or_create_by(name: owner)

    # if owner.class == String
    #   binding.pry
    #   @owner = Owner.find(owner.to_i)
    # else
    #   @owner = owner
    # end

    #self.owner_id = owner_id
    #@owner = Owner.find(owner_id)
  end
end
