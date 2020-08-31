# == Schema Information
#
# Table name: server_views
#
#  id        :bigint           not null, primary key
#  server_id :bigint
#  viewer    :string
#  date      :date
#
require 'rails_helper'

RSpec.describe ServerView, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
