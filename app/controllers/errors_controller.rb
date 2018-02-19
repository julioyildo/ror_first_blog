class ErrorsController < ApplicationController
  #N404
  def not_found
    render(:status => 404)
  end

  #500
  def internal_server_error
    render(:status => 500)
  end
end
