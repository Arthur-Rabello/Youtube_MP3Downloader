# app/mailers/download_mailer.rb
class DownloadMailer < ApplicationMailer
  def send_music(email, music_name, music_path)
    attachments[music_name] = File.read(music_path)
    mail(to: email, subject: "Seu download de #{music_name}, está disponível!")
  end
end
