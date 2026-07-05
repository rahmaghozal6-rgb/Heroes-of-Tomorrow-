import '../models/scenario_model.dart';

// ===== اختبار أولي =====
final List<ScenarioModel> preTestData = [
  ScenarioModel(
    id: 'test_initial_1', titleAr: 'رفض المجموعة', titleEn: 'Group Rejection', mode: 'test',
    scenes: [SceneModel(
      textAr: 'ياسمين راحت تلعب مع مجموعة بنات بيرسموا، فقالت لها وحدة منهم بصوت حاد: مش هنلعب معاكي، إحنا أربعة بس! ياسمين وقفت بعيد وحست بالزعل. تفتكري يا بطلة لو كنتي مكان ياسمين، هتعملي إيه؟',
      textEn: 'Yasmin went to join girls drawing, and one of them said sharply: We won\'t play with you, we\'re already four! Yasmin stood far feeling sad. If you were Yasmin, hero, what would you do?',
      image: 'assets/images/tests/test_initial_1.png',
    )], questionSceneIndex: 0,
  ),
  ScenarioModel(
    id: 'test_initial_2', titleAr: 'أخذ المسطرة', titleEn: 'Taking the Ruler', mode: 'test',
    scenes: [SceneModel(
      textAr: 'كان معاك مسطرة جديدة حلوة، وزميلك أخدها منك وقالك بصوت عالي: دي بقت بتاعتي دلوقتي! ومستحملش يرجعها. حسيت بالظلم. تفتكر يا بطل لو كنت أنت، هتعمل إيه؟',
      textEn: 'You had a nice new ruler, and your classmate took it and said loudly: It\'s mine now! refusing to give it back. You felt this was unfair. If you were there, hero, what would you do?',
      image: 'assets/images/tests/test_initial_2.jpg',
    )], questionSceneIndex: 0,
  ),
  ScenarioModel(
    id: 'test_initial_3', titleAr: 'برج المكعبات', titleEn: 'Block Tower', mode: 'test',
    scenes: [SceneModel(
      textAr: 'كنت بتبني برج عالي من المكعبات بكل جهدك من نص ساعة، وقبل ما تخلصه بشوية وقع كل حاجة على الأرض! حسيت بإحباط شديد. تفتكر يا بطل لو كنت أنت، هتعمل إيه؟',
      textEn: 'You spent half an hour building a tall block tower, and right before finishing it all fell down! You felt very frustrated. If you were there, hero, what would you do?',
      image: 'assets/images/tests/test_initial_3.jpg',
    )], questionSceneIndex: 0,
  ),
  ScenarioModel(
    id: 'test_initial_4', titleAr: 'الشوكولاتة', titleEn: 'The Chocolate', mode: 'test',
    scenes: [SceneModel(
      textAr: 'المدرسة كانت بتوزع شوكولاتة على الفصل، وفجأة خلصت قبل ما توصلك! كل زمايلك أخدوا وأنت بس ماخدتش. حسيت إن ده مش عدل. تفتكري يا بطلة لو كنتي أنتي، هتعملي إيه؟',
      textEn: 'The teacher was giving chocolate to the class, and it ran out before reaching you! Everyone else got some except you. You felt this wasn\'t fair. If you were there, hero, what would you do?',
      image: 'assets/images/tests/test_initial_4.jpg',
    )], questionSceneIndex: 0,
  ),
  ScenarioModel(
    id: 'test_initial_5', titleAr: 'الانضمام للمجموعة', titleEn: 'Joining the Group', mode: 'test',
    scenes: [SceneModel(
      textAr: 'في الفسحة، شفت مجموعة أطفال جداد بيلعبوا لعبة حلوة ونفسك تنضم لهم، بس ميعرفوكش ومش عارف هيرحبوا بيك ولا لأ. تفتكر يا بطل لو كنت أنت، هتعمل إيه عشان تلعب معاهم؟',
      textEn: 'At recess, you saw new kids playing a fun game and wanted to join, but they don\'t know you. If you were there, hero, what would you do to play with them?',
      image: 'assets/images/tests/test_initial_5.jpg',
    )], questionSceneIndex: 0,
  ),
  ScenarioModel(
    id: 'test_initial_6', titleAr: 'الانتظار', titleEn: 'Waiting', mode: 'test',
    scenes: [SceneModel(
      textAr: 'كنت واقف تنتظر دورك على المرجيحة، وصاحبك قاعد عليها من وقت طويل وكل ما تقوله جاهز يقولك دقيقة واحدة بس ومستمر. تفتكري يا بطلة لو كنتي أنتي، هتعملي إيه؟',
      textEn: 'You were waiting your turn for the swing, and your friend had been on it for a long time, always saying one more minute. If you were there, hero, what would you do?',
      image: 'assets/images/tests/test_initial_6.jpg',
    )], questionSceneIndex: 0,
  ),
  ScenarioModel(
    id: 'test_initial_7', titleAr: 'الإحراج', titleEn: 'Embarrassment', mode: 'test',
    scenes: [SceneModel(
      textAr: 'في الفصل، اتنين من زمايلك ضحكوا عليك عشان لبست قميصك بطريقة غلط من غير قصد. حسيت بالخجل والزعل قدام كل الفصل. تفتكر يا بطل لو كنت أنت، هتعمل إيه؟',
      textEn: 'In class, two classmates laughed at you because you accidentally wore your shirt the wrong way. You felt embarrassed in front of everyone. If you were there, hero, what would you do?',
      image: 'assets/images/tests/test_initial_7.jpg',
    )], questionSceneIndex: 0,
  ),
  ScenarioModel(
    id: 'test_initial_8', titleAr: 'نسيان الواجب', titleEn: 'Forgotten Homework', mode: 'test',
    scenes: [SceneModel(
      textAr: 'وصلت المدرسة وفتحت شنطتك عشان تاخد الواجب، واكتشفت إنك نسيته في البيت! المعلمة هتسأل عنه كمان شوية. تفتكري يا بطلة لو كنتي أنتي، هتعملي إيه؟',
      textEn: 'You arrived at school and discovered you forgot your homework at home! The teacher will ask soon. If you were there, hero, what would you do?',
      image: 'assets/images/tests/test_initial_8.jpg',
    )], questionSceneIndex: 0,
  ),
  ScenarioModel(
    id: 'test_initial_9', titleAr: 'الرسمة المكسورة', titleEn: 'Broken Drawing', mode: 'test',
    scenes: [SceneModel(
      textAr: 'أخوك الصغير دخل أوضتك وكسر رسمة كنت تعبت فيها كتير وكانت مهمة لك جداً. حسيت بزعل شديد. تفتكر يا بطل لو كنت أنت، هتعمل إيه؟',
      textEn: 'Your little brother went into your room and broke a drawing you\'d worked hard on. You felt very upset. If you were there, hero, what would you do?',
      image: 'assets/images/tests/test_initial_9.png',
    )], questionSceneIndex: 0,
  ),
  ScenarioModel(
    id: 'test_initial_10', titleAr: 'العصير المسكوب', titleEn: 'Spilled Juice', mode: 'test',
    scenes: [SceneModel(
      textAr: 'وأنت بتاكل في السفرة، وقعت كوب العصير بالغلط على الترابيزة وانسكب على كل حاجة. حسيت بالخوف من رد فعل ماما أو بابا. تفتكري يا بطلة لو كنتي أنتي، هتعملي إيه؟',
      textEn: 'While eating, you accidentally knocked over a juice cup and it spilled everywhere. You felt scared about your parents\' reaction. If you were there, hero, what would you do?',
      image: 'assets/images/tests/test_initial_10.png',
    )], questionSceneIndex: 0,
  ),
];

