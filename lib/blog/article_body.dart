/// The shape blog article prose is written in, and the small, deliberate
/// convention that turns plain text into it — kept in one tested place
/// instead of buried inside the widget that renders it.
///
/// Authors write plain paragraphs separated by a blank line. Within that,
/// checked in this order:
/// - A paragraph starting with `"` or `„` becomes an
///   [ArticleBlockType.quote] — checked first, so a short pull-quote can't
///   be mistaken for a heading.
/// - A short (under 60 characters) paragraph on a single line becomes a
///   [ArticleBlockType.heading].
/// - Everything else — including a hand-numbered list, written as one
///   multi-line paragraph ("1. ...\n2. ...") — renders as a plain
///   [ArticleBlockType.paragraph]. There is no dedicated list rendering;
///   numbers stay as literal text.
library;

enum ArticleBlockType { heading, quote, paragraph }

class ArticleBlock {
  final ArticleBlockType type;
  final String text;
  const ArticleBlock(this.type, this.text);
}

final _numberedItem = RegExp(r'^\d+\.');

/// Turns one article's raw content string into the blocks that render it.
/// Pure and independently testable — see test/article_body_test.dart.
List<ArticleBlock> parseArticleBody(String content) {
  return content.split('\n\n').map((raw) {
    final text = raw.trim();
    final isSingleLine = !raw.contains('\n');
    // A short, single-line numbered item ("1. Trink Wasser") must not be
    // mistaken for a heading. No article currently has one on its own —
    // every numbered list so far is written as one multi-line paragraph,
    // which already fails isSingleLine — but this guards the case anyway.
    final isNumbered = _numberedItem.hasMatch(text);

    if (text.startsWith('"') || text.startsWith('„')) {
      return ArticleBlock(ArticleBlockType.quote, text);
    }
    if (isSingleLine && text.length < 60 && !isNumbered) {
      return ArticleBlock(ArticleBlockType.heading, text);
    }
    return ArticleBlock(ArticleBlockType.paragraph, text);
  }).toList();
}
