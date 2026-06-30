import 'app_lang.dart';

/// Zentraler Übersetzungs-Katalog. DE und EN stehen pro Eintrag direkt
/// nebeneinander (`_(de, en)`), damit nichts auseinanderläuft. Markenbegriffe
/// (TRHI, The Real Health Insurance, UNFUCK YOUR GUT, Mobility, Mind-Body …)
/// bleiben in beiden Sprachen identisch.
class AppText {
  final AppLang l;
  const AppText(this.l);

  String _(String de, String en) => l.pick(de, en);

  // ── Navbar ──────────────────────────────────────────────────────────────
  String get navTraining => _('Training', 'Training');
  String get navMindBody => 'Mind-Body';
  String get navNutrition => _('Ernährung', 'Nutrition');
  String get navYouTube => 'YouTube';
  String get navBook => _('Buchen', 'Book');
  String get navCta => _('Erstgespräch', 'Free Call');
  String get brandTagline => 'The Real Health Insurance';

  // ── Hero ────────────────────────────────────────────────────────────────
  String get heroEyebrow => 'Personal Training & Consulting';
  String get heroMeta => _('TRHI · 2025 · Wien', 'TRHI · 2025 · Vienna');

  /// Stapel-Headline. Das letzte Wort wird golden hervorgehoben.
  List<String> get heroHeadlineLines =>
      l.pick(const ['Dein', 'Körper', 'erinnert', 'sich.'],
          const ['Your', 'body', 'remembers.']);

  String get heroBody => _(
        'Du musst nicht alles umkrempeln. Ein bisschen besser essen als gestern, '
            'ein bisschen mehr bewegen — Gewohnheiten, die in deinen Alltag passen, '
            'nicht in einen perfekten Plan.\n\n'
            'Was dich fast umgebracht hat, macht dich interessant für TRHI. '
            'Denn wer weiß, was auf dem Spiel steht, bewegt sich aus einem anderen Grund. '
            'Nicht weil ein Plan es sagt — sondern weil der Körper sich erinnert.\n\n'
            'Ein Bier. Ein schlechter Tag. Ein Stück Kuchen. Das Leben. '
            'Dafür ist TRHI da. Schau, was du noch kannst.',
        "You don't have to overhaul everything. Eat a little better than yesterday, "
            "move a little more — habits that fit your everyday life, not some perfect plan.\n\n"
            "What almost killed you is what makes you interesting to TRHI. "
            "Because someone who knows what's at stake moves for a different reason. "
            "Not because a plan says so — but because the body remembers.\n\n"
            "A beer. A bad day. A slice of cake. Life. "
            "That's what TRHI is for. See what you can still do.",
      );

  String get heroSubline => _(
        'Für Berufstätige · Eltern · 50+ · Alle die noch leben',
        'For professionals · parents · 50+ · everyone still living',
      );

  String get ctaPrimary => _('Erstgespräch buchen', 'Book a free call');
  String get ctaSecondary => 'TRHI Blog';
  String get linkReadMore => _('Weiterlesen →', 'Read more →');

  // ── Ticker ──────────────────────────────────────────────────────────────
  List<String> get tickerItems => l.pick(
        const [
          'Du bist zuerst ein Tier',
          'Wer rastet, rostet',
          'Was kannst du noch?',
          'The Real Health Insurance',
          'Mobility · Mind · Nourish',
          'Dein Körper erinnert sich',
          'Für Berufstätige · Eltern · 50+',
          'Ein bisschen Achtsamkeit reicht weit',
          'Unduck your Gut',
        ],
        const [
          'You are an animal first',
          'Rust never sleeps',
          'What can you still do?',
          'The Real Health Insurance',
          'Mobility · Mind · Nourish',
          'Your body remembers',
          'For professionals · parents · 50+',
          'A little mindfulness goes a long way',
          'Unduck your Gut',
        ],
      );

  // ── Three Pillars ───────────────────────────────────────────────────────
  String get pillarsEyebrow => _('Deine drei Säulen', 'Your three pillars');
  String get pillarsHeading =>
      _('Alles hängt zusammen.', "It's all connected.");

