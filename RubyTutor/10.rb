#練習問題

#• おじいさんの時計 。 ブロックを取って、今日過ぎた時間の回数だけ、 ブロックを呼ぶメソッドを書きなさい。それで、もし、ブロックとして do puts 'DONG!' endを渡したとしたら、それはおじいさんの時計のような (そんなたぐいの)チャイムを打つことになります。できたメソッドを、 (先ほどの例を含めて)2,3の違うブロックを使ってテストしてみなさい。
#ヒント:いまの時間を得るには Time.now.hour が使えます。でも、この時間というのは、0から 23の 数字を返しますので、それを普通の時計の前面にある数字 (1から 12)へと 変換しなければなりません。

def ojiclock &block
  now = Time.now.hour
  now = now - 12 if now > 12
  now.times do 
    block.call
  end
end

ojiclock do puts "DONG!" end

ojiclock do
  number = 1
  25000.times do
    number += number
  end
  puts "#{number.to_s.length.to_s}桁"
end

#• プログラムロガー。 ブロックを説明する文字列と ブロックを受け取る、logというメソッドを書きなさい。 doSelfImportantlyの例と似ているかもしれませんが、このメソッドでは、 渡されたブロックの開始を告げる文字列、修了を告げるまた別の文字列、 そしてブロックが何を返したかを告げる文字列をputsするようにします。 これにコードブロックを送って、作ったメソッドをテストしなさい。ブロックの中に 別の logへの呼び出しを入れて、それをもうひとつのブロックに 渡しなさい。(これは入れ子構造(nesting) と呼ばれます。) 別の言い方をすると、次のような出力が得られるようにしなさい。

#開始 "外ブロック"...
#開始 "ある小さなブロック"...
#..."ある小さなブロック" 終了, 返り値は:  5
#開始 "もうひとつのブロック"...
#..."もうひとつのブロック" 終了, 返り値は:  I like Thai food!
#..."外ブロック" 終了, 返り値は:  false

def log descri, &block
  puts "開始 #{descri}..."
  kaeri = block.call
  puts "...#{descri} 終了, 返り値は: #{kaeri}"
end

log "外ブロック" do
  log "ある小さなブロック" do
    5
  end
  log "もうひとつのブロック" do
    "I like Thai food!"
  end
  false
end

#• ロガー、改良版。 前のロガーの出力は少し読みにくく、多く使うほど より悪くなっていくようです。もし、内部のブロックで行が字下げ(インデント)されていれば 断然読みやすくなると思われます。それをするには、ロガーが、何か出力するたびに 何段階の入れ子になっているか保存しておく必要があるでしょう。その際、 コードのどの場所からも見ることができる変数である、グローバル変数 を使いなさい。この、グローバル変数を作るためには、$で始まる名前を 使えば良いです。たとえば、$global, $nestingDepthあるいは、 $bigTopPeeWeeはグローバル変数です。 そして、最後、ロガーは、こんなふうな出力をするようにします。

#開始 "外ブロック"...
#  開始 "ある小さなブロック"...
#    開始 "ちっちゃなブロック"...
#    ..."ちっちゃなブロック" 終了, 返り値は:  lots of love
#  ..."ある小さなブロック" 終了, 返り値は:  42
#  開始 "もうひとつのブロック"...
#  ..."もうひとつのブロック" 終了, 返り値は:  I love Indian food!
#..."外ブロック" 終了, 返り値は:  true

$nestingDepth = 0
def log descri, &block
  indent = " "*$nestingDepth
  $nestingDepth += 1 
  puts "#{indent}開始 #{descri}..."
  kaeri = block.call
  puts "#{indent}...#{descri} 終了, 返り値は: #{kaeri}"
  $nestingDepth -= 1
end

log "外ブロック" do
  log "ある小さなブロック" do
    log "ちっちゃなブロック" do
      "lots of love"
    end
    42
  end
  log "もうひとつのブロック" do
    "I like Indian food!"
  end
  true
end


