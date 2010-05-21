# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class SiteExtension < Spree::Extension
  version "1.0"
  description "Describe your extension here"
  url "http://yourwebsite.com/site"

  # Please use site/config/routes.rb instead for extension routes.

  # def self.require_gems(config)
  #   config.gem "gemname-goes-here", :version => '1.2.3'
  # end
  
  def activate

    # to enable automatic payment capture
    if Spree::Config.instance
      Spree::Config.set(:auto_capture => true)
    end
    
    # customize some paypal site options
    # to have a custom logo appear on paypal, set Spree::Config[:site_url] to a domain you can access
    # and prepare a logo. see :header_image below
    # use https to avoid browser warnings about insecure page content
    Spree::PaypalExpress.class_eval do   
      def paypal_site_opts
        { :description             => "Goods from #{Spree::Config[:site_name]}", # site details...
          :header_image            => "https://" + Spree::Config[:site_url] + "/images/logo.gif", 
          :background_color        => "ffffff",  # must be hex only, six chars
          :header_background_color => "ffffff",
          :header_border_color     => "ffffff"
        }
      end
      
      # def address_options(order)
      #   {
      #     :no_shipping => false,
      #     :address_override => false
      #   }
      # end
      
      # def flat_rate_shipping_and_handling_options(order, stage)
      #   max_fallback = 0.0
      #   default_category = ShippingCategory.find(:first, :conditions => {:name => 'Default Shipping'})
      #   default_rate = ShippingRate.all.select{|sr| sr.shipping_category == default_category}.first
      #   default_shipping_method = default_rate.shipping_method
      #   
      #   shipping_options = ShippingMethod.all.map do |shipping_method|
      #         max_fallback = shipping_method.calculator.preferred_amount if shipping_method.calculator.preferred_amount > max_fallback
      #             { :name       => "#{shipping_method.id}",
      #               :label       => "#{shipping_method.name} - #{shipping_method.zone.name}",
      #               :amount      => (shipping_method.calculator.preferred_amount*100) + 1,
      #               :default     => (shipping_method.shipping_rates.include? default_rate)}
      #           end
      #   
      #   
      #   
      #   
      #   opts = { :shipping_options  => shipping_options,
      #            :max_amount  => (order.total + max_fallback)*100
      #          }
      #   
      #   opts[:shipping] = (default_shipping_method.nil? ? 0 : default_shipping_method.calculator.preferred_amount*100) if stage == "checkout"
      #   
      #   opts
      # end
    end
    
    # go from address to payment
    # Checkout.state_machines[:state] = StateMachine::Machine.new(Checkout, :initial => 'address') do
    #   after_transition :to => 'complete', :do => :complete_order
    #   before_transition :to => 'complete', :do => :process_payment
    # 
    #   event :next do
    #     transition :to => 'delivery', :from => 'address'
    #     transition :to => 'payment', :from => 'delivery'
    #     transition :to => 'complete', :from => 'payment'
    #   end
    # end
    
  end
  
end