  String get pillarMobilityBody => _(
        'Täglich. Ohne Ausreden. Für deinen Rücken, deine Knie, '
            'deine Energie — damit du dir den Rest des Tages wirklich leisten kannst.',
        'Daily. No excuses. For your back, your knees, your energy — '
            'so you can actually afford the rest of your day.',
      );
  String get pillarMobilityBadge => _('Dein Fundament', 'Your foundation');

  String get pillarMindBodyBody => _(
        'Für manche Transzendentale Meditation — für andere ein Spaziergang '
            'oder Liegestütze. Finde deine Form der Stille.',
        'For some, transcendental meditation — for others, a walk or push-ups. '
            'Find your own form of stillness.',
      );
  String get pillarMindBodyBadge => _('Innere Stärke', 'Inner strength');

  String get pillarNutritionTitle => _('Ernährung', 'Nutrition');
  String get pillarNutritionBody => _(
        'Ein bisschen Achtsamkeit beim Essen reicht oft weiter als du denkst. '
            'Was du deinem Körper gibst, bestimmt was du dir sonst noch gönnen kannst.',
        'A little mindfulness around food goes further than you think. '
            'What you give your body decides what else you get to enjoy.',
      );
  String get pillarNutritionBadge => _('Dein Treibstoff', 'Your fuel');
  String get pillarReadArticle => _('Artikel lesen →', 'Read article →');

  // Inline-Artikel „Ernährung" (three_pillars)
  String get nutritionArticleTag => _('Ernährung', 'Nutrition');
  String get nutritionArticleTitle =>
      _('Was du isst, entscheidet wer du bist',
          'What you eat decides who you are');
  List<String> get nutritionArticleParas => l.pick(
        const [
          'Ernährung ist keine Diät. Es ist die Entscheidung, die du täglich dreimal triffst.',
          'Hochverarbeitete Lebensmittel entzünden — buchstäblich. Chronische Entzündungen '
              'sind der stille Hintergrund vieler Beschwerden, die wir als "Altern" akzeptieren, '
              'obwohl sie vermeidbar wären.',
          'Vollwertige Lebensmittel, fermentierte Produkte, wenig Zucker, wenig Industrieöle. '
              'Nicht weil ein Lifestyle-Trend es fordert, sondern weil dein Körper damit gebaut wurde.',
          'Jede Mahlzeit ist ein Signal: zur Regeneration — oder zur Entzündung. '
              'Du musst nicht perfekt essen. Aber du solltest wählen.',
        ],
        const [
          'Nutrition isn’t a diet. It’s the choice you make three times a day, every single day.',
          'Ultra-processed food inflames you — literally. Chronic inflammation is the quiet '
              'background noise behind most complaints we shrug off as "getting old," even though '
              'they’re preventable.',
          'Whole foods, fermented products, minimal sugar, minimal seed oils. Not because a '
              'lifestyle brand tells you to, but because your body was built on this stuff.',
          'Every meal is a signal: toward recovery — or toward inflammation. You don’t have '
              'to eat perfectly. But you should choose.',
        ],
      );

  // ── About ───────────────────────────────────────────────────────────────
  String get aboutEyebrow => _('Über TRHI', 'About TRHI');
  String get aboutTitle => _(
        'Keine Diät.\nKein Programm.\nEin Aufruf.',
        'No diet.\nNo program.\nA call to move.',
      );
  String get aboutBody => _(
        'TRHI ist keine Diät und kein Fitnessprogramm von der Stange. '
            'Es ist eine Lebenshaltung — entwickelt aus persönlicher Erfahrung, '
            'in Zusammenarbeit mit echten Fachleuten aus Training, Ernährung '
            'und Physiotherapie.\n\n'
            'Die Botschaft: Wer sich regelmäßig bewegt und ein bisschen Achtsamkeit '
            'in seine Ernährung bringt, kann sich im Alltag deutlich mehr leisten. '
            'Das ist keine Einschränkung — das ist Freiheit.\n\n'
            'Nicht: was kann ich nicht mehr. Sondern: was kann ich noch. '
            'Das ist oft viel mehr als du denkst.',
        "TRHI isn't a diet or an off-the-shelf fitness program. "
            "It's a way of living — built from personal experience, together with "
            "real specialists in training, nutrition and physiotherapy.\n\n"
            "The message: move regularly and bring a little mindfulness to what you eat, "
            "and you can afford a lot more in daily life. "
            "That's not a restriction — that's freedom.\n\n"
            "Not: what can I no longer do. But: what can I still do. "
            "Usually a lot more than you think.",
      );
  String get aboutQuote => _(
        '"Wer rastet, rostet. Aber wer sich bewegt, darf auch mal sitzen bleiben."',
        '"Rust never sleeps. But move enough, and you’ve earned the right to sit down too."',
      );
  String get aboutDisclaimerToggle => _('Rechtlicher Hinweis', 'Legal notice');
  String get audienceProfessionals => _('Berufstätige', 'Professionals');
  String get audienceProfessionalsBody =>
      _('25 min täglich reichen.', '25 minutes a day is enough.');
  String get audienceParents => _('Eltern', 'Parents');
  String get audienceParentsBody =>
      _('Erst für dich, dann für andere.', 'First for you, then for others.');
  String get audienceSeniors => '50+';
  String get audienceSeniorsBody => _('Nie zu spät.', 'Never too late.');

