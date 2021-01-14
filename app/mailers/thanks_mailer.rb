class ThanksMailer < ApplicationMailer
  def complate_registration(user)
    @user = user
    mail to: @user.email, subject: "会員登録が完了しました。"
  end
end
