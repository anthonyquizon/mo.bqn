
# idioms
# (⊣/+`)t=𝕩       get indices of all items of type 𝕩

# t0: none, 
# tf: fragment
# tn: name
# to: open braces
# tc: close braces
# th: hash
# tl: slash
# ts: start
# te: end
# tt: tag
# td: dot
t0‿tf‿tn‿to‿tc‿th‿tl‿ts‿te‿tt‿td←↕11
Render⇐{
  # c: character values
  # p: parent vector
  # t: type vector
  # t: reference vector
  # n: name string values
  # f: fragment string values
  # tmp variables. z mask flag
  c←𝕩⋄p←t←r←n←f←@⋄z←@ 

  t↩∨´to‿tc‿th‿tl(⊣×c⊸=¨)"{}#/"                                                   # tokenize character types
  t⌈⟜(tn×(+`to⊸=-=⟜tc))↩⋄n↩⊏⟜c¨1↓⊔∧⟜(+`»⊸<)∘=⟜tn t⋄z↩¬≠⟜(«⊸<)=⟜tn t⋄t z⊸/↩⋄c z⊸/↩ # mark and compress names
  t⌈⟜(tf×=⟜t0)↩         ⋄f↩⊏⟜c¨1↓⊔∧⟜(+`»⊸<)∘=⟜tf t⋄z↩¬≠⟜(«⊸<)=⟜tf t⋄t z⊸/↩⋄c z⊸/↩ # mark and compress fragments
  {z↩(to⊸=∘»∧=⟜𝕩)t ⋄ t(¬∘⊢/⊣∘⌈⟜(ts⊸×«∘⊢))⟜z˜↩ ⋄ c¬∘z⊸/↩}¨th‿tl                    # mark and compress start, close

  # TODO compress close brackets
  # TODO remove open brackets and create reference nodes

  •Show f‿n
  •Show [c,t]

}
