class HtmlUtils {
  HtmlUtils._();

  static final RegExp _htmlTagPattern = RegExp(r'<[^>]+>');
  static final RegExp _multiWhitespacePattern = RegExp(r'\s+');

  static String stripHtml(String value) {
    final withoutTags = value.replaceAll(_htmlTagPattern, ' ');
    final decoded = _decodeHtmlEntities(withoutTags);

    return decoded.replaceAll(_multiWhitespacePattern, ' ').trim();
  }

  static String _decodeHtmlEntities(String value) {
    const replacements = <String, String>{
      '&quot;': '"',
      '&#39;': '\'',
      '&amp;': '&',
      '&lt;': '<',
      '&gt;': '>',
      '&nbsp;': ' ',
    };

    var output = value;
    replacements.forEach((key, replacement) {
      output = output.replaceAll(key, replacement);
    });

    return output;
  }
}
