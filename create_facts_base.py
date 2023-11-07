import csv

with open("new_players.csv", newline='', encoding='utf-8') as csvfile:
    reader = csv.DictReader(csvfile)
    player_id = 1

    with open("facts.pl", "w", encoding="utf-8") as facts_file:
        for row in reader:
            row['id'] = player_id
            player_id += 1
            row['long_name'] = row['long_name'].replace('\n', ' ')
            
            facts_file.write(f"% Facts for {row['long_name']}\n")
            facts_file.write(f"joueur({str(row['id'])}).\n")
            facts_file.write(f"age({str(row['id'])},{row['age']}).\n")
            facts_file.write(f"height({str(row['id'])},{row['height_cm']}).\n")
            facts_file.write(f"weight({str(row['id'])},{row['weight_kg']}).\n")
            facts_file.write(f"nationality({str(row['id'])},\'{row['nationality']}\').\n")
            facts_file.write(f"club({str(row['id'])},\'{row['club']}\').\n")
            facts_file.write(f"overall({str(row['id'])},{row['overall']}).\n")
            facts_file.write(f"potential({str(row['id'])},{row['potential']}).\n")
            facts_file.write(f"value_eur({str(row['id'])},{row['value_eur']}).\n")
            facts_file.write(f"wage_eur({str(row['id'])},{row['wage_eur']}).\n")
            facts_file.write(f"preferred_foot({str(row['id'])},\'{row['preferred_foot']}\').\n")
            facts_file.write(f"skill_move({str(row['id'])},{row['skill_moves']}).\n")
            facts_file.write(f"work_rate({str(row['id'])},\'{row['work_rate']}\').\n")
            facts_file.write(f"body_type({str(row['id'])},\'{row['body_type']}\').\n")
            facts_file.write(f"player_position({str(row['id'])},\'{row['team_position']}\').\n\n")
