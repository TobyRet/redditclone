class VoteMailer < ActionMailer::Base
  default from: "no-reply@redditclone.com"

  def notification(vote, post)
    @vote = vote
    @post = post
    @user = post.user
    mail(to: @user.email, subject: 'You got a vote')
  end

end
