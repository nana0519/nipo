class Public::HomesController < ApplicationController
  before_action :authenticate_end_user!
end
