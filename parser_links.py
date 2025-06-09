import requests
import json
import psycopg2
import time

def search_rutube(query, retries=3):
    base_url = "https://rutube.ru/api/search/video/"
    params = {
        "query": query,
        "page": 1,
        "per_page": 5  # Количество результатов на странице
    }
    headers = {
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3"
    }

    for attempt in range(retries):
        try:
            response = requests.get(base_url, params=params, headers=headers)
            if response.status_code == 200:
                data = response.json()
                videos = data.get('results', [])
                return videos
            else:
                print(f"Ошибка при запросе: {response.status_code}")
                return []
        except requests.exceptions.RequestException as e:
            print(f"Ошибка при запросе: {e}")
            time.sleep(2)  # Пауза перед повторной попыткой

    return []

def save_video_links_to_db(video_links):
    try:
        conn = psycopg2.connect(
            dbname="learn_code",
            user="postgres",
            password="admin",
            host="localhost",
            port="5432"
        )
        print("Соединение с базой данных установлено.")
        cursor = conn.cursor()

        for lesson_id, links in video_links.items():
            for link in links:
                cursor.execute(
                    "UPDATE public.lessons SET video_link = %s WHERE id = %s",
                    (link, lesson_id)
                )

        conn.commit()
        print("Видео ссылки успешно сохранены в базе данных.")
        cursor.close()
        conn.close()
    except Exception as e:
        print(f"Ошибка при сохранении видео ссылок: {e}")

# Пример использования
lesson_queries = [
    "Игра на открытых струнах гитары",
    "Игра простых аккордов на гитаре",
    "Техника перебора струн на гитаре",
    "Техника игры медиатором",
    "Игра сложных аккордов на гитаре",
    "Техника игры арпеджио на гитаре",
    "Игра на открытых струнах скрипки",
    "Игра простых мелодий на скрипке",
    "Техника вибрато на скрипке",
    "Игра простых ритмов на барабанах",
    "Техника игры дроби на барабанах",
    "Игра синкопированных ритмов на барабанах",
    "Игра простых мелодий на флейте",
    "Техника игры стаккато на флейте",
    "Техника игры тремоло на флейте",
    "Игра простых мелодий на трубе",
    "Техника игры глиссандо на трубе",
    "Техника игры дубль-стаккато на трубе",
    "Игра простых мелодий на кларнете",
    "Техника игры флажолетов на кларнете",
    "Техника игры мультифониксов на кларнете",
    "Игра простых ритмов на ударных",
    "Техника игры рулли на ударных",
    "Техника игры фламов на ударных",
    "Игра простых мелодий на саксофоне",
    "Техника игры гроулинга на саксофоне",
    "Техника игры оверблоуинга на саксофоне",
    "Игра простых мелодий на фортепиано",
    "Игра аккордов на фортепиано",
    "Техника игры арпеджио на фортепиано",
    "Игра простых мелодий на гобое",
    "Техника игры стаккато на гобое",
    "Техника игры легато на гобое",
    "Игра простых мелодий на фаготе",
    "Техника игры стаккато на фаготе",
    "Техника игры тремоло на фаготе",
    "Игра простых мелодий на тромбоне",
    "Техника игры глиссандо на тромбоне",
    "Техника игры стаккато на тромбоне",
    "Игра простых мелодий на валторне",
    "Техника игры стаккато на валторне",
    "Техника игры легато на валторне",
    "Игра простых мелодий на тубе",
    "Техника игры стаккато на тубе",
    "Техника игры глиссандо на тубе",
    "Игра простых мелодий на виолончели",
    "Техника игры вибрато на виолончели",
    "Техника игры пиццикато на виолончели",
    "Игра простых мелодий на арфе",
    "Техника игры глиссандо на арфе",
    "Техника игры арпеджио на арфе",
    "Игра простых мелодий на аккордеоне",
    "Техника игры басов на аккордеоне",
    "Техника игры мелодии и аккомпанемента на аккордеоне"
]

video_links = {}

for i, query in enumerate(lesson_queries, start=4):
    print(f"Поиск: {query}")
    videos = search_rutube(query)
    if videos:
        video_links[i] = [f"https://rutube.ru/video/{video['id']}/" for video in videos]
    print("\n" + "-"*50 + "\n")

save_video_links_to_db(video_links)
