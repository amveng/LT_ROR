# frozen_string_literal: true

ActiveAdmin.register Petition do
  permit_params :topic, :body, :target, :user_id, :status, :answer
end
