
# idioms
# (⊣/+`)t=𝕩       get indices of all items of type 𝕩

# t0: none, 
# tf: fragment
# tn: name
# to: open braces
# tc: close braces
# th: hash
# tl: slash
# ts: start tag  {#}
# te: end tag    {/}
# tt: tag        { }
# td: dot         .
t0‿tf‿tn‿to‿tc‿th‿tl‿ts‿te‿tt‿td←↕11
Compile⇐{
  # c: character values
  # p: parent vector
  # t: type vector
  # t: reference vector
  # n: name string values
  # f: fragment string values
  c←𝕩⋄d←t←r←n←@

  t↩∨´to‿tc‿th‿tl(⊣×c⊸=¨)"{}#/"                                                   # tokenize character types
  # TODO assert balanced bracets
  t⌈⟜(tn×(+`to⊸=-=⟜tc))↩⋄{n↩⊏⟜c¨1↓⊔∧⟜(+`»⊸<)∘𝕩 t⋄ t‿c (¬≠⟜(«⊸<)𝕩)⊸/¨↩} tn=t # mark and compress names
  ts‿te {z←(to⊸=∘»∧=⟜𝕩)t ⋄ t(¬∘⊢/⊣∘⌈⟜(𝕨⊸×«∘⊢))⟜z˜↩ ⋄ c¬∘z⊸/↩}¨th‿tl              # mark and compress start, close
  t⌈⟜(tt×t=to)↩ # set tag types
  r↩↕∘≠⌾((t=tn)⊸/) ¯1¨t # set references
  # TODO assert balanced tags
  {z←(tn⊸=∧»∘=⟜𝕩) t ⋄ r (z/r)⌾((«z)⊸/) ↩ ⋄ c‿t‿r (¬z)⊸/¨↩}¨ts‿tt‿te # compress names into start tag and end references
  c‿t‿r (¬tc=t)⊸/¨↩ #remove close brackets
  d↩ +`(ts⊸=-=⟜te) t # depth vector
  {mo⇐c‿d‿t‿r‿n}
}

Render⇐{ 
    𝕊 ⟨mo⇐mo⟩:
    •Show "compiled"
  #c‿d‿t‿r‿n←𝕩.mo
  # match depths
  # expand repeats
  #•SHow d
  #•SHow t
  #•SHow r
  #•SHow c
;   𝕊 𝕩 : 
    •Show "not compiled!"
    𝕊 Compile 𝕩
}
