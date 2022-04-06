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
    (2×m)+(nm∧+`nm)∊1+/rx(⊒˜<≠∘⊢)rw
}

secret ← 5⊑words
guess ←  "abkag"
sc ← secret Score guess

•Out "Secret: " ∾ secret
•Out "Guess:  " ∾ guess
•Show sc

WI ← {
    s‿w ← 𝕨
    c ← w/˜s≠0
    nc ← w/˜s=0
    m ← (∧´c⊸(⊒˜<≠∘⊢))¨𝕩
    nm ← (∨´nc⊸(⊒˜<≠∘⊢))¨𝕩
    (m∧¬nm)/𝕩
}
IL ← {
    s‿w ← 𝕨
    c ← s=1
    m ← ((c⊸≡c⊸×)w⊸≠)¨𝕩
    m/𝕩
}
CL ← {
    s‿w ← 𝕨
    c ← s=2
    m ← ((c⊸≡c⊸×)w⊸=)¨𝕩
    m/𝕩
}

Filter ← { 𝕨 WI 𝕨 IL 𝕨 CL 𝕩 }

•Show sc‿guess Filter 10↑words