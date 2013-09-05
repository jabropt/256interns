#練習問題

#• 10億(One billion)秒... (もし記録が残っているなら)あなたの生まれた 正確な時刻を見つけ、いつ10億秒歳になる(あるいはなった)のかを 計算してみなさい。そしてカレンダーに印をつけましょう。

puts Time.mktime(1991, 1, 13) + 1000000000

#• ハッピーバースデー! 　生まれた年、月、そして日を順に訊いて そこから年齢を計算します。そして、過ごしてきた誕生日それぞれに対して 大きなおめでとう!をプレゼントしましょう。

puts "ハッピーバースデー！"
puts "何年生まれ？"
year = gets.chomp.to_i
puts "何月生まれ？"
month = gets.chomp.to_i
puts "何日生まれ？"
day = gets.chomp.to_i
old = Time.now.year - (Time.mktime(year, month, day)).year
puts "#{old}歳おめでとう！！！"

#あと、出る目をセットする方法が あったらいいなと思いませんか? さぁ、このcheatメソッドを 書いてみましょう。プログラムを書いたら(そして、もちろん書いた メソッドがきちんと動くかテストしたら)この文章に戻ってきましょう。 7の目をセットできてしまうなんてことがないように 確認してくださいね。

class Die
    
    def initialize
        #  ここでは、さいころを振るだけにします。
        #  最初から6にセットしておくとか、
        #  他にやりたい放題できることは確かですけど。
        roll
    end
    
    def roll
        @numberShowing = 1 + rand(6)
    end
    
    def showing
        @numberShowing
    end
    
    def cheat
        derume = gets.chomp.to_i
        @numberShowing = derume if 1 <= derume && derume <= 6
    end
end

puts Die.new.showing
puts Die.new.cheat

