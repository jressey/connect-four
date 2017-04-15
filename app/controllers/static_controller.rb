class StaticController < ApplicationController

  def show
  	render template: "static/home"
  end
end
