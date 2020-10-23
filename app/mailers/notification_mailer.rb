class NotificationMailer < ApplicationMailer
  default from: "k.f.alamoana@gmail.com"

  def complete_mail(user)
    @user = user
    mail(
      subject: "会員登録が完了しました。", #メールのタイトル
      to: @user.email #宛先
    ) do |format|
      format.text
    end
  end
end
