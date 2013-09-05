def englishNumber number
  if number < 0  #  負の数は不可です。
    return '負でない数を入力してください.'
  end
  if number == 0
    return 'zero'
  end

  #  もう、上限として特別の場合は設けません。余分なreturnもなし。

  numString = ''  #  これが最終的に返す文字列です。

  onesPlace = ['one',     'two',       'three',    'four',     'five',
               'six',     'seven',     'eight',    'nine']
  tensPlace = ['ten',     'twenty',    'thirty',   'forty',    'fifty',
               'sixty',   'seventy',   'eighty',   'ninety']
  teenagers = ['eleven',  'twelve',    'thirteen', 'fourteen', 'fifteen',
               'sixteen', 'seventeen', 'eighteen', 'nineteen']

  #  上のほうの桁から表示させていって、"left" には
  #  まだ残っている数を入れます。
  #  "write" にはこれからすぐに出力させるための
  #  一桁分の数を入れます。
  #  write と left... 良いですか? :)
    
  left  = number
  write = left/1000000000000
  left  = left - write*1000000000000

  if write > 0
    trillions  = englishNumber write
    numString = numString + trillions + ' trillion' 
    if left > 0
       numString = numString + ' and '
    end
  end
  
  write = left/1000000000
  left  = left - write*1000000000

  if write > 0
    billions  = englishNumber write
    numString = numString + billions + ' billion'
    if left > 0
       numString = numString + ' and '
    end
  end
  
  write = left/1000000
  left  = left - write*1000000

  if write > 0
    millions  = englishNumber write
    numString = numString + millions + ' million'
    if left > 0
       numString = numString + ' and '
    end
  end
  
  write = left/1000
  left  = left - write*1000

  if write > 0
    thousands  = englishNumber write
    numString = numString + thousands + ' thousand'
    if left > 0
        numString = numString + ' and '
    end
  end    
    
  write = left/100          #  百の桁以上の桁をwriteに入れます。
  left  = left - write*100  #  下2桁をleftに残します。

  if write > 0
    #  さて、ここでちょっとしたトリックを使います。

    hundreds  = englishNumber write
    numString = numString + hundreds + ' hundred'

    #  これは「再帰法」と呼ばれる技です。さて何をやって
    #  いるのでしょう? 上の行ではメソッドの中で自分自身
    #  (訳註：つまり"englishNumber")を呼ぶように指示して
    #  います。ただし、引数として"number"の代わりに
    #  "write"を指定しています。
    #  ここで、"write"が(この時点では)、最終的に英語で
    #  出力すべき数の百の位以上の数であるということを
    #  思い出してください。
    #  2行目では、"hundreds"を"numString"の後に追加して、
    #  さらに、' hundred'という文字列を追加しています。
    #  具体的に言うと、たとえば、最初に引数を1999とする
    #  と(つまり、"number" = 1999)、englishNumberを呼ぶ
    #  ところでは、"write"に19が入っており、"left"には99が
    #  入っています。ここで最も怠惰な考えとしては、
    #  englishNumberがまず'nineteen'を出力して、その後に
    #  ' hundred'を出力し、最後に残りの'ninety-nine'を
    #  englishNumberが出力してくれれば良いわけです。

     if left > 0
      #  この時、'two hundredfifty-one'のように
      #  ならないためにスペースを入れます。
      numString = numString + ' and '
    end
  end

  write = left/10          #  今度は十の桁です。
  left  = left - write*10  #  そして十の桁をひきます。

  if write > 0
    if ((write == 1) and (left > 0))
      #  英語では12は"twelve"であって、"tenty-two"と
      #  言うわけには行きません。そこで、十の桁が1の
      #  ときは特別扱いしなければなりません。

      numString = numString + teenagers[left-1]

      #  この"-1" は、teenagers[3] が 'fourteen'で
      #  あって、'thirteen'ではないため必要です。
      #  writeが1の場合、一の桁に関してはもう処理して
      #  しまっていますので、もう出力する必要は
      #  ありません。

      left = 0
    else
      numString = numString + tensPlace[write-1]

      #  この"-1" も、tensPlace[3] が'forty'で'thirty'ではない
      #  ため必要。
    end

    if left > 0
      #  'sixtyfour'とは書かずに、途中にハイフンを入れます。
      numString = numString + ' and '
    end
  end

  write = left  #  ここで、一の桁を書き出します。
  left  = 0     #  この桁を引きます。(0になります。)

  if write > 0
    numString = numString + onesPlace[write-1]
    #  この"-1"はonesPlace[3]が'four'であって
    #  'three'ではないから必要。
  end

  #  最後に"numString"を返します。
  numString
end

puts englishNumber(  0)
puts englishNumber(  9)
puts englishNumber( 10)
puts englishNumber( 11)
puts englishNumber( 17)
puts englishNumber( 32)
puts englishNumber( 88)
puts englishNumber( 99)
puts englishNumber(100)
puts englishNumber(101)
puts englishNumber(234)
puts englishNumber(3211)
puts englishNumber(999999)
puts englishNumber(1000000000000)

puts "好きな数をいれてね！"
n = gets.chomp.to_i
while n > 0
  puts englishNumber(n) + " Bottles of beer on the wall"
  puts englishNumber(n) + " Bottles of beer"
  puts "Take one down and pass it around"
  n -= 1
  puts englishNumber(n) + " Bottles of beer on the wall"
end

