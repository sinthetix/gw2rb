module GW2
  class API
    module Utils
      extend self
      def format_id(id)
        case id
        when String  then parse_string(id)
        when Array   then multiple_ids(id)
        when Integer then single_id(id)
        else
          ""
        end
      end

      def symbolize_keys(response)
        case response
        when Hash
          Hash[response.map { |k,v| [k.to_sym, symbolize_keys(v)]}]
        when Array
          response.map { |v| symbolize_keys(v) }
        else
          response
        end
      end

      private

      def parse_string(id)
        ids = id.split(",")
        if ids.length > 1
          multiple_ids(ids)
        else
          single_id(id)
        end
      end

      def single_id(id)
        "/#{id}"
      end

      def multiple_ids(ids)
        return "" if ids.length.zero?
        "?ids=#{ids.map(&:to_s).map(&:strip).join(',')}"
      end
    end
  end
end
