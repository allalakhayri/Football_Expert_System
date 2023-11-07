% Règles pour recommander des joueurs à une équipe

% Règle pour recommander des joueurs en fonction du salaire
recommend_low_salary(PlayerId, Team) :- 
    wage_eur(PlayerId, Wage), 
    Wage <= 50000,  
    potential(PlayerId, Potential), 
    Potential >= 85, 
    assertz(recommended(PlayerId, Team)).

% Règle pour recommander des joueurs en fonction de la nationalité
recommend_same_nationality(PlayerId, Team) :- 
    nationality(PlayerId, Nationality), 
    club(Team, TeamClub), 
    plays_in_national_team(Nationality, TeamClub), 
    assertz(recommended(PlayerId, Team)).

% Règle pour recommander des capitaines potentiels
recommend_captain_potential(PlayerId, Team) :- 
    leadership(PlayerId, Leadership), 
    Leadership >= 85,  
    assertz(recommended(PlayerId, Team)).

% Règle pour recommander des joueurs expérimentés
recommend_experienced_player(PlayerId, Team) :- 
    age(PlayerId, Age), 
    Age >= 30,  
    assertz(recommended(PlayerId, Team)).

% Règle pour recommander des joueurs polyvalents
recommend_versatile_player(PlayerId, Team) :- 
    versatility(PlayerId, Versatility), 
    Versatility >= 80, 
    assertz(recommended(PlayerId, Team)).

% Règle pour recommander des joueurs en fonction de la note globale (overall)
recommend_high_overall(PlayerId, Team) :- 
    overall(PlayerId, Overall), 
    Overall >= 85,  
    assertz(recommended(PlayerId, Team)).

% Règle pour recommander des joueurs en fonction de leur poste
recommend_position(PlayerId, Team, Position) :- 
    player_position(PlayerId, PlayerPosition), 
    Position == PlayerPosition, 
    assertz(recommended(PlayerId, Team)).

% Règle pour recommander des joueurs en fonction de la qualité de leur pied préféré
recommend_preferred_foot(PlayerId, Team, PreferredFoot) :- 
    preferred_foot(PlayerId, Foot), 
    Foot == PreferredFoot, 
    assertz(recommended(PlayerId, Team)).

% Règle pour recommander des joueurs avec des compétences spécifiques
recommend_skill(PlayerId, Team, Skill) :- 
    skill_move(PlayerId, SkillMove), 
    SkillMove >= 4,  
    assertz(recommended(PlayerId, Team)).

% Règle pour recommander des joueurs en fonction du club actuel
recommend_current_club(PlayerId, Team, CurrentClub) :- 
    club(PlayerId, CurrentClub), 
    assertz(recommended(PlayerId, Team)).

% Règle pour recommander des joueurs avec une certaine caractéristique physique
recommend_body_type(PlayerId, Team, BodyType) :- 
    body_type(PlayerId, Body), 
    Body == BodyType, 
    assertz(recommended(PlayerId, Team)).


% Règles de style de jeu

style_de_jeu('tiki-taka').
style_de_jeu('contre-attaque').
style_de_jeu('jeu direct').
style_de_jeu('jeu de possession').
style_de_jeu('pressing haut').
style_de_jeu('contre-pressing').
style_de_jeu('jeu de possession rapide').
style_de_jeu('jeu défensif').
style_de_jeu('contre-attaque rapide').
style_de_jeu('jeu collectif').
style_de_jeu('jeu aérien').
style_de_jeu('jeu physique').
style_de_jeu('jeu technique').
style_de_jeu('jeu créatif').
style_de_jeu('jeu direct').
style_de_jeu('jeu offensif').
style_de_jeu('jeu défensif compact').
style_de_jeu('jeu long').
style_de_jeu('jeu en transition').
style_de_jeu('jeu offensif rapide').