  String get trhiMotto => _(
        '"Die echte Absicherung ist nicht das, was du zahlst — '
            'sondern das, was du täglich für dich tust."',
        '"Real insurance isn’t what you pay — it’s what you do for yourself every day."',
      );

  String get disclaimer => _(
        'Ich bin kein ausgebildeter Fachmann im medizinischen Sinne. '
            'Alle Inhalte entstehen auf Basis persönlicher Erfahrung sowie '
            'in enger Zusammenarbeit mit zertifizierten Fachleuten aus Training, '
            'Ernährungswissenschaft und Physiotherapie. '
            'Die Inhalte ersetzen keinen professionellen medizinischen Rat.',
        'I am not a trained medical professional. All content is based on personal '
            'experience and close collaboration with certified specialists in training, '
            'nutrition science and physiotherapy. '
            'It does not replace professional medical advice.',
      );

  // ── Services ────────────────────────────────────────────────────────────
  String get servicesHeading => 'Personal Training & Consulting';
  String get servicesSubheading => _(
        'Individuell. Kein Standardprogramm.',
        'Individual. No off-the-shelf program.',
      );
  String get service1Body => _(
        'Persönliches Training vor Ort oder online.',
        'Personal training in person or online.',
      );
  String get service1Price => _('Erstgespräch kostenlos', 'Free intro call');
  String get service1Cta => _('Buchen →', 'Book →');
  String get service2Body => _(
        'Ganzheitliche Beratung Bewegung + Ernährung + Mental.',
        'Holistic guidance: movement + nutrition + mindset.',
      );
  String get service2Price => _('Ab Erstgespräch', 'From the intro call');
  String get service2Cta => _('Mehr erfahren →', 'Learn more →');
  String get service3Body => _(
        'Nach Verletzungen oder für alle die mehr können wollen.',
        'After injuries, or for anyone who wants to do more.',
      );
  String get service3Price => _('Mit Fachleuten', 'With specialists');
  String get service3Cta => _('Beratung anfragen →', 'Request advice →');
  String get featuredBadge => _('Empfohlen', 'Recommended');

  // ── YouTube ─────────────────────────────────────────────────────────────
  String get youtubeHeading =>
      _('TRHI auf YouTube & mehr.', 'TRHI on YouTube & more.');
  String get youtubeSubtitle =>
      _('Gutes Wissen kennt keine Grenzen.', 'Good knowledge knows no borders.');
  String get youtubeDisclaimer => _(
        'TRHI hat keine bezahlte Partnerschaft mit empfohlenen Kanälen. '
            'Bildung geht uns vor Werbung.',
        'TRHI has no paid partnership with the channels it recommends. '
            'Education before advertising.',
      );
  String get channelTrhiDesc => _(
        'Mobility, Ernährung, Mind-Body — für Berufstätige, Eltern, 50+',
        'Mobility, nutrition, Mind-Body — for professionals, parents, 50+',
      );
  String get channelSquatDesc => _(
        'Dr. Aaron Horschig — Physiotherapeut & Kraft-Coach. '
            'Wissenschaftlich fundierte Mobility-Arbeit. Pflicht für jeden mit Gelenken.',
        'Dr. Aaron Horschig — physiotherapist & strength coach. '
            'Science-based mobility work. Mandatory for anyone with joints.',
      );
  String get channelCampbellDesc => _(
        'Gesundheit, Ernährung, medizinische Forschung klar erklärt. '
            'Für Menschen die verstehen wollen, nicht nur folgen.',
        'Health, nutrition, medical research explained clearly. '
            'For people who want to understand, not just follow.',
      );
  String get subscribeCta => _('Abonnieren', 'Subscribe');
  String get visitCta => _('Besuchen →', 'Visit →');