// ===== اختبار نهائي =====
final List<ScenarioModel> postTestData = [
  ScenarioModel(
    id: 'test_final_1', titleAr: 'رفض الفريق', titleEn: 'Team Rejection', mode: 'test',
    scenes: [SceneModel(
      textAr: 'حسن قعد جنب مجموعة أولاد بيلعبوا بالكور، فقال له واحد منهم بصوت حاد: لأ، إحنا فريقنا كامل خلاص! حسن وقف بعيد وحس بالزعل. تفتكر يا بطل لو كنت أنت مكان حسن، هتعمل إيه؟',
      textEn: 'Hassan sat next to boys playing marbles, and one said sharply: No, our team is full! Hassan stood far feeling sad. If you were Hassan, hero, what would you do?',
      image: 'assets/images/tests/test_final_1.png',
    )], questionSceneIndex: 0,
  ),
  ScenarioModel(
    id: 'test_final_2', titleAr: 'أخذ الألوان', titleEn: 'Taking the Crayons', mode: 'test',
    scenes: [SceneModel(
      textAr: 'كان معاك ألوان جديدة حلوة، وزميلتك أخدت لون منهم وقالتلك بصوت عالي: ده بقى بتاعي دلوقتي! ومستحملتش ترجعه. حسيت بالظلم. تفتكري يا بطلة لو كنتي أنتي، هتعملي إيه؟',
      textEn: 'You had new crayons, and your classmate took one and said loudly: It\'s mine now! refusing to give it back. If you were there, hero, what would you do?',
      image: 'assets/images/tests/test_final_2.png',
    )], questionSceneIndex: 0,
  ),
  ScenarioModel(
    id: 'test_final_3', titleAr: 'الرسمة المتوسخة', titleEn: 'Ruined Drawing', mode: 'test',
    scenes: [SceneModel(
      textAr: 'كنت بترسم رسمة جميلة بكل تركيزك من نص ساعة، وقبل ما تخلصها بشوية، القلم زلق ووسخ الرسمة كلها! حسيت بإحباط شديد. تفتكر يا بطل لو كنت أنت، هتعمل إيه؟',
      textEn: 'You spent half an hour drawing, and right before finishing, the pen slipped and messed it all up! You felt very frustrated. If you were there, hero, what would you do?',
      image: 'assets/images/tests/test_final_3.jpg',
    )], questionSceneIndex: 0,
  ),
  ScenarioModel(
    id: 'test_final_4', titleAr: 'الاستيكرات', titleEn: 'The Stickers', mode: 'test',
    scenes: [SceneModel(
      textAr: 'المعلمة كانت بتوزع استيكرات على اللي خلصوا الواجب، وفجأة خلصت قبل ما توصلك، مع إنك خلصت واجبك زي الباقيين! تفتكري يا بطلة لو كنتي أنتي، هتعملي إيه؟',
      textEn: 'The teacher was giving stickers to those who finished homework, and they ran out before reaching you, even though you finished too! If you were there, hero, what would you do?',
      image: 'assets/images/tests/test_final_4.jpg',
    )], questionSceneIndex: 0,
  ),
  ScenarioModel(
    id: 'test_final_5', titleAr: 'كورة القدم', titleEn: 'Football', mode: 'test',
    scenes: [SceneModel(
      textAr: 'في النادي، شفت مجموعة أطفال جداد بيلعبوا كورة قدم ونفسك تنضم لهم، بس ميعرفوكش ومش عارف هيرحبوا بيك ولا لأ. تفتكر يا بطل لو كنت أنت، هتعمل إيه؟',
      textEn: 'At the club, you saw new kids playing football and wanted to join, but they don\'t know you. If you were there, hero, what would you do?',
      image: 'assets/images/tests/test_final_5.jpg',
    )], questionSceneIndex: 0,
  ),
  ScenarioModel(
    id: 'test_final_6', titleAr: 'الزحليقة', titleEn: 'The Slide', mode: 'test',
    scenes: [SceneModel(
      textAr: 'كنت واقفة تنتظري دورك على الزحليقة، وصاحبتك قاعدة عليها من وقت طويل وكل ما تقوليلها جاهزة تقولك دقيقة واحدة بس. تفتكري يا بطلة لو كنتي أنتي، هتعملي إيه؟',
      textEn: 'You were waiting your turn for the slide, and your friend had been on it a long time. If you were there, hero, what would you do?',
      image: 'assets/images/tests/test_final_6.jpg',
    )], questionSceneIndex: 0,
  ),
  ScenarioModel(
    id: 'test_final_7', titleAr: 'السقوط', titleEn: 'The Fall', mode: 'test',
    scenes: [SceneModel(
      textAr: 'في الفصل، اتنين من زمايلك ضحكوا عليك عشان وقعت على الأرض بالغلط وأنت داخل. حسيت بالخجل والزعل قدام كل الفصل. تفتكر يا بطل لو كنت أنت، هتعمل إيه؟',
      textEn: 'In class, two classmates laughed at you because you accidentally fell while walking in. You felt embarrassed. If you were there, hero, what would you do?',
      image: 'assets/images/tests/test_final_7.png',
    )], questionSceneIndex: 0,
  ),
  ScenarioModel(
    id: 'test_final_8', titleAr: 'كتاب القراءة', titleEn: 'Reading Book', mode: 'test',
    scenes: [SceneModel(
      textAr: 'وصلتي المدرسة وفتحتي شنطتك عشان تاخدي كتاب القراءة، واكتشفتي إنك نسيتيه في البيت! المعلمة هتسأل عنه كمان شوية. تفتكري يا بطلة لو كنتي أنتي، هتعملي إيه؟',
      textEn: 'You arrived at school and discovered you forgot your reading book at home! The teacher will ask soon. If you were there, hero, what would you do?',
      image: 'assets/images/tests/test_final_8.png',
    )], questionSceneIndex: 0,
  ),
  ScenarioModel(
    id: 'test_final_9', titleAr: 'برج الليجو', titleEn: 'Lego Tower', mode: 'test',
    scenes: [SceneModel(
      textAr: 'أختك الصغيرة دخلت أوضتك وخربت برج الليجو اللي كنت بنيته بكل صبر وكان مهم لك جداً. حسيت بزعل شديد. تفتكر يا بطل لو كنت أنت، هتعمل إيه؟',
      textEn: 'Your little sister went into your room and destroyed the Lego tower you patiently built. You felt very upset. If you were there, hero, what would you do?',
      image: 'assets/images/tests/test_final_9.png',
    )], questionSceneIndex: 0,
  ),
  ScenarioModel(
    id: 'test_final_10', titleAr: 'الأرز المسكوب', titleEn: 'Spilled Rice', mode: 'test',
    scenes: [SceneModel(
      textAr: 'وأنت بتاكل في السفرة، وقع منك صحن الأرز بالغلط على الترابيزة وانسكب على كل حاجة. حسيتي بالخوف من رد فعل ماما أو بابا. تفتكري يا بطلة لو كنتي أنتي، هتعملي إيه؟',
      textEn: 'While eating, you accidentally knocked over your rice plate and it spilled everywhere. You felt scared of your parents\' reaction. If you were there, hero, what would you do?',
      image: 'assets/images/tests/test_final_10.jpg',
    )], questionSceneIndex: 0,
  ),
];

