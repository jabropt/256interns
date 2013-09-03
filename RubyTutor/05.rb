#• 「怒ったボス」のプログラムを書いてみましょう。 まず、無作法に何が望みか聞いてきます。 で、何を答えようと「怒ったボス」はそれを叫び返して、あなたを首にします。 たとえば、もし給料上げてくださいとタイプしたとすると なにぃ? "給料上げてください" だとー!! おまえは首だ!! と、叫び返してきます。

puts '何が望みだ！'
nozomi = gets.chomp
puts 'なにぃ? "' + nozomi + '" だとー!! おまえは首だ!! '

#• center, ljust, そして rjust を使ってもう少し何かやってみましょう。こんな感じの「目次」を表示する プログラムを書いてみてください。

lineWidth = 40
puts " 目  次 ".center(lineWidth)
puts ""
puts "1章: 数".ljust(lineWidth/2) + "p. 1".rjust(lineWidth/2)
puts "2章: 文字".ljust(lineWidth/2) + "p. 72".rjust(lineWidth/2)
puts "3章: 変数".ljust(lineWidth/2) + "p. 118".rjust(lineWidth/2)
