import '../i18n/app_lang.dart';

class BlogPost {
  final String slug;

  /// Stabiler Filter-Schlüssel (all/fitness/nutrition/mindbody/science/seasonal).
  /// Das angezeigte Label kommt aus [AppText.category].
  final String categoryKey;

  final String tag;
  final String tagEn;
  final String title;
  final String titleEn;
  final String teaser;
  final String teaserEn;
  final String content;
  final String contentEn;

  final int readingTimeMin;
  final DateTime publishedAt;

  const BlogPost({
    required this.slug,
    required this.categoryKey,
    required this.tag,
    required this.tagEn,
    required this.title,
    required this.titleEn,
    required this.teaser,
    required this.teaserEn,
    required this.content,
    required this.contentEn,
    required this.readingTimeMin,
    required this.publishedAt,
  });

  String tagOf(AppLang l) => l.pick(tag, tagEn);
  String titleOf(AppLang l) => l.pick(title, titleEn);
  String teaserOf(AppLang l) => l.pick(teaser, teaserEn);
  String contentOf(AppLang l) => l.pick(content, contentEn);
}

final List<BlogPost> blogPosts = [
  BlogPost(
    slug: 'adhs-amphetamine',
    categoryKey: 'science',
    tag: 'ADHS & Medikamente · Juni 2026',
    tagEn: 'ADHD & Medication · June 2026',
    title: 'ADHS und Amphetamine: Was wirklich in deinem Kind vorgeht',
    titleEn: "ADHD and Amphetamine: What's Really Happening in Your Kid's Brain",
    teaser:
        'Dein Kind ist impulsiv, vergesslich, kann kaum stillsitzen — und der '
        'Arzt empfiehlt ausgerechnet ein Amphetamin? Was im Gehirn wirklich '
        'passiert, und warum es oft weniger beängstigend ist, als du denkst.',
    teaserEn:
        "Your kid is impulsive, forgetful, can barely sit still—and the doctor "
        "recommends an amphetamine? What actually happens in the brain, and why "
        "it's often less frightening than you think.",
    readingTimeMin: 6,
    publishedAt: DateTime(2026, 6, 11),
    content:
        'Dein Kind ist impulsiv, vergesslich und kann kaum stillsitzen – und der Arzt '
        'empfiehlt eine Substanz, die auch als Dopingmittel bekannt ist? Das klingt '
        'beängstigend. Die Wissenschaft zeigt: Es ist komplizierter – und oft weniger '
        'beängstigend – als du denkst.\n\n'
        'Was ADHS wirklich ist\n\n'
        'ADHS ist keine Erziehungsschwäche und keine Phase. Es ist eine neurologische '
        'Besonderheit: Bestimmte Bereiche im Gehirn – vor allem der präfrontale Kortex, '
        'der für Planung, Impulskontrolle und Konzentration zuständig ist – arbeiten mit '
        'zu wenig Dopamin und Noradrenalin. Zwei Botenstoffe, die das Gehirn braucht, um '
        'Prioritäten zu setzen.\n\n'
        'Stell dir vor, dein Auto hat einen Motor, der nicht ruhig im Leerlauf läuft. Es '
        'ruckelt, geht aus, springt unerwartet an. Das ist kein Fahrerfehler – das ist '
        'Mechanik. Kinder mit ADHS wollen sich konzentrieren. Sie können es nur schwerer '
        'steuern als andere.\n\n'
        'Wichtig zu wissen: ADHS betrifft rund 5–7 % aller Kinder und 3–5 % der Erwachsenen '
        'weltweit. Die Diagnose erfolgt klinisch – durch Beobachtung, Tests und Ausschluss '
        'anderer Ursachen, nicht durch einen einfachen Bluttest.\n\n'
        'Genau hier setzen amphetaminbasierte Medikamente an – nicht um das Kind zu '
        'betäuben, sondern um den Dopaminmangel auszugleichen.\n\n'
        'Wie Amphetamine bei ADHS wirken\n\n'
        'In Deutschland wird bei ADHS hauptsächlich Methylphenidat (Ritalin, Medikinet, '
        'Concerta) eingesetzt. Wenn das nicht ausreicht, kommt Lisdexamfetamin (Elvanse) '
        'zum Einsatz – eine amphetaminbasierte Substanz, die seit 2013 für Kinder ab 6 '
        'Jahren und seit 2019 für Erwachsene in Europa zugelassen ist.\n\n'
        'Beide Wirkstoffe erhöhen die Verfügbarkeit von Dopamin und Noradrenalin im Gehirn. '
        'Elvanse ist dabei ein sogenanntes Prodrug – es wird erst im Körper aktiviert. Das '
        'verlangsamt die Wirkung und macht es schwerer missbrauchbar als klassische '
        'Amphetamine.\n\n'
        'Der „Paradox"-Effekt erklärt: Menschen ohne ADHS fühlen sich durch Stimulanzien in '
        'niedrigen Dosen aufgedreht oder euphorisch. Menschen mit ADHS fühlen sich häufig '
        'ruhiger und klarer – weil ihr Gehirn endlich die Regulierung bekommt, die ihm '
        'fehlt. Es ist kein Paradox. Es ist Biologie.\n\n'
        'Eine Studie aus dem Jahr 2025 (Frontiers in Psychiatry) betont: Die steigende '
        'Verschreibung von Amphetaminen erfordert eine genaue Diagnose und regelmäßige '
        'Überprüfung – denn Medikamente ersetzen keine Therapie, sondern ergänzen sie.\n\n'
        'Die Fragen, die sich Eltern stellen\n\n'
        'Wird mein Kind abhängig?\n\n'
        'Das ist die am häufigsten gestellte Frage – und die Antwort überrascht viele: '
        'Behandelte Kinder mit ADHS entwickeln im Erwachsenenalter seltener eine '
        'Suchterkrankung als unbehandelte. Eine Metaanalyse von Wilens et al. (2003, '
        'Pediatrics) zeigte, dass eine frühe Stimulanzientherapie das spätere Suchtrisiko '
        'sogar senken kann – möglicherweise weil das unbehandelte ADHS-Gehirn andere Wege '
        'sucht, seinen Dopaminmangel zu kompensieren.\n\n'
        'Forschungsbefund: Unbehandelte ADHS-Patienten greifen häufiger zu Alkohol, Cannabis '
        'oder anderen Substanzen – wohl als unbewusste Selbstmedikation. Die gezielte '
        'medizinische Behandlung kann genau das verhindern.\n\n'
        'Wird mein Kind zum Zombie?\n\n'
        'Wenn ein Kind apathisch, emotionslos oder ständig niedergeschlagen wirkt, ist das '
        'meist ein Zeichen für eine zu hohe Dosis – nicht für das Medikament an sich. In '
        'diesem Fall sollte die Dosis angepasst werden. Bei der richtigen Dosis berichten '
        'viele Eltern: „Er ist immer noch er selbst – nur ruhiger und konzentrierter."\n\n'
        'Muss mein Kind das für immer nehmen?\n\n'
        'Nein. ADHS-Medikamente werden regelmäßig neu bewertet – oft jährlich. Viele Kinder '
        'reduzieren die Dosis im Teenager- oder Erwachsenenalter. Einige brauchen die '
        'Unterstützung dauerhaft, andere gar nicht mehr. Das ist keine Niederlage – das ist '
        'individuelle Medizin.\n\n'
        'Worauf du bei Nebenwirkungen achten musst\n\n'
        'Amphetaminbasierte Medikamente haben echte Nebenwirkungen. Kein seriöser Arzt wird '
        'das bestreiten. Wichtig ist, sie zu kennen – nicht um Angst zu machen, sondern '
        'damit du weißt, worauf du achten musst.\n\n'
        '1. Appetit: Viele Kinder haben weniger Hunger, besonders mittags. Lösung: Frühstück '
        'vor der Einnahme, kalorienreiches Abendessen, keine Verbote.\n'
        '2. Schlaf: Das Einschlafen kann sich verzögern. Uhrzeit der Einnahme mit dem Arzt '
        'besprechen – manchmal reicht eine kleine Verschiebung.\n'
        '3. Herzfrequenz & Blutdruck: Leicht erhöht – deshalb sind regelmäßige '
        'Kontrolluntersuchungen Pflicht, kein Kann.\n'
        '4. Wachstum: Bei Langzeitbehandlung kann das Wachstum leicht verlangsamt sein. '
        'Studien zeigen: Es holt sich im Laufe der Zeit meist auf.\n'
        '5. Stimmungsschwankungen beim Abklingen: Wenn das Medikament nachlässt '
        '(Rebound-Effekt), können kurze Gereiztheit oder Erschöpfung auftreten. Das ist '
        'normal – aber besprechbar.\n\n'
        'Das Wichtigste: ADHS-Medikamente sind ein Baustein – kein Allheilmittel. Am '
        'wirksamsten sind sie in Kombination mit Verhaltenstherapie, klaren Strukturen zu '
        'Hause und einem verständnisvollen Umfeld. Medikamente öffnen eine Tür. Was '
        'dahinter passiert, liegt bei euch.\n\n'
        '⚠️ Dieser Artikel informiert und ersetzt keine ärztliche Beratung. ADHS-Diagnose '
        'und Medikation gehören in professionelle Hände. Bitte sprich mit einem Kinder- und '
        'Jugendpsychiater oder Neuropädiater.\n\n'
        'Quellen: Wilens, T.E. et al. (2003), Pediatrics, DOI 10.1542/peds.112.1.179 · '
        'Frontiers in Psychiatry (2025), DOI 10.3389/fpsyt.2025.1460341 · Child Mind '
        'Institute · ADxS.org.',
    contentEn:
        "Your kid is impulsive, forgetful, and can barely sit still—and the doctor recommends a substance you've heard of as a doping drug? That sounds terrifying. The science says it's more complicated—and often less terrifying—than you think.\n\n"
        "What ADHD Really Is\n\n"
        "ADHD isn't a parenting failure and it's not a phase. It's a neurological difference: certain parts of the brain—especially the prefrontal cortex, which handles planning, impulse control, and concentration—work with too little dopamine and noradrenaline. Two chemicals your brain needs to set priorities.\n\n"
        "Picture your car engine that won't idle smoothly. It sputters, stalls, restarts unexpectedly. That's not driver error—that's mechanics. Kids with ADHD want to concentrate. They just have a harder time controlling it than others do.\n\n"
        "Important to know: ADHD affects roughly 5–7% of all kids and 3–5% of adults worldwide. The diagnosis is clinical—through observation, testing, and ruling out other causes, not a simple blood test.\n\n"
        "That's exactly where amphetamine-based medications come in—not to sedate your kid, but to fix the dopamine shortage.\n\n"
        "How Amphetamines Work in ADHD\n\n"
        "In Germany, ADHD is primarily treated with methylphenidate (Ritalin, Medikinet, Concerta). When that's not enough, there's lisdexamfetamine (Elvanse)—an amphetamine-based substance approved for kids 6+ since 2013 and adults in Europe since 2019.\n\n"
        "Both drugs increase dopamine and noradrenaline availability in the brain. Elvanse is a prodrug—it gets activated in your body. That slows the effect and makes it harder to abuse than classic amphetamines.\n\n"
        "The \"paradox\" explained: people without ADHD feel wired or euphoric on low-dose stimulants. People with ADHD often feel calmer and sharper—because their brain finally gets the regulation it's been missing. It's not a paradox. It's biology.\n\n"
        "A 2025 study (Frontiers in Psychiatry) emphasizes: rising amphetamine prescriptions demand careful diagnosis and regular checkups—because medication supplements therapy, it doesn't replace it.\n\n"
        "The Questions Parents Ask\n\n"
        "Will my kid become addicted?\n\n"
        "This is the most common question—and the answer surprises most people: treated kids with ADHD develop substance issues less often as adults than untreated kids. A meta-analysis by Wilens et al. (2003, Pediatrics) showed early stimulant therapy can actually lower later addiction risk—possibly because the untreated ADHD brain seeks other ways to fix its dopamine shortage.\n\n"
        "Research finding: untreated ADHD patients turn to alcohol, cannabis, or other substances more often—likely unconscious self-medication. Proper medical treatment stops exactly that.\n\n"
        "Will my kid turn into a zombie?\n\n"
        "If your kid seems apathetic, emotionless, or constantly down, that usually means the dose is too high—not the medication itself. In that case, the dose should be adjusted. At the right dose, many parents report: \"He's still himself—just calmer and more focused.\"\n\n"
        "Does my kid have to take it forever?\n\n"
        "No. ADHD medications are reassessed regularly—often yearly. Many kids reduce their dose during teenage years or adulthood. Some need it long-term, others don't. That's not failure—that's individualized medicine.\n\n"
        "What Side Effects You Need to Watch For\n\n"
        "Amphetamine-based medications have real side effects. No honest doctor will deny that. What matters is knowing them—not to scare you, but so you know what to look for.\n\n"
        "1. Appetite: Many kids feel less hungry, especially at lunch. Solution: breakfast before the dose, calorie-dense dinner, no restrictions.\n"
        "2. Sleep: Falling asleep can take longer. Talk timing with your doctor—often a small shift is all it takes.\n"
        "3. Heart rate & blood pressure: slightly elevated—which is why regular checkups are mandatory, not optional.\n"
        "4. Growth: Long-term treatment can slightly slow growth. Studies show it usually catches up over time.\n"
        "5. Mood dips when it wears off: When the medication fades (rebound effect), brief irritability or exhaustion can happen. Normal—but worth discussing.\n\n"
        "Here's the key: ADHD meds are one tool—not a cure-all. They work best paired with behavioral therapy, clear structure at home, and an understanding environment. Medication opens a door. What happens next is up to you.\n\n"
        "⚠️ This article informs and is not a substitute for medical advice. ADHD diagnosis and medication belong in professional hands. Talk to a child and adolescent psychiatrist or pediatric neurologist.\n\n"
        "Sources: Wilens, T.E. et al. (2003), Pediatrics, DOI 10.1542/peds.112.1.179 · Frontiers in Psychiatry (2025), DOI 10.3389/fpsyt.2025.1460341 · Child Mind Institute · ADxS.org.",
  ),
  BlogPost(
    slug: 'hitze-training',
    categoryKey: 'seasonal',
    tag: 'Sommer · Juni 2026',
    tagEn: 'Summer · June 2026',
    title: 'Training bei Hitze — warum dein Körper jetzt anders tickt',
    titleEn: "Training in the heat — why your body's playing a different game now",
    teaser:
        'Über 30 Grad, und dein gewohntes Workout fühlt sich an wie doppelt '
        'so schwer. Das ist keine Einbildung — das ist Thermoregulation.',
    teaserEn:
        "Over 30 degrees, and your usual workout feels twice as hard. That's "
        "not weakness—that's thermoregulation.",
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
    contentEn:
        "The first properly hot day in June. You head out like always, run your usual program—and halfway through, you feel like you've done double the work.\n\n"
        "You're not out of shape. Your body just has a second priority.\n\n"
        "When it's hot, your cardiovascular system has to do two things at once: deliver blood to your muscles and shed heat through your skin. Blood literally gets rerouted—more to the surface, less to the muscle. Your heart rate climbs by 10 to 20 beats at the same intensity. That's normal. That's physics.\n\n"
        "On top of that, you lose electrolytes with sweat—sodium, magnesium, potassium. Exactly the minerals your muscles need to contract.\n\n"
        "What actually works in summer:\n\n"
        "1. Move your hard sessions to early morning or late evening. Between noon and 4pm, your body's fighting the sun, not the weight.\n"
        "2. Drink throughout the day, don't wait until you're thirsty. Thirst is already a deficit signal.\n"
        "3. A pinch of salt in your water on longer sessions. Plain water alone can actually dilute your electrolyte loss.\n"
        "4. Reduce volume, not quality. A shorter, clean session beats a long one where your form falls apart in the heat.\n\n"
        "Summer isn't a reason to stop. It's a reason to train smarter. Your body adapts to heat—but only if you give it the chance.",
  ),
  BlogPost(
    slug: 'sommerschlaf-licht',
    categoryKey: 'science',
    tag: 'Schlaf · Juni 2026',
    tagEn: 'Sleep · June 2026',
    title: 'Die längsten Tage des Jahres ruinieren deinen Schlaf — wenn du sie lässt',
    titleEn: 'The longest days of the year will wreck your sleep — unless you take control',
    teaser:
        'Um 21:30 ist es noch hell, um 5:00 wieder. Dein Melatonin kommt da '
        'kaum hinterher. So holst du dir die Sommernächte zurück.',
    teaserEn:
        "It's still light at 9:30 PM, light again at 5:00 AM. Your melatonin can "
        "barely keep up. Here's how to reclaim your summer nights.",
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
    contentEn:
        "In June across central Europe, the sun sets just before 10 PM and rises just after 5 AM. That's beautiful. For your sleep, it's a challenge.\n\n"
        "Melatonin — the hormone that tells your body it's time to sleep — is only released in darkness. As long as light hits your retina, your brain thinks the day isn't over. In midsummer you get that darkness signal hours later than in winter.\n\n"
        "The result: you go to bed at your usual time, but your system is still in day mode. You lie awake, fall asleep later — and that early morning light wakes you up anyway.\n\n"
        "The good news: you can control your light environment, even if you can't control the sun.\n\n"
        "Blackout your room. Blackout curtains or a sleep mask aren't a luxury in summer — they're your most powerful tool. Complete darkness from the moment you get into bed.\n\n"
        "Turn down the screens. The blue light from your phone and laptop mimics exactly the daylight that holds back your melatonin. The hour before sleep belongs to warm, dimmed light.\n\n"
        "Get bright light in the morning. Sounds backward, but it's not: bright morning light pushes your internal clock forward and makes your melatonin arrive on schedule in the evening.\n\n"
        "Summer gives you long evenings. You don't have to pay for them with sleep deprivation.",
  ),
  BlogPost(
    slug: 'grillsaison-ernaehrung',
    categoryKey: 'nutrition',
    tag: 'Ernährung · Juni 2026',
    tagEn: 'Nutrition · June 2026',
    title: 'Grillsaison ohne schlechtes Gewissen — und ohne Ernährungsdogma',
    titleEn: 'Grilling Season Without Guilt — And Without Nutrition Dogma',
    teaser:
        'Grillen ist nicht das Problem. Was meistens daneben liegt, ist es. '
        'Eine entspannte Anleitung für den Sommer.',
    teaserEn:
        "Grilling isn't the problem. What's usually piled around it is. "
        "A relaxed guide for summer.",
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
    contentEn:
        "Grilling gets bad press it doesn't deserve. A piece of meat or fish over open heat is one of the oldest and most honest cooking methods around.\n\n"
        "The problem is rarely what's on the grill. It's what surrounds it: the third bread roll, the store-bought sauce that's half sugar, the chips in between, and the fifth beer.\n\n"
        "Here's what actually matters:\n\n"
        "Your protein is your anchor. Meat, fish, halloumi, tofu — that's the part of your plate that keeps you full and stable. Build the rest around it.\n\n"
        "Add color. Grilled vegetables, a proper salad, fresh herbs. Not for virtue — because fiber and water fill you up before you reach that third roll.\n\n"
        "Carbs on purpose, not by accident. Good bread or a potato salad belong on the plate — but as a choice, not a reflex because the basket happens to be there.\n\n"
        "One thing about charring: heavily blackened spots contain stuff you shouldn't eat daily. One beautifully browned steak a week? Not a drama. Just trim the charred bits generously — that's enough.\n\n"
        "And here's the real thing: A night grilling with friends is more than macros. Shared food, sun, conversation — that counts for your health just as much as the macro split. Eat with intention, enjoy it, don't overthink.",
  ),
  BlogPost(
    slug: 'feiertagsfalle',
    categoryKey: 'fitness',
    tag: 'Pfingsten · Mai 2026',
    tagEn: 'Holiday Trap · May 2026',
    title: 'Feiertagsfalle — was Ruhetage wirklich mit deinem Körper machen',
    titleEn: 'Holiday Trap — what rest days actually do to your body',
    teaser:
        'Pfingsten. Drei Tage frei. Und plötzlich tut der Rücken weh, '
        'obwohl du dich "ausgeruht" hast. Kein Zufall.',
    teaserEn:
        "Whit Sunday. Three days off. And suddenly your back hurts, even though "
        "you've been \"resting.\" No accident.",
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
    contentEn:
        "Whit Sunday is amazing. Three days. Family. Food. Maybe one glass too much wine Sunday night.\n\n"
        "Then Tuesday morning: your back hurts. Your knees crack on your first step out of bed. You feel stiffer than Friday—even though you took a break.\n\n"
        "What happened?\n\n"
        "Your body isn't a machine you can just switch off. It's a system built for movement. Three days of inactivity—more sitting, more lying down, less walking than usual—and your small stabilizers around your spine, hips, and knees simply shift into energy-saving mode.\n\n"
        "Your fascia tissue contracts. The synovial fluid in your joints gets distributed less. Your body briefly forgets how to hold itself optimally.\n\n"
        "What you can do instead:\n\n"
        "1. Every holiday: 20 minutes of movement. No sport. Just walk, stretch, a few squats.\n"
        "2. Drink intentionally—water, not just prosecco. Fascia needs fluid.\n"
        "3. Don't spend your first hour after waking on the couch.\n\n"
        "You're fundamentally an animal. Animals rest briefly. Then they move again. That's not a criticism—that's biology.",
  ),
  BlogPost(
    slug: 'fruehjahrsmuedigkeit',
    categoryKey: 'nutrition',
    tag: 'Frühling · Mai 2026',
    tagEn: 'Spring · May 2026',
    title: 'Frühjahrsmüdigkeit ist kein Mythos. Hier ist der Fix.',
    titleEn: "Spring fatigue isn't a myth. Here's the fix.",
    teaser:
        'Die Sonne scheint, alles blüht — und du willst nur schlafen. '
        'Dein Körper steckt mitten in einer hormonellen Zeitumstellung.',
    teaserEn:
        "The sun's out, everything's blooming — and you just want to sleep. "
        "Your body's in the middle of a hormonal time shift.",
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
    contentEn:
        "Spring fatigue sounds like an excuse. It's not.\n\n"
        "What's actually happening: Your body produces more melatonin in winter — the sleep hormone. As daylight increases in spring, production slows, but the system takes weeks to adjust. At the same time, serotonin demand rises. The result: you feel tired even though you're sleeping.\n\n"
        "Add to that: after winter, many people run low on vitamin D, iron, and magnesium. Not dramatic — but enough to feel drained.\n\n"
        "The fix isn't complicated:\n\n"
        "Morning daylight. At least 10 minutes outside within the first hour after waking. It resets your internal clock faster than any coffee.\n\n"
        "Iron-rich foods: spinach, lentils, red meat if you tolerate it. Not as a diet — as a conscious boost for 2–3 weeks.\n\n"
        "Movement over caffeine. A 15-minute walk at 2pm beats the afternoon espresso. Scientifically. Seriously.\n\n"
        "And yes — sometimes it's just the weather. That's allowed. But if the fatigue is still there after two weeks of spring, get a blood panel done.",
  ),
  BlogPost(
    slug: 'ruecken-montag',
    categoryKey: 'mindbody',
    tag: 'Gesundheit · Mai 2026',
    tagEn: 'Health · May 2026',
    title: 'Warum dein Rücken nach dem Wochenende schlimmer ist als freitags',
    titleEn: 'Why your back feels worse after the weekend than on Friday',
    teaser:
        'Montag ist der häufigste Tag für Rückenschmerzen. Das ist kein Zufall — '
        'und es liegt nicht am Job.',
    teaserEn:
        "Monday is the most common day for back pain. That's not a coincidence — "
        "and it's not about your job.",
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
    contentEn:
        "Statistically, most people report back pain on Mondays. It's well documented and was long blamed on the stress of getting back to work.\n\n"
        "The reality is more straightforward: the weekend is the problem.\n\n"
        "Saturday and Sunday mean for most people: more sitting, different sitting positions (couch instead of office chair), less regular movement, more unusual strain (gardening, helping someone move, long car drives) and worse sleep from changed sleep times.\n\n"
        "The small back muscles — especially the multifidus — lose their tonic activation over the weekend. They need regular, low-threshold stimulation to stabilize your spine. Two days on the couch are enough to reduce that noticeably.\n\n"
        "What actually helps:\n\n"
        "Every morning — including Saturdays and Sundays — 5 minutes: Cat-Cow, Bird-Dog, Dead Bug. No workout. Just activation.\n\n"
        "Pay attention to how you sit on the couch. If you're sitting, sit upright. Or on the floor. Or switch between them.\n\n"
        "And when your back hurts again on Monday: it's not your job. It's the weekend. Start changing that.",
  ),
  BlogPost(
    slug: 'schlaf-training',
    categoryKey: 'science',
    tag: 'Wissenschaft · April 2026',
    tagEn: 'Science · April 2026',
    title: 'Schlaf ist kein Luxus — er ist das halbe Training',
    titleEn: "Sleep isn't a luxury — it's half your training",
    teaser:
        'Neue Studien zeigen: Wer unter 7 Stunden schläft, verliert einen signifikanten '
        'Teil seiner Trainingsadaptation. Der Körper baut sich nachts, nicht im Gym.',
    teaserEn:
        "New research shows: sleep under 7 hours and you lose a significant chunk "
        "of your training gains. Your body builds itself at night, not in the gym.",
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
    contentEn:
        "You train hard. You eat clean. You're doing everything right.\n\n"
        "And you're sleeping 5.5 hours a night.\n\n"
        "Then you're working against yourself.\n\n"
        "While you sleep, the heavy lifting happens: muscles get repaired and built, growth hormone gets released (80% of it at night), your nervous system recovers, inflammation gets controlled, movement patterns get locked into memory.\n\n"
        "A 2023 study (University of Chicago & Stanford) found this: people sleeping under 7 hours lost 55% less fat mass and built 40% less muscle after 6 weeks of identical training compared to the 8+ hour group. Same workouts. Different outcomes.\n\n"
        "That's not a small difference. That's almost half your results gone.\n\n"
        "What that means for you:\n\n"
        "If you're training 3x a week on 6 hours of sleep, you're effectively training like someone doing 1.5x a week on 8 hours.\n\n"
        "Prioritizing sleep isn't weakness. It's the smartest thing you can do for your training. And it's free.",
  ),
  BlogPost(
    slug: 'protein-mythen',
    categoryKey: 'nutrition',
    tag: 'Ernährung · April 2026',
    tagEn: 'Nutrition · April 2026',
    title: '3 Protein-Mythen die sich hartnäckig halten — und die Wahrheit dahinter',
    titleEn: "3 Protein Myths That Won't Die — and the Truth Behind Them",
    teaser:
        '"Du musst gleich nach dem Training Protein essen." '
        '"Mehr als 30g kann der Körper nicht verwerten." '
        '"Ohne Shakes geht kein Muskelaufbau." Alles falsch.',
    teaserEn:
        "\"You must eat protein right after training.\" \"Your body can only "
        "process 30g per meal.\" \"You can't build muscle without shakes.\" All wrong.",
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
    contentEn:
        "The fitness industry lives on protein fear. The more confusion, the more products it sells.\n\n"
        "Here are three of the most persistent myths — and what the research actually says:\n\n"
        "Myth 1: The anabolic window exists and closes 30 minutes after training.\n\n"
        "Reality: The window is closer to 4–6 hours. If you ate before training, the exact timing after doesn't matter much. Relax.\n\n"
        "Myth 2: Your body can only process 30g of protein per meal.\n\n"
        "Reality: Your body processes everything you eat — it just takes longer. Larger protein amounts are simply absorbed more slowly. For muscle building, total protein over the day is what matters, not how you divide it up.\n\n"
        "Myth 3: Without protein shakes, serious muscle building isn't possible.\n\n"
        "Reality: Whole foods work just as well. 200g cottage cheese, 3 eggs, 150g salmon — that's 50g+ of protein without a single shake.\n\n"
        "What actually counts: Total protein over the day (1.6–2.2g per kg of body weight), quality of sources, and enough calories overall.",
  ),
  BlogPost(
    slug: 'meditation-anfaenger',
    categoryKey: 'mindbody',
    tag: 'Mind-Body · März 2026',
    tagEn: 'Mind-Body · March 2026',
    title: 'Meditation für Menschen die Meditation hassen',
    titleEn: 'Meditation for people who hate meditation',
    teaser:
        'Du musst nicht auf einem Kissen sitzen und "Om" sagen. '
        'Hier sind 3 Formen mentaler Stille die auch für Zyniker funktionieren.',
    teaserEn:
        "You don't need to sit on a cushion and chant \"Om.\" Here are 3 forms "
        "of mental stillness that work even for cynics.",
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
    contentEn:
        "I know what you're thinking. Meditation isn't for you. Too esoteric. Too still. You're not someone who just sits there.\n\n"
        "That's okay. Classic sitting meditation is one of many forms — and not necessarily the most accessible one.\n\n"
        "Here are three variations that actually work, even if you think meditation is stupid:\n\n"
        "1. Walking Meditation\n\n"
        "15 minutes of walking. No podcast, no music, no phone. Focus on your steps, your breath, what you see. That's meditation. Done.\n\n"
        "2. Body Scan on waking\n\n"
        "Before you jump out of bed: 2 minutes. Where do you feel tension? What feels good? No judgment. Just observation. Your brain learns to sense your body — and that has direct effects on your stress responses all day long.\n\n"
        "3. Box Breathing\n\n"
        "4 seconds in. 4 hold. 4 out. 4 hold. Three times. Total time: 48 seconds.\n\n"
        "Used by Navy SEALs. No spirituality. Pure neurology.\n\n"
        "Start with one of these three. Give it 2 weeks. Then decide if meditation really isn't for you.",
  ),
];

List<BlogPost> getPostsByCategory(String categoryKey) {
  if (categoryKey == 'all') return blogPosts;
  return blogPosts.where((p) => p.categoryKey == categoryKey).toList();
}

BlogPost? getPostBySlug(String slug) {
  try {
    return blogPosts.firstWhere((p) => p.slug == slug);
  } catch (_) {
    return null;
  }
}
