class FeedbacksMailer < ApplicationMailer
  def completed_feedback(feedback)
    @email = feedback.email
    @text = feedback.text

    mail to: @email
  end
end