  // ── Blog-Preview / Journal ──────────────────────────────────────────────
  String get journalEyebrow => 'TRHI Journal';
  String get journalHeading => _(
        'Einmal pro Woche.\nImmer mit Grund.',
        'Once a week.\nAlways for a reason.',
      );
  String get journalDescription => _(
        'Kein Newsletter-Blödsinn. Nur das, was gerade wichtig ist — '
            'ob Feiertag, Jahreszeit oder das, was die Wissenschaft diese Woche rausgefunden hat.',
        'No newsletter nonsense. Only what matters right now — '
            'a holiday, a season, or whatever science figured out this week.',
      );
  String get readAllArticles => _('Alle Artikel lesen →', 'Read all articles →');

  // ── Footer ──────────────────────────────────────────────────────────────
  String get footerTagline => 'Move · Mind · Nourish';

  // ── Sticker Card (Fermentation) ─────────────────────────────────────────
  String get fermentTag => _('Gut Health & Mikrobiom', 'Gut Health & Microbiome');
  String get fermentTitle => _(
        'Fermentation: Warum unser Körper diese Jahrtausende alte Technik braucht',
        'Fermentation: Why Your Body Still Needs This Ancient Tech',
      );
  List<String> get fermentParas => l.pick(
        const [
          'Fermentation ist wahrscheinlich so alt wie die Menschheit selbst. '
              'Nicht weil unsere Vorfahren besonders klug waren, sondern weil '
              'Lebensmittel nun mal vergären, wenn man sie lässt.',
          'Was dabei passiert ist: Über zehntausende von Jahren haben wir uns '
              'gemeinsam mit Mikroben entwickelt. Unser Immunsystem hat gelernt, mit '
              'ihnen umzugehen. Das Mikrobiom — die Milliarden von Mikroorganismen '
              'in unserem Verdauungstrakt — ist kein Nebenprodukt der Evolution, '
              'sondern ein aktiver Teil davon.',
          'Fermentierte Lebensmittel liefern genau das, was dieses System braucht: '
              'lebende Mikroorganismen, die die Darmflora bevölkern, stabilisieren und '
              'in ihrer Vielfalt erhöhen. Diversität ist dabei der entscheidende Faktor.',
          'Darm und Gehirn kommunizieren ständig miteinander — über den Vagusnerv, '
              'Hormone, und Botenstoffe, die ausschließlich im Darm produziert werden.',
          'Hochverarbeitete Lebensmittel, Antibiotika, sterile Umgebungen — das '
              'alles hat das Mikrobiom des durchschnittlichen Westeuropäers ärmer '
              'gemacht als das von Jäger-Sammler-Gesellschaften, die an keiner unserer '
              'Zivilisationskrankheiten leiden.',
          'Fermentation ist keine Lifestyle-Entscheidung. Es ist eine Rückkehr zu '
              'etwas, das unsere Physiologie ohnehin erwartet.',
        ],
        const [
          'Fermentation’s probably as old as humanity itself. Not because our '
              'ancestors were particularly clever — food just ferments when you leave it alone.',
          'Here’s what actually happens: over tens of thousands of years, we evolved '
              'alongside microbes. Your immune system learned to work with them. Your '
              'microbiome — the billions of microorganisms in your gut — isn’t evolution’s '
              'leftover. It’s evolution in action.',
          'Fermented foods deliver exactly what this system needs: living organisms that '
              'colonize, stabilize and diversify your gut flora. Diversity is the key lever here.',
          'Your gut and brain are in constant conversation — through the vagus nerve, '
              'hormones, and signaling molecules produced only in the gut.',
          'Ultra-processed food, antibiotics, sterile environments — all of it has made the '
              'average Western European’s microbiome poorer than that of hunter-gatherer '
              'societies, who suffer from none of our civilizational diseases.',
          'Fermentation isn’t a lifestyle choice. It’s a return to something your '
              'physiology expects in the first place.',
        ],
      );

