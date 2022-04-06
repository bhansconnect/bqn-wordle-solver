Load ← {
    ⊢/˜⟜(∾𝕩⊸=∘≢¨) •file.Lines 𝕨⊣"WORD.LST" 
}

words ← Load 5

•Show 10↑words
•Show ≢words

Score ← {
    m ← 𝕨=𝕩
    nm ← ¬m
    rw ← nm/𝕨
    rx ← nm/𝕩
    (2×m)+(nm∧+`nm)∊1+/(≠rw)>rw⊒rx
}

secret ← "shsws"
guess ←  "swiss"

•Out "Secret: " ∾ secret
•Out "Guess:  " ∾ guess
•Show secret Score guess