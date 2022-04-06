Load ← {
    ⊢/˜⟜(∾𝕩⊸=∘≢¨) •file.Lines 𝕨⊣"WORD.LST" 
}

words ← Load 5

•Show 10↑words
•Show ≢words

Score ← {
    m ← 𝕨=𝕩
    nm ← ¬m
    r ← nm/𝕨
    (2×m)+(≠r)>r⊒𝕩
}

secret ← "chsws"
guess ←  "swiss"

•Out "Secret: " ∾ secret
•Out "Guess:  " ∾ guess
•Show secret Score guess