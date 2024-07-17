using Printf
function position(ch::Char)
    if isuppercase(ch) return ch-'A'+1 end
    if islowercase(ch) return ch-'a'+1 end
    return 0
end
function charFrequency(inn::IOStream)
    LettersInAlphabet = 26
    Freq = fill(0, LettersInAlphabet)
    while !eof(inn)
        n = position(read(inn, Char))
        if n != 0 Freq[n] += 1 end
    end
    println("Letter Frequency\n")
    for ch = 'a' : 'z'
        @printf("%4c %8d\n", ch, Freq[ch-'a'+1])
    end
    close(inn)
end
inn = open("6ain.txt", "r")
charFrequency(inn)