  // ── Booking-Screen / Left ───────────────────────────────────────────────
  String get bookingScreenTitle =>
      _('Termin anfragen', 'Request an appointment');
  String get back => _('Zurück', 'Back');
  String get bookingLeadHeading =>
      _('Was bringt dich hierher?', 'What brings you here?');
  String get bookingFreeHint =>
      _('Erstgespräch immer kostenlos.', 'Intro call always free.');
  String get bookingTimeHeading => _('Uhrzeit wählen', 'Choose a time');

  String get session1Title => '1:1 Personal Training';
  String get session1Desc =>
      _('60 min · Bewegungsanalyse & Plan', '60 min · Movement analysis & plan');
  String get session2Title => 'Health Consulting';
  String get session2Desc =>
      _('45 min · Ganzheitliche Beratung', '45 min · Holistic guidance');
  String get session3Title => 'Mind-Body Session';
  String get session3Desc =>
      _('45 min · Atemarbeit & Mindset', '45 min · Breathwork & mindset');
  String get session4Title => _('Erstgespräch', 'Intro Call');
  String get session4Desc => _('30 min · Kostenlos', '30 min · Free');

  // ── Booking-Form ────────────────────────────────────────────────────────
  List<String> get goals => l.pick(
        const [
          '🔥 Abnehmen', '💪 Muskelaufbau', '🦵 Mehr Beweglichkeit',
          '🦴 Weniger Rückenschmerzen', '⚡ Mehr Energie im Alltag',
          '🏃 Ausdauer verbessern', '🧘 Stressabbau', '🏕 Training Camp',
          '🏅 Wettkampf-Vorbereitung', '🦺 Verletzungsrehabilitation',
          '🧓 Fit im Alter bleiben', '🏋 Körperhaltung verbessern',
          '😴 Besser schlafen', '🌿 Gesündere Ernährung',
        ],
        const [
          '🔥 Lose weight', '💪 Build muscle', '🦵 More mobility',
          '🦴 Less back pain', '⚡ More everyday energy',
          '🏃 Improve endurance', '🧘 Stress relief', '🏕 Training camp',
          '🏅 Competition prep', '🦺 Injury rehab',
          '🧓 Stay fit with age', '🏋 Better posture',
          '😴 Sleep better', '🌿 Healthier nutrition',
        ],
      );

  List<String> get activityLevels => l.pick(
        const [
          'Kein Sport seit längerem',
          'Leichte Bewegung (Spazieren, Yoga)',
          '1–2× Sport pro Woche',
          '3–4× Sport pro Woche',
          'Tägliches Training',
          'Leistungssport / Wettkampf',
        ],
        const [
          'No exercise for a while',
          'Light movement (walking, yoga)',
          '1–2× exercise per week',
          '3–4× exercise per week',
          'Daily training',
          'Competitive / pro level',
        ],
      );

  List<String> get sources => l.pick(
        const [
          'YouTube', 'Instagram', 'Empfehlung', 'Google', 'Sticker/Flyer', 'Sonstiges',
        ],
        const [
          'YouTube', 'Instagram', 'Recommendation', 'Google', 'Sticker/Flyer', 'Other',
        ],
      );

  String get bookingSuccess => _(
        'Anfrage gesendet — wir melden uns innerhalb 24h!',
        "Request sent — we'll get back to you within 24h!",
      );
  String get bookingError => _(
        'Fehler beim Senden. Bitte nochmal versuchen.',
        'Something went wrong. Please try again.',
      );

