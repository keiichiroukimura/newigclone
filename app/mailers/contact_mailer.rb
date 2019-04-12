class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
    mail to: "kkhtwdect@gmail.com", subject: "画像投稿の確認メール"
  end
end
