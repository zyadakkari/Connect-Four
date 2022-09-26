# Connect-Four

Features to come:
- UI improvement
- computer player
- add save function


Building connect four using Test Driven Development

Learning Reflections:
- most difficult broadly was focusing on using rspec to understand the issue with code as opposed to defaulting to debugger
- testing user inputs when using gets, struggled with this until discovering stub & .to_stdout
- finding a way to find consecutive numbers for win
    - brute force(iterating over elems)
    - trying to understand enumerable#each_cons
- diagonal win could not find a way to calculate without multiple nested loop, ultimately had to go with brute force to move on but sure of many optimisations
- building using TDD was definitely helpful in learning to break down the problem to very small manageable pieces. Struggled at times to not just jump ahead when complications down the line would be apparent. eg. in diagonal win found it hard to write code to only return true for a test of a particular diagonal as there were many possible cases. Ultimately though, adapting code already working for one case was easier than having to solve all at once.



Project Plan: 

1. tests for board
    1. creating the board
        1. an array of 6 subarray of length 7
    2. edit the board
        1. edit desired element
    3. create players
        1. create array of two players
        2. each player to have a name and symbol
        3. allow editing of the name
    4. edit(to come before win) player chooses square to add to
        1. request from the user a column to put their symbol
        2. check the first nil element in the array to put symbol
        3. edit board to reflect this
        4. add square to the moves played by player
    5. winning condition
        1. return winner when 4 X in a row
        2. return winner when 4 X in a column
        3. return winner when 4 consec colls & 4 consec rows[5, 5], [4, 4], [3, 3], [2, 2]
        4. for i in 1..obj.length-1
        5. for i in movesHash[obj[i]] 
    6. play function
    7. computer player
    
    
