# -*- coding: utf-8 -*-

Plugin.create(:mention_extract) do

  on_update do | service, msgs |
    msgs = msgs.select{ |m| /(ぽっけ)|(ぽけ)/ =~ m[:message] }
    timeline(:mentions) << msgs
  end

end
