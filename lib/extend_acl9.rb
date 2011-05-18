# ExtendAcl9

module ActionController
  class Base

    class << self
      # :w => write, :r => Read, :n => No Access
      LEVELS = {:w => [:index, :show, :new, :edit, :create, :update, :destroy], :r => [:index, :show], :n => [] }
      # Class methods

      def controller_name
        self.name.gsub(/Controller/, '').downcase
      end

      def autom_permissions
        access_control do
          LEVELS.each do |level, permissions|
            access_name = (controller_name+"_"+level.to_s).to_sym
            allow access_name, :to => permissions
          end
        end
      end #def autom_permissions

    end #class << self
  # Instance methods
  end
end

