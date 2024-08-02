extends Node

## Definicje eventów dostępnych globalnie w całej aplikacji
##
## Skrypt zawiera definicje globalncyh eventów w całej aplikacji

# Sygnał wywoływany w momencie usunięcia bańki. Ma za zadanie zbierać punkty.
# Sygnał emitowany jest w obiekcie 'Bubble' w metodzie '_exit_tree()'
# Sygnał jest łapany w obiekcie 'Player', 'HUD', 'sfx'
signal OnScoreBubbleDelete	
