<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Perfect Idioms Site</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;700&display=swap" rel="stylesheet">
    <style>
        * { box-sizing: border-box; }
        body { font-family: 'Roboto', sans-serif; margin: 0; padding: 20px; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: #333; transition: background 0.5s, color 0.5s; min-height: 100vh; opacity: 0; animation: siteFadeIn 2s ease-in-out 0.5s forwards; }
        body.dark { background: linear-gradient(135deg, #2c3e50 0%, #34495e 100%); color: #ecf0f1; }
        .container { max-width: 1000px; margin: auto; background: rgba(255,255,255,0.9); border-radius: 15px; padding: 30px; box-shadow: 0 10px 30px rgba(0,0,0,0.2); transition: all 0.5s; animation: containerFadeIn 1s ease-in-out 1s forwards; opacity: 0; }
        body.dark .container { background: rgba(44,62,80,0.9); }
        @keyframes siteFadeIn { to { opacity: 1; } }
        @keyframes containerFadeIn { to { opacity: 1; transform: translateY(0); } from { transform: translateY(20px); } }
        h1, h2 { text-align: center; margin-bottom: 20px; }
        h1 { font-size: 2.5em; background: linear-gradient(45deg, #ff6b6b, #4ecdc4); -webkit-background-clip: text; -webkit-text-fill-color: transparent; animation: textGlow 2s infinite alternate; }
        @keyframes textGlow { from { filter: brightness(1); } to { filter: brightness(1.2); } }
        .lang-selector, .nav { text-align: center; margin-bottom: 20px; }
        button { padding: 12px 25px; margin: 5px; cursor: pointer; background: linear-gradient(45deg, #ff6b6b, #4ecdc4); color: white; border: none; border-radius: 25px; font-weight: 700; transition: all 0.3s ease; box-shadow: 0 4px 15px rgba(0,0,0,0.2); position: relative; overflow: hidden; }
        button:hover { transform: translateY(-3px) scale(1.05); box-shadow: 0 6px 20px rgba(0,0,0,0.3); }
        button:active { transform: translateY(0) scale(1); animation: buttonPress 0.2s; }
        @keyframes buttonPress { 0% { transform: scale(1); } 50% { transform: scale(0.95); } 100% { transform: scale(1); } }
        button::before { content: ''; position: absolute; top: 50%; left: 50%; width: 0; height: 0; background: rgba(255,255,255,0.5); border-radius: 50%; transition: width 0.6s, height 0.6s; transform: translate(-50%, -50%); }
        button:active::before { width: 300px; height: 300px; }
        .pulse { animation: pulse 0.5s; }
        @keyframes pulse { 0% { transform: scale(1); } 50% { transform: scale(1.1); } 100% { transform: scale(1); } }
        .shake { animation: shake 0.5s; }
        @keyframes shake { 0%, 100% { transform: translateX(0); } 25% { transform: translateX(-5px); } 75% { transform: translateX(5px); } }
        .section { display: none; margin-bottom: 40px; animation: fadeIn 0.5s ease-in; }
        .active { display: block; }
        @keyframes fadeIn { from { opacity: 0; transform: translateY(20px); } to { opacity: 1; transform: translateY(0); } }
        .card { width: 280px; height: 180px; margin: 10px; perspective: 1000px; display: inline-block; cursor: pointer; transition: transform 0.3s; }
        .card:hover { transform: scale(1.05); animation: bounce 0.5s; }
        @keyframes bounce { 0%, 20%, 50%, 80%, 100% { transform: translateY(0); } 40% { transform: translateY(-10px); } 60% { transform: translateY(-5px); } }
        .card-inner { position: relative; width: 100%; height: 100%; transition: transform 0.8s; transform-style: preserve-3d; }
        .front, .back { position: absolute; width: 100%; height: 100%; backface-visibility: hidden; border-radius: 15px; padding: 20px; box-shadow: 0 4px 15px rgba(0,0,0,0.1); display: flex; flex-direction: column; justify-content: center; align-items: center; text-align: center; }
        .front { background: linear-gradient(45deg, #ffeaa7, #fab1a0); color: #333; }
        .back { background: linear-gradient(45deg, #a29bfe, #fd79a8); color: white; transform: rotateY(180deg); }
        .flipped .card-inner { transform: rotateY(180deg); }
        .quiz { text-align: center; }
        .quiz-question { margin: 20px 0; font-size: 1.2em; }
        .options { display: flex; justify-content: center; flex-wrap: wrap; }
        .option { margin: 5px; animation: bounceIn 0.5s; }
        @keyframes bounceIn { 0% { transform: scale(0.3); opacity: 0; } 50% { transform: scale(1.05); } 70% { transform: scale(0.9); } 100% { transform: scale(1); opacity: 1; } }
        .score { font-size: 1.5em; margin-top: 20px; color: #ff6b6b; }
        .progress-bar { width: 100%; height: 10px; background: #ddd; border-radius: 5px; margin: 20px 0; overflow: hidden; }
        .progress { height: 100%; background: linear-gradient(45deg, #4ecdc4, #44a08d); transition: width 0.5s ease; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; border-radius: 10px; overflow: hidden; }
        th, td { border: 1px solid #ddd; padding: 15px; text-align: left; transition: background 0.3s; }
        th { background: linear-gradient(45deg, #74b9ff, #0984e3); color: white; }
        tr:hover { background: rgba(116,185,255,0.1); }
        .slider { display: flex; align-items: center; justify-content: center; }
        .slider-btn { font-size: 2em; margin: 0 10px; background: none; border: none; color: #333; cursor: pointer; transition: color 0.3s; }
        body.dark .slider-btn { color: #ecf0f1; }
        .slider-btn:hover { color: #ff6b6b; transform: scale(1.2); }
        .cards-wrapper { display: flex; overflow: hidden; width: 100%; }
        .cards-container { display: flex; transition: transform 0.5s ease; }
        .theme-toggle { position: absolute; top: 20px; right: 20px; }
        .flash { animation: flash 0.5s; }
        @keyframes flash { 0%, 100% { background: white; } 50% { background: #4ecdc4; } }
        .loading { position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: #667eea; display: flex; justify-content: center; align-items: center; z-index: 9999; animation: loadingFade 2s ease-in-out 2s forwards; }
        .loading::after { content: ''; width: 50px; height: 50px; border: 5px solid #fff; border-top: 5px solid transparent; border-radius: 50%; animation: spin 1s linear infinite; }
        @keyframes spin { from { transform: rotate(0deg); } to { transform: rotate(360deg); } }
        @keyframes loadingFade { to { opacity: 0; visibility: hidden; } }
    </style>
</head>
<body>
    <div class="loading"></div>
    <div class="container">
       <button onclick="toggleTheme()">🌙 Dark Mode</button>
        <h1 id="title">Perfect Idioms Interactive Site</h1>
        <div class="lang-selector">
            <button onclick="setLanguage('en')">English</button>
            <button onclick="setLanguage('ru')">Русский</button>
        </div>
        <div class="nav">
            <button onclick="showSection('home')">🏠 Home</button>
            <button onclick="showSection('cards')">🎴 Cards</button>
            <button onclick="showSection('quiz')">🧠 Quiz</button>
            <button onclick="showSection('compare')">📊 Compare</button>
        </div>

        <div id="home" class="section active">
            <h2 id="home-title">Welcome to the Ultimate Idioms Experience!</h2>
            <p id="home-text">Dive into English and Russian idioms with interactive flip cards, challenging quizzes, and detailed comparisons. Switch languages, explore, and learn!</p>
        </div>

        <div id="cards" class="section">
            <h2 id="cards-title">Flip Cards</h2>
            <p id="cards-instr">Click a card to flip and discover meanings. Use arrows to navigate.</p>
            <div class="slider">
                <button class="slider-btn" onclick="slideCards(-1)">‹</button>
                <div class="cards-wrapper">
                    <div class="cards-container" id="cards-container"></div>
                </div>
                <button class="slider-btn" onclick="slideCards(1)">›</button>
            </div>
        </div>

        <div id="quiz" class="section">
            <h2 id="quiz-title">Quiz Challenge</h2>
            <p id="quiz-instr">Answer questions to earn points. Aim for the max!</p>
            <div class="progress-bar">
                <div class="progress" id="progress" style="width: 0%;"></div>
            </div>
            <div class="quiz">
                <div id="question"></div>
                <div class="options" id="options"></div>
                <div class="score" id="score">Score: 0</div>
                <button id="next-btn" onclick="nextQuestion()" style="display:none;">Next</button>
                <button id="play-again-btn" onclick="resetQuiz()" style="display:none;">Play Again</button>
            </div>
        </div>

        <div id="compare" class="section">
            <h2 id="compare-title">Idiom Comparisons</h2>
            <table>
                <thead>
                    <tr>
                        <th id="col1">English Idiom</th>
                        <th id="col2">Russian Equivalent</th>
                        <th id="col3">Meaning</th>
                        <th id="col4">Explanation</th>
                    </tr>
                </thead>
                <tbody id="table-body"></tbody>
            </table>
        </div>
    </div>

    <script>
            const data = [
            { en: "Kick the bucket", ru: "Дать дуба", meaning: "To die", explanation: "Both mean to die, but 'kick the bucket' implies suicide, while 'дать дуба' means sudden death." },
            { en: "Break a leg", ru: "Ни пуха ни пера", meaning: "Good luck", explanation: "Used before performances; the Russian is a superstition to ward off bad luck." },
            { en: "Hit the books", ru: "Учить уроки", meaning: "To study", explanation: "Direct equivalents for studying hard." },
            { en: "Spill the beans", ru: "Выдать секрет", meaning: "To reveal a secret", explanation: "Both imply accidentally sharing confidential info." },
            { en: "Bite the bullet", ru: "Стиснуть зубы", meaning: "To endure pain", explanation: "Facing something unpleasant bravely." },
            { en: "Piece of cake", ru: "Пар пустяков", meaning: "Very easy", explanation: "Something simple to do." },
            { en: "Under the weather", ru: "Не в форме", meaning: "Feeling ill", explanation: "Mild sickness or low energy." },
            { en: "Cry over spilt milk", ru: "Плакать над пролитым молоком", meaning: "Regret past mistakes", explanation: "Wasting time on things you can't change." },
            { en: "Burn the midnight oil", ru: "Жечь свечу с двух концов", meaning: "Work late", explanation: "Staying up late to work or study." },
            { en: "Let the cat out of the bag", ru: "Выдать тайну", meaning: "Reveal a secret", explanation: "Similar to 'spill the beans'." },
            { en: "Cost an arm and a leg", ru: "Стоить целое состояние", meaning: "Very expensive", explanation: "Something very pricey." },
            { en: "When pigs fly", ru: "Когда рак на горе свистнет", meaning: "Never", explanation: "Impossible events." },
            { en: "Barking up the wrong tree", ru: "Искать не там, где потерял", meaning: "Wrong approach", explanation: "Pursuing the wrong path." },
            { en: "Hit the nail on the head", ru: "Попасть в точку", meaning: "Exactly right", explanation: "Spot on with an answer." },
            { en: "A blessing in disguise", ru: "Нет худа без добра", meaning: "Hidden benefit", explanation: "Something good from bad." },
            { en: "Actions speak louder than words", ru: "Дела говорят громче слов", meaning: "Deeds over talk", explanation: "What you do matters more." },
            { en: "Don't count your chickens", ru: "Не дели шкуру неубитого медведя", meaning: "Don't assume", explanation: "Don't plan on uncertain outcomes." },
            { en: "Every cloud has a silver lining", ru: "Нет худа без добра", meaning: "Positive in negative", explanation: "Good in every bad situation." },
            { en: "Kill two birds with one stone", ru: "Убить двух зайцев одним выстрелом", meaning: "Efficient action", explanation: "Achieve two goals at once." },
            { en: "The ball is in your court", ru: "Мяч на твоей стороне", meaning: "Your turn", explanation: "It's your responsibility now." },
            { en: "Bite off more than you can chew", ru: "Взять на себя больше, чем можешь", meaning: "Overcommit", explanation: "Take on too much." },
            { en: "Don't put all your eggs in one basket", ru: "Не клади все яйца в одну корзину", meaning: "Diversify", explanation: "Spread risks." },
            { en: "It's raining cats and dogs", ru: "Льет как из ведра", meaning: "Heavy rain", explanation: "Pouring rain." },
            { en: "Pull someone's leg", ru: "Подшутить над кем-то", meaning: "Tease", explanation: "Play a joke." },
            { en: "The early bird catches the worm", ru: "Кто рано встает, тому Бог дает", meaning: "Early action pays", explanation: "Advantages of being early." }
        ];

        let lang = 'en';
        let quizIndex = 0;
        let score = 0;
        let cardIndex = 0;

        const quizQuestions = [
            { q: "What does 'Kick the bucket' mean?", opts: ["To die", "To run", "To eat"], ans: 0 },
            { q: "Что значит 'Дать дуба'?", opts: ["Умереть", "Бежать", "Есть"], ans: 0 },
            { q: "Equivalent of 'Break a leg'?", opts: ["Ни пуха ни пера", "Спокойной ночи", "До свидания"], ans: 0 },
            { q: "Meaning of 'Piece of cake'?", opts: ["Очень легко", "Трудно", "Вкусно"], ans: 0 },
            { q: "What is 'Under the weather'?", opts: ["Не в форме", "На улице", "В машине"], ans: 0 },
            { q: "Что значит 'Плакать над пролитым молоком'?", opts: ["Жалеть о прошлом", "Радоваться", "Злиться"], ans: 0 },
            { q: "Equivalent of 'Burn the midnight oil'?", opts: ["Жечь свечу с двух концов", "Спать рано", "Гулять"], ans: 0 },
            { q: "Meaning of 'Cost an arm and a leg'?", opts: ["Очень дорого", "Дешево", "Бесплатно"], ans: 0 },
            { q: "What does 'When pigs fly' mean?", opts: ["Никогда", "Завтра", "Скоро"], ans: 0 },
            { q: "Что значит 'Убить двух зайцев одним выстрелом'?", opts: ["Сделать два дела сразу", "Охотиться", "Бегать"], ans: 0 }
        ];
                function toggleTheme() {
            document.body.classList.toggle('dark');
        }

        function setLanguage(l) {
            lang = l;
            updateTexts();
            renderCards();
            renderTable();
            resetQuiz();
        }

        function updateTexts() {
            const texts = {
                en: {
                    title: "Perfect Idioms Interactive Site",
                    homeTitle: "Welcome to the Ultimate Idioms Experience!",
                    homeText: "Dive into English and Russian idioms with interactive flip cards, challenging quizzes, and detailed comparisons. Switch languages, explore, and learn!",
                    cardsTitle: "Flip Cards",
                    cardsInstr: "Click a card to flip and discover meanings. Use arrows to navigate.",
                    quizTitle: "Quiz Challenge",
                    quizInstr: "Answer questions to earn points. Aim for the max!",
                    compareTitle: "Idiom Comparisons",
                    col1: "English Idiom",
                    col2: "Russian Equivalent",
                    col3: "Meaning",
                    col4: "Explanation",
                    nextBtn: "Next",
                    playAgainBtn: "Play Again"
                },
                ru: {
                    title: "Идеальный Интерактивный Сайт Идиом",
                    homeTitle: "Добро пожаловать в Ультимативный Опыт Идиом!",
                    homeText: "Погрузитесь в английские и русские идиомы с интерактивными флип-карточками, сложными викторинами и подробными сравнениями. Переключайте языки, исследуйте и учитесь!",
                    cardsTitle: "Флип-Карточки",
                    cardsInstr: "Кликните на карточку, чтобы перевернуть и узнать значения. Используйте стрелки для навигации.",
                    quizTitle: "Викторина-Вызов",
                    quizInstr: "Отвечайте на вопросы, чтобы набрать баллы. Цельтесь в максимум!",
                    compareTitle: "Сравнения Идиом",
                    col1: "Английская идиома",
                    col2: "Русский аналог",
                                      col3: "Значение",
                    col4: "Объяснение",
                    nextBtn: "Далее",
                    playAgainBtn: "Сыграть еще раз"
                }
            };
            document.getElementById('title').textContent = texts[lang].title;
            document.getElementById('home-title').textContent = texts[lang].homeTitle;
            document.getElementById('home-text').textContent = texts[lang].homeText;
            document.getElementById('cards-title').textContent = texts[lang].cardsTitle;
            document.getElementById('cards-instr').textContent = texts[lang].cardsInstr;
            document.getElementById('quiz-title').textContent = texts[lang].quizTitle;
            document.getElementById('quiz-instr').textContent = texts[lang].quizInstr;
            document.getElementById('compare-title').textContent = texts[lang].compareTitle;
            document.querySelector('#compare th:nth-child(1)').textContent = texts[lang].col1;
            document.querySelector('#compare th:nth-child(2)').textContent = texts[lang].col2;
            document.querySelector('#compare th:nth-child(3)').textContent = texts[lang].col3;
            document.querySelector('#compare th:nth-child(4)').textContent = texts[lang].col4;
            document.getElementById('next-btn').textContent = texts[lang].nextBtn;
            document.getElementById('play-again-btn').textContent = texts[lang].playAgainBtn;
        }

        function showSection(id) {
            document.querySelectorAll('.section').forEach(s => s.classList.remove('active'));
            document.getElementById(id).classList.add('active');
        }

        function renderCards() {
            const container = document.getElementById('cards-container');
            container.innerHTML = '';
            data.forEach(item => {
                const card = document.createElement('div');
                card.className = 'card';
                card.innerHTML = `
                    <div class="card-inner">
                        <div class="front">${lang === 'en' ? item.en : item.ru}</div>
                        <div class="back">
                            ${lang === 'en' ? item.ru : item.en}<br>
                            <strong>${lang === 'en' ? 'Meaning:' : 'Значение:'}</strong> ${item.meaning}<br>
                            <strong>${lang === 'en' ? 'Explanation:' : 'Объяснение:'}</strong> ${item.explanation}
                        </div>
                    </div>
                `;
                card.onclick = () => card.classList.toggle('flipped');
                container.appendChild(card);
            });
        }

        function renderTable() {
            const tbody = document.getElementById('table-body');
            tbody.innerHTML = '';
            data.forEach(item => {
                const row = document.createElement('tr');
                row.innerHTML = `
                    <td>${item.en}</td>
                    <td>${item.ru}</td>
                    <td>${item.meaning}</td>
                    <td>${item.explanation}</td>
                `;
                tbody.appendChild(row);
            });
        }

        function resetQuiz() {
            quizIndex = 0;
            score = 0;
            document.getElementById('score').textContent = `Score: 0`;
            document.getElementById('progress').style.width = '0%';
            document.getElementById('next-btn').style.display = 'none';
            document.getElementById('play-again-btn').style.display = 'none';
            loadQuestion();
        }

        function loadQuestion() {
            if (quizIndex >= quizQuestions.length) {
                document.getElementById('question').innerHTML = `<div class="quiz-question">${lang === 'en' ? 'Quiz complete! Your score: ' + score : 'Викторина завершена! Твой счет: ' + score}</div>`;
                document.getElementById('options').innerHTML = '';
                document.getElementById('next-btn').style.display = 'none';
                document.getElementById('play-again-btn').style.display = 'inline';
                return;
            }
            const q = quizQuestions[quizIndex];
            document.getElementById('question').innerHTML = `<div class="quiz-question">${q.q}</div>`;
            const opts = document.getElementById('options');
            opts.innerHTML = '';
            q.opts.forEach((opt, i) => {
                const btn = document.createElement('button');
                btn.className = 'option';
                btn.textContent = opt;
                btn.onclick = () => checkAnswer(i);
                opts.appendChild(btn);
            });
            document.getElementById('next-btn').style.display = 'none';
            document.getElementById('play-again-btn').style.display = 'none';
        }

        function checkAnswer(selected) {
            if (selected === quizQuestions[quizIndex].ans) score++;
            document.getElementById('score').textContent = `Score: ${score}`;
            document.getElementById('progress').style.width = `${((quizIndex + 1) / quizQuestions.length) * 100}%`;
            document.getElementById('next-btn').style.display = 'inline';
        }

        function nextQuestion() {
            quizIndex++;
            loadQuestion();
        }

        function slideCards(direction) {
            const container = document.getElementById('cards-container');
            const cards = container.children;
            if (cards.length === 0) return;
            cardIndex += direction;
            if (cardIndex < 0) cardIndex = cards.length - 1;
            if (cardIndex >= cards.length) cardIndex = 0;
            container.style.transform = `translateX(-${cardIndex * 300}px)`;
        }

        // Инициализация
        updateTexts();
        renderCards();
        renderTable();
        loadQuestion();
    </script>
</body>
</html>
