module Api  
  class BaseController < ApplicationController
    protect_from_forgery with: :null_session
    before_action :set_resource, only: [:destroy, :show, :update]
    respond_to :json

    private

      def get_resource
        instance_variable_get("@#{resource_name}")
      end

      def query_params
        {}
      end

      def page_params
        params.permit(:page, :page_size)
      end

      def resource_class
        @resource_class ||= resource_name.classify.constantize
      end

      def resource_name
        @resource_name ||= self.controller_name.singularize
      end

      def resource_params
        @resource_params ||= self.send("#{resource_name}_params")
      end

      def set_resource(resource = nil)
        resource ||= resource_class.find(params[:id])
        instance_variable_set("@#{resource_name}", resource)
      end
  end
end 
