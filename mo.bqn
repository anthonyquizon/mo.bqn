
# idioms
# (⊣/+`)t=𝕩       get indices of all items of type 𝕩

FromNS⇐{
  𝕩
}

⟨t0 # none
 tf # fragment
 tn # name
 to # open tag     {#}
 tc # close tag    {/}
 tt # tag          { }
 td # dot tag      {.}
⟩←↕7

_AssertBalance←{ msg 𝔽 _𝕣 c:
  n←30⌊≠c
  !∘{i←⊑/(1⊸<∨<⟜0) 𝕩⋄r←n↑«⍟(⌊2÷n-i)↕≠c⋄∾⟨msg,@+10,r⊏c,@+10,⊢◶" ∧"¨i=r⟩}⍟{0≠⊑¯1↑𝕩} 𝔽 c # TODO cleanup
}

Compile⇐{
  # c: character values, d: parent vector, t: type vector, n: name string values
  c←𝕩⋄d←t←n←0¨c

  #•Show ('{'⊸=-=⟜'}')c
  •Show ⊑ ¯1↑+`('{'⊸=-=⟜'}')c
  #"Unbalanced brackets" (+`('{'⊸=-=⟜'}')) _AssertBalance c
  #t↩∨´to‿tc‿th‿tl(⊣×c⊸=¨)"{}#/"                                                   # tokenize character types
  # TODO assert balanced bracets
  #•SHow [»(+`'{'⊸=-=⟜'}') c,c]
  #t↩tn×(+`'{'⊸=-=⟜'}') c ⋄

  #•Show ⊏⟜c¨1↓⊔∧⟜(+`»⊸<) tn=t

  #to‿tc {z←('{'⊸=∘»∧=⟜𝕩)c ⋄ t(¬∘⊢/⊣∘⌈⟜(𝕨⊸×«∘⊢))⟜z˜↩ ⋄ c¬∘z⊸/↩}¨"#/"           # mark and compress start, close
  #{n↩⊏⟜c¨1↓⊔∧⟜(+`»⊸<)∘𝕩 t⋄ t‿c (¬≠⟜(«⊸<)𝕩)⊸/¨↩} tn=t # mark and compress names
  #•Show n
  #•Show c
  #•Show t
  #•SHow n
  #•SHow t
  #t⌈⟜(tt×t=to)↩ # set tag types
  #r↩↕∘≠⌾((t=tn)⊸/) ¯1¨t # set references
  ## TODO assert balanced tags
  #{z←(tn⊸=∧»∘=⟜𝕩) t ⋄ r (z/r)⌾((«z)⊸/) ↩ ⋄ c‿t‿r (¬z)⊸/¨↩}¨ts‿tt‿te # compress names into start tag and end references
  #c‿t‿r (¬tc=t)⊸/¨↩ #remove close brackets
  #d↩ +`(ts⊸=-=⟜te) t # depth vector
  {tpl⇐c‿d‿t‿n}
}

Render⇐{ 
; ⟨c‿d‿t‿n⇐tpl⟩ 𝕊 𝕩: •Show "compiled"
    #←tpl
; 𝕨 𝕊 𝕩 : (Compile 𝕨) 𝕊 𝕩
}

RenderNs⇐Render⟜FromNS
