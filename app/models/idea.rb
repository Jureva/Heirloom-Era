class Idea < ActiveRecord::Base
    validates :title, presence: true,
                    length: { minimum: 5 }
                    
    def self.by_id_and_customer_id(id = nil, customer_id = nil)
        return where(id: id, customer_id: customer_id) if id && customer_id
        return where(id: id) if id
        return where(customer_id: customer_id) if customer_id
        all
    end
end
