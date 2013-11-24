# -*- coding: utf-8 -*-

# Copyright 2013, pocket
# Licensed MIT
# http://opensource.org/licenses/mit-license.php

Plugin.create(:mention_extract) do
  settings('メンション抽出') do
    input '抽出する正規表現', :mention_extract_pattern
  end

  on_update do |service, msgs|
    pattern ||= Regexp.new UserConfig[:mention_extract_pattern]
    Plugin.call :mention, service, msgs.select{|m| pattern =~ m[:message] }
  end
end