// ===== اختبار قصير 1 =====
final List<ScenarioModel> quiz1Data = [
  ScenarioModel(
    id: 'quiz1_q1', titleAr: 'المسطرة', titleEn: 'Ruler', mode: 'test',
    scenes: [SceneModel(
      textAr: 'زميلك في الفصل أخد المسطرة بتاعتك وقالك بصوت عالي: دي بقت بتاعتي دلوقتي! ومستحملش يرجعها. تفتكر يا بطل لو كنت أنت، هتعمل إيه؟',
      textEn: 'Your classmate took your ruler and said loudly: It\'s mine now! refusing to give it back. If you were there, hero, what would you do?',
      image: 'assets/images/tests/quiz1_q1.jpg',
    )], questionSceneIndex: 0,
  ),
  ScenarioModel(
    id: 'quiz1_q2', titleAr: 'الصديق الساكت', titleEn: 'Quiet Friend', mode: 'test',
    scenes: [SceneModel(
      textAr: 'صاحبك في الفصل كان بيضحك وبيتكلم زي العادة، بس فجأة بقى ساكت وبيبص للأرض ومش بيرد عليك. تفتكري يا بطلة لو كنتي أنتي، هتعملي إيه عشان تفهمي السبب؟',
      textEn: 'Your friend was talking and laughing as usual, but suddenly went quiet, looked down, and didn\'t respond. If you were there, hero, what would you do to understand why?',
      image: 'assets/images/tests/quiz1_q2.jpg',
    )], questionSceneIndex: 0,
  ),
  ScenarioModel(
    id: 'quiz1_q3', titleAr: 'الكوباية', titleEn: 'The Cup', mode: 'test',
    scenes: [SceneModel(
      textAr: 'وأنت قاعد بتاكل، إيدك زاحت بالغلط على كوباية أخوك الصغير ووقعت منه، وهو زعل وفكر إنك عملت ده عمداً. تفتكر يا بطل لو كنت أنت، هتعمل إيه؟',
      textEn: 'While eating, your hand accidentally bumped your little brother\'s cup and it fell, and he got upset thinking you did it on purpose. If you were there, hero, what would you do?',
      image: 'assets/images/tests/quiz1_q3.png',
    )], questionSceneIndex: 0,
  ),
  ScenarioModel(
    id: 'quiz1_q4', titleAr: 'الانعزال', titleEn: 'Isolation', mode: 'test',
    scenes: [SceneModel(
      textAr: 'في الفسحة، كل الأطفال بيلعبوا في جروبات، وزميلك قاعد في ركن لوحده مش بيحاول يلعب مع حد. تفتكري يا بطلة لو كنتي أنتي، هتعملي إيه؟',
      textEn: 'At recess, all kids are playing in groups, and your classmate is sitting alone in a corner. If you were there, hero, what would you do?',
      image: 'assets/images/tests/quiz1_q4.jpg',
    )], questionSceneIndex: 0,
  ),
  ScenarioModel(
    id: 'quiz1_q5', titleAr: 'الأخت الصغيرة', titleEn: 'Little Sister', mode: 'test',
    scenes: [SceneModel(
      textAr: 'أختك الصغيرة اللي عمرها 3 سنين أخدت لعبتك المفضلة من غير ما تفهم إنها بتضايقك، وقاعدة تلعب بيها فرحانة جداً. تفتكر يا بطل لو كنت أنت، هتعمل إيه؟',
      textEn: 'Your 3-year-old sister took your favorite toy without understanding she\'s bothering you, playing with it happily. If you were there, hero, what would you do?',
      image: 'assets/images/tests/quiz1_q5.jpg',
    )], questionSceneIndex: 0,
  ),
];

