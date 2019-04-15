class SendMailer < ApplicationMailer
  def send_mail(post)
    @post = post
    mail to: post.user.email, subject: "画像投稿の確認メール"
  end
end
