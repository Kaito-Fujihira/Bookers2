class NotificationMailer < ApplicationMailer

  def complete_mail(user)
    @user = user
    mail(
      subject: "会員登録が完了しました。", #メールのタイトル
      to: @user.email #宛先
    )
  end
end