// ===== اختبار قصير 2 =====
final List<ScenarioModel> quiz2Data = [
  ScenarioModel(
    id: 'quiz2_q1', titleAr: 'الحفلة المزدحمة', titleEn: 'Crowded Party', mode: 'test',
    scenes: [SceneModel(
      textAr: 'كنت في حفلة كبيرة فيها زحمة ناس كتير، وفجأة لما بصيت حواليك ملقيتش بابا أو ماما. حسيت بالخوف. تفتكر يا بطل لو كنت أنت، هتعمل إيه؟',
      textEn: 'You were at a big crowded party, and suddenly you couldn\'t find mom or dad. You felt scared. If you were there, hero, what would you do?',
      image: 'assets/images/tests/quiz2_q1.jpg',
    )], questionSceneIndex: 0,
  ),
  ScenarioModel(
    id: 'quiz2_q2', titleAr: 'السقوط على السلم', titleEn: 'Stair Fall', mode: 'test',
    scenes: [SceneModel(
      textAr: 'صاحبتك كانت بتنزل من على السلم وانزلقت ووقعت ومسكت رجلها وبتعيط من الألم بصوت عالي. تفتكري يا بطلة لو كنتي أنتي، هتعملي إيه؟',
      textEn: 'Your friend was going down the stairs and slipped, fell, and is crying loudly from pain. If you were there, hero, what would you do?',
      image: 'assets/images/tests/quiz2_q2.jpg',
    )], questionSceneIndex: 0,
  ),
  ScenarioModel(
    id: 'quiz2_q3', titleAr: 'الشارع الغريب', titleEn: 'Unfamiliar Street', mode: 'test',
    scenes: [SceneModel(
      textAr: 'رحت تتمشى مع عيلتك في مكان جديد، وانشغلت بحاجة شدت نظرك، وبعدين لقيت نفسك في شارع مش عارف ترجع منه لعيلتك. تفتكر يا بطل لو كنت أنت، هتعمل إيه؟',
      textEn: 'You were walking with your family in a new place, got distracted, and then found yourself on a street not knowing how to get back to your family. If you were there, hero, what would you do?',
      image: 'assets/images/tests/quiz2_q3.jpg',
    )], questionSceneIndex: 0,
  ),
  ScenarioModel(
    id: 'quiz2_q4', titleAr: 'الإصابة المخفية', titleEn: 'Hidden Injury', mode: 'test',
    scenes: [SceneModel(
      textAr: 'صاحبك كان بيلعب جنبك وقال لك بصوت هادي: إيدي بتوجعني شوية من امبارح، بس استمر يلعب من غير ما يقول لحد. تفتكري يا بطلة لو كنتي أنتي، هتعملي إيه؟',
      textEn: 'Your friend was playing next to you and said quietly: My arm hurts a bit from yesterday, but kept playing without telling anyone. If you were there, hero, what would you do?',
      image: 'assets/images/tests/quiz2_q4.jpg',
    )], questionSceneIndex: 0,
  ),
  ScenarioModel(
    id: 'quiz2_q5', titleAr: 'السوق', titleEn: 'The Market', mode: 'test',
    scenes: [SceneModel(
      textAr: 'كنت بتتمشى مع أختك الكبيرة في السوق، وفي لحظة لقيتها مش جنبك، وأنت معرفش الطريق للبيت لوحدك. تفتكر يا بطل لو كنت أنت، هتعمل إيه؟',
      textEn: 'You were walking with your older sister at the market, and suddenly she wasn\'t next to you, and you don\'t know the way home alone. If you were there, hero, what would you do?',
      image: 'assets/images/tests/quiz2_q5.jpg',
    )], questionSceneIndex: 0,
  ),
];

