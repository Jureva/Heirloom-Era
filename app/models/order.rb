class Order < ActiveRecord::Base
    #belongs_to :idea
    validates :title, presence: true,
                    length: { minimum: 5 }
end
