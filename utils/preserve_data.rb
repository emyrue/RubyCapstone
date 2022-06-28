require 'json'
require_relative '../classes/music_album'
module PreserveData

    def create_obj(preserve_obj, class_type, data)
        case class_type
        when 'music_album'
            MusicAlbum.new(preserve_obj['date'], preserve_obj['on_spotify'])
        else
            puts 'Not yet supported :)'
        end
      end

  def preserve_data(path, data, class_type)
    data_json = []
      data.each { |d| data_json << d.to_json }
    end
    File.write(path, JSON.pretty_generate(data_json))
  end


  def get_data(path, class_type)
    preserve_data = []
    return preserve_data unless File.exist?(path)
    return preserve_data if File.zero?(path)

    data = JSON.parse(File.read(path))
    data.each do |d|
      preserve_obj = []
      preserve_data << create_obj(preserve_obj, class_type, d)
    end
    preserve_data
  end
end