module UsersHelper
  def show_follower(usr)
    res = ''
    if usr.followers.count > 0
      res << 'Followed by '
      res << link_to(usr.followers.first.fullname, profile_path(usr.followers.first.username))
      res.html_safe
    else
      res << '0 follower'
      res.html_safe
    end
  end

  def follow_me(usr, partial)
    return if current_user == usr || current_user.follows.include?(usr)
  
    render partial: partial, locals: {res: usr}
  end
end
