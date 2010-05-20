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
    end
    
  end
  
end
