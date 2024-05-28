class HomeController < ApplicationController
  def index; end
  def download_and_send_email
    youtube_url = params[:youtube_url]
    email = params[:email]

    # Baixar o arquivo usando YoutubeDlWrapper
    youtube_dl_wrapper = YoutubeDlWrapper.new(youtube_url: youtube_url)
    mp3_file_path = youtube_dl_wrapper.download

    # Enviar o email com o arquivo anexado usando DownloadMailer
    DownloadMailer.send_music(email, youtube_dl_wrapper.file_name, mp3_file_path).deliver_now

    redirect_to root_path, notice: "A música foi baixada e enviada para o seu email!"
  end
end
