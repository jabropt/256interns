#練習問題

#好きな数だけ単語の入力をしてもらい(1行に1単語、最後はEnterだけの空行)、 アルファベット順に並べ変えて出力するようなプログラムを書いてみましょう?
##ヒント： 配列を順番に並び替える(ソートする)には 素敵なメソッド sortがあります。 これを使いましょう。
#(訳注：配列 ary の最後に要素 elem を追加するには、ary << elem と 記述します。)

puts "気が済むまで単語をいれてね！"
tango = nil
ary = %w() 
while tango != "\n" 
  tango = gets
  ary << tango.chomp
end
puts ary.sort

#• 上のプログラムをsortメソッドなしで 書けますか。プログラミングの大部分は、問題解決にあります。 これはいい練習になります。

puts "気が済むまで単語をいれてね！"
tango = nil
ary = %w() 
while tango != "\n" 
  tango = gets
  mae = ary.select {|a| a < tango}
  ato = ary.select {|a| a > tango}
  ary = (mae << tango.chomp) + ato
end
puts ary

#練習問題

#• 以前、メソッドの章で書いた 目次を表示するプログラムを修正してみましょう。その際、プログラムの最初で 目次の情報(つまり、章の名前やページ番号など)をすべてひとつの配列にしまいます。 その後、その配列から情報を取り出して美しくフォーマットされた目次を出力します。

lineWidth = 40
puts " 目  次 ".center(lineWidth)
puts ""
nakami = [['1章: 数', 'p. 1'], ['2章: 文字', 'p. 72'], ['3章: 変数', 'p. 118']]
nakami.each{|a| puts a[0].ljust(lineWidth/2) + a[1].rjust(lineWidth/2)}