// ===== اختبار قصير 3 =====
final List<ScenarioModel> quiz3Data = [
  ScenarioModel(
    id: 'quiz3_q1', titleAr: 'المزهرية', titleEn: 'The Vase', mode: 'test',
    scenes: [SceneModel(
      textAr: 'كنت بتلعب بالكرة في الصالة، وبالغلط ضربت بيها مزهرية ماما واتكسرت قدام عينيك. حسيت بالخوف. تفتكر يا بطل لو كنت أنت، هتعمل إيه؟',
      textEn: 'You were playing ball in the living room, and accidentally hit mom\'s vase and it broke. You felt scared. If you were there, hero, what would you do?',
      image: 'assets/images/tests/quiz3_q1.jpg',
    )], questionSceneIndex: 0,
  ),
  ScenarioModel(
    id: 'quiz3_q2', titleAr: 'الكلب الخائف', titleEn: 'Scared Dog', mode: 'test',
    scenes: [SceneModel(
      textAr: 'شفت كلب صغير لطيف في الشارع ونفسك تلعب معاه، فجريت بسرعة وصوت عالي ناحيته من الفرحة، فخاف وهرب بعيد. تفتكري يا بطلة لو كنتي أنتي، هتعملي إيه تاني مرة؟',
      textEn: 'You saw a cute small dog and wanted to play, so you ran towards it quickly and loudly, and it got scared and ran away. If you were there, hero, what would you do differently?',
      image: 'assets/images/tests/quiz3_q2.jpg',
    )], questionSceneIndex: 0,
  ),
  ScenarioModel(
    id: 'quiz3_q3', titleAr: 'لعبة الأخ', titleEn: "Brother's Toy", mode: 'test',
    scenes: [SceneModel(
      textAr: 'كنت بترتب أوضتك ولقيت لعبة أخوك على الأرض، وأنت بتمشي وقعت عليها بالغلط وانكسرت، ومحدش شافك. تفتكر يا بطل لو كنت أنت، هتعمل إيه؟',
      textEn: 'You were tidying your room and accidentally stepped on your brother\'s toy and it broke, and no one saw you. If you were there, hero, what would you do?',
      image: 'assets/images/tests/quiz3_q3.png',
    )], questionSceneIndex: 0,
  ),
  ScenarioModel(
    id: 'quiz3_q4', titleAr: 'الطفل الجديد', titleEn: 'New Kid', mode: 'test',
    scenes: [SceneModel(
      textAr: 'كان فيه طفل جديد في الفصل ميعرفش حد، فقعدت جنبه وبدأت تتكلم معاه عن كل حاجة بسرعة ومن غير ما تسكت، فاستغرب وابتعد عنك. تفتكري يا بطلة لو كنتي أنتي، هتعملي إيه؟',
      textEn: 'There was a new kid in class who didn\'t know anyone, so you started talking quickly without stopping, and he looked confused and stepped away. If you were there, hero, what would you do?',
      image: 'assets/images/tests/quiz3_q4.jpg',
    )], questionSceneIndex: 0,
  ),
  ScenarioModel(
    id: 'quiz3_q5', titleAr: 'لعبة صاحبك', titleEn: "Friend's Toy", mode: 'test',
    scenes: [SceneModel(
      textAr: 'كنت بتلعب في بيت صاحبك، وبالغلط وقعت لعبته المفضلة وانكسرت. حسيت بالخوف من رد فعله. تفتكر يا بطل لو كنت أنت، هتعمل إيه؟',
      textEn: 'You were playing at your friend\'s house, and accidentally dropped his favorite toy and it broke. You felt scared. If you were there, hero, what would you do?',
      image: 'assets/images/tests/quiz3_q5.jpg',
    )], questionSceneIndex: 0,
  ),
];

