class BlogPost {
  final String slug;
  final String tag;
  final String title;
  final String teaser;
  final String content;
  final int readingTimeMin;
  final DateTime publishedAt;
  final String category;

  const BlogPost({
    required this.slug,
    required this.tag,
    required this.title,
    required this.teaser,
    required this.content,
    required this.readingTimeMin,
    required this.publishedAt,
    required this.category,
  });
}

final List<BlogPost> blogPosts = [
  BlogPost(
    slug: 'hitze-training',
    tag: 'Sommer · Juni 2026',
    category: 'Saisonal',
    title: 'Training bei Hitze — warum dein Körper jetzt anders tickt',
    teaser:
        'Über 30 Grad, und dein gewohntes Workout fühlt sich an wie doppelt '
        'so schwer. Das ist keine Einbildung — das ist Thermoregulation.',
    readingTimeMin: 4,
    publishedAt: DateTime(2026, 6, 1),
    content:
        'Der erste richtig heiße Tag im Juni. Du gehst raus wie immer, machst dein gewohntes '
        'Programm — und nach der Hälfte fühlst du dich, als hättest du das Doppelte geleistet.\n\n'
        'Du bist nicht außer Form. Dein Körper hat nur eine zweite Baustelle.\n\n'
        'Bei Hitze muss dein Herz-Kreislauf-System gleichzeitig zwei Dinge leisten: die Muskeln '
        'mit Blut versorgen und Wärme über die Haut abführen. Das Blut wird buchstäblich umverteilt — '
        'mehr nach außen, weniger zum Muskel. Dein Puls steigt bei gleicher Leistung um 10 bis 20 Schläge. '
        'Das ist normal. Das ist Physik.\n\n'
        'Dazu verlierst du über Schweiß nicht nur Wasser, sondern Elektrolyte — Natrium, Magnesium, Kalium. '
        'Genau die Mineralien, die deine Muskeln zum Kontrahieren brauchen.\n\n'
        'Was im Sommer wirklich hilft:\n\n'
        '1. Verschieb die intensiven Einheiten in den frühen Morgen oder späten Abend. Mittags zwischen '
        '12 und 16 Uhr arbeitet dein Körper gegen die Sonne, nicht gegen das Gewicht.\n'
        '2. Trink über den Tag verteilt, nicht erst beim Durst. Durst ist bereits ein Defizit-Signal.\n'
        '3. Eine Prise Salz ins Wasser bei langen Einheiten. Reines Wasser allein kann den Elektrolytverlust '
        'sogar verdünnen.\n'
        '4. Reduziere das Volumen, nicht die Qualität. Ein kürzeres, sauberes Training schlägt ein langes, '
        'bei dem die Technik in der Hitze zerfällt.\n\n'
        'Der Sommer ist kein Grund zu pausieren. Er ist ein Grund, klüger zu trainieren. '
        'Dein Körper passt sich an Hitze an — aber nur, wenn du ihm die Chance gibst.',
  ),
  BlogPost(
    slug: 'sommerschlaf-licht',
    tag: 'Schlaf · Juni 2026',
    category: 'Wissenschaft',
    title: 'Die längsten Tage des Jahres ruinieren deinen Schlaf — wenn du sie lässt',
    teaser:
        'Um 21:30 ist es noch hell, um 5:00 wieder. Dein Melatonin kommt da '
        'kaum hinterher. So holst du dir die Sommernächte zurück.',
    readingTimeMin: 5,
    publishedAt: DateTime(2026, 5, 28),
    content:
        'Im Juni geht in Mitteleuropa die Sonne erst kurz vor halb zehn unter und kurz nach fünf wieder auf. '
        'Das ist schön. Für deinen Schlaf ist es eine Herausforderung.\n\n'
        'Melatonin — das Hormon, das deinem Körper sagt, dass es Zeit zum Schlafen ist — wird nur bei '
        'Dunkelheit ausgeschüttet. Solange Licht auf deine Netzhaut fällt, hält dein Gehirn den Tag für '
        'noch nicht beendet. Im Hochsommer bekommst du dieses Dunkelsignal Stunden später als im Winter.\n\n'
        'Das Ergebnis: Du gehst zur gewohnten Zeit ins Bett, aber dein System ist noch im Tagmodus. '
        'Du liegst wach, schläfst später ein — und das frühe Morgenlicht weckt dich trotzdem wieder.\n\n'
        'Die gute Nachricht: Du kannst dein Lichtumfeld steuern, auch wenn du die Sonne nicht steuern kannst.\n\n'
        'Abdunkeln. Verdunkelungsvorhänge oder eine Schlafmaske sind im Sommer kein Luxus, sondern das '
        'wirksamste Werkzeug. Komplette Dunkelheit ab dem Zubettgehen.\n\n'
        'Bildschirme runterdrehen. Das blaue Licht von Handy und Laptop imitiert exakt das Tageslicht, '
        'das dein Melatonin bremst. Die letzte Stunde vor dem Schlaf gehört warmem, gedämpftem Licht.\n\n'
        'Morgens raus ins Helle. Klingt widersprüchlich, ist es nicht: Helles Morgenlicht stellt deine '
        'innere Uhr nach vorne und sorgt dafür, dass das Melatonin abends pünktlicher kommt.\n\n'
        'Der Sommer schenkt dir lange Abende. Du musst sie nur nicht mit Schlafmangel bezahlen.',
  ),
  BlogPost(
    slug: 'grillsaison-ernaehrung',
    tag: 'Ernährung · Juni 2026',
    category: 'Ernährung',
    title: 'Grillsaison ohne schlechtes Gewissen — und ohne Ernährungsdogma',
    teaser:
        'Grillen ist nicht das Problem. Was meistens daneben liegt, ist es. '
        'Eine entspannte Anleitung für den Sommer.',
    readingTimeMin: 4,
    publishedAt: DateTime(2026, 5, 22),
    content:
        'Grillen hat einen schlechten Ruf, den es nicht verdient. Ein Stück Fleisch oder Fisch über '
        'offener Hitze ist eine der ältesten und ehrlichsten Zubereitungsarten, die es gibt.\n\n'
        'Das Problem ist selten das Gegrillte selbst. Es ist das Drumherum: der dritte Brötchen-Nachschlag, '
        'die fertige Grillsoße mit halb Zucker, die Chips zwischendurch und das fünfte Bier.\n\n'
        'Worauf es wirklich ankommt:\n\n'
        'Die Proteinquelle ist dein Anker. Fleisch, Fisch, Halloumi, Tofu — das ist der Teil der Mahlzeit, '
        'der dich satt und stabil hält. Plane den Teller um ihn herum.\n\n'
        'Farbe dazu. Gegrilltes Gemüse, ein großer Salat, frische Kräuter. Nicht aus Tugend, sondern weil '
        'Ballaststoffe und Wasser dich satt machen, bevor du beim dritten Brötchen landest.\n\n'
        'Kohlenhydrate bewusst, nicht nebenbei. Ein gutes Brot oder ein Kartoffelsalat gehören dazu — '
        'aber als Entscheidung, nicht als Reflex, weil der Korb gerade danebensteht.\n\n'
        'Ein Wort zur Verkohlung: stark verbrannte, schwarze Stellen enthalten Stoffe, die man nicht '
        'täglich essen sollte. Einmal die Woche ein gut gebräuntes Steak ist kein Drama. Verkohlte '
        'Reste großzügig wegschneiden — das reicht völlig.\n\n'
        'Und das Wichtigste: Ein Grillabend mit Freunden ist mehr als Nährwerte. Gemeinsames Essen, '
        'Sonne, Gespräche — das zählt für deine Gesundheit genauso wie der Makro-Split. '
        'Iss bewusst, genieß es, und mach dir keinen Kopf.',
  ),
  BlogPost(
    slug: 'feiertagsfalle',
    tag: 'Pfingsten · Mai 2026',
    category: 'Fitness',
    title: 'Feiertagsfalle — was Ruhetage wirklich mit deinem Körper machen',
    teaser:
        'Pfingsten. Drei Tage frei. Und plötzlich tut der Rücken weh, '
        'obwohl du dich "ausgeruht" hast. Kein Zufall.',
    readingTimeMin: 4,
    publishedAt: DateTime(2026, 5, 15),
    content:
        'Pfingsten ist großartig. Drei Tage. Familie. Essen. Vielleicht ein Glas zu viel Wein am Sonntagabend.\n\n'
        'Und dann, Dienstagmorgen: dein Rücken tut weh. Die Knie knacken beim ersten Schritt aus dem Bett. '
        'Du fühlst dich steifer als freitags — obwohl du doch "Pause gemacht" hast.\n\n'
        'Was ist passiert?\n\n'
        'Dein Körper ist kein Maschine, die man einfach abschaltet. Er ist ein System, das auf Bewegung ausgelegt ist. '
        'Drei Tage Inaktivität — mehr Sitzen, mehr Liegen, weniger Laufen als üblich — und die kleinen Stabilisatoren '
        'rund um Wirbelsäule, Hüfte und Knie schalten schlicht in den Energiesparmodus.\n\n'
        'Das Fasziengewebe zieht sich zusammen. Die Synovialflüssigkeit in den Gelenken wird weniger verteilt. '
        'Und der Körper vergisst kurz, wie er sich optimal halten soll.\n\n'
        'Was du stattdessen tun kannst:\n\n'
        '1. Jeden Feiertag: 20 Minuten bewegen. Kein Sport. Einfach gehen, dehnen, ein paar Kniebeugen.\n'
        '2. Bewusst trinken — Wasser, nicht nur Prosecco. Faszien brauchen Flüssigkeit.\n'
        '3. Die erste Stunde nach dem Aufstehen nicht auf dem Sofa verbringen.\n\n'
        'Du bist in erster Linie ein Tier. Tiere rasten kurz. Dann bewegen sie sich wieder. '
        'Das ist kein Vorwurf — das ist Biologie.',
  ),
  BlogPost(
    slug: 'fruehjahrsmuedigkeit',
    tag: 'Frühling · Mai 2026',
    category: 'Ernährung',
    title: 'Frühjahrsmüdigkeit ist kein Mythos. Hier ist der Fix.',
    teaser:
        'Die Sonne scheint, alles blüht — und du willst nur schlafen. '
        'Dein Körper steckt mitten in einer hormonellen Zeitumstellung.',
    readingTimeMin: 5,
    publishedAt: DateTime(2026, 5, 8),
    content:
        'Frühjahrsmüdigkeit klingt wie eine Ausrede. Sie ist es nicht.\n\n'
        'Was wirklich passiert: Im Winter produziert dein Körper mehr Melatonin — das Schlafhormon. '
        'Mit mehr Tageslicht im Frühling bremst die Produktion, aber das System braucht Wochen, '
        'um sich anzupassen. Gleichzeitig steigt der Serotoninbedarf. Das Ergebnis: du fühlst dich '
        'müde, obwohl du schläfst.\n\n'
        'Dazu kommt: nach dem Winter sind viele mit Vitamin D, Eisen und Magnesium im Keller. '
        'Nicht dramatisch — aber genug, um sich schlapp zu fühlen.\n\n'
        'Der Fix ist nicht kompliziert:\n\n'
        'Tageslicht morgens. Mindestens 10 Minuten draußen innerhalb der ersten Stunde nach dem Aufstehen. '
        'Das reguliert die innere Uhr schneller als jeder Kaffee.\n\n'
        'Eisenreiche Lebensmittel: Spinat, Linsen, rotes Fleisch wenn du es verträgst. '
        'Nicht als Diät — als bewusste Ergänzung für 2–3 Wochen.\n\n'
        'Bewegung statt Koffein. Ein 15-minütiger Spaziergang um 14:00 Uhr schlägt den Nachmittags-Espresso. '
        'Wissenschaftlich. Ernsthaft.\n\n'
        'Und ja — manchmal liegt es auch einfach am Wetter. Das darf sein. '
        'Aber wenn die Müdigkeit nach zwei Wochen Frühling noch da ist, lohnt sich ein Blutbild.',
  ),
  BlogPost(
    slug: 'ruecken-montag',
    tag: 'Gesundheit · Mai 2026',
    category: 'Mind-Body',
    title: 'Warum dein Rücken nach dem Wochenende schlimmer ist als freitags',
    teaser:
        'Montag ist der häufigste Tag für Rückenschmerzen. Das ist kein Zufall — '
        'und es liegt nicht am Job.',
    readingTimeMin: 4,
    publishedAt: DateTime(2026, 5, 1),
    content:
        'Statistisch gesehen melden sich die meisten Menschen mit Rückenschmerzen montags. '
        'Das ist gut dokumentiert und wurde lange dem Stress des Arbeitsbeginns zugeschrieben.\n\n'
        'Die Realität ist nüchterner: das Wochenende ist das Problem.\n\n'
        'Samstag und Sonntag bedeuten für die meisten: mehr Sitzen, andere Sitzhaltungen '
        '(Sofa statt Bürostuhl), weniger regelmäßige Bewegung, mehr ungewohnte Belastung '
        '(Gartenarbeit, Umzugshelfen, langes Autofahren) und schlechterer Schlaf durch '
        'veränderte Schlafzeiten.\n\n'
        'Die kleinen Rückenmuskeln — insbesondere der Multifidus — verlieren über das Wochenende '
        'ihre tonische Aktivierung. Sie brauchen regelmäßige, niedrigschwellige Stimulation, '
        'um die Wirbelsäule zu stabilisieren. Zwei Tage Sofa genügen, um das merklich zu reduzieren.\n\n'
        'Was konkret hilft:\n\n'
        'Jeden Morgen — auch samstags und sonntags — 5 Minuten: Cat-Cow, Bird-Dog, Dead Bug. '
        'Kein Workout. Nur Aktivierung.\n\n'
        'Bewusst auf die Sitzposition auf dem Sofa achten. Wenn du schon sitzt, dann aufrecht. '
        'Oder auf dem Boden. Oder im Wechsel.\n\n'
        'Und wenn der Rücken am Montag wieder schmerzt: es ist nicht dein Job. '
        'Es ist das Wochenende. Fang damit an, das zu ändern.',
  ),
  BlogPost(
    slug: 'schlaf-training',
    tag: 'Wissenschaft · April 2026',
    category: 'Wissenschaft',
    title: 'Schlaf ist kein Luxus — er ist das halbe Training',
    teaser:
        'Neue Studien zeigen: Wer unter 7 Stunden schläft, verliert einen signifikanten '
        'Teil seiner Trainingsadaptation. Der Körper baut sich nachts, nicht im Gym.',
    readingTimeMin: 6,
    publishedAt: DateTime(2026, 4, 24),
    content:
        'Du trainierst hart. Du isst sauber. Du tust alles richtig.\n\n'
        'Und schläfst 5,5 Stunden pro Nacht.\n\n'
        'Dann arbeitest du gegen dich selbst.\n\n'
        'Während du schläfst, passiert das Meiste: Muskeln werden repariert und aufgebaut, '
        'Wachstumshormon wird ausgeschüttet (80% davon nachts), das Nervensystem regeneriert, '
        'Entzündungsprozesse werden reguliert, Bewegungsmuster werden im Gedächtnis konsolidiert.\n\n'
        'Eine Studie aus 2023 (Universitäten Chicago & Stanford) zeigte: Probanden die unter '
        '7 Stunden schliefen, verloren nach 6 Wochen Training 55% weniger Fettmasse und '
        'bauten 40% weniger Muskelmasse auf als die Gruppe mit 8+ Stunden — bei identischem Training.\n\n'
        'Das ist kein kleiner Unterschied. Das ist fast die Hälfte des Ergebnisses.\n\n'
        'Was das bedeutet für TRHI:\n\n'
        'Wenn du 3x pro Woche trainierst und 6 Stunden schläfst, trainierst du effektiv '
        'wie jemand der 1,5x pro Woche trainiert und 8 Stunden schläft.\n\n'
        'Schlaf zu priorisieren ist kein Zeichen von Schwäche. Es ist das Klügste was du '
        'für dein Training tun kannst. Und es kostet nichts.',
  ),
  BlogPost(
    slug: 'protein-mythen',
    tag: 'Ernährung · April 2026',
    category: 'Ernährung',
    title: '3 Protein-Mythen die sich hartnäckig halten — und die Wahrheit dahinter',
    teaser:
        '"Du musst gleich nach dem Training Protein essen." '
        '"Mehr als 30g kann der Körper nicht verwerten." '
        '"Ohne Shakes geht kein Muskelaufbau." Alles falsch.',
    readingTimeMin: 5,
    publishedAt: DateTime(2026, 4, 17),
    content:
        'Die Fitnessindustrie lebt von Protein-Angst. Je mehr Verwirrung, desto mehr Produkte.\n\n'
        'Hier sind drei der hartnäckigsten Mythen — und was die Forschung wirklich sagt:\n\n'
        'Mythos 1: Das anabole Fenster existiert und ist 30 Minuten nach dem Training.\n\n'
        'Realität: Das Fenster ist eher 4–6 Stunden. Wenn du vor dem Training gegessen hast, '
        'spielt der genaue Zeitpunkt danach kaum eine Rolle. Entspann dich.\n\n'
        'Mythos 2: Der Körper kann nur 30g Protein pro Mahlzeit verarbeiten.\n\n'
        'Realität: Dein Körper verarbeitet alles was du isst — er braucht nur länger. '
        'Größere Proteinmengen werden einfach langsamer absorbiert. Für Muskelaufbau ist '
        'die Gesamtmenge über den Tag entscheidend, nicht die Aufteilung.\n\n'
        'Mythos 3: Ohne Protein-Shakes kein ernsthafter Muskelaufbau möglich.\n\n'
        'Realität: Echte Lebensmittel funktionieren genauso gut. 200g Hüttenkäse, '
        '3 Eier, 150g Lachs — das ist 50g+ Protein ohne einen einzigen Shake.\n\n'
        'Was wirklich zählt: Gesamtprotein über den Tag (1,6–2,2g/kg Körpergewicht), '
        'Qualität der Quellen, und ausreichend Kalorien insgesamt.',
  ),
  BlogPost(
    slug: 'meditation-anfaenger',
    tag: 'Mind-Body · März 2026',
    category: 'Mind-Body',
    title: 'Meditation für Menschen die Meditation hassen',
    teaser:
        'Du musst nicht auf einem Kissen sitzen und "Om" sagen. '
        'Hier sind 3 Formen mentaler Stille die auch für Zyniker funktionieren.',
    readingTimeMin: 4,
    publishedAt: DateTime(2026, 3, 28),
    content:
        'Ich weiß was du denkst. Meditation ist nichts für dich. Zu esoterisch. Zu still. '
        'Du bist kein Mensch der einfach "da sitzt".\n\n'
        'Das ist okay. Klassische Sitzmeditation ist eine von vielen Formen — '
        'und nicht unbedingt die zugänglichste.\n\n'
        'Hier sind drei Varianten die tatsächlich funktionieren, auch wenn du Meditation eigentlich blöd findest:\n\n'
        '1. Walking Meditation\n\n'
        '15 Minuten gehen. Kein Podcast, keine Musik, kein Handy. '
        'Fokus auf Schritte, Atmung, das was du siehst. '
        'Das ist Meditation. Fertig.\n\n'
        '2. Körperscan beim Aufwachen\n\n'
        'Bevor du aus dem Bett springst: 2 Minuten. Wo spürst du Spannung? '
        'Was fühlt sich gut an? Keine Bewertung. Nur Beobachtung. '
        'Das Gehirn lernt dabei, den Körper wahrzunehmen — und das hat direkte Auswirkungen '
        'auf Stressreaktionen den ganzen Tag.\n\n'
        '3. Box Breathing\n\n'
        '4 Sekunden einatmen. 4 halten. 4 ausatmen. 4 halten. '
        'Drei Mal. Gesamtzeit: 48 Sekunden.\n\n'
        'Wird von Navy SEALs verwendet. Keine Esoterik. Reine Neurologie.\n\n'
        'Fang mit einer dieser drei an. Gib ihr 2 Wochen. '
        'Dann entscheide ob Meditation nichts für dich ist.',
  ),
];

List<BlogPost> getPostsByCategory(String category) {
  if (category == 'Alle') return blogPosts;
  return blogPosts.where((p) => p.category == category).toList();
}

BlogPost? getPostBySlug(String slug) {
  try {
    return blogPosts.firstWhere((p) => p.slug == slug);
  } catch (_) {
    return null;
  }
}
