module QueriesHelper

  def query_suggestion
  end

  def compute_search_intent(qString)
    ptrOne=0
    ptrTwo=1
    newWord=""

    chars=qString.split("")

    newWord.concat(chars[ptrOne])
    while ptrTwo < qString.length do
      puts ptrOne
      puts ptrTwo
      if chars[ptrOne] == chars[ptrTwo]
        while chars[ptrOne] == chars[ptrTwo] do
          ptrTwo+=1
        end
        if newWord[-1,1] == chars[ptrTwo-1]
          newWord.concat(chars[ptrTwo-1])
        else
          newWord.concat(chars[ptrOne]).concat(chars[ptrTwo-1])
        end
        ptrOne=ptrTwo
        ptrTwo+=1
      else
        newWord.concat(chars[ptrTwo])
        ptrOne+=1
        ptrTwo+=1
      end

    end

    return newWord

  end

end
