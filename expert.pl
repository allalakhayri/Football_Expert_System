% Règle pour recommander un joueur adapté au style de jeu "tiki-taka"
recommander_joueur_par_style(PlayerId, Team, Style) :-
    joueur(PlayerId),
    correspond_style_de_jeu(PlayerId, Style),
    assertz(recommended(PlayerId, Team)).

% Règle pour recommander un joueur adapté au style de jeu "contre-attaque"
recommander_joueur_contre_attaque(PlayerId, Team) :-
    recommander_joueur_par_style(PlayerId, Team, 'contre-attaque').

% Règle pour recommander un joueur adapté au style de jeu "tiki-taka"
recommander_joueur_tiki_taka(PlayerId, Team) :-
    recommander_joueur_par_style(PlayerId, Team, 'tiki-taka').


recommander_joueur_jeu_direct(PlayerId, Team) :-
    recommander_joueur_par_style(PlayerId, Team, 'jeu direct').

% Exemple de règle experte : Recommander un milieu de terrain créatif
recommander_milieu_creatif(PlayerId, Team) :-
    joueur(PlayerId),
    milieu_de_terrain(PlayerId),
    créativité(PlayerId, Élevée),
    assertz(recommended(PlayerId, Team)).

% Exemple de règle experte : Recommander un défenseur solide
recommander_defenseur_solide(PlayerId, Team) :-
    joueur(PlayerId),
    défenseur(PlayerId),
    robustesse(PlayerId, Élevée),
    assertz(recommended(PlayerId, Team)).



% Exemple de règle experte : Recommander un gardien de but réactif
recommander_gardien_réactif(PlayerId, Team) :-
    joueur(PlayerId),
    gardien_de_but(PlayerId),
    réflexes(PlayerId, Élevés),
    assertz(recommended(PlayerId, Team)).


% Définir la fonction test pour recommander des joueurs en fonction de critères
test() :-
    write('Choose the recommendation criteria:'), nl,
    write('1. Low Salary (Wage <= 50000 and Potential >= 85)'), nl,
    write('2. Same Nationality (Same nationality as the team)'), nl,
    write('3. Captain Potential (Leadership >= 85)'), nl,
    write('4. Experienced Player (Age >= 30)'), nl,
    write('5. Versatile Player (Versatility >= 80)'), nl,
    write('6. High Overall (Overall >= 85)'), nl,
    write('7. Position Match (Matches the player position)'), nl,
    write('8. Preferred Foot Match (Matches the preferred foot)'), nl,
    write('9. Skillful Player (Skill move >= 4)'), nl,
    write('10. Current Club Match (Matches the current club)'), nl,
    write('11. Body Type Match (Matches the body type)'), nl,
    write('Enter the number of your choice: '),
    nl,
    read(RecommendationType),
    integer(RecommendationType),
    write('Enter the name of the team: '),
    nl,
    read(Team),
    string(Team),  % Assuming team names are strings
    % You can add other logic to input necessary parameters or conditions
    % ...

    % Now you can call the appropriate recommendation predicates based on RecommendationType
    (RecommendationType =:= 1 -> recommend_low_salary_players(Team);
     RecommendationType =:= 2 -> recommend_same_nationality_players(Team);
     RecommendationType =:= 3 -> recommend_captain_potential_players(Team);
     RecommendationType =:= 4 -> recommend_experienced_players(Team);
     RecommendationType =:= 5 -> recommend_versatile_players(Team);
     RecommendationType =:= 6 -> recommend_high_overall_players(Team);
     RecommendationType =:= 7 -> recommend_position_match_players(Team);
     RecommendationType =:= 8 -> recommend_preferred_foot_match_players(Team);
     RecommendationType =:= 9 -> recommend_skillful_players(Team);
     RecommendationType =:= 10 -> recommend_current_club_match_players(Team);
     RecommendationType =:= 11 -> recommend_body_type_match_players(Team);
     write('Invalid recommendation type. Please choose 1 to 11.')).

% Define your recommendation predicates based on the criteria here.

% Example recommendation predicates:
recommend_low_salary_players(Team) :-
    write('Recommending players with low salary and high potential...'), nl,
    % Récupérer tous les joueurs qui correspondent au critère de faible salaire et potentiel élevé
    findall(PlayerId, (joueur(PlayerId), wage_eur(PlayerId, Wage), Wage =< 50000, potential(PlayerId, Potential), Potential >= 85), Players),
    
   
    recommend_players_for_team(Players, Team).

% Prédicat pour recommander une liste de joueurs pour une équipe donnée
recommend_players_for_team([], _).

recommend_players_for_team([PlayerId | Rest], Team) :-
    not(recommended(PlayerId, Team)),
    
    assertz(recommended(PlayerId, Team)),
    
    player_name(PlayerId, PlayerName),
    write(PlayerName), nl,
    
    recommend_players_for_team(Rest, Team).

