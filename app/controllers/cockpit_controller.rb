# encoding: utf-8
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

class CockpitController < ApplicationController


  before_action :fetch_status

  def index
  end

  def show
    case params[:type].downcase
    when "weekly_status"
      @status = WeeklyStatus.includes(:comments)
                    .references(:comments)
                    .find(params[:id])
    when "entry"

    end
    render "index"
  end

  private

  def fetch_status
    current_week = Date.current.cweek
    names_and_weeks = [["Diese Woche", current_week]] +
        5.times.map {|week| (current_week - week - 1)}.map {|week| ["KW #{week}", week]}
    @wochenstatuses = names_and_weeks.map {|(name, week)| [name, WeeklyStatus.by_week(week)]}
  end

end