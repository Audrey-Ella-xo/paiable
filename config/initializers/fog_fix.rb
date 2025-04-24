# Fix for "wrong constant name CDN v2" error in fog-rackspace
module Fog
  module Rackspace
    class << self
      alias_method :original_service, :service rescue nil
      
      def service(service_string)
        return nil if service_string == "CDN v2"
        original_service(service_string) rescue nil
      end
    end
  end
end