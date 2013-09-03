# 最初に姓、次に名前を聞いて、最後にフルネームに対してあいさつを するようなプログラムを書いてみましょう。
puts 'Family name?'
fam = gets.chomp
puts 'First name?'
fir = gets.chomp
puts 'Hello,' + fir + fam

# 好きな数を入力してもらい、それに1を加えて、その結果を ベターな 数字として薦めるプログラムを書きましょう。 (機転の利いたサジェスチョンに努めましょう。)
puts '好きな数字をいれてね'
num =  gets.chomp.to_i + 1 
puts num.to_s + 'が好きな人もいますね！'
