# require 'rails/all'
require "active_record/railtie"
require "action_controller/railtie"
require 'action_view/railtie'

app = Class.new(Rails::Application)
app.config.secret_token = '3b7cd727ee24e8444053437c36cc66c4'
app.config.session_store :cookie_store, :key => '_myapp_session'
app.config.active_support.deprecation = :log
app.config.eager_load = false
# Rais.root
app.config.root = File.dirname(__FILE__)
Rails.backtrace_cleaner.remove_silencers!
app.initialize!

# routes
app.routes.draw do
  resources :diaries, only: [:index] do
    collection do
      get "week_partition(/archive/:year/:month/:day)" => 'diaries#week_partition'
      get "day_partition(/archive/:year/:month/:day)" => 'diaries#day_partition'
    end
  end
end

#models
require 'fake_app/active_record/models'

# controllers
class ApplicationController < ActionController::Base; end
class DiariesController < ApplicationController
  before_action :set_month, only: [:index]
  before_action :set_week,  only: [:week_partition]
  before_action :set_date,  only: [:day_partition]

  def index
    @diaries = Diary.within_month(@date)
    render :inline => <<-ERB
<%= @diaries.map(&:title).join("\n") %>
<%= date_paginate %>
ERB
  end

  def week_partition
    @diaries = Diary.within_week(@date)
    render :inline => <<-ERB
<%= @diaries.map(&:title).join("\n") %>
<%= date_paginate_weeks %>
ERB
  end

  def day_partition
    @diaries = Diary.within_day(@date)
    render :inline => <<-ERB
<%= @diaries.map(&:title).join("\n") %>
<%= date_paginate_days num_pages: 3 %>
ERB
  end
end

# helpers
Object.const_set(:ApplicationHelper, Module.new)
