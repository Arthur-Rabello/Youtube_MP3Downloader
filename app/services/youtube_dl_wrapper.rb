# app/services/youtube_dl_wrapper.rb
class YoutubeDlWrapper
  MUSICS_PATH = Rails.root.join('tmp', 'musics').to_s.freeze

  def initialize(youtube_url:)
    @youtube_url = youtube_url
  end

  def download
    download_mp3!
    file_path
  end

  def file_name
    @file_name ||= get_file_name
  end

  def file_path
    @file_path ||= "#{MUSICS_PATH}/#{file_name}"
  end

  private

  attr_reader :youtube_url

  def get_file_name
    # Utilize yt-dlp para obter o título do vídeo do YouTube
    output = `yt-dlp --get-title #{youtube_url}`
    video_title = output.strip

    if video_title
      # Formata o nome do arquivo
      formatted_file_name = video_title
                              .gsub(/(\||\\|\/)/, '_')
                              .gsub(/:/, ' -')

      return formatted_file_name + '.mp3'
    else
      # Se o título não puder ser obtido, retorna um nome de arquivo padrão
      return "video.mp3"
    end
  end

  def download_mp3!
    `mkdir -p #{MUSICS_PATH}` # Certifique-se de que o diretório existe
    puts "Downloading MP3 to: #{file_path}"

    mp3_file_path = file_path

    # Download do vídeo e conversão para MP3 usando yt-dlp e ffmpeg
    download_command = <<-CMD
      yt-dlp "#{youtube_url}" -f bestaudio --extract-audio --audio-format mp3 --output "#{mp3_file_path}"
    CMD
    system(download_command)

    raise "Failed to download MP3" unless File.exist?(mp3_file_path)
    puts "MP3 file downloaded: #{mp3_file_path}"
  end
end
