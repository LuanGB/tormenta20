class OpenStructJson
  BASE_PATH = __dir__.gsub(/ruby\/?$/, 'json/')
    
  class << self
    def load(path, include_if: nil, reject_if: nil)
      if File.directory?(BASE_PATH + path)
        all = OpenStruct.new
        all[:all] = []
        all_ids = Dir.entries(BASE_PATH + path).reject{|e| e.match(/\.\.?$/)}.map do |e|
          id = e.gsub('.json', '').to_sym
          object = parse_json_path_to_ostruct(BASE_PATH + path.gsub(/\/$/, "") + "/" + e)
          next if include_if && !include_if.call(object)
          next if reject_if && reject_if.call(object)
          all[id] = object
          all[:all] << object
          id
        end.compact
        all[:all_ids] = all_ids
        all
      else
        throw "include_if and reject_if are only available for directories" if include_if || reject_if
        parse_json_path_to_ostruct(BASE_PATH + path + '.json')
      end
    end

    private

    def parse_json_path_to_ostruct(path)
      hash_map = JSON.parse(File.read(path))
      struct = JSON.parse(hash_map.to_json, object_class: OpenStruct)
      struct.as_json = hash_map
      struct
    end
  end
end