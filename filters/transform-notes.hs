#!/usr/bin/env runhaskell
import Text.Pandoc.JSON

main :: IO ()
main = toJSONFilter putSpeakerNoteAside

putSpeakerNoteAside :: Block -> [Block]
putSpeakerNoteAside b = case b of
  Div (_, ["notes"], _) notes -> wrapInAside notes
  _                           -> [b]

wrapInAside :: [Block] -> [Block]
wrapInAside bs =
  let openingTag = RawBlock (Format "html") "<aside class=\"notes\">"
      closingTag = RawBlock (Format "html") "</aside>"
  in openingTag : bs ++ [closingTag]
