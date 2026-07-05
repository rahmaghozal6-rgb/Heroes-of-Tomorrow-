import '../models/scenario_model.dart';

final List<ScenarioModel> lessonsData = [
  // درس 1
  ScenarioModel(
    id: 'lesson_scenario_1',
    titleAr: 'مشكلة القلم الضائع',
    titleEn: 'The Taken Pen',
    mode: 'lesson',
    scenes: [
      SceneModel(
        textAr: 'كان يا مكان، صديقنا البطل خالد كان قاعد في الفصل، ومتحمس جداً وبيكتب واجبه بخط جميل أوي بقلمه الأزرق المفضل ومبسوط.',
        textEn: 'Once upon a time, our hero Khaled was sitting in class, feeling super excited, writing his homework beautifully with his favorite blue pen.',
        image: 'assets/images/lessons/lesson1_scene1.jpg',
      ),
      SceneModel(
        textAr: 'وفجأة! ومن غير أي مقدمات، جه صاحبه نوح ومد إيده وشد القلم من إيد خالد بسرعة ومن غير ما يستأذن خالص! خالد اتفاجئ واتضايق جداً.',
        textEn: 'Suddenly! Without asking, his friend Noah reached out and snatched the pen right out of Khaled\'s hand! Khaled was shocked and felt very upset.',
        image: 'assets/images/lessons/lesson1_scene2.jpg',
      ),
      SceneModel(
        textAr: 'الموقف ده بيزعل فعلاً.. تفتكر يا بطل لو أنت مكان خالد بداله.. هتعمل إيه وتتصرف إزاي؟',
        textEn: 'This is a tough situation... If you were in Khaled\'s shoes, hero... what would you do?',
        image: 'assets/images/lessons/lesson1_scene3.jpg',
      ),
    ],
    questionSceneIndex: 2,
  ),

  // درس 2
  ScenarioModel(
    id: 'lesson_scenario_2',
    titleAr: 'لغز الصديق الحزين',
    titleEn: 'The Mystery of the Sad Friend',
    mode: 'lesson',
    scenes: [
      SceneModel(
        textAr: 'في يوم جميل، صديقنا نوح كان بيلعب بالكورة مع صاحبه عمر في جنينة المدرسة، وكانوا بيجروا ويضحكوا ومبسوطين جداً باللعب سوا.',
        textEn: 'On a beautiful day, our friend Noah was playing ball with his friend Omar in the school garden. They were running, laughing, and having so much fun.',
        image: 'assets/images/lessons/lesson2_scene1.jpg',
      ),
      SceneModel(
        textAr: 'لكن فجأة، وبدون ما يقول أي حاجة، عمر ساب اللعب وراحل قعد لوحده على جنب وهو زعلان. نوح وقف مكانه ومستغرب جداً.',
        textEn: 'But suddenly, Omar left the ball and went to sit all alone, looking very sad, without saying a word! Noah stood there feeling very surprised.',
        image: 'assets/images/lessons/lesson2_scene2.jpg',
      ),
      SceneModel(
        textAr: 'نوح عايز يعرف صاحبه ماله عشان يساعده.. تفتكر يا بطل لو أنت مكان نوح، هتعمل إيه عشان تعرف سبب المشكلة؟',
        textEn: 'Noah wants to know what\'s wrong to help his friend. If you were in Noah\'s shoes, hero... what would you do to find out the problem?',
        image: 'assets/images/lessons/lesson2_scene3.jpg',
      ),
    ],
    questionSceneIndex: 2,
  ),

  // درس 3 - SAFETY
  ScenarioModel(
    id: 'lesson_scenario_3',
    titleAr: 'نوح والبحث عن ماما',
    titleEn: 'Noah Looks for Mom',
    mode: 'safety',
    scenes: [
      SceneModel(
        textAr: 'في يوم جميل، صديقنا نوح كان بيتمشى مع مامته في الحديقة الكبيرة، وكان مبسوط وطاير من الفرحة وهو ماسك إيد مامته وبيتفرج على الشجر والورد.',
        textEn: 'On a beautiful day, our friend Noah was walking with his mom in the big garden. He was super happy, holding his mom\'s hand, and enjoying the trees and flowers.',
        image: 'assets/images/lessons/lesson3_scene1.jpeg',
      ),
      SceneModel(
        textAr: 'لكن نوح من حماسه، ساب إيد مامته وفجأة جِري بعيد عشان يلعب ويشوف حاجة لفتت انتباهه، ومخدش باله إنه ابتعد عنها خالص.',
        textEn: 'But Noah got so excited that he let go of his mom\'s hand and suddenly ran far away to play, without realizing how far he had gone.',
        image: 'assets/images/lessons/lesson3_scene2.jpeg',
      ),
      SceneModel(
        textAr: 'وبعد شوية، نوح التفت حواليه وملقاش مامته! الحديقة بقت واسعة وهو واقف لوحده، وحس إنه خايف جداً.. تفتكر يا بطل لو أنت مكان نوح.. هتعمل إيه بأمان؟',
        textEn: 'After a while, Noah looked around and couldn\'t find his mom! The garden was so big and he was all alone. He felt very scared. If you were in Noah\'s shoes, hero... what would you do to stay safe?',
        image: 'assets/images/lessons/lesson3_scene3.jpeg',
      ),
    ],
    questionSceneIndex: 2,
  ),

  // درس 4
  ScenarioModel(
    id: 'lesson_scenario_4',
    titleAr: 'جاك وسقوط الدراجة',
    titleEn: "Jack's Bicycle Fall",
    mode: 'lesson',
    scenes: [
      SceneModel(
        textAr: 'نوح وصاحبه جاك كانوا راكبين العجل بتاعهم في ممر الحديقة، وكانوا بيسوقوا بسرعة ومبسوطين جداً والضحكة مالية وشوشهم.',
        textEn: 'Noah and his friend Jack were riding their bicycles on the park path. They were riding fast, laughing, and having a wonderful time together.',
        image: 'assets/images/lessons/lesson4_scene1.jpg',
      ),
      SceneModel(
        textAr: 'لكن فجأة، جاك اختل توازنه ووقع من على العجلة الخضراء بتاعته على الأرض! جاك قعد يعيط من الألم وماسك رجله ومش قادر يقوم.. نوح وقف جنبه قلقان ومش عارف يتصرف إزاي.',
        textEn: 'But suddenly, Jack lost his balance and fell off his green bicycle! Jack sat there crying, holding his hurt leg, unable to stand up. Noah stood by him, feeling worried and not knowing what to do.',
        image: 'assets/images/lessons/lesson4_scene2.jpg',
      ),
      SceneModel(
        textAr: 'صاحبنا جاك تعبان ومحتاج مساعدة سريعة.. تفتكر يا بطل لو أنت مكان نوح.. هتعمل إيه عشان تساعد صاحبك؟',
        textEn: 'Our friend Jack is hurt and needs quick help. If you were in Noah\'s shoes, hero... what would you do to help your friend?',
        image: null,
      ),
    ],
    questionSceneIndex: 2,
  ),

  // درس 5
  ScenarioModel(
    id: 'lesson_scenario_5',
    titleAr: 'اللعبة المكسورة',
    titleEn: 'The Broken Toy',
    mode: 'lesson',
    scenes: [
      SceneModel(
        textAr: 'نوح كان قاعد على السجادة في أوضته وسط ألعابه الكتيرة، وكان ماسك اللعبة المفضلة عنده، روبوت لونه أحمر وأصفر، وكان فرحان جداً وهو بيلعب بيه.',
        textEn: 'Noah was sitting on the rug in his room among his many toys. He was holding his favorite toy, a red and yellow robot, and he was very happy playing with it.',
        image: 'assets/images/lessons/lesson5_scene1.png',
      ),
      SceneModel(
        textAr: 'وفجأة وبدون قصد، الروبوت فلت من إيد نوح ووقع في الهواء! نوح اتفاجئ جداً وفتح بقه من الخوف وهو شايف لعبته بتقع على الأرض.',
        textEn: 'Suddenly and by mistake, the robot slipped out of Noah\'s hand and fell! Noah was shocked and opened his mouth in fear as he watched his favorite toy falling.',
        image: 'assets/images/lessons/lesson5_scene2.png',
      ),
      SceneModel(
        textAr: 'الروبوت وقع على الأرض واتكسر! نوح قعد على ركبه وهو زعلان جداً وبيبص للعبته المكسورة ومش عارف يعمل إيه.. تفتكر يا بطل لو أنت مكان نوح.. هتعمل إيه؟',
        textEn: 'The robot hit the ground and broke! Noah sat on his knees, feeling very sad, looking at his broken toy. If you were in Noah\'s shoes, hero... what would you do?',
        image: 'assets/images/lessons/lesson5_scene3.jpeg',
      ),
    ],
    questionSceneIndex: 2,
  ),

  // درس 6
  ScenarioModel(
    id: 'lesson_scenario_6',
    titleAr: 'نوح والكلب الخائف',
    titleEn: 'Noah and the Scared Dog',
    mode: 'lesson',
    scenes: [
      SceneModel(
        textAr: 'في يوم من الأيام، جيران نوح جابوا كلب جديد صغير وشكله حلو أوي. نوح أول ما شافه في الشارع كان فرحان ومتحمس جداً، ونفسه يروح يلعب معاه.',
        textEn: 'One day, Noah\'s neighbors got a beautiful new little dog. As soon as Noah saw it in the street, he felt super excited and really wanted to go play with it.',
        image: 'assets/images/lessons/lesson6_scene1.png',
      ),
      SceneModel(
        textAr: 'نوح من كتر حماسه، جِري بسرعة وبقوة ناحية الكلب عشان يلعبه، لكن للأسف، أول ما قرب منه الكلب خاف جداً وجِري بعيد واستخبى!',
        textEn: 'Noah was so excited that he ran quickly towards the dog to play. But unfortunately, the dog got scared and ran away to hide!',
        image: 'assets/images/lessons/lesson6_scene2.jpg',
      ),
      SceneModel(
        textAr: 'نوح وقف مكانه وهو زعلان ومحتار جداً.. هو مكنش قصد يضايق الكلب، بس مش عارف الكلب خاف ليه.. تفتكر يا بطل لو أنت مكان نوح.. هتعمل إيه؟',
        textEn: 'Noah stood there feeling sad and confused. He didn\'t mean to upset the dog. If you were in Noah\'s shoes, hero... what would you do?',
        image: 'assets/images/lessons/lesson6_scene3.jpg',
      ),
    ],
    questionSceneIndex: 2,
  ),

  // درس 7
  ScenarioModel(
    id: 'lesson_scenario_7',
    titleAr: 'نوح وامتحان الرياضيات',
    titleEn: "Noah's Math Exam",
    mode: 'lesson',
    scenes: [
      SceneModel(
        textAr: 'نوح عنده امتحان رياضيات صعب جداً بكرة، وعشان كده قعد على مكتبه من أول اليوم يذاكر بحماس ويركز في كل المسائل.',
        textEn: 'Noah has a difficult math exam tomorrow. So, he sat at his desk from the very beginning of the day, studying hard and focusing on all the problems.',
        image: 'assets/images/lessons/lesson7_scene1.png',
      ),
      SceneModel(
        textAr: 'الوقت مر بسرعة والليل جِه، ونوح لسه قاعد مكانه وتعبان جداً، وحس فجأة إنه مش فاكر أي حاجة من اللي ذاكرها! نوح بقى خايف وقلقان جداً من الامتحان.',
        textEn: 'Time passed quickly and it became night. Noah was still sitting there, feeling very tired, when suddenly he felt like he couldn\'t remember anything he studied! Noah felt so scared and anxious.',
        image: 'assets/images/lessons/lesson7_scene2.png',
      ),
      SceneModel(
        textAr: 'من كتر التعب والخوف، نوح استسلم وساب كتبه وراحل نام على السرير، وحس إنه محتار ومش عارف يعمل إيه.. تفتكر يا بطل لو أنت مكان نوح.. هتعمل إيه؟',
        textEn: 'Because he was so tired and scared, Noah gave up and went to bed. He felt confused and very upset. If you were in Noah\'s shoes, hero... what would you do?',
        image: 'assets/images/lessons/lesson7_scene3.png',
      ),
    ],
    questionSceneIndex: 2,
  ),

  // درس 8 - SAFETY
  ScenarioModel(
    id: 'lesson_scenario_8',
    titleAr: 'نوح وقاعدة السلامة',
    titleEn: 'Noah and the Safety Rule',
    mode: 'safety',
    scenes: [
      SceneModel(
        textAr: 'نوح كان ماشي في الشارع لوحده وراجع البيت، وفجأة ظهر شخص غريب ميعرفوش، قرب منه وهو بيتبسم وطلع من جيبه مصاصة ملونة كبيرة، وعرضها على نوح.',
        textEn: 'Noah was walking in the street alone on his way home. Suddenly, a stranger he didn\'t know approached him with a smile, pulled out a big colorful lollipop, and offered it to Noah.',
        image: 'assets/images/lessons/lesson8_scene1.jpeg',
      ),
      SceneModel(
        textAr: 'نوح وقف في مكانه وهو خايف ومتردد جداً.. هو نفسه في المصاصة بس تفتكر في مخه كلام مامته وباباه إن غلط ناخد أي حاجة من حد مانعرفوش.',
        textEn: 'Noah stood there feeling scared and hesitant. He wanted the lollipop, but he remembered his parents\' advice never to take anything from a stranger.',
        image: 'assets/images/lessons/lesson8_scene2.jpeg',
      ),
      SceneModel(
        textAr: 'وفجأة، الشخص الغريب ده قرب أكتر ومد إيده وحطها على كتف نوح! نوح اتفزع وبقى خايف جداً ومش عارف يتصرف إزاي.. تفتكر يا بطل لو أنت مكان نوح.. هتعمل إيه فوراً؟',
        textEn: 'Suddenly, the stranger got even closer and placed his hand on Noah\'s shoulder! Noah felt terrified. If you were in Noah\'s shoes, hero... what would you do right away?',
        image: 'assets/images/lessons/lesson8_scene3.jpeg',
      ),
    ],
    questionSceneIndex: 2,
  ),
];