  String get formPersonalSection => _('Persönliche Daten', 'Personal details');
  String get formFirstName => _('Vorname *', 'First name *');
  String get formLastName => _('Nachname *', 'Last name *');
  String get formRequired => _('Pflichtfeld', 'Required');
  String get formEmail => _('E-Mail *', 'Email *');
  String get formInvalidEmail => _('Ungültige E-Mail', 'Invalid email');
  String get formPhone => _('Telefon (optional)', 'Phone (optional)');
  String get formGoalsSection =>
      _('Was möchtest du erreichen?', 'What do you want to achieve?');
  String get formGoalsHint => _('Mehrere Ziele möglich.', 'Multiple goals possible.');
  String get formCustomGoal => _('Eigenes Ziel (optional)', 'Your own goal (optional)');
  String get formBodySection => _('Körperdaten', 'Body data');
  String get formAge => _('Alter', 'Age');
  String get formAgeHint => _('z.B. 34', 'e.g. 34');
  String get formHeight => _('Größe (cm)', 'Height (cm)');
  String get formHeightHint => _('z.B. 178', 'e.g. 178');
  String get formWeight => _('Gewicht (kg)', 'Weight (kg)');
  String get formWeightHint => _('z.B. 75', 'e.g. 75');
  String get formInjuries =>
      _('Verletzungen / Beschwerden (optional)', 'Injuries / complaints (optional)');
  String get formInjuriesHint => _(
        'z.B. Knieschmerzen links, Bandscheibe L4/L5…',
        'e.g. left knee pain, disc L4/L5…',
      );
  String get formActivitySection => _('Aktivitätslevel', 'Activity level');
  String get formCurrentActivity =>
      _('Aktuelles Aktivitätslevel', 'Current activity level');
  String get formHowFound =>
      _('Wie hast du TRHI gefunden?', 'How did you find TRHI?');
  String get formPrivacyConsent => _(
        'Ich stimme zu, dass meine Angaben zur Bearbeitung '
            'meiner Anfrage gespeichert werden. '
            'Details in der Datenschutzerklärung.',
        'I agree that my details may be stored to process my request. '
            'Details in the privacy policy.',
      );
  String get formSubmit => _('Termin anfragen →', 'Request appointment →');
  String get formTrust => _(
        '✓ Antwort innerhalb 24h · Kein Spam · Kein Verkaufsdruck',
        '✓ Reply within 24h · No spam · No sales pressure',
      );

  // ── Blog-Screens ────────────────────────────────────────────────────────
  String get blogIndexSubheading => _(
        'Fitness · Ernährung · Mentale Stärke — verbunden mit dem, was gerade passiert.',
        "Fitness · Nutrition · Mental strength — tied to what's happening right now.",
      );
  String get blogNoArticles =>
      _('Keine Artikel in dieser Kategorie.', 'No articles in this category.');
  String readingTimeMeta(int min) =>
      _('TRHI · $min min Lesezeit', 'TRHI · $min min read');
  String cardMeta(int min, String date) => '$min min · $date';
  String get blogRelatedHeading => _('Weitere Artikel', 'More articles');
  String get blogCtaHeading => _('Bereit loszulegen?', 'Ready to start?');
  String get blogCtaSub => _(
        'Erstgespräch kostenlos. Kein Druck. Kein Verkauf.',
        'Free intro call. No pressure. No sales.',
      );
  String get blogCtaButton => _('Erstgespräch buchen', 'Book a free call');
  String get blogNotFound => _('Artikel nicht gefunden.', 'Article not found.');
  String get blogBackToJournal =>
      _('Zurück zum Journal', 'Back to the journal');

  // ── Kategorien (stabiler Key → Label) ───────────────────────────────────
  /// Reihenfolge = Filter-Reihenfolge im Blog-Index. 'all' ist nur Filter.
  static const List<String> categoryKeys = [
    'all', 'fitness', 'nutrition', 'mindbody', 'science', 'seasonal',
  ];

  String category(String key) {
    switch (key) {
      case 'all':
        return _('Alle', 'All');
      case 'fitness':
        return 'Fitness';
      case 'nutrition':
        return _('Ernährung', 'Nutrition');
      case 'mindbody':
        return 'Mind-Body';
      case 'science':
        return _('Wissenschaft', 'Science');
      case 'seasonal':
        return _('Saisonal', 'Seasonal');
      default:
        return key;
    }
  }
}