% Styles de jeu des équipes
style_de_jeu('FC Barcelona', 'tiki-taka').
style_de_jeu('Real Madrid', 'counter-attack').
style_de_jeu('Liverpool FC', 'high-pressing').
style_de_jeu('Manchester City', 'possession play').
style_de_jeu('Bayern Munich', 'high pressing').
style_de_jeu('Paris Saint-Germain', 'attacking play').
style_de_jeu('Chelsea FC', 'defensive play').
style_de_jeu('Manchester United', 'direct play').
style_de_jeu('Arsenal FC', 'possession play').
style_de_jeu('AC Milan', 'counter-attack').
style_de_jeu('Borussia Dortmund', 'high pressing').
style_de_jeu('Atletico Madrid', 'defensive counter-attacks').
style_de_jeu('Juventus', 'possession play').
style_de_jeu('Tottenham Hotspur', 'high-pressing').
style_de_jeu('Inter Milan', 'counter-attack').
style_de_jeu('Ajax', 'attacking play').
style_de_jeu('FC Porto', 'defensive play').
style_de_jeu('Napoli', 'possession play').
style_de_jeu('Leicester City', 'counter-attack').
style_de_jeu('Everton FC', 'high pressing').
style_de_jeu('Sevilla FC', 'high-pressing').
style_de_jeu('Boca Juniors', 'counter-attack').
style_de_jeu('Lyon', 'attacking play').
style_de_jeu('Leeds United', 'high pressing').
style_de_jeu('Benfica', 'possession play').
style_de_jeu('Rangers FC', 'defensive play').
style_de_jeu('Celtic FC', 'direct play').
style_de_jeu('Ajax', 'possession play').

% Entraîneurs connus
strategie_entraîneur('Pep Guardiola', 'possession play').
strategie_entraîneur('Jurgen Klopp', 'high pressing').
strategie_entraîneur('Diego Simeone', 'defensive counter-attacks').
strategie_entraîneur('Carlo Ancelotti', 'possession play').
strategie_entraîneur('Zinedine Zidane', 'counter-attack').
strategie_entraîneur('Thomas Tuchel', 'attacking play').
strategie_entraîneur('Antonio Conte', 'defensive play').
strategie_entraîneur('Ole Gunnar Solskjaer', 'direct play').
strategie_entraîneur('Mikel Arteta', 'possession play').
strategie_entraîneur('Stefano Pioli', 'counter-attack').
strategie_entraîneur('Marco Rose', 'high pressing').
strategie_entraîneur('Sergio Conceicao', 'defensive play').
strategie_entraîneur('Massimiliano Allegri', 'possession play').
strategie_entraîneur('Nuno Espirito Santo', 'high pressing').
strategie_entraîneur('Simone Inzaghi', 'counter-attack').
strategie_entraîneur('Erik ten Hag', 'attacking play').
strategie_entraîneur('Sérgio Conceição', 'defensive play').
strategie_entraîneur('Luciano Spalletti', 'possession play').
strategie_entraîneur('Brendan Rodgers', 'counter-attack').
strategie_entraîneur('Rafa Benítez', 'high pressing').
strategie_entraîneur('Marcelo Bielsa', 'high pressing').
strategie_entraîneur('Jorge Jesus', 'attacking play').
strategie_entraîneur('Marcelino', 'defensive play').
strategie_entraîneur('Andrea Pirlo', 'possession play').
strategie_entraîneur('Steven Gerrard', 'counter-attack').
strategie_entraîneur('Diego Maradona', 'direct play').
strategie_entraîneur('Ronald Koeman', 'possession play').


recommander_joueur_style(X, Y) :-
    joueur(X),
    club(X, Club),
    style_de_jeu(Club, Style),
    style_de_jeu(Y, Style),
    X \= Y.

% Règles pour recommander des joueurs en fonction des performances des joueurs
recommander_joueur_perf(X, Y) :-
    joueur(X),
    overall(X, OverallX),
    potential(X, PotentialX),
    overall(Y, OverallY),
    potential(Y, PotentialY),
    X \= Y,
    OverallX >= 85,
    PotentialX >= 90,
    OverallY >= 85,
    PotentialY >= 90.

recommander_joueur_strategie(X, Y) :-
    joueur(X),
    club(X, Club),
    strategie_entraîneur(Entraîneur, Stratégie),
    club_entraineur(Club, Entraîneur),
    club(Y, Club),
    X \= Y,
    club_strategie(Y, Stratégie).

correspond_style_de_jeu(X, 'tiki-taka') :-
    joueur(X),
    possession_de_balle(X, Élevée),
    passes_courtes(X, Élevées),
    rapidité_circulation(X, Élevée).

correspond_style_de_jeu(X, 'contre-attaque') :-
    joueur(X),
    vitesse(X, Élevée),
    exploitation_espaces_libres(X, Élevée),
    jeu_transition(X, Élevé).

correspond_style_de_jeu(X, 'jeu physique') :-
    joueur(X),
    force(X, Élevée),
    puissance_physique(X, Élevée),
    jeu_aerien(X, Élevé).

correspond_style_de_jeu(X, 'jeu direct') :-
    joueur(X),
    passes_longues(X, Élevées),
    recherche_rapide_buts(X, Élevée).

correspond_style_de_jeu(X, 'pressing haut') :-
    joueur(X),
    agressivité(X, Élevée),
    jeu_demi_terrain_adverse(X, Élevé).
