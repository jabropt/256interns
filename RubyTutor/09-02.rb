#練習問題

#• OrangeTreeクラスを作ってみなさい。 このクラスには、木の高さを返すheightメソッドと、 メソッドを呼ぶことで、1年分時間を進めるoneYearPassesメソッドがあります。 毎年、この木は成長し大きくなります(オレンジの木が1年に伸びる分だけ)。 そして、ある年限が来たら(これもメソッド呼び出しによります) その木は死んでしまいます。最初の2，3年は実をつけませんが、その後は 実がなる様にします。で、成長した木は若い木よりたくさん実をつけます。 このあたりはあなたが納得するよう調節してみましょう。 そして、もちろんcountTheOranges(木になっているオレンジの数を返す)メソッドと、 pichAnOrange(オレンジをひとつ摘むメソッド。このメソッドで @orangeCountが、1だけ小さくなり、いかにおいしいオレンジだったかを告げる文字列か あるいは、もう木にオレンジがなっていないことを告げる文字列かを返します。)を 実行できるようにしなければいけません。 それと、ある年に取り残したオレンジは次の年には落ちてしまうようにしましょう。

class OrangeTree

  def initialize
    @orangeCount = 0
    @old = 0
    @takasa = 0
  end

  def height
    @takasa
  end  

  def oneYearPasses
    @takasa += 10
    @old += 1
    if @old > 10
    puts "木は枯れている。。。"
    exit
    else
    @orangeCount = 10 * @old if @old > 3
    end
  end

  def countTheOranges
    @orangeCount
  end

  def pichAnOrange
    if @orangeCount > 0
      @orangeCount -= 1
      puts "まあなんておいしいオレンジなのでしょう"
    else
      puts "木にオレンジがなっていません"
    end
  end

  private
end

#• 赤ちゃんドラゴンと会話が出来るようなプログラムを書いてみましょう。 feedやwalkのようなコマンドを入力できるようにして ドラゴンに対してそれらのメソッドが呼ばれるようにします。 もちろん、入力されたものは文字列なので、ある種のメソッドに転送する処理 をしなくてはならないでしょう。つまり、何の文字が入力されたかをチェックして適切な メソッドを呼び出すという処理です。

class Dragon
    
    def initialize name
        @name = name
        @asleep = false
        @stuffInBelly     = 10  #  最初彼はおなかいっぱいです。
        @stuffInIntestine =  0  #  トイレはまだ大丈夫。(Bellyは胃、Intestineは腸です。)
        
        puts @name + ' は生まれました.'
    end
    
    def feed
        puts 'あなたは ' + @name + 'に食べ物を与えます.'
        @stuffInBelly = 10
        passageOfTime
    end
    
    def walk
        puts 'あなたは ' + @name + 'をトイレに連れて行きます.'
        @stuffInIntestine = 0
        passageOfTime
    end
    
    def putToBed
        puts 'あなたは ' + @name + ' を寝かしつけます.'
        @asleep = true
        3.times do
            if @asleep
                passageOfTime
            end
            if @asleep
                puts @name + ' はいびきをかいて, 部屋中煙だらけ.'
            end
        end
        if @asleep
            @asleep = false
            puts @name + ' はゆっくり目を覚ます.'
        end
    end
    
    def toss
        puts 'あなたは ' + @name + ' を空中に投げ上げます.'
        puts '彼はキャハキャハ笑い, あなたの眉毛は焼け焦げた.'
        passageOfTime
    end
    
    def rock
        puts 'あなたは ' + @name + ' を優しく揺すります.'
        @asleep = true
        puts '彼は短くうとうと...'
        passageOfTime
        if @asleep
            @asleep = false
            puts '...でもやめるとすぐ起きちゃう.'
        end
    end
    
    private
    
    #  "private"というのは、ここで定義されているメソッドが
    #  オブジェクト内部のものであるという意味です。
    #  (あなたはドラゴンにえさを与えることはできますが、
    #  おなかがすいているかどうかを訊くことはできません。)
    
    def hungry?
        #  メソッドの名前は"?"で終わることができます。
        #  通常、メソッドがtrueかfalseのどちらかを返すときだけ、
        #  この名前を使います。このように:
        @stuffInBelly <= 2
    end
    
    def poopy?
        #うんちが出そう?
        @stuffInIntestine >= 8
    end
    
    def passageOfTime
        if @stuffInBelly > 0
            #  食べたものは、胃から腸へ移動
            @stuffInBelly     = @stuffInBelly     - 1
            @stuffInIntestine = @stuffInIntestine + 1
            else  #  私たちのドラゴンは飢えました!
            if @asleep
                @asleep = false
                puts '彼は突然跳び起きます!'
            end
            puts @name + ' は飢え死にしそう!  死に物狂いの彼は"あなた"を食べてしまいました!'
            exit  #  プログラムを終了します。
        end
        
        if @stuffInIntestine >= 10
            @stuffInIntestine = 0
            puts 'おっと!  ' + @name + ' はやっちゃったようです...'
        end
        
        if hungry?
            if @asleep
                @asleep = false
                puts '彼は突然起きます!'
            end
            puts @name + 'のおなかはゴロゴロ言ってます...'
        end
        
        if poopy?
            if @asleep
                @asleep = false
                puts '彼は突然起きます!'
            end
            puts @name + ' はうんちをしたくて踊っています...'
        end
    end
    
end

pet = Dragon.new 'Norbert'

while true
    puts "ドラゴンを世話しよう feed walk putToBed toss rock"
    sewa = %w(feed walk putToBed toss rock)
    choice = gets.chomp
    if sewa.include?(choice)
      pet.method(choice).call
    else
      puts "世話の仕方が違います"
    end
end
