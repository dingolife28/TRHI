import 'package:flutter_test/flutter_test.dart';
import 'package:trhi_app/blog/article_body.dart';
import 'package:trhi_app/blog/blog_data.dart';

void main() {
  group('parseArticleBody', () {
    test('short single-line paragraph becomes a heading', () {
      final blocks = parseArticleBody('Was die Kasse tatsächlich zahlt');
      expect(blocks, hasLength(1));
      expect(blocks.single.type, ArticleBlockType.heading);
    });

    test('paragraph of exactly 60 characters is not a heading (boundary)',
        () {
      final sixty = 'x' * 60;
      final blocks = parseArticleBody(sixty);
      expect(blocks.single.type, ArticleBlockType.paragraph);
    });

    test('paragraph of 59 characters is a heading (boundary)', () {
      final fiftyNine = 'x' * 59;
      final blocks = parseArticleBody(fiftyNine);
      expect(blocks.single.type, ArticleBlockType.heading);
    });

    test('short single-line numbered item is not mistaken for a heading',
        () {
      // Regresses the isNumbered guard: no article currently produces this
      // shape (numbered lists are always multi-line, see below), but the
      // rule it guards against is real.
      final blocks = parseArticleBody('1. Trink Wasser');
      expect(blocks.single.type, ArticleBlockType.paragraph);
    });

    test('paragraph starting with a straight quote becomes a blockquote', () {
      final blocks = parseArticleBody('"Was fast nicht geklappt hätte."');
      expect(blocks.single.type, ArticleBlockType.quote);
    });

    test('paragraph starting with a German opening quote becomes a blockquote',
        () {
      final blocks = parseArticleBody('„Was fast nicht geklappt hätte."');
      expect(blocks.single.type, ArticleBlockType.quote);
    });

    test('a multi-line hand-numbered list renders as one plain paragraph,'
        ' numbers kept as literal text', () {
      final list = '1. Erstens.\n2. Zweitens.\n3. Drittens.';
      final blocks = parseArticleBody(list);
      expect(blocks.single.type, ArticleBlockType.paragraph);
      expect(blocks.single.text, list);
    });

    test('blank-line-separated paragraphs each become their own block', () {
      final blocks = parseArticleBody(
        'Ein kurzer Titel\n\n'
        'Ein normaler Absatz mit mehr als sechzig Zeichen Text darin, der lang genug ist.\n\n'
        '"Ein Zitat."',
      );
      expect(blocks.map((b) => b.type), [
        ArticleBlockType.heading,
        ArticleBlockType.paragraph,
        ArticleBlockType.quote,
      ]);
    });

    test('every published article parses without throwing, and its real '
        'numbered list (if any) survives as a single paragraph block', () {
      // Regression against real content: locks in current shipped
      // behaviour for all 19 articles, DE and EN.
      for (final post in blogPosts) {
        expect(() => parseArticleBody(post.content), returnsNormally,
            reason: '${post.slug} (DE)');
        expect(() => parseArticleBody(post.contentEn), returnsNormally,
            reason: '${post.slug} (EN)');
      }

      final prevention = getPostBySlug('gesetzliche-krankenversicherung-praevention')!;
      final blocks = parseArticleBody(prevention.content);
      final numberedBlock = blocks.firstWhere(
        (b) => b.text.startsWith('1. Präventionsleistungen'),
      );
      expect(numberedBlock.type, ArticleBlockType.paragraph);
      expect(numberedBlock.text, contains('5. Das System nicht verteufeln'));
    });
  });
}
