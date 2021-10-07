class ApplicationController < ActionController::Base
  def hello
    render html: "hello, from sample App !"
  end
end