// ===== اختبار قصير 4 =====
final List<ScenarioModel> quiz4Data = [
  ScenarioModel(
    id: 'quiz4_q1', titleAr: 'قلق الامتحان', titleEn: 'Exam Anxiety', mode: 'test',
    scenes: [SceneModel(
      textAr: 'عندك امتحان رياضيات بكرة وحسيت إنك قلقان جداً ومش فاكر حاجة من اللي ذاكرته، وبدأ قلبك يدق بسرعة. تفتكر يا بطل لو كنت أنت، هتعمل إيه؟',
      textEn: 'You have a math test tomorrow and feel very anxious, like you can\'t remember anything you studied. If you were there, hero, what would you do?',
      image: 'assets/images/tests/quiz4_q1.jpg',
    )], questionSceneIndex: 0,
  ),
  ScenarioModel(
    id: 'quiz4_q2', titleAr: 'الغريب بالهدية', titleEn: 'Stranger with Gift', mode: 'test',
    scenes: [SceneModel(
      textAr: 'كنت واقف قدام البيت تستنى صاحبك، وجه واحد غريب ميعرفك معاه لعبة حلوة، وقالك: تعالى هاديك اللعبة دي هدية. تفتكري يا بطلة لو كنتي أنتي، هتعملي إيه فوراً؟',
      textEn: 'You were standing in front of your house, and a stranger came with a toy and said: Come here, I\'ll give you this toy as a gift. If you were there, hero, what would you do right away?',
      image: 'assets/images/tests/quiz4_q2.jpg',
    )], questionSceneIndex: 0,
  ),
  ScenarioModel(
    id: 'quiz4_q3', titleAr: 'قلق الأداء', titleEn: 'Performance Anxiety', mode: 'test',
    scenes: [SceneModel(
      textAr: 'النهارده عندك حفلة في المدرسة وهتقف تتكلم قدام كل زمايلك وأولياء أمورهم، وحسيت إنك خايف جداً ورجليك بترعش. تفتكر يا بطل لو كنت أنت، هتعمل إيه؟',
      textEn: 'Today you have a school event and you\'ll speak in front of all your classmates and parents, and you feel very scared with shaky legs. If you were there, hero, what would you do?',
      image: 'assets/images/tests/quiz4_q3.png',
    )], questionSceneIndex: 0,
  ),
  ScenarioModel(
    id: 'quiz4_q4', titleAr: 'الغريب بالسيارة', titleEn: 'Stranger in Car', mode: 'test',
    scenes: [SceneModel(
      textAr: 'كنت بتلعب في حديقة المبنى، وسيارة وقفت جنبك وراكبها شخص ميعرفوش حد، وقالك: ممكن تساعدني، تعالى وريني الطريق؟ تفتكري يا بطلة لو كنتي أنتي، هتعملي إيه؟',
      textEn: 'You were playing in the garden, and a car stopped near you with a stranger who said: Can you help me, come show me the way? If you were there, hero, what would you do?',
      image: 'assets/images/tests/quiz4_q4.jpg',
    )], questionSceneIndex: 0,
  ),
  ScenarioModel(
    id: 'quiz4_q5', titleAr: 'قلق المباراة', titleEn: 'Match Anxiety', mode: 'test',
    scenes: [SceneModel(
      textAr: 'كنت متحمس عشان مباراة كورة بكرة، بس فجأة حسيت بقلق شديد إنك ممكن تخسر وتخيب أمل فريقك، وبدأت تحس بألم في بطنك. تفتكر يا بطل لو كنت أنت، هتعمل إيه؟',
      textEn: 'You were excited about a football match, but suddenly felt anxious that you might lose and disappoint your team. If you were there, hero, what would you do?',
      image: 'assets/images/tests/quiz4_q5.jpg',
    )], questionSceneIndex: 0,
  ),
];
