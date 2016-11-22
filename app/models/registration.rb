class Registration < ActiveRecord::Base
  belongs_to :order

  #validates :name, :email, :telephone, presence: true

  serialize :notification_params, Hash
    def paypal_url(return_path)
        values = {
            business: "evelin86js-facilitator@gmail.com",
            cmd: "_xclick",
            upload: 1,
            return: "#{Rails.application.secrets.app_host}#{return_path}",
            invoice: id,
            amount: order.price,
            item_name: order.title,
            item_number: order.id,
            quantity: '1',
            
            notify_url: "#{Rails.application.secrets.app_host}/hook"
        }
        "#{Rails.application.secrets.paypal_host}" + "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query

    end
end