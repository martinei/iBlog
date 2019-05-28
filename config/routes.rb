# Copyright 2014 innoQ Deutschland GmbH

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#     http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
Rails.application.routes.draw do
  resources :weekly_statuses do
    resources :comments
  end

  get '/weekly_statuses/by/:author' => 'weekly_statuses#by_author',
    :as => 'weekly_statuses_by_author'
  get '/weekly_statuses/week/:week' => 'weekly_statuses#by_week',
    :as => 'weekly_statuses_by_week'

  resources :blogs do
    resources :entries do
      resources :comments
    end
  end


  get '/cockpit', to: 'cockpit#index'
  get '/cockpit/:type/:id', to: 'cockpit#show',  as: :cockpit_type

  resources :comments

  resources :entries do
    resources :comments
  end

  get '/index-all(.:format)' => 'entries#full', :as => 'all_entries'

  root :to => 'entries#full'

  scope '/entries' do
    get '/tags/:tag(.:format)' => 'entries#by_tag', :as => 'tag'
    get '/home/:author(.:format)' => 'entries#user_home', :as => 'blog_entries_by_author'
    get '/home' => 'entries#home', :as => 'home'
  end

  get 'status' => 'status#index'

  get '/blogs/by/:owner(.:format)' => 'blogs#index', :as => 'blogs_by_owner'

  get '/search' => 'search#index'
end
