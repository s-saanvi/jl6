MaxCandidates=10
using Printf
function getNames(inn, Cand)
    n=0
    while (name = readline(inn)) != ""
        if n < MaxCandidates
            n += 1
            Cand[n] = name
        else
            println("\nToo many candidates")
            println("Working with first $n")
        end
    end
    return n
end
function printResults(out, max, Name, Vote, valid, spoilt)
println(out, "\nNumber of voters: $(valid + spoilt)")
println(out, "Number of valid votes: $valid")
println(out, "Number of spoilt votes: $spoilt")
println(out, "\nCandidate Score:\n")
for c = 1 : max
@printf(out, "%-15s %3d\n", Name[c], Vote[c])
end
println(out, "\nThe winner(s)")
winVote = maximum(Vote) 
for c = 1 : max
if (Vote[c] == winVote) println(out, "$(Name[c])") end
end
end
function processVotes(inn, out, numCand, Vote)
    validVotes = spoiltVotes = 0
    while (line = readline(inn)) != ""
        Num = [parse(Int, x) for x in split(line)]
        for v in Num
            if v < 1 || v > numCand
                println(out, "Invalid vote: $v")
                spoiltVotes += 1
            else
                Vote[v] +=1
                validVotes += 1
            end
        end
    end
    validVotes, spoiltVotes
end
function main()
    inn = open("6bin.txt", "r")
    out = open("6bout.txt", "w")
    Candidate = fill("", MaxCandidates)
    numCand = getNames(inn, Candidate)
    Vote = fill(0, numCand)
    valid, spoilt = processVotes(inn, out, numCand, Vote)
    printResults(out, numCand, Candidate, Vote, valid, spoilt)
    close(inn)
    close(out)
end
main()