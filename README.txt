TIPS
- grafika z nekromantą jest w postaci 17x7
- wykorzystany został mechanizm grup. Każda bańka jest dodawana do grupy "Bubbles". Wystarczy, że w widoku sceny dodamy obiekt do tej grupy i
każda instancja obiektu będzie już w tej grupie. W projekcie grupa została wykorzystana do zlikwidowania wszystkich obiektów po zakońćzeniu gry

TERMIN:
- start pisania gry: 22.07.2024
- czas pisania gry: 3 tygodnie
- koniec pisania gry: 11.08.2024

CZAS PRACY
- 23.07.2024: 3h
- 24.07.2024: 1h 35m + 2h 18m
- 25.07.2024: 1h 33m
- 26.07.2024: 6h 13m
- 27.07.2024: 3h 18m
- 28.07.2024: 1h 40m
- 31.07.2024: 3h 10m

WYMAGANIA
- OK - postać gracza może poruszać się w każdym kierunku
- OK - postać gracza sterowana jest strzałkami lub klawiszami AWSD
- OK - postać gracza jest bez animacji (zrobione jednak z animacją)
- OK - postać gracza obraca się w kierunku w którym idzie
- OK (1h 35m) - postać gracza nie może wyjść poza okran
- OK (0h 3m) - wykorzystaj colorrect
- OK - bąbelki generują się w losowych miejscach (w sumie generują się tam gdzie jest wskaźnik myszy ale na raize moze być)
- OK - bąbelki poruszają się w różnych kierunkach w obrębie ekranu
- OK - każdy bąbelek ma losową predkość, kierunek
- OK - są specjalne bąbelki, które powodują że po ich dotknięciu postać gracza ginie i gra się kończy
- OK - postać gracza zbiera bąbelki, poprzez jego dotknięcie
- OK - za każdy bąbelek jest przyznawany jeden punkt
- OK - po zakończeniu gry:
	- OK - wyświetlane są punkty gracza
	- OK - wyświetlany jest przycisk pozwalający rozpocząć grę od nowa
	- OK - wyświetlany jest przycisk pozwalający wyjść z gry
	- OK - HUD robimy jako CanvasLayer: https://www.youtube.com/watch?v=Xq9AyhX8HUc
- OK zrób coś z tą różową bańką bo jest tragiczna
- OK - dopisz wersję gry
- OK - dopisz autora gry
- OK - dopisz link do strony na GitHub
- OK - dodaj info o assetach, skąd je masz
- zakończenie gry jest tragiczne. Trzeba coś z tym zrobić, żeby tam się nic nie wykonywło. Pauza jest chyba kiepskim pomysłem
- balans gry
- coś się czasem dzieje że zderzam się z bańką a ona dalej istnieje i chyba w tym momencie przybywa mi dużo punktów
DODATKOWE WYMAGANA
- pokaż FPS-y (Engine.target_fps)
- zrób animację bańki w momencie jak pęka
- dodaj dźwięki do gry
- dodać czas życia bąbelka. Jak skończy się czas życia bąbelka to bąbelek znika
- dodać inny sposób puszczania bąbelków. Na ekran może wpadać sprite2d (z niczym się nie zderza). Ten sprite2D ma podpięty timer jako child, który to timer generuje nowe bąbelki.
Można dodać przyjaznego spritea oraz sprite który puszcza bąbelki killujące gracza
- mozna dodać ProgressBar do Playera jako węzeł podrzędny. Ten progress bar może pokazywać zycia lub złapane bąbelki
- informacje o autorze - jest taka metoda jak Engine.get_author_info() - czyli można gdzieś wpisać info o uatorze. Poszukaj też wersji, licencji i innych podobnych tematów
- o co chodzi z grupami w Godot. Można podefiniować jakieś grupy i np. sprawdzić czy body.is_in_group("Player"). Można wywalić wszystkie obiekty z grupy poleceniem: get_tree().call_group("mobs", "queue_free")
- generowanie baniek w losowym miejscu
- dodaj czas trawnia gry na ekranie
- podaj link do kanału na Youtube (jak już będzie)
