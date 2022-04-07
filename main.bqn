#!/usr/bin/env bqn

Load ← {
    ⊢/˜⟜(∾𝕩⊸=∘≢¨) •file.Lines 𝕨⊣"WORD.LST" 
}

words ← Load 5

# •Show 10↑words
# •Show ≢words

Score ← {
    m ← 𝕨=𝕩
    nm ← ¬m
    rw ← nm/𝕨
    rx ← nm/𝕩
    (2×m)+(nm∧+`nm)∊1+/rx(⊒˜<≠∘⊢)rw
}

# secret ← 0⊑words
# guess ←  9⊑words
# sc ← secret Score guess

# •Out "Secret: " ∾ secret
# •Out "Guess:  " ∾ guess
# •Show sc

WI ← {
    s‿w ← 𝕨
    c ← w/˜s=1
    nc ← w/˜s=0
    r ← (s≠2)⊸/¨𝕩
    m ← (∧´c⊸(⊒˜<≠∘⊢))¨r
    nm ← (∨´nc⊸(⊒˜<≠∘⊢))¨(¬c⊸((⊒˜<≠∘⊢)˜))⊸/¨r
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

# scg ← (1‿2‿0‿0‿0)‿("abcba")
# •Show scg Filter words

# This is brute force and super slow.
# 𝕨 is the current list of possible secret words.
# 𝕩 is the list of all guessable words.
# Sometimes guessing a word that isn't a possible secret
# can narrow down the list better than just using the possible secrets
BestGuess ← {
    w ← 𝕨⊣𝕩
    # Preprocess 𝕩 to have 𝕨 at the beginning this will make it get selected first.
    x ← w ∾ w(¬∘∊˜/⊢)𝕩
    sc ← +˝≠¨w((<∘Score ∾ <∘⊢) Filter 𝕏)⌜x
    # •Show sc
    bg ← ⊑⍋sc
    bg⊑x
}

# possible ← 5↑words
# all ← 10↑words
# •Out "Word that leads to lowest average remaining words: " ∾ possible BestGuess all

# Actual test game/solving.
•Out "Starting real game minigame with 100 random words"
all ← (⊢/˜(↕∊100⊸•rand.Subset)∘≠) words
# If wanted possible could be limited to match real wordle.
possible ← all

secret ← (•rand.Range∘≠⊑⊢) possible
# •Out "Secret: " ∾ secret

chosen ← "     "
guesses ← 0

While ← {𝕨{𝕊∘𝔾⍟𝔽𝕩}𝕩@}´
While {𝕤⋄(secret≢chosen)∧guesses<6}‿{𝕤
    •Out "Remaining possibile words:"
    •Show possible
    •Out "Chosen: " ∾ chosen ↩ possible BestGuess all
    •Out "Score: " ∾ •Repr sc ← secret Score chosen
    possible ↩ sc‿chosen Filter possible
    guesses +↩ 1
}

{
    secret≡chosen ?
        •Out "Found secret word (" ∾ secret ∾ ") in " ∾ (•Repr guesses) ∾ " guesses!"
    ;
        •Out "Failed to figure out secret word. It was " ∾ secret
}
