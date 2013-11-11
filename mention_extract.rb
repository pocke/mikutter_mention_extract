# -*- coding: utf-8 -*-

# Copyright 2013, pocket
# Licensed MIT
# http://opensource.org/licenses/mit-license.php

Plugin.create(:mention_extract) do

  settings('メンション抽出') do
    input '抽出する正規表現', :mention_extract_pattern
  end

  on_update do | service, msgs |
    pattern = UserConfig[:mention_extract_pattern]
    msgs = msgs.select{ |m| /#{pattern}/ =~ m[:message] }
    #timeline(:mentions) << msgs
    Plugin.call(:mention, service, msgs) if msgs != []
  end

end
