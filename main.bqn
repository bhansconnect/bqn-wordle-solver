Load ← {
    ⊢/˜⟜(∾𝕩⊸=∘≢¨) •file.Lines 𝕨⊣"WORD.LST" 
}

words ← Load 5

•Show 10↑words
•Show ≢words

Score ← {
    m ← 𝕨=𝕩
    nm ← ¬m
    (2×m) + nm×𝕨 ∊ nm/𝕩
}

guess ←  ⊑words
secret ← 2⊑words

•Show guess
•Show secret
•Show secret Score guess