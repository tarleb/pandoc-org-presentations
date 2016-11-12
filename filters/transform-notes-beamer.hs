#!/usr/bin/env runhaskell
import Text.Pandoc.JSON
import Text.Pandoc.Shared (blocksToInlines)

main :: IO ()
main = toJSONFilter putSpeakerNoteAside

putSpeakerNoteAside :: Block -> [Block]
putSpeakerNoteAside b = case b of
  Div (_, ["notes"], _) notes -> wrapInNote notes
  _                           -> [b]

wrapInNote :: [Block] -> [Block]
wrapInNote bs =
  let open = RawBlock (Format "latex") "\\note{"
      close = RawBlock (Format "latex") "}"
  in open : bs ++ [close]
