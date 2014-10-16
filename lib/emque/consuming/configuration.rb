require "logger"

module Emque
  module Consuming
    class Configuration
      attr_accessor :app_name, :consuming_adapter, :kafka_options,
        :rabbitmq_options, :error_handlers, :error_limit, :error_expiration
      attr_writer :log_level

      def initialize
        @app_name = ""
        @consuming_adapter  = :rabbitmq
        @rabbitmq_options   = { :url => "amqp://guest:guest@localhost:5672" }
        @kafka_options      = { :seed_brokers => ["localhost:9092"],
                                :zookeepers => ["localhost:2181"] }
        @error_handlers     = []
        @error_limit        = 5
        @error_expiration   = 3600 # 60 minutes
        @log_level          = nil
      end

      def log_level
        @log_level ||= Logger::INFO
      end
    end
  end
end
