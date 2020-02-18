def sowpod_list
    text_file = []
    f = File.open("sowpods.txt", "r")
    for line in f
        arr = line.split()
        arr.each do |word|
            text_file << word
        end
    end
    return text_file
end
                
def sorting
    @word_3 = []
    @word_4 = []
    @word_5 = []
    @word_6 = []
    @word_7 = []
    text_file = sowpod_list
    for i in text_file
        c = i.length
        if c == 3
            @word_3 << i
        elsif c == 4
            @word_4 << i
        elsif c == 5
            @word_5 << i
        elsif c == 6
            @word_6 << i
        elsif c == 7
            @word_7 << i
        end
    end
end
                                  
def pick_word(n)
    sorting
    if n == 3
        @word_3.keep_if {|word| (((word.split"").uniq).length == 3)}
        return @word_3.sample
    elsif n == 4
        @word_4.keep_if {|word| (((word.split"").uniq).length == 4)}
        return @word_4.sample
    elsif n == 5
        @word_5.keep_if {|word| (((word.split"").uniq).length == 5)}
        return @word_5.sample
    elsif n == 6
        @word_6.keep_if {|word| (((word.split"").uniq).length == 6)}
        return @word_6.sample
    elsif n == 7
        @word_7.keep_if {|word| (((word.split"").uniq).length == 7)}
        return @word_7.sample
    end
end

def common(h, word, wlist)
    x = word
    ls = x.split""
    if h == 0
        wlist.keep_if {|word| ((((word.split"") & ls).length) == 0)}
        return wlist.sample
    elsif h == 1
        wlist.keep_if {|word| ((((word.split"") & ls).length) == 1)}
        return wlist.sample
    elsif h == 2
        wlist.keep_if {|word| ((((word.split"") & ls).length) == 2)}
        return wlist.sample
    elsif h == 3
        wlist.keep_if {|word| ((((word.split"") & ls).length) == 3)}
        return wlist.sample
    elsif h == 4
        wlist.keep_if {|word| ((((word.split"") & ls).length) == 4)}
        return wlist.sample
    elsif h == 5
        wlist.keep_if {|word| ((((word.split"") & ls).length) == 5)}
        return wlist.sample
    elsif h == 6
        wlist.keep_if {|word| ((((word.split"") & ls).length) == 6)}
        return wlist.sample
    end
end
    
puts "\n\nMASTERMIND!"
puts "Choose number of letters: {3, 4, 5, 6, 7}"
n = Integer(gets)
word = pick_word(n)
s = pick_word(n)
puts "\nSystem chose the word, your turn to choose"
puts "RULE: Choose a word without repeated letters"
puts "NOTE: Enter -1 if system guesses correct word"
print "\n\nSystem Guess: ", word, "\n"
k = 0
while k == 0
    print "enter number of common letters: "
    h = Integer(gets)
    if h == -1
        print "\nOops u lost, System won!\n"
        print "System's secret word: ", s,"\n\n"
        break
    end
    print "\nguess system's word: "
    e = gets
    p = e.length
    m = 0
    c = 0
    for i in (0..n-1)
        for j in (0..p-1)
            if s[i] == e[j]
                m = m + 1
                break
            end
        end
    end
    list1 = s.split""
    list2 = e.split""
    for i in (0..n)
        if list1[i] == list2[i]
            c = c+1
        end
    end
    if c == n
        print "\n\nCongratulations, YOU WON!\n\n"
        break
    else
        print "number of letters matched: ", m, "\n\n"
    end
    if n == 3
        word = common(h, word, @word_3)
       
    elsif n == 4
        word = common(h, word, @word_4)
    elsif n == 5
        word = common(h, word, @word_5)
    elsif n == 6
        word = common(h, word, @word_6)
    elsif n == 7
        word = common(h, word, @word_7)
    end

 if word.nil?
      puts "Input mistake at some line\n\n"
      break
 else
     print "System Guess: ", word, "\n"     
 end
end 
