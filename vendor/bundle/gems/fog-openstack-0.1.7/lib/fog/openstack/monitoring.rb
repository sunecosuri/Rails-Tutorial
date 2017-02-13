
module Fog
  module Monitoring
    class OpenStack < Fog::Service
      requires   :openstack_auth_url
      recognizes :openstack_auth_token, :openstack_management_url,
                 :persistent, :openstack_service_type, :openstack_service_name,
                 :openstack_tenant, :openstack_tenant_id, :openstack_userid,
                 :openstack_api_key, :openstack_username, :openstack_identity_endpoint,
                 :current_user, :current_tenant, :openstack_region,
                 :openstack_endpoint_type, :openstack_auth_omit_default_port,
                 :openstack_project_name, :openstack_project_id,
                 :openstack_project_domain, :openstack_user_domain, :openstack_domain_name,
                 :openstack_project_domain_id, :openstack_user_domain_id, :openstack_domain_id,
                 :openstack_identity_prefix, :openstack_temp_url_key

      model_path 'fog/openstack/models/monitoring'
      model       :metric
      collection  :metrics
      model       :measurement
      collection  :measurements
      model       :statistic
      collection  :statistics
      model       :notification_method
      collection  :notification_methods
      model       :alarm_definition
      collection  :alarm_definitions
      model       :alarm
      collection  :alarms
      model       :alarm_state
      collection  :alarm_states
      model       :alarm_count
      collection  :alarm_counts

      request_path 'fog/openstack/requests/monitoring'
      request :create_metric
      request :create_metric_array
      request :list_metrics
      request :list_metric_names

      request :find_measurements

      request :list_statistics

      request :create_notification_method
      request :get_notification_method
      request :list_notification_methods
      request :update_notification_method
      request :delete_notification_method

      request :create_alarm_definition
      request :list_alarm_definitions
      request :patch_alarm_definition
      request :update_alarm_definition
      request :get_alarm_definition
      request :delete_alarm_definition

      request :list_alarms
      request :get_alarm
      request :patch_alarm
      request :update_alarm
      request :delete_alarm
      request :get_alarm_counts

      request :list_alarm_state_history_for_specific_alarm
      request :list_alarm_state_history_for_all_alarms

      class Real
        include Fog::OpenStack::Core

        def initialize(options = {})
          initialize_identity options

          @openstack_service_type           = options[:openstack_service_type] || ['monitoring']
          @openstack_service_name           = options[:openstack_service_name]

          @connection_options               = options[:connection_options] || {}

          authenticate
          @persistent = options[:persistent] || false
          @connection = Fog::Core::Connection.new("#{@scheme}://#{@host}:#{@port}", @persistent, @connection_options)
        end

        def request(params, parse_json = true)
          begin
            response = @connection.request(params.merge(:headers => {
              'Content-Type' => 'application/json',
              'Accept'       => 'application/json',
              'X-Auth-Token' => @auth_token
            }.merge!(params[:headers] || {}),
                                                        :path    => "#{@path}/#{params[:path]}"))
          rescue Excon::Errors::Unauthorized => error
            if error.response.body != 'Bad username or password' # token expiration
              @openstack_must_reauthenticate = true
              authenticate
              retry
            else # bad credentials
              raise error
            end
          rescue Excon::Errors::HTTPStatusError => error
            raise case error
                  when Excon::Errors::NotFound
                    Fog::Monitoring::OpenStack::NotFound.slurp(error)
                  else
                    error
                  end
          end
          if !response.body.empty? && parse_json && response.get_header('Content-Type') =~ %r{application/json}
            response.body = Fog::JSON.decode(response.body)
          end
          response
        end
      end
    end
  end
end
