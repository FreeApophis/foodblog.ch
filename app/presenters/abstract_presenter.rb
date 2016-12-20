class AbstractPresenter < SimpleDelegator
  def initialize(model, view)
    @model = model
    @view = view

    super(@model)
  end

  def h
    @view
  end

  def m
    @model
  end
end
