function tn --wraps=tmux\ new\ -s\ \(pwd\ \|\ sed\ \'s/.\*\\///g\'\) --description alias\ tn=tmux\ new\ -s\ \(pwd\ \|\ sed\ \'s/.\*\\///g\'\)
  tmux new -s (pwd | sed 's/.*\///g') $argv
        
end
