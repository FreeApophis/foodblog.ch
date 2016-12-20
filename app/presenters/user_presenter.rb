class UserPresenter < AbstractPresenter
  def avatar
    h.link_to m do
      m.email
    end
  end
end
