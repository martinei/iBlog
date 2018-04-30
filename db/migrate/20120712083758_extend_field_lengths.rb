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
class ExtendFieldLengths < ActiveRecord::Migration[4.2]
  def up
    change_column :entries, :progress, :text
    change_column :entries, :plans, :text
    change_column :entries, :problems, :text
    change_column :entries, :progress_html, :text
    change_column :entries, :plans_html, :text
    change_column :entries, :problems_html, :text
  end

  def down
  end
end
