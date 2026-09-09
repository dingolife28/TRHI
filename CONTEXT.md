# TRHI — Domain Glossary

Vocabulary for talking about TRHI precisely. This file describes concepts, not code — no file paths, no implementation detail. See `docs/adr/` for decisions and the reasoning behind them.

## Article

A single piece of Blog content: a title, a short teaser, a body, a publish date, and one category. Every Article exists in German and English side by side — there's no such thing as an Article in only one language.

## Article body

The Article's main text. Written by the author as plain prose, not as structured markup — the author writes paragraphs, and a few lightweight, implicit conventions (a short line stands alone as a section title, a line opening with a quotation mark reads as a pull-quote) let the prose carry its own shape. An Article body is made of three kinds of block:

- **Heading** — a short section title inside the body (not the Article's own title).
- **Quote** — a pulled-out line, set apart visually, usually a striking or quotable sentence from the piece.
- **Paragraph** — everything else, including a hand-numbered list an author writes inline (`"1. ... 2. ..."`) — TRHI has no distinct "list" concept yet; a numbered list is a Paragraph whose author chose to number their own sentences.
